<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지</title>
<script src="js/jquery.js"></script>
<script>
$(function() {
	alert("${message}");
	var status = $("#status").val();
	location.href = "${pageContext.request.contextPath}/";
});
</script>
</head>

<body>
	<input id="status" type="hidden" value="${locationStatus}">
</body>
</html>