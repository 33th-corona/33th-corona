<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
#primary-menu ul li:hover > a,
#primary-menu ul li.current > a { color: #ffffff !important; }
</style>
</head>
<body class="stretched">
<div class="body-overlay"></div>
<header id="header" class="full-header" data-sticky-class="not-dark">

			<div id="header-wrap" class="w3-container w3-orange" style="padding-left: 0;">

				<div class="container nomargin nopadding">

					<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

					<!-- Logo
					============================================= -->
					<div id="logo" style="padding-bottom: 0.11cm; padding-left: 0.3cm; padding-right: 0.36cm;   /* background:url('images/logoback.jpg') no-repeat; z-index: -1; */" class="w3-border-right w3-border-white w3-orange">
						<a href="${pageContext.request.contextPath}/afterLoginLocation" class="standard-logo logoChange" style="z-index: 1" data-dark-logo="images/logo2.png"><img class="logoChange" src="images/logo2.png" alt="CodeLecture Logo"></a>
						<a href="${pageContext.request.contextPath}/afterLoginLocation" class="retina-logo logoChange" style="z-index: 1" data-dark-logo="images/logo2.png"><img class="logoChange" src="images/logo2.png" alt="CodeLecture Logo"></a>
					</div><!-- #logo end -->

					<!-- Primary Navigation
					============================================= -->
					<nav id="primary-menu" class="style dark w3-orange" >
						
						<ul >
							<li><a href="${pageContext.request.contextPath}/afterLoginLocation" style="font-size: 30px !important;"><div><i class="icon-home2 topmenubtn" style="font-size: 20px !important;"></i>Home</div></a></li>
							<li><a href="${pageContext.request.contextPath}/createClassLocation" style="font-size: 30px !important;"><div><i class="icon-pencil2 topmenubtn" style="font-size: 20px !important;"></i>반 생성</div></a></li>
							<li><a href="#" style="font-size: 30px !important;"><div><i class="icon-flag2 topmenubtn" style="font-size: 20px !important;"></i>사용법</div></a></li>
							<li><a href="${pageContext.request.contextPath}/searchLocation" style="font-size: 30px !important;"><div><i class="icon-search3 topmenubtn" style="font-size: 20px !important;"></i>반 검색</div></a>
						</ul>

						<!-- Top Search
						============================================= -->
<!-- 						<div id="top-search"> -->
<!-- 							<a href="#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a> -->
<!-- 							<form action="search.html" method="get"> -->
<!-- 								<input type="text" name="q" class="form-control" value="" placeholder="Type &amp; Hit Enter.."> -->
<!-- 							</form> -->
<!-- 						</div> #top-search end -->

					</nav><!-- #primary-menu end -->

				</div>

			</div>

		</header><!-- #header end -->
		<script type="text/javascript" src="js/jquery.js"></script>
		<script>
		$(function() {
			$('.logoChange').mouseover(function() {
				$(this).attr("data-dark-logo","images/logoChange.PNG");
				$(this).attr("src", "images/logoChange.PNG");
			});
			$('.logoChange').mouseout(function() {
				$(this).attr("data-dark-logo","images/logo2.png");
				$(this).attr("src", "images/logo2.png");
			})
		});
		</script>
</body>
</html>