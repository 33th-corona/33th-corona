<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.2.1.min.js/"></script>
<script>
$(function() {
	alert("500에러 발생! 메인으로 돌아갑니다.");
	location.href = '${pageContext.request.contextPath}/';
});
</script>
</head>
<body>
</body>
</html>