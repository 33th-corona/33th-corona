package com.sesoc.cl;

import java.awt.Image;
import java.awt.font.ImageGraphicAttribute;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sesoc.cl.dao.UsersRepository;
import com.sesoc.cl.util.FileService;
import com.sesoc.cl.vo.Users;




@Controller
public class CustomerController {
	@Autowired
	UsersRepository repo;
	
	String path = "/img";
	//Register
	
	//아이디 체크 (Ajax처리)
		@ResponseBody
		@RequestMapping(value="idcheck", method = RequestMethod.POST)
		public String idcheck(String check_id) {
			String checked_id = repo.idcheck(check_id);
			if(checked_id != null) {
				return "N"; //이미 존재하는 아이디 입니다.
			} else {
				return "Y";	//사용 가능한 아이디 입니다.
			}
			
		}
		@ResponseBody
		@RequestMapping(value="emailcheck", method = RequestMethod.POST)
		public String emailcheck(String check_email) {
			String checked_email = repo.emailcheck(check_email);
			if(checked_email != null) {
				return "N"; //이미 존재하는 아이디 입니다.
			} else {
				return "Y";	//사용 가능한 아이디 입니다.
			}
			
		}
		
		//회원가입 처리 (POST방식)
		@RequestMapping(value="register", method = RequestMethod.POST)
		public String register(
				@RequestParam(value="is_deleted", defaultValue="n") String is_deleted,
				Users user, Model model, MultipartFile upload) {
			System.out.println(upload);
			String resultName = FileService.originalSaveFile(upload, path, user.getId());
			Users makedUser = new Users(user.getId(), user.getPassword(), user.getEmail(), is_deleted, user.getName(), resultName);
			
			String message = "";
			
			int result = repo.register(makedUser);
			
			if(result != 0) {
				message = "회원가입이 정상적으로 완료 되었습니다.";
			} else {
				message = "회원가입에 실패하였습니다.";
			}
			
			model.addAttribute("message", message);
			
			return "message";
		}
		
		@ResponseBody
		@RequestMapping(value="unregisterCheck", method = RequestMethod.GET)
		public int unregisterCheck(HttpSession session, Model model, String password) {
			int count = 0;
			String id = (String)session.getAttribute("loginId");
			Map<String, String> user = new HashMap<>();
			user.put("id", id);
			user.put("password", password);
			Users check = repo.unregisterCheck(user);
			if(check != null) {
				count = 1;
			}
			return count;
		}
		
		//회원 탈퇴 (GET방식)
		@RequestMapping(value="unregister", method = RequestMethod.GET)
		public String unregister(HttpSession session, Model model) {
			
			Users quitUser = new Users();
			String message = "";
			
			quitUser.setId((String)session.getAttribute("loginId"));
			
			int result = repo.unregister(quitUser);
			
			if(result != 0) {
				int result1 = repo.delete_class_user(quitUser);
				
				if(result1 != 0) {
					message = "회원 탈퇴 처리 되었습니다.";
					session.invalidate();
				} else {
					message = "회원 처리에 실패하였습니다";
				}
				
			} else {
				message = "회원 처리에 실패하였습니다.";
			}
			model.addAttribute("locationStatus", "joinComplete");
			model.addAttribute("message", message);
			
			return "message";
		}
	
	//login
		@RequestMapping(value="login", method=RequestMethod.POST)
		public @ResponseBody int loginAjax(HttpSession session, Model model, Users users) {
			Users selectedUser = repo.login(users.getId(), users.getPassword());
			
			int result = 0;
			
			if(selectedUser != null) {
				result = 1;
				session.setAttribute("loginId", selectedUser.getId());
				session.setAttribute("name", selectedUser.getName());
				session.setAttribute("userImg", selectedUser.getImg_name());
				session.setAttribute("email", selectedUser.getEmail());
			} else {
				result = 0;
			}
			return result;
		}
		
		//로그아웃
		@RequestMapping(value="logout", method = RequestMethod.GET)
		public String logout(HttpSession session, Model model) {
			
			session.invalidate();
			
			return "redirect:/";
		}
		
	//Update
		
		//회원 정보 수정 (POST방식)
		@RequestMapping(value="update", method = RequestMethod.POST)
		public String update(MultipartFile upload, 
				Users user, Model model, String count, HttpServletRequest request, HttpServletResponse response) {
			System.out.println(count);
			System.out.println(upload);
			HttpSession session = request.getSession();
			String userImg = (String)session.getAttribute("userImg");
			String id = (String)session.getAttribute("loginId");
			switch (count) {
			case "0" :
				user.setImg_name(userImg);
				repo.update(user);
				break;
			case "1" :
				String fullPath = path + "/" + userImg;
				FileService.deleteFile(fullPath);
				if(upload.getOriginalFilename() == "") {
						String originalName = FileService.defaultSaveFile(path, id);
						user.setImg_name(originalName);
						String name = (String)session.getAttribute("name");
						String email = (String)session.getAttribute("email");
						model.addAttribute("loginId", id);
						model.addAttribute("name", name);
						model.addAttribute("userImg", userImg);
						model.addAttribute("email", email);
						repo.update(user);
				} else {
					String name = (String)session.getAttribute("name");
					String email = (String)session.getAttribute("email");
					model.addAttribute("loginId", id);
					model.addAttribute("name", name);
					model.addAttribute("userImg", userImg);
					model.addAttribute("email", email);
					String originalName = FileService.originalSaveFile(upload, path, id);
					user.setImg_name(originalName);
					repo.update(user);
				}
				break;
			}
			return "redirect:/afterLoginLocation";
		}
		
		//이미지 로직
		@RequestMapping(value="imgStatus", method=RequestMethod.GET)
		public String download(HttpServletResponse response, HttpServletRequest request){
			HttpSession session = request.getSession();
			String original_fileName = (String)session.getAttribute("userImg");
			try {
				response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(original_fileName, "UTF-8"));
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String fullPath = path + "/" + original_fileName;
			//파일 가져오기
			FileInputStream filein = null;
			//브라우저로 내보내기
			ServletOutputStream sout = null;
			try {
				filein = new FileInputStream(fullPath);
				sout = response.getOutputStream();
				FileCopyUtils.copy(filein, sout);
				filein.close();
				sout.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
		
}
