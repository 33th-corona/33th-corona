package sesoc.global.recorder;

 
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
 
public class SocketHandler extends TextWebSocketHandler{
		
       private final Logger logger = LogManager.getLogger(getClass());
       public static List<WebSocketSession> connectedUsers;
 
      
       public SocketHandler (){
             this.logger.info("create SocketHandler instance!");
             connectedUsers = new ArrayList<WebSocketSession>();
       }
 
       @Override //웹소켓 해재
       public void afterConnectionClosed(WebSocketSession session,
                    CloseStatus status) throws Exception {
             super.afterConnectionClosed(session, status);
 
             this.logger.info("remove session!");
             connectedUsers.remove(session);
             
             for(WebSocketSession webSocketSession : connectedUsers){
            	 if(!session.getId().equals(webSocketSession.getId())){
            		 webSocketSession.sendMessage(new TextMessage(session.getRemoteAddress().getHostName() + "퇴장했습니다."));
            	 }
             }
       }
 
       @Override
       public void afterConnectionEstablished(WebSocketSession session)
                    throws Exception {
             super.afterConnectionEstablished(session);
             connectedUsers.add(session);
             this.logger.info(session.getId() + "님이 접속 했습니다.");
             this.logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
             //**
             System.out.println("toString : "+connectedUsers.get(0).getId());
             //학생 리스트에 저장된 IP와 비교하여 닉네임or이름으로 보이게 설정필요
       }
 
//    @Override
//    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//    	MessageVO messageVO = MessageVO.convertMessage(message.getPayload());
//    	String hostName = "";
//    	
//    	for (WebSocketSession webSocketSession : connectedUsers){
//    		if (messageVO.getType().equals("all")){
//    			if(!session.getId().equals(webSocketSession.getId())){
//    				webSocketSession.sendMessage(
//    						new TextMessage(session.getRemoteAddress().getHostName() + " -> " + messageVO.getMessage() ));
//    			}
//    		}else{
//    			hostName = webSocketSession.getRemoteAddress().getHostName();
//    			if(messageVO.getTo().equals(hostName)){
//    				webSocketSession.sendMessage(
//    						new TextMessage(
//    								"<span style='color:red; font-weight: bold;' >"
//    								+ session.getRemoteAddress().getHostName() + " -> " + messageVO.getMessage()
//    								+ "</span>"));
//    				break;
//    			}
//    		}
//    	}
//    }//end
 
}
