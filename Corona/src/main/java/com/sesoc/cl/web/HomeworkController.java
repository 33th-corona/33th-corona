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
import com.sesoc.cl.dao.TaskRepository;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.TaskInfo;

@Controller
public class HomeworkController {
	
	@Autowired
	ClassRepository cRepo;
	@Autowired
	TaskRepository tRepo;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeworkController.class);
	
	private List<ClassInfo> myTeacherList;
	
	@RequestMapping(value="homeworkList", method=RequestMethod.GET)
	public String homeworkList(
			int classNum,
			Model model,
			HttpServletRequest request) 
	{
		listCome(model, request);
		
		//기한 지났으면 다 제출불가 처리 해야한다 여기서!
		int result = tRepo.closed_work();
		if(result != 0) {
//			System.out.println("기한 지난 과제들 제출불가 처리!");
		}
		
		//과제 목록 불러오기
		List<TaskInfo> taskInfoList = tRepo.selectAll(classNum);
//		logger.info(taskInfoList.toString());
		
		String position = "student";
		
		for(ClassInfo i : myTeacherList) {
			if(classNum == i.getNum()) {
				position = "teacher";
				break;
			}
		}
		
		model.addAttribute("taskInfoList", taskInfoList);
		model.addAttribute("classNum", classNum);
		model.addAttribute("position", position);
		
		return "homework/homeworkList";
	}
	
	
	
	public void listCome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id", id);
		myTeacherList = cRepo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
	}
}
