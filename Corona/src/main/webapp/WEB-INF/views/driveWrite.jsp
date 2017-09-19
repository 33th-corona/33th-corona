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

<script>
	$(function(){
		$('#check').on('click',check);
		$('.plus').on('click',plus);
	});
	
	function plus() {
		var html = '<tr><td><label>파일 명</label></td><td>';
		html += '<input type="file" name="file1" class="upload"/>';
		html += '<img class="cansle" alt="취소" src="resources/cansle.png" width="20" height="20" style="cursor: pointer;">';
		html += '</td></tr>';
		$('#plustable').append(html);
		$('.cansle').on('click', cansle);
	}
	function cansle() {
		$(this).parent().parent().remove();
	}
	
	function check(){
		var title = $('#title').val();
		var file1 = $('.upload');
		
		var content = $('#content').val();
		if(title == ''){
			alert('제목을 적으세요.');
			return;
		}
		if(file1.length == 0){
			alert('첨부파일이 없습니다. 확인해주세요');
			return;	
		}
		for (var i = 0; i < file1.length; i++) {
			var check = $(file1[i]).val();
			alert(check);
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
		$('#upload').submit();
	}
	
</script>

</head>
<body>
<div id="wrapper">
<h2>[ 자료실 글쓰기 ]</h2>
<form id="upload" action="upload" method="POST" enctype="multipart/form-data">
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
			<td><input type="text" name="title" required class="col-md-12"/></td>
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
		
		<tbody id="plustable">
		</tbody>
		
		<tr>
			<td colspan="2"><textarea name="content" cols="60" rows="15" class="col-md-12">simple is best</textarea></td>
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