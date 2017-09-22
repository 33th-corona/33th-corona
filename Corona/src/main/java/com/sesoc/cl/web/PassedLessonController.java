package com.sesoc.cl.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.PassedLessonRepository;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.SavedLessonInfo;

@Controller
public class PassedLessonController {
	@Autowired
	ClassRepository cRepo;
	@Autowired
	PassedLessonRepository pRepo;
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherLessonController.class);
	
	@RequestMapping(value="passedLessonList", method=RequestMethod.GET)
	public String passedLessonList(
			int classNum,
			Model model,
			HttpServletRequest request) 
	{
		List<SavedLessonInfo> savedLessonInfos = pRepo.loadSavedLesson(classNum);
//		logger.info(savedLessonInfos.toString());
		listCome(model, request);
		model.addAttribute("classNum", classNum);
		model.addAttribute("savedLessonInfos", savedLessonInfos);
		return "lesson/passedLessonList";
	}
	
	@RequestMapping(value="passedLessonList", method=RequestMethod.POST)
	public String loadPassedLesson() {
		
		return null;
	}
	
	public void listCome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id", id);
		List<ClassInfo> myTeacherList = cRepo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
	}
}
