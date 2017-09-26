<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="SemiColonWeb" />
<!-- Stylesheets
	============================================= -->
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
	
<title>Passed Lesson List</title>
<%@ include file="../topMenu.jsp" %>
	<%@ include file="../sidebar.jsp" %>
<script>
function loadLessonInfo(class_num, saved_code, saved_audio) {
	var loadForm = $('form#loadForm');
	alert(class_num);
	var class_numTag = loadForm.find('input#class_num');
	var saved_codeTag = loadForm.find('input#saved_code');
	var saved_audioTag = loadForm.find('input#saved_audio');
	
// 	alert(class_numTag);
// 	alert(saved_code);
// 	alert(saved_audio);
	
	class_numTag.val(class_num);
	saved_codeTag.val(saved_code);
	saved_audioTag.val(saved_audio);
	loadForm.submit();
	
} 
</script>
</head>

<body class="stretched side-panel-left">
<div class="body-overlay"></div>

<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini bottommargin-sm">
	<div class="container clearfix">
		<h1>Passed Lesson List Page</h1>
		<span>Passed Lesson List Page</span>
	</div>
</section>


<!-- 여기서부터 작업공간 -->
<section id="content">

	<!-- 특정 글 검색 -->
	<div class="search">
		<form id="search" action ="passedLessonList" method="GET" >
		<input type="hidden" name="classNum" value="${classNum}" /> 
		<input type="text" name="searchword" value="${searchword}" /> 
		<input class="btn" type="submit" value="검색" />
		</form>
	</div><br><br>
	

<div class="container clearfix">
	
	<div id="posts" class="post-grid grid-container post-masonry post-masonry-full grid-3 clearfix">
	
	<c:if test="${savedLessonInfos != null}">
	<c:forEach var="savedLessonInfo" items="${savedLessonInfos}">
		<div class="entry clearfix">
			<div class="entry-image">
				<div class="fslider" data-arrows="false" data-lightbox="gallery" data-pause="2000">
					<div class="flexslider">
						<div class="slider-wrap">
							<div class="slide"><a href="images/10.jpg" data-lightbox="gallery-item"><img class="image_fade" src="images/10.jpg" alt="Standard Post with Gallery"></a></div>
							<div class="slide"><a href="images/20.jpg" data-lightbox="gallery-item"><img class="image_fade" src="images/20.jpg" alt="Standard Post with Gallery"></a></div>
							<div class="slide"><a href="images/21.jpg" data-lightbox="gallery-item"><img class="image_fade" src="images/21.jpg" alt="Standard Post with Gallery"></a></div>
						</div>
					</div>
				</div>
			</div>
			<div class="entry-title">
				<h2><a href="#" onclick="loadLessonInfo('${savedLessonInfo.class_num}', '${savedLessonInfo.saved_code}', '${savedLessonInfo.saved_audio}')">${savedLessonInfo.title}</a></h2>
			</div>
			<ul class="entry-meta clearfix">
				<li><i class="icon-calendar3"></i> ${savedLessonInfo.savetime}</li>
				<li><a href="blog-single-small.html#comments"><i class="icon-comments"></i> 21</a></li>
				<li><a href="#"><i class="icon-picture"></i></a></li>
			</ul>
			<div class="entry-content">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
				<a href="#" onclick="loadLessonInfo('${savedLessonInfo.class_num}', '${savedLessonInfo.saved_code}', '${savedLessonInfo.saved_audio}')">Read More</a>
			</div>
		</div>
	</c:forEach>
	</c:if>
		
	
	</div><!-- end posts -->	

<br><br><br><br><br><br><br><br>

</div><!-- container -->

	<!-- 페이징 시작 -->
	<div id="navigator">
		<ul class="pagination pagination-lg">
			<li><a href="passedLessonList?currentPage= ${navi.currentPage - navi.pagePerGroup}&classNum=${classNum}">◁ ◁</a></li>
			<li><a href="passedLessonList?currentPage= ${navi.currentPage-1}&searchword=${searchword}&classNum=${classNum}"> ◀ </a></li>
		<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:if test="${navi.currentPage eq page}">
				<li class="active"><a href="#">${page}</a></li>
			</c:if>
			<c:if test="${navi.currentPage ne page}">
				<li><a href="passedLessonList?currentPage=${page}&searchword=${searchword}&classNum=${classNum}">${page}</a></li>
			</c:if>
		</c:forEach>
		<li><a href="passedLessonList?currentPage= ${navi.currentPage+1}&searchword=${searchword}&countPerPage=${countPerPage}&classNum=${classNum}">▶</a> </li>
		<li><a href="passedLessonList?currentPage= ${navi.currentPage + navi.pagePerGroup}&classNum=${classNum}">▷ ▷</a></li>  
		</ul> 
	</div>
	
</section> 

<form action="loadPassedLesson" method="post" id="loadForm">
	<input type="hidden" id="class_num" name="class_Num">
	<input type="hidden" id="saved_code" name="saved_code">
	<input type="hidden" id="saved_audio" name="saved_audio">
</form>
</body>
</html>