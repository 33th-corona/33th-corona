package com.sesoc.cl.forLessonSave;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.json.simple.JSONObject;

import com.sesoc.cl.threadForLesson.CurrentLessonPage;
import com.sesoc.cl.threadForLesson.LessonThread;

public class LessonSave {

	private long rawStartTime;
	private CurrentLessonPage currentLessonPage;
	private boolean firstOfFile = true;
	private String prevJsonCode;
	
	private Map<String, Object> lectureData;
	
	private LessonThread lessonThread;
	
	// 파일 저장 경로! 변경 중요!
//	private String zipName = "c:\\test\\test11.zip";
//	private String fileName = "c:\\test\\test11.vtt";
	private String zipName;
	private String fileName;

	public LessonSave() {
	}

	// 생성자
	public LessonSave(LessonThread lessonThread) {
		this.lessonThread = lessonThread;
		this.currentLessonPage = lessonThread.getCurrentLessonPage();
		rawStartTime = lessonThread.getStartTime();
		lectureData = new HashMap<>();
	}

	// 이클립스 실행시 파일 저장
	public boolean startFile() {
		boolean result = false;
		String savedFileName = lessonThread.getSavedFileName();
		String directory = "C:\\CoronaSaveFolder\\passed_lesson\\text";
		zipName = directory + "\\" + savedFileName + ".zip";
		fileName = directory + "\\" + savedFileName + ".vtt";
		
		File pathFile = new File(directory);
		if (!(pathFile.isDirectory())) pathFile.mkdirs();
		
		
		String txt = "﻿WEBVTT\r\n" + "\r\n";
		
		File file = new File(fileName);
		if (!(file.exists())) trueFile(txt, false);
		
		result = true;
		return result;
	}


	/**
	 * 자막 저장 코드 part = 각 파트별 이름으로 저장 status = input : 재생중, end면 종료
	 */
	public boolean lessonSave(String part) {
//		System.out.println("part: " + part);
		boolean result = false;
		
		String nowTime = captionTime(rawStartTime);
//		System.out.println("startTime: " + startTime);
		
		boolean endOfFile = false;
//		System.out.println("part: " + part);
		switch (part) {
		case "initProjectExplorer":
			lectureData.put("projectExplorer", currentLessonPage.getProjectExplorerList());
			return true;
		
		case "initActivedEditor":
			lectureData.put("nowPath", currentLessonPage.getNowPath());
			lectureData.put("nowCode", currentLessonPage.getNowCode());
			break;
			
		case "projectChange":
		case "projectDelete":
		case "projectAdd":
			lectureData.put("projectExplorer", currentLessonPage.getProjectExplorerList());
			break;
			
		case "codeChange":
			lectureData.put("nowCode", currentLessonPage.getNowCode());
			break;
			
		case "consoleChange":
			lectureData.put("changedConsole", currentLessonPage.getNowConsole());
			break;
			
		case "activatedEditorChange":
			lectureData.put("nowPath", currentLessonPage.getNowPath());
			lectureData.put("nowCode", currentLessonPage.getNowCode());
			break;
		
		case "chatMessage":
			lectureData.put("chatMessage", currentLessonPage.getChatHistory());
			break;
			
		case "":
			endOfFile = true;
			break;
		}
		
		String jsonCode = JSONObject.toJSONString(lectureData);
		result = writeFile(jsonCode, nowTime, endOfFile);
		
		return result;
	}
	
	/**
	 * 자막 시간 계산 메소드 00:00:00:000
	 */
	public String captionTime(long rawStartTime) {
		long nowTime = System.currentTimeMillis();
		long lessonTime = nowTime - rawStartTime;
		Long chenge = new Long(lessonTime);
		String chenge2 = chenge.toString();
		
		if(chenge2.length() < 3) {
			return "00:00:00.000";
		} else {
			String stringMiliSecond = chenge2.substring(chenge2.length() - 3, chenge2.length());
			String stringTime = chenge2.substring(0, chenge2.length() - 3);
			if (stringTime.isEmpty()) {
				stringTime = "0";
			}
			long resultTime = Long.parseLong(stringTime);
			String hour = String.format("%02d", (int) resultTime / 3600);
			String minute = String.format("%02d", (int) resultTime % 3600 / 60);
			String second = String.format("%02d", (int) resultTime % 3600 % 60);
			String startTime = hour + ":" + minute + ":" + second + "." + stringMiliSecond;
			return startTime;
		}
	}
	
	/**
	 * 강의 현재 상황 파일에 저장
	 * @param jsonCode
	 * @param nowTime
	 * @param endOfFile
	 * @return
	 */
	public boolean writeFile(String jsonCode, String nowTime, boolean endOfFile) {
		boolean result = false;
		
		String txt;
		if(firstOfFile) {
			txt = nowTime + " --> ";
			prevJsonCode = jsonCode;
			firstOfFile = false;
		} else {
			if(endOfFile) {
				txt = nowTime + "\r\n" + prevJsonCode;
				System.out.println("파일 끝");
			} else {
				txt = nowTime + "\r\n" + prevJsonCode + "\r\n" + "\r\n" + nowTime + " --> ";
				prevJsonCode = jsonCode;
			}
		}
		result = trueFile(txt, endOfFile);
		
		return result;
	}
	
	// 파일 생성 코드
	public boolean trueFile(String txt, boolean endOfFile) {
		boolean result = false;
		
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(fileName, true));
			// 파일 안에 문자열 쓰기
			bw.write(txt);
			// 이어서 덮어씨우기
			bw.flush();
			// 파일 만들기 종료
			bw.close();
			if (endOfFile) zipInput();
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 파일 압축 프로그램
	public void zipInput() {
		Path safety = new File(fileName).toPath();
		ZipEntry zipEntry = new ZipEntry(safety.getFileName().toString());
		try {
			FileOutputStream fos = new FileOutputStream(new File(zipName));
			ZipOutputStream zop = new ZipOutputStream(fos);
			FileInputStream fis = new FileInputStream(new File(fileName));
			zop.putNextEntry(zipEntry);
			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = fis.read(buffer, 0, 1024)) != -1) {
				zop.write(buffer, 0, len);
			}

			// 객체 닫기
			if (zop != null) {
				zop.closeEntry();
				zop.close();
			}
			if (fos != null)
				fos.close();
			if (fis != null)
				fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		File deleteFile = new File(fileName);
		if (deleteFile.isFile()) deleteFile.delete();
	}
}