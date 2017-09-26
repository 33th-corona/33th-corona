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
			<form id="search" action ="taskList" method="GET" >
			<input type = "hidden" name = "action" value = "taskList">
			<select name="searchtype">
				<option value="title" ${searchtype=='title' ? 'selected' : '' }>제목</option>
				<option value="user_id" ${searchtype=='user_id' ? 'selected' : '' }>작성자</option>
				<option value="content" ${searchtype=='content' ? 'selected' : '' }>내용</option>
			</select>
			<input type="text" name="searchword" value="${searchword}" /> 
			<input class="btn" type="submit" value="검색" />
			</form>
		</div>
	
		<div class="content-wrap">
	
			<a class="button button-full button-purple center tright header-stick bottommargin-lg" href="homeworkCreateForm">
				<div class="container clearfix">
					<i class="icon-plus" style="top:4px;"></i>
				</div>
			</a>
	
		<!-- 게시판 시작 -->
		<div id="posts" class="post-grid grid-container post-masonry post-masonry-full grid-3 clearfix">
		
		
		<!-- 과제 forEach -->
		<c:forEach var="taskInfo" items="${taskInfoList}" varStatus="stat">
			<div class="entry clearfix">
			<div class="clock" id="clock${stat.count}" ></div>
				<div class="entry-title">
					<h2><a href="taskDetail?num=${task.num}">${taskInfo.title}</a></h2>
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
			<li><a href="taskList?currentPage= ${navi.currentPage - navi.pagePerGroup}">◁ ◁</a></li>
			<li><a href="taskList?currentPage= ${navi.currentPage-1}&searchtype=${searchtype}&searchword=${searchword}"> ◀ </a></li>
		<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:if test="${navi.currentPage eq page}">
				<li class="active"><a href="#">${page}</a></li>
			</c:if>
			<c:if test="${navi.currentPage ne page}">
				<li><a href="taskList?currentPage=${page}&searchtype=${searchtype}&searchword=${searchword}">${page}</a></li>
			</c:if>
		</c:forEach>
		<li><a href="taskList?currentPage= ${navi.currentPage+1}&searchtype=${searchtype}&searchword=${searchword}&countPerPage=${countPerPage}">▶</a> </li>
		<li><a href="taskList?currentPage= ${navi.currentPage + navi.pagePerGroup}">▷ ▷</a></li>  
		</ul> 
	</div><!-- end paging -->
</section><!-- end content section -->

<link rel="stylesheet" href="css/flipclock.css">
<script src="js/flipclock.js"></script>

	<script>var now = Date.now();</script>
	<c:forEach var="taskInfo" items="${taskInfoList}" varStatus="stat">
	<script type="text/javascript">
	var end = +new Date('${taskInfo.deadline}');
	var ms = (end-now)/1000;
	var clock = $('#clock${stat.count}').FlipClock(ms, {
		clockFace: 'DailyCounter',
		countdown: true
	});
	</script>
	</c:forEach>

<section id="content">
<div class="container clearfix">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>과제내용</th>
			<th>제출기한</th>
			<th>제출가능여부</th>
		</tr>
		
		<c:forEach var="taskInfo" items="${taskInfoList}">
			<tr>
				<td>${taskInfo.num}</td>
				<td>${taskInfo.title}</td>
				<td>${taskInfo.deadline}</td>
				<c:if test="${position eq 'student' }">
					<c:if test="${taskInfo.submitted}">
						<td><a href="myhomeworkConfirm?homeworkNum=${taskInfo.num}">제출 답안 확인</a></td>
					</c:if>
					<c:if test="${!taskInfo.submitted}">
						<c:if test="${taskInfo.is_closed eq 'n'}">
							<td><a href="homeworkDetail?homeworkNum=${taskInfo.num}">과제작성</a></td>
						</c:if>
						<c:if test="${taskInfo.is_closed ne 'n'}">
							<td>기한마감</td>
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${position eq 'teacher' }">
					<td><a href="submittedHomeworkConfirm?homeworkNum=${taskInfo.num}">제출자 확인</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	
	<c:if test="${position eq 'teacher' }">
		<input type="button" id="homeworkCreateForm" value="과제 생성">
	</c:if>
</div>
</section>

</body>
</html>