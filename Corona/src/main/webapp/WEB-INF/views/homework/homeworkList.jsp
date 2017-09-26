<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homework List</title>
<script src="js/jquery-3.2.1.min.js/"></script>
<script>
$(function() {
	$('#homeworkCreateForm').on('click', function() {
		location.href = 'homeworkCreateForm?classNum=${classNum}';
	});
});
</script>
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

<!-- 특정 글 검색 -->
	<div class="search">
		<form id="search" action ="passedLessonList" method="GET" >
			<input type="hidden" name="classNum" value="${classNum}" /> 
			<input type="text" name="searchword" value="${searchword}" /> 
			<input class="btn" type="submit" value="검색" />
		</form>
	</div>	

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
				<td>${taskInfo.title}</td>
				<td>${taskInfo.deadline}</td>
				<c:if test="${position eq 'student' }">
					<c:if test="${taskInfo.submitted}">
						<td><a href="myhomeworkConfirm?homeworkNum=${taskInfo.num}">제출 답안 확인</a></td>
					</c:if>
					<c:if test="${!taskInfo.submitted}">
						<c:if test="${taskInfo.is_closed eq 'n'}">
							<td><a href="homeworkDetail?homeworkNum=${taskInfo.num}">과제작성</a></td>
						</c:if>
						<c:if test="${taskInfo.is_closed ne 'n'}">
							<td>기한마감</td>
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${position eq 'teacher' }">
					<td><a href="submittedHomeworkConfirm?homeworkNum=${taskInfo.num}">제출자 확인</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	
	<c:if test="${position eq 'teacher' }">
		<input type="button" id="homeworkCreateForm" value="과제 생성">
	</c:if>
</div>
</section>

</body>
</html>