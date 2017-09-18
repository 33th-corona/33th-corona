<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<script src="resources/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<script type="text/javascript" src="resources/textEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#wrapper{
		width : 800px;
		margin : 0 auto;
	}
	pre {
		height : 400px;
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
	$(function(){
		init();
		$("#reply_submit").on("click", replywrite);
	});
	
	function init(){
		var board_num = ${board.num};
		$.ajax({
			url : "replyList",
			method:"get",
			data:"board_num="+board_num,
			dataType:"json",
			success : replyList,
			error : function(){
				alert("게시글을 읽어올 수 없습니다.");
			}
		});
	}
	
	//댓글
	function replyList(resp){
		var data = "<table class='Bordered table'>";
		$.each(resp, function(index,reply){
			data += "<tr>";
			data += "<td class='col-md-2'>";
			if(reply.parent != 0) data+= "└ "; //답글이면 ㄴ 추가, 후에 이미지로 대체
			data += reply.user_id+"</td>"; 
			data += "<td class='col-md-7'>"+reply.content+"</td>";
			data += "<td class='col-md-3'>"+reply.register_time;
			var delBtn = "del"+reply.num;
			var updateBtn = "update"+reply.num;
			if(reply.user_id == "${loginId}"){
				data += "<i data-rno='"+reply.num+"'class='delete icon-remove'></i>";
				data += "<i class='update icon-line2-magic-wand' data-rno='"+reply.num+"' data-con='"+reply.content+"'></i>";
				}
			if(reply.parent ==0){
			data += "<i class='reReply icon-plus' data-rno='"+reply.num+"' data-prt='"+reply.parent+"'></i></td>"; //대댓글
			}
			data += "</tr>";
		}); //end $.each
		data += "</table>";
		$("#replydisplay").html(data);
		//삭제
		$(".delete").on("click",function(){
			var bnum = ${board.num};
			var rnum = $(this).attr("data-rno");
			$.ajax({ 
				url : "replyDelete",
				method :"get",
				data : "rnum="+rnum+"&bnum="+bnum,
				success : function(){
					alert("댓글이 삭제되었습니다.");
					init(); // 삭제되면 리스트 새로 그리기
				}
				, error : function(){
					alert("댓글 삭제에 실패했습니다.");
				}
			});//end ajax
		}); // end delete
		//수정
		  $(".update").on("click",function(){
			$("#reply_submit").val('댓글수정'); //버튼값 바꾸기
			$('#reply_submit').off('click');
			var con = $(this).attr('data-con');//댓글내용가져오기
			var reply = $(this).attr('data-rno'); //리플넘버가져오기
			document.getElementById("reply_text").value = con; //댓글입력창에 수정하고자하는 댓글내용표시
			$('#reply_text').focus();
			$("#reply_submit").on("click",function(){
				var replytxt = $("#reply_text").val(); //댓글입력란 텍스트 가져오기
				$.ajax({
					url : "replyUpdate",
					method : "get",
					data : "num="+reply+"&content="+replytxt,
					success : function(){
						init();
						$("#reply_submit").off('click');
						$("#reply_submit").on("click", replywrite);
						$("#reply_submit").val('댓글입력');
						$("#reply_text").val("");
					}
					,error : function(){
						alert("댓글수정에 실패했습니다.");
					}
				});//end ajax
			})//end 수정버튼클릭
			return false;
		});//end update	
		//답글
		$(".reReply").on("click",function(){
			//$("#reply_submit").val('답글달기'); //버튼값 바꾸기
			$('#reply_submit').off('click'); //기존 이벤트 삭제
			$('#reply_text').focus();
			var reply = $(this).attr('data-rno'); //리플넘버가져오기
			$("#reply_submit").on("click",function(){
				var replytxt = $("#reply_text").val();
				var bnum = ${board.num};
				$.ajax({
					url : "replyWrite",
					method : "post",
					data : "parent="+reply+"&content="+replytxt+"&board_num="+bnum,
					success : function(){
						init();
						$("#reply_submit").off('click');
						$("#reply_submit").on('click', replywrite);
						//$("#reply_submit").val('댓글입력');
						$("#reply_text").val("");
					}
					,error : function(){
						alert("답글달기에 실패했습니다");
					}
				});//end ajax
			});
		});//end reReply		
			
	}	
	//댓글작성
	function replywrite() {
		var d = document.getElementById("reply_text").value;
		alert(d);
		
		if(document.getElementById("reply_text").value == ""){
			alert("댓글을 입력해주세요");
			return false;
		}
		
		var writetext = document.getElementById("reply_text").value;
		var board_num = ${board.num};
			$.ajax({
				url:"replyWrite",
				method : "post",
				data : "content="+writetext+"&board_num="+board_num,
				success : function(){
					init();
				}
				,error: function(){
					alert("댓글작성에 실패했습니다");
				}
			});//end ajax
	}
	//글삭제
	function deleteForm(){
		var del = confirm("정말 삭제하시겠습니까?")
		if(del){
			location.href="deleteForm?num=${board.num}";
		}
		return;
	}	
</script>

<!--
<script type="text/javascript">
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
	
	oAppRef: oEditors,
	
	elPlaceHolder: "content",
	
	fOnAppLoad : function(){
	    //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	    oEditors.getById["content"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
	    
	};
</script> -->
</head>
<body>

<div id="wrapper">
	<div class="center">
	<h2>[ 게시판 글보기 ]</h2>
	</div>
	<form action="boardUpdateForm" id="Form" method="POST" >
	<input type="hidden" name="num" value="${board.num}">
	<table class="Bordered table">
		<tr>
			<th colspan="3">${board.title} [${board.reply_count}]</th>
		</tr>
		<tr id="photo_td">
			<td rowspan="3" class="col-md-3">프로필사진</td>
			<td class="col-md-5">${board.user_id}작성자</td>
			<td rowspan="3" class="col-md-4">빈 공간 무엇을 추가할까</td>
		</tr>
		
		<tr>
			<th>${board.register_time}</th>
		</tr>	
		<tr>
			<th>부가기능 쓴글보기나 회원정보 뭐..</th>
		</tr>
		<tr>
			<td colspan="3">
				<pre class="col-md-12 row-md-5" id="context">${board.content}</pre>
			</td>
		</tr>
		<tr>
			<td colspan="1">
				<a href="boardLocation?status=${status}">목록으로</a>
			</td>
			<td></td>
			<td align="right">	
				<input type="submit" class="btn btn-primary" value="글수정">
				<input type="button" value="글삭제" class="btn btn-primary" onclick="deleteForm()"/>
				<a class="btn btn-primary" href="boardWrite" role="button"><i class="icon-book3"></i>글쓰기</a>
			</td>
		</tr>
	</table>
	</form>
	<span>댓글 수 : </span><span id="replycount">${board.reply_count}</span> <span>조회수 : ${board.hit}</span>
	<!-- 댓글 입력 / 로그인한 사람만 댓글을 달 수 있다. -->
		<form id="replyWrite" action="replyWrite" method="POST">
		<input type="hidden" name="action" value="replyWrite" />
		<input type="hidden" name="board_num" value="${board.num}" />
		<table id="replyinput" class="reply">
			<tr>
				<td>
				<label class="col-md-2">유저네임</label>
				<textarea class="col-md-9" id="reply_text" name="reply_text" maxlength="400"></textarea>
				<a class="btn btn-primary col-md-1" id="reply_submit" role="button"><i class="icon-ok"></i>등록</a>
				</td>
			</tr>
		</table>
		</form>

	<!-- 댓글 출력 -->
	<div id="replydisplay">
		<!--
		<table class="Bordered table">
		<tr>
			<td class="col-md-2">작성자</td>
			<td class="col-md-6">댓글내용&nbsp;<a><i class='reReply icon-plus' data-rno='reply.num' data-prt='reply.parent'></i></a></td>
			<td class="col-md-4" align="right">2017-09-11
				<i class='delete icon-remove' data-rno='reply.num'></i>
				<i class='update icon-legal' data-rno='reply.num' data-con='reply.content'></i>
			</td>
		</tr>
		
		<tr>
			<td class="col-md-2">작성자2</td>
			<td class="col-md-6">댓글내용2ddddddddddddddddddd&nbsp;<a><i class='reReply icon-plus' data-rno='reply.num' data-prt='reply.parent'></i></a></td>
			<td class="col-md-4" align="right">2017-09-11
				<i class='delete icon-remove' data-rno='reply.num'></i>
				<i class='update icon-legal' data-rno='reply.num' data-con='reply.content'></i>
			</td>
		</tr>
		
		<tr>
			<td class="col-md-2">작성자3</td>
			<td class="col-md-6">댓글내용3</td>
			<td class="col-md-4" align="right">2017-09-11
				<input type='button' data-rno='"+reply.num+"'class='delete' value='삭제'>
				<input type='button' class='update' data-rno='"+reply.num+"' data-con='"+reply.content+"' value='수정'>
				<input type='button' class='reReply' data-rno='"+reply.num+"' data-prt='"+reply.parent+"' value='답글'>
			</td>
		</tr>
		</table>
		-->
	</div><!-- end #replydisplay -->
</div> <!-- end #wrapper -->


</body>
</html>