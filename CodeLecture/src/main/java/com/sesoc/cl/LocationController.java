package com.sesoc.cl;

import java.io.File;
import java.util.List;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.UsersRepository;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.ClassUser;

@Controller
public class LocationController {
	@Autowired
	UsersRepository repo;
	@Autowired
	ClassRepository cRepo;
	
	String path = "/img";
	
	@RequestMapping(value="searchLocation", method=RequestMethod.GET)
	public String searchForm(Model model, HttpServletRequest request) {
		this.listCome(model, request);
		return "searchForm";
	}

	@RequestMapping(value="afterLoginLocation", method=RequestMethod.GET)
	public String afterLoginForm(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		String name = (String)session.getAttribute("name");
		String userImg = (String)session.getAttribute("userImg");
		String email = (String)session.getAttribute("email");
		model.addAttribute("loginId", id);
		model.addAttribute("name", name);
		model.addAttribute("userImg", userImg);
		model.addAttribute("email", email);
		List<ClassInfo> myTeacherList = repo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
		String mime = null;
			String fullPath = path + "/" + userImg;
			mime = new MimetypesFileTypeMap().getContentType(new File(fullPath));
			System.out.println("마임타입 : " + mime);
			if(mime.contains("image")||mime.contains("octet-stream")){
				model.addAttribute("mimetype", mime);
			}
		return "afterLogin";
	}
	
	@RequestMapping(value="createClassLocation", method=RequestMethod.GET)
	public String createClassForm(Model model, HttpServletRequest request) {
		this.listCome(model, request);
		return "createClassForm";
	}
	@RequestMapping(value="everyBoardLocation", method=RequestMethod.GET)
	public String everyBoardForm(Model model, HttpServletRequest request) {
		this.listCome(model, request);
		return "everyBoardForm";
	}
	@RequestMapping(value="createHomeWorkLocation", method=RequestMethod.GET)
	public String createHomeWorkForm(Model model, HttpServletRequest request) {
		this.listCome(model, request);
		return "createHomeWorkForm";
	}
	@RequestMapping(value="boardLocation", method=RequestMethod.GET)
	public String boardForm(Model model, String status, HttpServletRequest request) {
		this.listCome(model, request);
		model.addAttribute("status", status);
		return "boardForm";
	}
	
	public void listCome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id", id);
		List<ClassInfo> myTeacherList = repo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
	}
}
