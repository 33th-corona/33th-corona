package com.sesoc.cl.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.cl.forLessonSave.UnZip;

/**
 * 강의 관련 학생 쪽 Controller 
 * @author LSY
 */
@Controller
public class StudentLessonController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudentLessonController.class);
	
	/**
	 * 강의 참여 페이지 요청 시 실행
	 * @return 강의 참여 페이지 jsp
	 */
	@RequestMapping("/student")
	public String viewStudentLessonPage() {
		return "lesson/lessonJoin";
	}
	
	@RequestMapping(value = "/lessonStart", method = RequestMethod.POST)
	public String joinLesson(String student_Id, int classNum, Model model) {
		model.addAttribute("student_Id", student_Id);
		model.addAttribute("classNum", classNum);
		return "lesson/studentSideLesson";
	}
	
	/**
	 * 파일의 코드 확인 용 페이지 요청 시 실행
	 * @param code 파일의 코드
	 * @param model 코드를 전달 할 model 객체
	 * @return 파일의 코드 확인 페이지 jsp
	 */
	@RequestMapping("/sourceCode")
	public String viewSourceCodePage(
			String code, 
			String theme, 
			String invisibles, 
			String indentGuides, 
			Model model) 
	{
		model.addAttribute("code", code);
		model.addAttribute("theme", theme);
		model.addAttribute("invisibles", invisibles);
		model.addAttribute("indentGuides", indentGuides);
		return "lesson/sourceCodePopup";
	}
	
	@RequestMapping(value = "/playForm", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		UnZip zip = new UnZip();
		zip.start();
		return "studentPlay";
	}

	@RequestMapping(value = "/videoPlay", method = RequestMethod.GET)
	public String video(HttpServletResponse response) {
		String originalFile = "finalmp31.mp3";
		try {
			response.setHeader("Content-Disposition",
					"attachment; filename=" + URLEncoder.encode(originalFile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String fullPath = "c:/webRecoderTest/finalmp31.mp3";
		File file = new File(fullPath);
		try {
			response.setContentType("audio/mpeg");
			response.setHeader("Accept-Ranges", "bytes");
			response.setHeader("Content-Range", "bytes " + 0 + "-" + (file.length()-1) + "/" + file.length());
			response.setContentLength((int)file.length());
			
			FileInputStream filein = new FileInputStream(file);
			ServletOutputStream sout = response.getOutputStream();
			FileCopyUtils.copy(filein, sout);
			filein.close();
			sout.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/captionPlay", method = RequestMethod.GET)
	public String captionPlay(HttpServletResponse response) {
		String originalFile = "1.vtt";
		try {
			response.setHeader("Content-Disposition",
					"attachment; filename=" + URLEncoder.encode(originalFile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String fullPath = "c:/test/1.vtt";
		try {
			FileInputStream filein = new FileInputStream(fullPath);
			ServletOutputStream sout = response.getOutputStream();
			FileCopyUtils.copy(filein, sout);
			filein.close();
			sout.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}