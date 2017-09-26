<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>

<script type="text/javascript" src="js/jquery.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="topMenu.jsp" %>
<%@ include file="sidebar.jsp" %>
<style>
	div#wrapper{
		width : 800px;
		margin : 0 auto;
	}
	pre {
		width : 600px;
		height : 200px;
		overflow: auto;
		background-color: white;
	}
	table.reply {
		width : 800px;
	}
	span {
		display: inline-block;
		margin : 5px;
	}
</style>


<script>
	$(function() {
		$("#update").on('click',update);
	});

	function update() {
		var num = $('#num').val();
		location.href = "${pageContext.request.contextPath}/driveUpdateForm?num=" + num;
	}
	
	//글삭제
	function deleteForm(){
		var del = confirm("정말 삭제하시겠습니까?")
		if(del){
			location.href="driveDelete?num=${drive.num}";
		}
		return;
	}
	
	
</script>
</head>

<body>

<div id="wrapper" class="clearfix">

<div class="body-overlay"></div>
<section id="content">

	<div class="content-wrap">
	<div class="container clearfix">

	<div class="center">
	
	
	
	<h2>[ 자료실 글보기 ]</h2>
	</div>
	<form action="driveUpdateForm" id="Form" method="GET" >
	<input type="hidden" id="num" name="num" value="${drive.num}">
	<table class="Bordered table">
		<tr>
			<th colspan="3">${drive.title}제목제목</th>
		</tr>
		<tr id="photo_td">
			<td rowspan="3" class="col-md-3"><img src ="imgStatus?imgName=${userImg}" style="width: 200px; height: 200px"/></td>
			<td class="col-md-5">${drive.user_id}</td>
			<td rowspan="3" class="col-md-4">빈공간입니다 광고??</td>
		</tr>
		
		<tr>
			<th>${drive.register_time}</th>
		</tr>	
		<tr>
			<th>부가기능 쓴글보기나 회원정보 뭐..</th>
		</tr>
		
		<c:forEach items="${list}" var="driveList" varStatus="check">
				<tr>
				<td>
					<label>첨부파일${check.index + 1}</label>
				</td>
				<td>
					<a href="download?num=${driveList.num}">${driveList.original_filename}</a>
				</td>
			</tr>
		</c:forEach>
		
		<tr>	
			<td colspan="3">
				<pre class="col-md-12">${drive.content}</pre>
			</td>
		</tr>
		<tr>
			<td colspan="1">
				<a href="boardLocation?status=drive" >목록으로</a>
			</td>
			<td></td>
			<td align="right">	
				<input type="button" id="update" class="btn btn-primary" value="글수정">
				<input type="button" value="글삭제" class="btn btn-primary" onclick="deleteForm()"/>
				<a class="btn btn-primary" href="driveWrite" role="button"><i class="icon-book3"></i>글쓰기</a>
			</td>
		</tr>
	</table>
	</form>

</div> <!-- end #wrapper -->
</div>
</section>


</body>
</html>