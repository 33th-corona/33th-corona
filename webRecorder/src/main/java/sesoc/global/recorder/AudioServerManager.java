package sesoc.global.recorder;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.TargetDataLine;
import javax.sound.sampled.AudioFileFormat.Type;

public class AudioServerManager {
	
	ServerSocket ss = null;
	int PORT = 7879;
	AudioCapture cap = new AudioCapture();
	File wav = new File("c:/server-recored/RecordAudio.wav");
	File mp3 = new File("c:/server-recored/RecordAudio.mp3");
	AudioInputStream ais;
	Socket socket;
	TargetDataLine targetDataLine;
	
	
	public int openServerSocket(){
		int result = 0;	
		try {
				ss = new ServerSocket(PORT);
				System.out.println("서버소켓 생성완료");
				System.out.println("클라이언트 접속 대기중...");
			} catch (IOException e) {
				e.printStackTrace();
			}
		if(ss != null){
			result = 1;
		}
		return result;
		}//end openServerSocket
		
	
	
	public void saveWav(){	
			//ObjectInputStream ois = new ObjectInputStream(socket.getInputStream());
			//ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
			try {
				System.out.println("saveWav 메소드");
				socket = ss.accept();
				System.out.println("접속한 IP : "+socket.getInetAddress().getHostAddress());
				InputStream is = socket.getInputStream();
				OutputStream os = socket.getOutputStream();
				System.out.println(is.read());
				//AudioInputStream ais = new AudioInputStream(is, Type.WA);
			while(socket.isConnected()){
				System.out.println("while문 진입");
				System.out.println(is.read());
				//AudioSystem.write(ais, , os);
				
				
			}//end while
			} catch (IOException e) {
				e.printStackTrace();
			}
				 
	}
	
	
	
}//end class
