<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Passed Lesson List</title>
<script>
$(function() {
	
});
function loadLessonInfo(class_num, saved_code, saved_audio) {
	var loadForm = $('form#loadForm');
	var class_numTag = loadForm.find('class_num');
	var saved_codeTag = loadForm.find('saved_code');
	var saved_audioTag = loadForm.find('saved_audio');
	
	class_numTag.val(class_num);
	saved_codeTag.val(saved_code);
	saved_audioTag.val(class_num);
}
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
		<h1>Passed Lesson List Page</h1>
		<span>Passed Lesson List Page</span>
	</div>
</section>

<section id="content">
<div class="container clearfix">
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>저장시간</th>
	</tr>
	
	<c:forEach var="savedLessonInfo" items="${savedLessonInfos}">
		<tr>
			<td>${savedLessonInfo.num}</td>
			<td><a href="#" onclick="loadLessonInfo('${savedLessonInfo.class_num}', '${savedLessonInfo.saved_code}', '${savedLessonInfo.saved_audio}')">${savedLessonInfo.title}</a></td>
			<td>${savedLessonInfo.savetime}</td>
		</tr>
	</c:forEach>

</table>
</div>
</section>

<form action="loadPassedLesson" method="post" id="loadForm">
<input type="hidden" id="class_num" name="class_num">
<input type="hidden" id="saved_code" name="saved_code">
<input type="hidden" id="saved_audio" name="saved_audio">
</form>

</body>
</html>