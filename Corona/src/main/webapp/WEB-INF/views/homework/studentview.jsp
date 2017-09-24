<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="resources/style.css" type="text/css" />
	
	<!-- One Page Module Specific Stylesheet -->
	<link rel="stylesheet" href="css/onepage.css" type="text/css" />
	<!-- / -->
	
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<link rel="stylesheet" href="css/fonts.css" type="text/css" />
	
	<!-- Bootstrap Switch CSS -->
	<link rel="stylesheet" href="css/components/bs-switches.css" type="text/css" />
	
	<!-- Date & Time Picker CSS -->
	<link rel="stylesheet" href="css/components/timepicker.css" type="text/css" />
	<link rel="stylesheet" href="css/components/daterangepicker.css" type="text/css" />
	
	<!-- Radio Checkbox Plugin -->
	
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	

<title>학생 과제 제출</title>
<%@ include file="../topMenu.jsp" %>
	<%@ include file="../sidebar.jsp" %>
<style>
#editor {
    clear: left;
  margin-right: 10px;
  padding: 5px;
  float: left;
  border-width: 1px;
  border-color: #7f7f7f;
  border-style: solid;
  border-radius: 10px;
}

</style>



</head>
<body class="scretched">
	
	<div id="wrapper" class="clearfix">
		<div data-animate = "fadeInLeft">
		<div id="body-overlay">
<!-- 			<div class="swiper-wrapper"> -->
<!-- 						<div class="swiper-slide dark" style="background-image: url('images/homework_img.jpg');"> -->
<!-- 							<div class="container clearfix" style="margin-left: 320px;"> -->
<!-- 								<div class="slider-caption slider-caption-center"> -->
<!-- 									<h2 data-caption-animate="fadeInUp" style="text-transform: capitalize;">Welcome to Corona</h2> -->
<!-- 									<p data-caption-animate="fadeInUp" data-caption-delay="200">이클립스를 이용한 Pure Java 수업 지원 서비스. <br>선생님의 이클립스를 실시간으로 확인하여<br>학생의 웹 페이지로 전송합니다.</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
<!-- 					</div> -->
		
		
		
		<section id = "page-title">
		
		<div class="container center clearfix">
			<h1>과제 제출 화면</h1>
		</div>
		
		</section>
	
	<section id="content">

<!-- 	<div class="content-wrap" style="padding-top: 10px;">	</div> -->
	<div class="swiper-slide dark" style="background-image: url('images/picture3.jpg'); background-size: cover;">
	
	<div class="container clearfix">
	
	
	<div class="row"> <!-- 큰 row 시작 -->
		<div class="row"> <!-- 중간줄 1번째 시작 -->
			
			<div class="col-md-6"> <!-- 서쪽 컬럼 시작 -->
				<div class="row">
					<div class="col_full"><i class="i-rounded i-light icon-edit"></i><h2 style="color: black;">과제명</h2></div>
				</div>
				<div class="row">
					<div class="col-md-10"><input type="text" id="title" name="title"
											value="${selectedTask.title}" readonly="readonly" class="form-control"></div>
				</div>
			</div>  <!-- 서쪽 컬럼 끝 -->
			
			<div class="col-md-6"> <!-- 동쪽 컬럼 시작 -->
				<div class="row">
					<div class="col_full"><i class="i-rounded i-light icon-edit"></i><h2 style="color: black;">과제 내용</h2></div>
				</div>
				<div class="row">
					<div class="col-md-10"><textarea class="form-control" rows="5" id="comment" readonly="readonly">${selectedTask.content}</textarea></div>						
				</div>
			</div> <!-- 동쪽 컬럼 끝 -->
			<input type="hidden" id="task_num" value="${selectedTask.num}" >
			
		</div> <!-- 중간줄 1번째 끝 -->
		
		<div class="line topmargin-sm bottommargin-sm"></div>
		
		<div class="row"> <!-- 중간줄 2번째 시작 -->
			<div class="row">
					<div class="col_full"><i class="i-rounded i-light icon-edit"></i><h2 style="color: black;">과제 코드</h2></div>
			</div>
			<div class="row">
				<div id="task_code" class="col_full">${selectedTask.code}</div>
			</div>
		</div> <!-- 중간줄 2번째 끝 -->
		
		<div class="row"> <!-- 중간줄 3번째 시작 -->
			<div class="col-md-6 col-md-offset-7">
				<button type="button" id="run" class="button button-xlarge button-leaf button-rounded tright">실행<i class="icon-circle-arrow-right"></i></button>
				<button type="button" id="back" class="button button-xlarge button-leaf button-rounded tright">뒤로<i class="icon-line-cross"></i></button>
				<button type="button" id="task_submit" class="button button-xlarge button-leaf button-rounded tright">과제 제출<i class="icon-line-layout"></i></button>
				<div id = "submit_button"></div>
				
				</div>
				
<!-- 			<div class="btn-group btn-group-group col-md-6 col-md-offset-8"> -->
<!-- 				<button type="button" id="run" class="btn btn-default">실행<i class="icon-circle-arrow-right"></i></button> -->
<!--  				<button type="button" id="back" class="btn btn-default">뒤로<i class="icon-line-cross"></i></button> -->
<!-- 				<button type="button" id="task_submit" class="btn btn-default">과제 제출<i class="icon-line-layout"></i></button> -->
<!-- 			</div> -->
				
		
		</div>  <!-- 중간줄 3번째 끝 -->
		
		<div class="line topmargin-sm bottommargin-sm"></div>
		
		</div> <!-- 큰 row 끝 -->
	</div>
	</div>
	
	</section>
	
	</div>
	
	<footer id="footer" class="dark noborder">

			<div id="copyrights">
				<div class="container center clearfix">
					Copyright HanJo 2017 | All Rights Reserved
				</div>
			</div>

	</footer><!-- #footer end -->
	</div>
</div> 
	
<!-- 	<p>과제명 -->
<%-- 	<input type="text" id="title" value="${selectedTask.title}" readonly="readonly"> --%>
<!-- 	</p> -->

<!-- 	<hr> -->

<!-- 	<p>과제 내용 -->
<%-- 	<input type="text" id="content" value="${selectedTask.content}" readonly="readonly"> --%>
<!-- 	</p> -->
<%-- 	<input type="hidden" id="task_num" value="${selectedTask.num}" > --%>
<!-- 	<br><hr> -->

<!-- 	<p>과제 코드</p> -->
<%-- 	<div id="task_code">${selectedTask.code}</div> --%>
	
<!-- 	<p> -->
<!-- 	<input type="button" id="run" value="실행"> -->
<!-- 	<input type="button" id="back" value="뒤로"> -->
<!-- 	</p> -->
<!-- 	<div id = "submit_button"></div> -->
	
<!-- 	</div> -->
	
	
	
<script src="resources/jquery-3.2.1.min.js"></script>
<script src="resources/ace.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
	
		<!-- Date & Time Picker JS -->
<script type="text/javascript" src="js/components/moment.js"></script>
<script type="text/javascript" src="js/components/timepicker.js"></script>

	<!-- Include Date Range Picker -->
<script type="text/javascript" src="js/components/daterangepicker.js"></script>
<script type="text/javascript" src="js/components/bs-switches.js"></script>
<script type="text/javascript" src="js/functions.js"></script>
	
<script type="text/javascript">
$(function (){
	
	//과제 제출 버튼의 다중생성을 막기 위함.
	var task_submit_buttoncount = 0;
	
	//web editor 객체 생성 (Code part)
    var editor = ace.edit("task_code");
	//web editor의 maxline을 설정
	editor.setOptions({ maxLines: Infinity });
	//web editor의 syntaxing 언어 설정(java)
	editor.getSession().setMode("ace/mode/java");
	//web editor의 테마 설정
	editor.setTheme("ace/theme/monokai");
	//web editor를 읽기 전용에의 설정을 해제
	editor.setReadOnly(false);
	
	
	//코드를 실행해 본다.(컴파일 및 런타임 체크)
	$("#run").on('click',function(){
		var code = editor.getValue();   //코드 전체
		var student_id = 'helloworld1'; //나중에 여기에 로그인한 학생의 세션id를 받아서 넣어주자.
		var task_num = $("#task_num").val(); //task_num
		var title = $("#title").val();  //과제 제목

		
		//ajax처리
		var aceData = {
			"task_num" : task_num,
			"user_id" : student_id,
			"submit_code" : code,
			"title": title
		}
		
		
		$.ajax({
			method:"POST",
			url:"runtime",
			data:aceData,
			success:function(data){
				alert("학생과제 데이터 전송완료. 컴파일 및 런타임 수행");
				if(data == true) {
					if(task_submit_buttoncount < 1) {
						var html = '<button type="button" id="task_submit" class="button button-xlarge button-leaf button-rounded tright">과제 제출<i class="icon-line-layout"></i></button>';
						
						$("#submit_button").append(html);
						
						task_submit_buttoncount += 1;
					}
					
				}
			},
			error:function(data){
				alert("학생과제 데이터 전송실패");
				
				return false;
			}
		});
		
		
		$("#task_submit").on('click',function(){
			//ajax처리
			var aceData = {
				"task_num" : task_num,
				"user_id" : student_id,
				"submit_code" : code,
				"title": title
			}
			
			$.ajax({
				method:"POST",
				url:"save_submit",
				data:aceData,
				success:function(data){
					alert(data);
				},
				error:function(data){
					alert("학생의 과제를 기록 실패");
					
					return false;
				}
			});
		});
		
	});
	
	$("#back").on('click',function(){
		location.href="${pageContext.request.contextPath}/tasklist";
	});
	
});

</script>
</body>
</html>