<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<script src="resources/jquery-3.2.1.min.js"></script>
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	
	<script type="text/javascript" src="resources/textEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	
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
        oEditors.getById["content"].exec("PASTE_HTML", ['${board.content}']);

    },
	 
	 fCreator: "createSEditor2"
	 });
	 
	//저장버튼 클릭시 form 전송
    $("#save").click(function(){
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
        $("#frm").submit();
        alert('글 저장');
    });   
	 
}
</script>

<body>
<div id="wrapper">
<h2>[ 게시글 수정  ]</h2>
<form action="boardUpdate" method="POST" id='frm' >
<input type="hidden" name="num" value="${board.num}">
	<table class="Bordered table">
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" required class="col-md-12" value="${board.title}" /></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${loginId}로그인세션아이디</td>
	</tr>
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