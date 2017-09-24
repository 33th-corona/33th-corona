<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!--오늘은 여기까지  -->
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
	<link rel="stylesheet" href="css/components/bs-datatable.css" type="text/css" />
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<link rel="stylesheet" href="css/customHeader.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>
<style type="text/css">
.button-orange { background-color: #ff9800 !important; }

.button-3d.boran:hover,
.button-reveal.boran:hover,
.button-border.boran:hover,
.button-border.boran.button-fill:before { background-color: #ff9800 !important; }
.button.button-3d:hover {
	background-color: #000530 !important;
}
.boran{
	border-color: #ff9800 !important
}
.feature-box .fbox-icon i,
.feature-box .fbox-icon img {
	border-radius: 50%;
	background-color: #000000 !important;
}
.feature-box.fbox-outline .fbox-icon {
    border: 1px solid #000530 !important;
    border-radius: 50%;
    padding: 3px;
}
.fbox-effect .fbox-icon i:after {
    top: -3px;
    left: -3px;
    padding: 3px;
    box-shadow: 0 0 0 2px #fff !important;
    -webkit-transition: -webkit-transform 0.3s, opacity 0.3s;
    -webkit-transform: scale(.8);
    -moz-transition: -moz-transform 0.3s, opacity 0.3s;
    -moz-transform: scale(.8);
    -ms-transform: scale(.8);
    transition: transform 0.3s, opacity 0.3s;
    transform: scale(.8);
    opacity: 0;
    
}
#wrapper {
	background-color: rgba(255, 255, 255, 0);
}
</style>
</head>
<body class="stretched no-transition" style="background-image: url('images/back2.jpeg'); background-size: 1600px; background-repeat: no-repeat;" >
	<div class="body-overlay"></div>
		<div id="wrapper" class="clearfix">
			<section id="page-title" class="page-title-parallax page-title-dark page-title-video" style="padding : 30px 0; margin-top: 20px; ">
			<div class="video-wrap" id="video-wrap">
				<video poster="images/videos/explore.jpg" preload="auto" loop autoplay muted style="width: 1300px !important; ">
					<source src='images/videos/teacher.mp4' type='video/webm' />
				</video>
				<div class="video-overlay"></div>
			</div>
			<div class="container clearfix" style="z-index: 1;">
					<div class="emphasis-title">
							<span class="t-rotate t700 font-body col_full" style="font-size: 60px; color:#222 !important;">${classInfo.name}</span>
					</div>
			</div>
	</section>
		<section id="content" style="background-color: transparent;">

			<div class="content-wrap" style="padding-top: 20px; padding-bottom: 20px;">

				<div class="container clearfix">
				<div class="col-md-2" style="margin-left: 100px;">
				<form action="#">
				<div status="normal" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #000530; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="${pageContext.request.contextPath}/boardLocation?status='normal'" style="background-color: transparent;"><i class="icon-list i-alt"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important; font-size: 24px;">일반 게시판</h2></div>
				
				</div>
				</form>
				</div>
				<div class="col-md-2" style="margin-top: 100px;">
				<form action="#">
				<div status="drive" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #000530; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="${pageContext.request.contextPath}/boardLocation?status='drive'" style="background-color: transparent;"><i class="icon-line-paper-clip"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important;">자료실</h2></div>
				
				</div>
				</form>
				</div>
				
				
				<div class="col-md-2" >
				<form action="lessonStart" method="POST" id="lesson">
				<input type="hidden" value="${classInfo.teacher_id}" name="teacher_id">
				<input type="hidden" value="${classInfo.num}" name="classNum">
				<div status="study" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #000530; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="#" style="background-color: transparent;"><i class="icon-et-search i-alt"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important;">강의 시작</h2></div>
				</div>
				</form>
				</div> 
				<div class="col-md-2" style="margin-top: 100px;">
				<form action="#">
				<div status="passedLesson" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #000530; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="${pageContext.request.contextPath}/passedLessonList?classNum=${classInfo.num}" style="background-color: transparent;"><i class="icon-study"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important;">지난 강의</h2></div>
				
				</div>
				</form>
				</div>
				<div class="col-md-2">
				<form action="#">
				<div status="homeworkList" class="feature-box fbox-outline fbox-effect nomargin col_full location" style="padding:5px; position: static !important; background-color: #000530; border-radius: 100%; background-image: url(images/icons/iconalt.svg); background-position: center center; background-size: 100% 100%; cursor: pointer;">
							<div class="fbox-icon center" style="position: static !important; margin: 0 auto !important;">
								<a href="#" style="background-color: transparent;"><i class="icon-book3 i-alt"></i></a>
							</div>
							<div class="col_full center" style="padding-top:1px;"><h2 style="color: white !important; font-size: 24px;">과제 게시판</h2></div>
				
				</div>
				</form>
				</div>
				</div>
			</div>
		</section>
		<section>
			<div class="container clearfix" style="margin-right: 50px;">
				<div class="panel-heading">
					<div id="homeWork" class="entry clearfix"
					style="margin-bottom: 10px; padding-bottom: 10px;">
					<div class="table-responsive col-md-6">
					<h2>가입 신청 정보</h2>
					<table id="datatable3"
						class="table table-striped table-bordered datatable"
						cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>UserId</th>
								<th>Commit</th>
								<th>WithDraw</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>UserId</th>
								<th>Commit</th>
								<th>WithDraw</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${userList}" var="uList">
								<c:if test="${uList.status == 'request'}">
								<tr>
									<th>${uList.user_id}</th>
									<th class="center result">
										<c:if test="${uList.status eq 'request'}">
											<button num="${uList.num}" status="student" class="button button-rounded button-reveal button-small button-border button-orange tright nomargin status boran"><i class="icon-angle-right" style="width:20px;"></i>승낙</button>
										</c:if>
									</th>
									<th class="center result">
										<c:if test="${uList.status eq 'request'}">
											<button num="${uList.num}" status="withdraw" class="button button-rounded button-reveal button-small button-border button-red tright nomargin status"><i class="icon-angle-right" style="width:20px;"></i>거부</button>
										</c:if>
									</th>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					</div>
					<div class="panel panel-default col-md-6">
					<h2>가입자 명단</h2>
							<!-- Default panel contents -->

							<!-- Table -->
							<table id="datatable4" class="table">
								<thead>
									<tr>
										<th>Num</th>
										<th>UserId</th>
										<th>Email</th>
										<th>Retired</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userList}" var="sList">
										<c:if test="${sList.status == 'student'}">
										<tr>
											<th>${sList.num}</th>
											<th>${sList.user_id}</th>
											<c:forEach items="${allList}" var="all">
											<c:if test="${all.id == sList.user_id}">
											<th>${all.email}</th>
											</c:if>
											</c:forEach>
											<th><button num="${sList.num}" class="button button-rounded button-reveal button-small button-border button-gray tright nomargin retired"><i class="icon-angle-right" style="width: 20px "></i>탈퇴</button></th>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Footer
		============================================= -->
		<footer id="footer" class="dark noborder">

			<div id="copyrights">
				<div class="container center clearfix">
					Copyright HanJo 2017 | All Rights Reserved
				</div>
			</div>

		</footer><!-- #footer end -->
	</div><!-- #wrapper end -->
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	<script type="text/javascript" src="js/components/bs-datatable.js"></script>
	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	<script>

		$(function() {

			$('.datatable')
					.dataTable(
							{
								"columns" : [ {
									"width" : "50%"
								}, {
									"width" : "25%",
									"orderable" : false
								}, {
									"width" : "25%",
									"orderable" : false
								}, ],
								scrollY : 300,
								scrollCollapse : true,
								columnDefs : [ {
									targets : 0,
									render : function(data, type, row) {
										return type === 'display'
												&& data.length > 10 ? data
												.substr(0, 10)
												+ '…' : data;
									}
								} ],
								"bSortClasses" : false
							});
			$('#datatable3 tbody').on('click', '.status', status);
			$('#datatable4 tbody').on('click', '.retired', retired);
			$('#lessonbtn').on('click', function() {
				$()
			})
			$('.feature-box').mouseover(function() {
				$(this).find('h2').css('color', '#000000');
				$(this).find('a').css('color','#ff9800');
				$(this).css('background-color', '#ff9800');
			})
			$('.feature-box').mouseout(function() {
				$(this).find('h2').css('color', '#ffffff');
				$(this).find('a').css('color','white');
				$(this).css('background-color', '#000530');
			})
			$('.location').on('click', locationStatus);
			
			$('#wrapper').animate({
				backgroundColor: "rgba(255, 255, 255, 0.5)"
			}, 1500);
			
		});
		function locationStatus(){
			var status= $(this).attr('status');
			if(status == 'normal' || status == "drive"){
				location.href = "${pageContext.request.contextPath}/boardLocation?status=" + status;
			} else if(status == 'study') {
				$('#lesson').submit();
			} else if(status == 'passedLesson') {
				location.href = '${pageContext.request.contextPath}/passedLessonList?classNum=${classInfo.num}';
			} else if(status == 'homeworkList') {
				location.href = '${pageContext.request.contextPath}/homeworkList?classNum=${classInfo.num}';
			}
		}
		
		function status() {
			var num = $(this).attr('num');
			var statusChange = $(this).attr('status');
			var btn = $(this);
			var result = confirm(statusChange + " : 실행 하시겠습니까?");
			if(result){
			$.ajax({
						url : 'status',
						method : 'POST',
						data : 'num=' + num + '&status=' + statusChange,
						success : function(repo) {
							if(repo == 'student'){
								$(btn).parent().html('<button disabled="disabled" num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-blue tright nomargin request"><i class="icon-lock3" style="width: 20px"></i>승인완료</button>');
								$('th.result').find('button').each(function(index) {
									var wnum = $(this).attr('num');
									var wstatusChange = $(this).attr('status');
									if(wstatusChange == 'withdraw' && num == wnum){
										$(this).parent().html('<button disabled="disabled" num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-blue tright nomargin request"><i class="icon-lock3" style="width: 20px"></i>승인완료</button>');
									}
								})
							}
							if(repo == 'withdraw'){
								$(btn).parent().html('<button disabled="disabled" num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-red tright nomargin request"><i class="icon-lock3" style="width: 20px"></i>거부완료</button>');
								$('th.result').find('button').each(function(index) {
									var snum = $(this).attr('num');
									var sstatusChange = $(this).attr('status');
									if(sstatusChange == 'student' && num == snum){
										$(this).parent().html('<button disabled="disabled" num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-red tright nomargin request"><i class="icon-lock3" style="width: 20px"></i>거부완료</button>');
									}
								})
							}
						},
						error : function(repo) {
							alert("오류 : " + repo)
						}
				});
			} else {
				return false;
			}
		}
		
		function retired(){
			var num = $(this).attr('num');
			var btn = $(this);
			var result = confirm("retired : 실행 하시겠습니까?");
			if(result){
			$.ajax({
				url : 'retired',
				data : 'num=' + num,
				method : 'POST',
				success : function(repo) {
					$(btn).parent().html('<button disabled="disabled" num="${searchList.num}" class="button button-rounded button-reveal button-small button-border button-blue tright nomargin request"><i class="icon-lock3" style="width: 20px"></i>탈퇴완료</button>');
				},
				error : function(repo) {
					alert("오류 : " + repo)
				}
			})
			} else{
				return false;
			}
		}
		
	</script>
</body>
</html>