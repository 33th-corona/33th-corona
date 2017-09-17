package sesoc.global.recorder;
/*File AudioCapture01.java
이 프로그램은 캡쳐와 오디오데이터의 playback 기능을 포함한다.

GUI는 다음과 같은 버튼이 있다 :
Capture
Stop
Playback

유저가 캡쳐버튼을 누르면 마이크 입력 데이터를
ByteArrayOutputStream object에
캡쳐 및 저장한다.

유저가 stop버튼을 누르면 데이터 캡쳐가 중지 된다.

playback버튼을 누르면 캡쳐한 소리가 재생된다.

Tested using SDK 1.4.0 under Win2000
**************************************/

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.SourceDataLine;
import javax.sound.sampled.TargetDataLine;

public class AudioCapture{

  static boolean stopCapture = false;
  ByteArrayOutputStream
                 byteArrayOutputStream;
  AudioFormat audioFormat; //ex)PCM_SIGNED 44100.0 Hz, 16 bit, stereo, 4 bytes/frame, little-endian
  TargetDataLine targetDataLine; //com.sun.media.sound.DirectAudioDevice$DirectTDL@3807ca55
  AudioInputStream audioInputStream;
  SourceDataLine sourceDataLine;
  
  //소켓통신을 위한 스트림선언
  OutputStream os;
  InputStream is;
  
  //파일 내보내기
  //녹음된 wav파일과 녹음 후 컨버팅할 mp3파일의 경로설정
  File wavFile = new File("c:/170821/RecordAudio.wav"); //파일 경로는 후에 서버로 수정,파일이름은 강의타이틀 따온 뒤 넘버링
  File mp3File = new File("c:/170821/RecordAudio1.mp3"); //컨버팅 기능은 후에 독립시켜서 서버에서 처리하도록
  //오디오파일의 포맷지정
  AudioFileFormat.Type fileType = AudioFileFormat.Type.WAVE;
  
  //허용되는 매개변수 값을 넣어서 AudioFormat 생성
  private AudioFormat getAudioFormat(){
    float sampleRate = 44100.0F;
    //비트레이트 8000,11025,16000,22050,44100
    int sampleSizeInBits = 16;
    //8,16
    int channels = 2;
    //채널 1,2
    boolean signed = true;  //stereo  false면 프로그램 작동 안함
    //true,false
    boolean bigEndian = false; //false면 little-endian  
    //true,false
    //<-->little-endian : 메모리 시작주소가 하위바이트부터 기록 
    //window,리눅스는 리틀 엔디안 but,네트워크를 통해 전송되는 것은 빅 엔디안이다.
    return new AudioFormat(
                      sampleRate,
                      sampleSizeInBits,
                      channels,
                      signed,
                      bigEndian);
  }//end getAudioFormat
//===================================//
  
  public void createStream(){
	  try {
			Socket s = new Socket("localhost",7879); //IP주소 서버로 바꿔라
			System.out.println("소켓생성 완료");
			os = s.getOutputStream();
			is = s.getInputStream();
			//System.out.println("아웃풋스트림 생성");
			//oos = new ObjectOutputStream(s.getOutputStream());
			 //ois = new ObjectInputStream(s.getInputStream());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
  }
  
  
  public void stop(){
	 //마이크 캡쳐 종료
	 stopCapture = true; 
	 //파일저장
	 targetDataLine.stop();
	 targetDataLine.close();
	 System.out.println("종료");
 	}


  //ButeArrayOutputStream에 마이크로부터 입력받은 오디오 데이터를 저장하는 메소드
  public void captureAudio(){
    try{
      //캡쳐의 모든 설정
      audioFormat = getAudioFormat();
      
      System.out.println(audioFormat);
     //ex)PCM_SIGNED 44100.0 Hz, 16 bit, stereo, 4 bytes/frame, little-endian
      
      DataLine.Info dataLineInfo =
                new DataLine.Info(
                  TargetDataLine.class,
                   audioFormat);
      //시스템이 데이터라인을 지원하는지 체크
      if(!AudioSystem.isLineSupported(dataLineInfo)){
    	  System.out.println("Line not supported");
    	  System.exit(0);
      }
      
      targetDataLine = (TargetDataLine)
                   AudioSystem.getLine(
                         dataLineInfo);
      targetDataLine.open(audioFormat);
      targetDataLine.start(); //start capturing
      
      System.out.println(targetDataLine);
      
      //stop버튼을 클릭할 때까지 마이크 오디오데이터를 캡쳐할 쓰레드를 생성한다.
      Thread captureThread =new Thread(new CaptureThread());
      captureThread.start();
      System.out.println("캡쳐쓰레드 실행");
    } catch (Exception e) {
      System.out.println(e);
      System.exit(0);
    }//end catch
  }//end captureAudio method

 

	//마이크 데이터를 캡쳐하는 내부 클래스
	class CaptureThread extends Thread{
	  public void run(){
//	    byteArrayOutputStream =
//	           new ByteArrayOutputStream();
	    stopCapture = false;
	    try{//다른 스레드에 의해 stop버튼이 눌릴 때까지 루프
	    	//파일저장 시작
	        AudioInputStream ais = new AudioInputStream(targetDataLine);
	        System.out.println("파일저장 시작");
	        //createStream();
	        AudioSystem.write(ais, fileType, wavFile);
	        
	        
	        //스탑버튼을 누르면 여기서부터 시작.
	        //byteArrayOutputStream.close(); //녹음이 종료되면 스트림 close
	        System.out.println("녹음종료");
	        //이후 stop메소드 실행
	    }catch (Exception e) {
	      System.out.println(e);
	      System.exit(0);
	    }finally{
		 boolean result = mp3Converter.WavToMp3(wavFile, mp3File);
		 if(result == true){
			 System.out.println("컨버팅 완료");
		 }
	    }
	    
	  }//end run
	}//end inner class CaptureThread

}//end outer class AudioCapture.java