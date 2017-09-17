<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="resources/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
		$("#startBtn").on("click",start)
		$("#stopBtn").on("click",stop)
	})
	
	
	
	
	//sock = new WebSocket("ws://"+ window.location.host +"/recorder/echo");
	
	//sock.onopen = function(){
		//alert("웹소켓이 생성되었습니다");
	//}
	
	
	
	



	function start(){
		$.ajax({
			url: "start",
			dataType: "text",
			success: message
		})
	}

	function stop(){
		$.ajax({
			url: "stop",
			dataType: "text",
			success: message
		})
	}
	
	function message(resp){
		alert(resp);
	}

</script>
<body>
<h1>[  녹음 테스트 페이지입니다  ]</h1>
<input id ="startBtn" type="button" value="녹음시작">
<input id ="stopBtn"  type="button" value="녹음중지">






</body>
</html>