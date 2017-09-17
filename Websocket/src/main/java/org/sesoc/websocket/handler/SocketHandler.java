package org.sesoc.websocket.handler;

 
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.sesoc.websocket.HomeController;
import org.sesoc.websocket.vo.MessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
 
public class SocketHandler extends TextWebSocketHandler{
		
       private final Logger logger = LogManager.getLogger(getClass());
       public static List<WebSocketSession> connectedUsers;
 
      
       public SocketHandler (){
             this.logger.info("create SocketHandler instance!");
             connectedUsers = new ArrayList<WebSocketSession>();
       }
 
       @Override //웹소켓 연결이 끊긴 후
       public void afterConnectionClosed(WebSocketSession session,
                    CloseStatus status) throws Exception {
             super.afterConnectionClosed(session, status);
 
             this.logger.info("세션 삭제!!");
             connectedUsers.remove(session);
             
             for(WebSocketSession webSocketSession : connectedUsers){
            	 if(!session.getId().equals(webSocketSession.getId())){
            		 webSocketSession.sendMessage(new TextMessage(session.getRemoteAddress().getHostName() + "님이 퇴장했습니다."));
            	 }//채팅방 퇴장시 다른 유저에게 보여지는 메시지
             }
       }
       
       
       @Override //채팅방에 접속하면 다른 유저에게 보여줄 메시지
       public void afterConnectionEstablished(WebSocketSession session)
                    throws Exception {
             super.afterConnectionEstablished(session);
             connectedUsers.add(session);
             this.logger.info(session.getId() + "님이 접속했습니다.");
             this.logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
             
             System.out.println("toString : "+connectedUsers.get(0).getId());
             //학생 리스트에 저장된 IP와 비교하여 닉네임or이름으로 보이게 설정필요
       }
 
    @Override //채팅메시지 전송 메소드
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	MessageVO messageVO = MessageVO.convertMessage(message.getPayload()); //입력한 메시지를 VO 객체로 생성
    	String hostName = "";
    	
    	for (WebSocketSession webSocketSession : connectedUsers){ //for문을 돌며 모든 유저에게 메시지를 전송한다
    		if (messageVO.getType().equals("all")){
    			if(!session.getId().equals(webSocketSession.getId())){
    				webSocketSession.sendMessage(
    						new TextMessage(session.getRemoteAddress().getHostName() + " -> " + messageVO.getMessage() ));
    			}
    		}else{
    			hostName = webSocketSession.getRemoteAddress().getHostName();
    			if(messageVO.getTo().equals(hostName)){ //귓속말 대상이 있으면
    				webSocketSession.sendMessage(
    						new TextMessage(
    								"<span style='color:red; font-weight: bold;' >"
    								+ session.getRemoteAddress().getHostName() + " -> " + messageVO.getMessage()
    								+ "</span>")); //귓속말은 빨간색으로 보인다(수신자)
    				break;
    			}
    		}
    	}
    }
 
}
