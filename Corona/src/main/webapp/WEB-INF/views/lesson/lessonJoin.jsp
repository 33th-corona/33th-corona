<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Side Lesson</title>
</head>
<body>
	<h4>Student Side Lesson</h4>
	<div id="wrapper">
		<form action="joinLesson" method="post">
			<a>반 번호</a><input type="text" name="classNum" id="classNum"><br>
			<a>학생 id</a><input type="text" name="studentId" id="studentId"><br>
			<input type="submit" value="join">
		</form>
	</div>
</body>
</html>