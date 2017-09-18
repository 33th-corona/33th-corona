<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<script src="resources/jquery-3.2.1.min.js"></script>
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#wrapper{
		width : 800px;
		margin : 0 auto;
		
	}
	div#wrapper>h2 {
		text-align : center;
	}
	th {
		width: 100px;
	}
	td {
		width:600px;
	}
	div#wrapper table {
		margin:0 auto;
	}
</style>
</head>
<body>
<div id="wrapper">
<h2>[ 자료실 글쓰기 ]</h2>
<form action="boardWrite" method="POST" enctype="multipart/form-data">
	<table class="Bordered table">
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" required class="col-md-12"/></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${loginId}로그인세션아이디</td>
	</tr>
	<tr>
		<th>파일업로드</th>
		<td><input type="file"></td>
	</tr>
	<tr>
		<td colspan="2"><textarea name="content" cols="60" rows="15" class="col-md-12">simple is best</textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<a href="boardList" class="btn btn-primary">취소</a>
			<input type="submit" class="btn btn-primary" value='등록하기'>
		</td>
	</tr>
	</table>
</form>
</div>
</body>
</html>