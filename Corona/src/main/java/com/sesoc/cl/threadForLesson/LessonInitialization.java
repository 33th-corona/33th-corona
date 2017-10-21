package com.sesoc.cl.threadForLesson;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sesoc.cl.connInfo.TeacherConn;
import com.sesoc.cl.connInfo.TeacherConnList;
import com.sesoc.cl.forAudioCapture.AudioRecordThread;
import com.sesoc.cl.forLessonSave.LessonSave;

/**
 * 클래스 Thread의 초기화 메소드를 모아논 클래스
 * @author LSY
 */
public class LessonInitialization {
	
	Socket socket;
	OutputStream os;
	InputStream is;
	ObjectOutputStream oos;
	ObjectInputStream ois;
	LessonThread lessonThread;
	
	LessonSave lectureSave;
	
	/**
	 * Eclipse 연결 후 초기화 클래스의 생성자
	 * @param lessonThread 클래스 Thread 객체
	 */
	public LessonInitialization(LessonThread lessonThread) {
		this.lessonThread = lessonThread;
	}
	
	public String getSavedFileName() {
		String result = null;
		String classNum = lessonThread.getTeacherConn().getclassNum();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd-hh_mm_ss");
		String nowTime = dateFormat.format(cal.getTime());
		result = classNum + "-" + nowTime;
		return result;
	}
	
	/**
	 * Eclipse와의 Stream이 잘 구축되었는지 확인을 위해 Eclipse에 성공 메세지 전달
	 * @param oos 
	 * @return Eclipse에 메세지 전송에 성공하면 true, 아니면 false
	 */
	public void initStreamCheck(ObjectOutputStream oos) {
		try {
			Map<String, Object> sendMapToEclipse = new HashMap<>();
			sendMapToEclipse.put("initResult", "success");
			oos = lessonThread.getOos();
			oos.writeObject(sendMapToEclipse);
		} catch (IOException e) {
			e.printStackTrace();
			close();
		}
	}
	
	public boolean startLectureSave() {
		boolean result = false;
		
		long nowTime = System.currentTimeMillis();
		lessonThread.setStartTime(nowTime);
		
		lectureSave = new LessonSave(lessonThread);
		lessonThread.setLectureSave(lectureSave);
		result = lectureSave.startFile();
		
		return result;
	}
	
	/**
	 * Eclipse연결 시 Project Explorer의 정보를 로딩 
	 * @return Eclipse로 부터 정보를 받아서 CurrentLessonPage객체에 저장을 완료했으면 true, 실패하면 false
	 */
	@SuppressWarnings("unchecked")
	public boolean getInitProjectExplorer() {
		boolean result = false;
		
		try {
//			System.out.println("initProjectExplorer");
			ois = lessonThread.getOis();
			Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
			String action = (String)receiveMapFromEclipse.get("action");
			switch(action) {
			case "initProjectExplorer":
				List<List<Map<String, Map<String, String>>>> projectExplorerList = (List<List<Map<String, Map<String, String>>>>)receiveMapFromEclipse.get("list");
				lessonThread.getCurrentLessonPage().setProjectExplorerList(projectExplorerList);
				lectureSave.lessonSave("initProjectExplorer");
				break;
			}
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
			close();
		}
//		System.out.println("End");
		return result;
	}
	
	/**
	 * Eclipse연결 시 활성화 되어 있는 Editor의 정보를 로딩 
	 * @return Eclipse로 부터 정보를 받아서 CurrentLessonPage객체에 저장을 완료했으면 true, 실패하면 false
	 */
	@SuppressWarnings("unchecked")
	public boolean getInitActivedEditor() {
		boolean result = false;
		
		try {
//			System.out.println("InitActivedEditor");
			ois = lessonThread.getOis();
			Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
			String action = (String)receiveMapFromEclipse.get("action");
			switch(action) {
			case "initActivatedEditor":
				String path = (String) receiveMapFromEclipse.get("path");
				String code = (String) receiveMapFromEclipse.get("code");
				lessonThread.getCurrentLessonPage().setNowPath(path);
				lessonThread.getCurrentLessonPage().setNowCode(code);
				lectureSave.lessonSave("initActivedEditor");
//				System.out.println("init activated path : " + path);
//				System.out.println("init activated code : " + code);
				break;
			}
//			System.out.println("End");
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
			close();
		}
		
		return result;
	}
	
	public void startAudioRecord(String savedFileName) {
		
		AudioRecordThread recordThread = new AudioRecordThread(savedFileName);
		lessonThread.setAudioRecordThread(recordThread);
		new Thread(recordThread).start();
		
		try {
			System.out.println("2번째소켓 생성 요청");
			Map<String, Object> sendMapToEclipse = new HashMap<>();
			sendMapToEclipse.put("checkSocket", "openSocket");
			oos = lessonThread.getOos();
			oos.writeObject(sendMapToEclipse);
		} catch (IOException e) {
			e.printStackTrace();
			close();
		}
		
	}
	
	/**
	 * 통신에 실패하여 예외 발생 시 실행, 선생님의 정보를 삭제하고, socket을 닫고, 강의 정보를 삭제하고, 현재 Thread를 종료
	 */
	private void close() {
		try {
			TeacherConn teacherConn = lessonThread.getTeacherConn();
			TeacherConnList.getList().remove(teacherConn);
			lessonThread.getCurrentLessonPage().close();
			if(oos != null)	oos.close();
			if(ois != null) ois.close();
			if(os != null) os.close();
			if(is != null) is.close();
			if(socket != null) socket.close();
			Thread.currentThread().interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
