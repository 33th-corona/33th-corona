<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="js/jquery.js"></script>
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	
	<script type="text/javascript" src="resources/textEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

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
	
	div#wrapper table {
		margin:0 auto;
	}
	
	#content {
		width : 780px;
	}
	
</style>
</head>
<script type="text/javascript">
window.onload = function(){	
	$('.plus').on('click',plus);
	$('.cansle').on('click', cansle);
	
	function plus() {
		var html = '<tr><td><label>파일 명</label></td><td>';
		html += '<input type="file" id="ty"  name="file1" class="upload" />';
		html += '<img class="cansle" alt="취소" src="resources/cansle.png" width="20" height="20" style="cursor: pointer;">';
		html += '</td></tr>';
		$('#plustable').append(html);
		$('.cansle').on('click', cansle);
	}
	
	function cansle() {
		$(this).parent().parent().remove();
	}
	
	
	 var oEditors = [];

	 nhn.husky.EZCreator.createInIFrame({
	
	 oAppRef: oEditors,

	 elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다.

	 sSkinURI: "resources/textEditor/SmartEditor2Skin.html",
	 
	 htParams : {
         // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
         bUseToolbar : true,             
         // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
         bUseVerticalResizer : true,     
         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
         bUseModeChanger : true,         
         fOnBeforeUnload : function(){
              
         }
     }, 
     fOnAppLoad : function(){
         //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
         oEditors.getById["content"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
     },
	 
	 fCreator: "createSEditor2"
	 });
	 
	//저장버튼 클릭시 form 전송
     $("#save").click(function(){
    	 if($(".upload").val() != null){
	    	var fileValue = $(".upload").val().split("\\");
	    	var fileName = fileValue[fileValue.length-1]; // 파일명
	    	 
	    	var fileKind = fileName.split(".")[1];
			if(!(fileKind == 'png' || 'jpg' || 'gif')){
			alert('이미지 파일형식만 업로드 해주세요');
	    	return false;
			}
    	 }
    	 
         oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
         $("#frm").submit();
         alert('글 저장');
     });   
	 
}
</script>
<body>
<div id="wrapper">
<h2>[ 게시판 글쓰기 ]</h2>
<form action="boardWrite" method="POST" id="frm" enctype="multipart/form-data">
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
		<td colspan="2"><textarea name="content" id="content" rows="22"></textarea></td>
	</tr>
	
	<tr>
		<td colspan="2" align="right">
			<a href="boardList" class="btn btn-primary">취소</a>
			<input type="button" id="save" class="btn btn-primary" value='등록하기'>
		</td>
	</tr>
	</table>
	
</form>
</div>
</body>


</html>