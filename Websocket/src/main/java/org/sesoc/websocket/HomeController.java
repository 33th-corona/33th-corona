package org.sesoc.websocket;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.sesoc.websocket.handler.SocketHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("접속 환영!!!", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		System.out.println("깃허브 체인지");
		
		System.out.println("22깃허브 체인지");
		
		System.out.println("dddddd");
		return "home";
	}
	
	@RequestMapping(value="websocket", method = RequestMethod.GET)
	public String websocket(){
		return "websocket";
	}
	
	//채팅창으로 이동
	@RequestMapping(value="chatroom", method = RequestMethod.GET)
	public String chatroom(){
		return "chatroom";
	}
	
	//**추가 메소드
	@ResponseBody
	@RequestMapping(value="updateMember", method = RequestMethod.GET)
	public List<WebSocketSession> updateMember(){
		List<WebSocketSession> list = SocketHandler.connectedUsers;
		System.out.println("리스트업뎃컨트롤러 :"+list);
		return list;
	}
	
	
}
