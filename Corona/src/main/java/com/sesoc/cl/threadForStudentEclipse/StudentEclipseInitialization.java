package com.sesoc.cl.threadForStudentEclipse;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 학생 Eclipse 접속 Thread의 초기화 메소드를 모아논 클래스
 * @author LSY
 */
public class StudentEclipseInitialization {
	
	Socket socket;
	ObjectOutputStream oos;
	ObjectInputStream ois;
	StudentEclipseThread studentEclipseThread;
	SendToStudentEclipsePage send;
	CurrentStudentEclipsePage currentStudentPage;
	
	/**
	 * Eclipse 연결 후 초기화 클래스의 생성자
	 * @param studentEclipseThread 학생 Eclipse 접속 Thread 객체
	 */
	public StudentEclipseInitialization(StudentEclipseThread studentEclipseThread) {
		this.studentEclipseThread = studentEclipseThread;
		send = studentEclipseThread.getSend();
		currentStudentPage = studentEclipseThread.getCurrentStudentEclipsePage();
	}
	
	/**
	 * Eclipse와의 Stream이 잘 구축되었는지 확인을 위해 Eclipse에 성공 메세지 전달
	 * @return Eclipse에 메세지 전송에 성공하면 true, 아니면 false
	 */
	public boolean initStreamCheck() {
		boolean result = false;
		try {
			Map<String, Object> sendMapToEclipse = new HashMap<>();
			sendMapToEclipse.put("initResult", "success");
			oos = studentEclipseThread.getOos();
			oos.writeObject(sendMapToEclipse);
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
			close();
		}
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
			ois = studentEclipseThread.getOis();
			Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
			String action = (String)receiveMapFromEclipse.get("action");
			switch(action) {
			case "initProjectExplorer":
				List<List<Map<String, Map<String, String>>>> projectExplorerList = (List<List<Map<String, Map<String, String>>>>)receiveMapFromEclipse.get("list");
				currentStudentPage.setProjectExplorerList(projectExplorerList);
				//Eclipse의 Project Explorer의 정보 전달
				send.sendToStudentEclipsePage("initProjectExplorer", 
						"projectExplorer", currentStudentPage.getProjectExplorerList());
				break;
			}
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
			close();
		}
		
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
			ois = studentEclipseThread.getOis();
			Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
			String action = (String)receiveMapFromEclipse.get("action");
			switch(action) {
			case "initActivatedEditor":
				String path = (String) receiveMapFromEclipse.get("path");
				String code = (String) receiveMapFromEclipse.get("code");
				currentStudentPage.setNowPath(path);
				currentStudentPage.setNowCode(code);
				send.sendToStudentEclipsePage("initActivatedEditor", 
						"nowPath", currentStudentPage.getNowPath(), 
						"nowCode", currentStudentPage.getNowCode());
//				System.out.println("init activated path : " + path);
//				System.out.println("init activated code : " + code);
				break;
			}
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
			close();
		}
		
		return result;
	}
	
	/**
	 * 통신에 실패하여 예외 발생 시 실행, socket을 닫고, 학생 Eclipse 정보를 삭제하고, 현재 Thread를 종료
	 */
	private void close() {
		try {
			studentEclipseThread.getCurrentStudentEclipsePage().close();
			if(oos != null)	oos.close();
			if(ois != null) ois.close();
			if(socket != null) socket.close();
			Thread.currentThread().interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
