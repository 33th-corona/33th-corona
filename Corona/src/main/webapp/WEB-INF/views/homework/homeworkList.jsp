<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homework List</title>
</head>
<%@ include file="../topMenu.jsp" %>
	<%@ include file="../sidebar.jsp" %>
<body class="stretched side-panel-left">
<div class="body-overlay"></div>

<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini bottommargin-sm">
	<div class="container clearfix">
		<h1>Homework List Page</h1>
		<span>Homework List Page</span>
	</div>
</section>

<section id="content">
<div class="container clearfix">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과제내용</th>
			<th>제출기한</th>
			<th>제출가능여부</th>
		</tr>
		
		<c:forEach var="taskInfo" items="${taskInfoList}">
			<tr>
				<td>${taskInfo.num}</td>
				<td><a href="submit_list?num=${taskInfo.num}">${taskInfo.content}</a></td>
				<td>${taskInfo.deadline}</td>
				<c:if test="${position eq 'student' }">
					<c:if test="${taskInfo.is_closed eq 'n'}">
						<td><a href="submit_form?num=${taskList.num}">과제작성</a></td>
					</c:if>
					<c:if test="${taskInfo.is_closed ne 'n'}">
						<td>기한마감</td>
					</c:if>
				</c:if>
				<c:if test="${position eq 'teacher' }">
					<td><a href="submit_form?num=${taskList.num}">제출자 확인</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<input type="button" id="back_main" value="뒤로">
</div>
</section>

</body>
</html>