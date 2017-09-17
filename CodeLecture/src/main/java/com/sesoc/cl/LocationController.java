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

import com.sesoc.cl.dao.UsersRepository;
import com.sesoc.cl.vo.ClassInfo;

@Controller
public class LocationController {
	@Autowired
	UsersRepository repo;
	
	String path = "/img";
	
	@RequestMapping(value="searchLocation", method=RequestMethod.GET)
	public String searchForm() {
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
		model.addAttribute("myTeacherList", myTeacherList);
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
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id", id);
		return "createClassForm";
	}
	@RequestMapping(value="everyBoardLocation", method=RequestMethod.GET)
	public String everyBoardForm() {
		return "everyBoardForm";
	}
	@RequestMapping(value="createHomeWorkLocation", method=RequestMethod.GET)
	public String createHomeWorkForm() {
		return "createHomeWorkForm";
	}
	@RequestMapping(value="boardLocation", method=RequestMethod.GET)
	public String boardForm(Model model, String status) {
		model.addAttribute("status", status);
		return "boardForm";
	}
	
}
