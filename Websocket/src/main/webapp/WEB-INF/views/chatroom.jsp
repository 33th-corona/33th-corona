<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[ 채팅룸 ]</title>
<script type="text/javascript" src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
var sock = null;
var message = {};

$(document).ready(function(){
     
    sock = new WebSocket("ws://"+ window.location.host +"/websocket/echo");
    
    //채팅창에 접속했을 때
    sock.onopen = function() {
        message={};
        message.message = "반갑습니다.";
        message.type = "all";
        message.to = "all";
        sock.send(JSON.stringify(message));
		alert("입장");
    };
    
    //메시지를 보냈을 때 이전 메시지+최신 메시지+<br>
    sock.onmessage = function(evt) {
        $("#chatMessage").append(evt.data);
        $("#chatMessage").append("<br />");
        $("#chatMessage").scrollTop(99999999);
    };
    
    //채팅창에서 퇴장했을 때
    sock.onclose = function() {
        // sock.send("채팅을 종료합니다.");
        alert("퇴장"); //안나옴
    }
     
    //엔터키를 누르면 메시지를 보내도록 설정
     $("#message").keydown(function (key) {
         if (key.keyCode == 13) {
            $("#sendMessage").click();
         }
      });
     
    //보내기 버튼을 클릭했을 때
    $("#sendMessage").click(function() {
        if( $("#message").val() != "") { 
            message={};
            message.message = $("#message").val();
            message.type = "all";
            message.to = "all";
             
            var to = $("#to").val();
            if ( to != "") {            //귓속말 대상이 존재하면 type을 변경해준다
                message.type = "one";
                message.to = to;
            }
             
            sock.send(JSON.stringify(message));
            $("#chatMessage").append("나 ->  " + $("#message").val() + "<br/>");
            $("#chatMessage").scrollTop(99999999);
             
            $("#message").val("");
        }
    });
});
</script>
</head>
<body>
<input type="button" id="sendMessage" value="전송" />
<input type="text" id="message" placeholder="메시지 내용"/>
<input type="text" id="to" placeholder="귓속말대상"/>
<div id="chatMessage" style="overFlow: auto; max-height: 500px;"></div>
<div id="member"></div>
</body>
</html>
