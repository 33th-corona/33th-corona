<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="js/jquery.js"></script>
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<meta charset="UTF-8">
<title>게시글 수정</title>
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

<script>
$(function() {
	$('.plus').on('click', plus);
	$('.cansle').on('click', cansle);
	$('.modify').on('click', modify);
	$('#check').on('click',check);
	$('#back').on('click',back);
})
//추가 아이콘으로 첨부파일 추가
function plus() {
	var html = '<tr><td><label>파일 명</label></td><td>';
	html += '<input type="file" name="file1" class="upload"/>';
	html += '<img alt="수정" src="resources/modify.png" class="modify" width="20" height="20" style="cursor: pointer;">';
	html += '<img class="cansle" alt="취소" src="resources/cansle.png" width="20" height="20" style="cursor: pointer;">';
	html += '</td></tr>';
	$('#plustable').append(html);
	$('.modify').on('click', modify);
	$('.cansle').on('click', cansle);
}
//삭제 아이콘 누를시 삭제
function cansle() {
	$(this).parent().parent().remove();
}
//수정 아이콘 누를시  input file로 덮어 씌움
function modify() {
	var html = '<td><label>파일 명</label></td><td>';
	html += '<input type="file" name="file1" class="upload"/>';
	html += '<img alt="수정" src="resources/modify.png" class="modify" width="20" height="20" style="cursor: pointer;">';
	html += '<img class="cansle" alt="취소" src="resources/cansle.png" width="20" height="20" style="cursor: pointer;">';
	html += '</td>';
	$(this).parent().parent().html(html);
	$('.modify').on('click', modify);
	$('.cansle').on('click', cansle);
}

//게시판 글 및 첨부파일 유무 유효성 검사
function check(){
	alert('체크');
	var title = $('#title').val();
	var file1 = $('.upload');
	var original_filename = $('.original_filename');
	var content = $('#content').val();
	if(title == ''){
		alert('제목을 적으세요.');
		return;
	}
	if(file1.length == 0 && original_filename.length == 0){
		alert('첨부파일이 없습니다. 확인해주세요');
		return;	
	}
	for (var i = 0; i < file1.length; i++) {
		var check = $(file1[i]).val();
		if(check == null){
			alert('첨부파일이 없습니다. 확인해주세요');
			return;	
		}
		if(check == ''){
			alert('첨부파일이 없습니다. 확인해주세요');
			return;	
		}
	}
	if(content == ''){
		alert('내용을 적어주세요');
		return;
	}
	alert('유효성검사 끝');
	$('#dup').submit();
}

//돌아가기 버튼
function back() {
	history.back();
}

</script>

</head>
<body>
<div id="wrapper">
<h2>[ 자료실 수정  ]</h2>
<form id="dup" action="driveUpdate" method="POST" enctype="multipart/form-data">
<input type="hidden" name="num" value="${drive.num}">
<input type="hidden" id="user_id" name="user_id" class="user_id" value="${drive.user_id}">
	<table class="Bordered table">
		<thead>
			<tr>
				<th colspan="2">
					<label>파일 업로드 폼</label>
				</th>
			</tr>
		</thead>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" required value="${drive.title}" class="col-md-12"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${loginId}로그인세션아이디</td>
		</tr>
		<tr>
			<td>
				<label>파일 추가</label>
			</td>
			<td>
				<img class="plus" alt="추가" src="resources/plus.png" width="20" height="20" style="cursor: pointer;">
			</td>
		</tr>
		<c:forEach items="${list}" var="driveList" varStatus="check">
				<tr>
				<td>
					<label>파일 명</label>
				</td>
				<td>
					<a href="download?num=${driveList.num}">${driveList.original_filename}</a> 
					<input type="hidden" name="original_filename" class="original_filename" value="${driveList.original_filename}">
					<img alt="수정" src="resources/modify.png" class="modify" width="20" height="20" style="cursor: pointer;">
					<img alt="삭제" src="resources/cansle.png" class="cansle" width="20" height="20" style="cursor: pointer;">
				</td>
			</tr>
			</c:forEach>
		
		<tbody id="plustable">
		</tbody>
		
		<tr>
			<td colspan="2"><textarea name="content" cols="60" rows="15" class="col-md-12">${drive.content}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="right">
				<a href="boardLocation?status=drive" class="btn btn-primary">취소</a>
				<input type="button" class="btn btn-primary" id="check" value='등록하기'>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>