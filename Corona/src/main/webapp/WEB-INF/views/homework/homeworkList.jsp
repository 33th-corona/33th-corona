<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />
<!-- Stylesheets -->
<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/swiper.css" type="text/css" />
<link rel="stylesheet" href="css/dark.css" type="text/css" />
<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

<link rel="stylesheet" href="css/responsive.css" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>	
	
<title>Homework List</title>
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
<style>
	.flip-clock-divider.minutes .flip-clock-label {
		display: none;
	}
	.flip-clock-divider.seconds .flip-clock-label{
		display: none;
	}
</style>	
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


<!--  작업시작 -->

<div id="wrapper" class="clearfix">
	
	<!-- Content
	============================================= -->
	<section id="content">
		<!-- 특정 글 검색 -->
		<div class="search">
			<form id="search" action ="homeworkList" method="GET" >
			<input type="hidden" name="classNum" value="${classNum}" />
			<input type="text" name="searchword" value="${searchword}" /> 
			<input class="btn" type="submit" value="검색" />
			</form>
		</div>
	
		<div class="content-wrap">
			<c:if test="${position eq 'teacher' }">
				<a class="button button-full button-purple center tright header-stick bottommargin-lg" id="homeworkCreateForm">
					<div class="container clearfix">
						<i class="icon-plus" style="top:4px;"></i>
					</div>
				</a>
			</c:if>
		<!-- 게시판 시작 -->
		<div id="posts" class="post-grid grid-container post-masonry post-masonry-full grid-3 clearfix">
		
		
		<!-- 과제 forEach -->
		<c:forEach var="taskInfo" items="${taskInfoList}" varStatus="stat">
			<div class="entry clearfix">
			<div class="clock" id="clock${stat.count}" ></div>
				<div class="entry-title">
					<h3><a href="taskDetail?num=${task.num}">[${taskInfo.title}]</a></h3>
				</div>
				
				<c:if test="${position eq 'student' }">
					<c:if test="${taskInfo.submitted}">
						<a href="myhomeworkConfirm?homeworkNum=${taskInfo.num}">제출 답안 확인</a>
					</c:if>
					
					<c:if test="${!taskInfo.submitted}">
						<c:if test="${taskInfo.is_closed eq 'n'}">
							<a href="homeworkDetail?homeworkNum=${taskInfo.num}">과제작성</a>
						</c:if>
						<c:if test="${taskInfo.is_closed ne 'n'}">
							<span>기한마감<sapn>
						</c:if>
					</c:if>
				</c:if><!-- end student -->
				
				<c:if test="${position eq 'teacher' }">
					<a href="submittedHomeworkConfirm?homeworkNum=${taskInfo.num}">제출자 확인</a>
				</c:if>
				
			</div>
		</c:forEach>
		</div><!-- #posts end -->
	</div><!-- end content-wrap end -->
	
	<!-- 페이징 시작 -->
	<div id="navigator">
		<ul class="pagination pagination-lg">
			<li><a href="homeworkList?currentPage= ${navi.currentPage - navi.pagePerGroup}&classNum=${classNum}">◁ ◁</a></li>
			<li><a href="homeworkList?currentPage= ${navi.currentPage-1}&searchword=${searchword}&classNum=${classNum}"> ◀ </a></li>
		<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:if test="${navi.currentPage eq page}">
				<li class="active"><a href="#">${page}</a></li>
			</c:if>
			<c:if test="${navi.currentPage ne page}">
				<li><a href="homeworkList?currentPage=${page}&searchword=${searchword}&classNum=${classNum}">${page}</a></li>
			</c:if>
		</c:forEach>
		<li><a href="homeworkList?currentPage= ${navi.currentPage+1}&searchword=${searchword}&countPerPage=${countPerPage}&classNum=${classNum}">▶</a> </li>
		<li><a href="homeworkList?currentPage= ${navi.currentPage + navi.pagePerGroup}&classNum=${classNum}">▷ ▷</a></li>  
		</ul> 
	</div><!-- end paging -->
	
</section><!-- end content section -->

<link rel="stylesheet" href="css/flipclock.css">
<script src="js/flipclock.js"></script>

	<script>var now = Date.now();</script>
	<c:forEach var="taskInfo" items="${taskInfoList}" varStatus="stat">
	<script type="text/javascript">
	var end = +new Date('${taskInfo.deadline}');
	var ms =0;
	if(now<end){
	ms = (end-now)/1000;
	} else {
		ms =0;
	}
	var clock = $('#clock${stat.count}').FlipClock(ms, {
		clockFace: 'DailyCounter',
		countdown: true
	});
	</script>
	</c:forEach>


</body>
</html>