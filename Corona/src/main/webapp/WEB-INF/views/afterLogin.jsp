<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

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
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<link rel="stylesheet" href="css/customHeader.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<style type="text/css">
	#side-panel-button {
		z-index: 1;
		position: fixed;
		top: 110px;
		left: 30px;
	}

#vertical-nav {
	position: fixed;
	top: 0;
	left: 0;
	width: 240px;
	z-index: 99;
	background: #F9F9F9;
	border-right: 1px solid #EEE;
	height: 100%;
	overflow: auto;
	padding: 140px 0 40px;
	-webkit-transition: padding .4s ease;
	-o-transition: padding .4s ease;
	transition: padding .4s ease;
}

.sticky-header + #vertical-nav { padding-top: 100px; }

#vertical-nav nav ul {
	margin-bottom: 0;
	list-style: none;
}

#vertical-nav nav li a {
	display: block;
	padding: 10px 30px;
	color: #333;
	text-transform: uppercase;
	font-size: 13px;
	font-weight: 700;
	letter-spacing: 2px;
	font-family: 'Raleway', sans-serif;
}

#vertical-nav nav li i {
	font-size: 14px;
	width: 16px;
	text-align: center;
}

#vertical-nav nav li i:not(.icon-angle-down) {
	margin-right: 8px;
	position: relative;
	top: 1px;
}

#vertical-nav nav li a i.icon-angle-down {
	width: auto;
	margin-left: 5px;
}

#vertical-nav nav li:hover > a,
#vertical-nav nav li.current > a,
#vertical-nav nav li.active > a {
	background-color: #FFF;
	color: #1ABC9C;
}

#vertical-nav nav ul ul { display: none; }

#vertical-nav nav ul ul a {
	font-size: 12px;
	letter-spacing: 1px;
	padding-left: 45px;
	font-family: 'Lato', sans-serif;
}

#vertical-nav nav ul ul a i.icon-angle-down { font-size: 12px; }

#vertical-nav nav ul ul ul a { padding-left: 60px; }
#vertical-nav nav ul ul ul ul a { padding-left: 75px; }

@media (min-width: 992px) {

	#header { z-index: 199; }

	#page-title,
	#content,
	#footer { margin-left: 240px; }

	#page-title .container,
	#content .container,
	#footer .container {
		width: auto;
		padding: 0 60px;
	}

	#vertical-nav .container {
		width: 100%;
		padding: 0;
	}

	#page-title .breadcrumb { right: 60px !important; }

}


@media (max-width: 991px) {

	#vertical-nav {
		position: relative;
		width: 100%;
		z-index: auto;
		border: none;
		border-bottom: 1px solid #EEE;
		height: auto;
		padding: 0;
	}

	#vertical-nav .container { padding: 10px 20px; }

	#vertical-nav nav li a { padding: 10px 0; }

	#vertical-nav nav li:hover > a,
	#vertical-nav nav li.current > a,
	#vertical-nav nav li.active > a { background-color: transparent; }

	#vertical-nav nav ul ul a { padding-left: 15px; }
	#vertical-nav nav ul ul ul a { padding-left: 30px; }
	#vertical-nav nav ul ul ul ul a { padding-left: 45px; }

}

</style>
	
	<!-- Document Title
	============================================= -->
	<title>Main Page</title>
	<style>
	#changeImg{
		display: none;
	}
	
	</style>
</head>
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>
<body class="stretched side-panel-left">
	<div class="body-overlay"></div>
	
	

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">
	
		<div id="side-panel-button" class="side-panel-trigger"><a href="#"><i class="i-rounded i-bordered icon-user"></i></a></div>
	


		<!-- Page Title
		============================================= -->
		<section id="page-title" class="page-title-mini">

			<div class="container clearfix">
				<h1>Main Page</h1>
				<span>Main Page</span>
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">Features</a></li>
					<li class="active">Side Panel</li>
				</ol>
			</div>

		</section><!-- #page-title end -->

		<!-- Content
		============================================= -->
		<section id="slider" class="slider-parallax swiper_wrapper full-screen clearfix">
			<div class="slider-parallax-inner">

				<div class="swiper-container swiper-parent">
					<div class="swiper-wrapper">
						<div class="swiper-slide dark" style="background-image: url('images/after1.jpg');">
							<div class="container clearfix" style="margin-left: 320px;">
								<div class="slider-caption slider-caption-center">
									<h2 data-caption-animate="fadeInUp">Welcome to Corona</h2>
									<p data-caption-animate="fadeInUp" data-caption-delay="200">이클립스를 이용한 Pure Java 수업 지원 서비스. <br>선생님의 이클립스 화면을 실시간 확인하여<br>학생의 이클립스 화면으로 전송합니다.</p>
								</div>
							</div>
						</div>
						
					</div>
				</div>

				<a href="#" data-scrollto="#content" data-offset="20" class="dark one-page-arrow" style="margin-left: 110px;"><i class="icon-angle-down infinite animated fadeInDown"></i></a>

			</div>
		</section>
		<section id="content">

			<div class="content-wrap"  style="padding-top: 20px;">

				<div class="container clearfix">

					<div class="row topmargin-lg bottommargin-sm">

						<div class="heading-block center" style="margin-bottom: 0px;">
							<h2>저희가 가진 기능은?</h2>
							<span class="divcenter">Corona는 선생과 학생의 편의를 도모하기 위해 <br>화면 전송 이외에도 몇가지 주요 기능을 제공하고 있습니다.</span>
						</div>

						<div class="col-md-4 col-sm-6 bottommargin">

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-heart"></i></a>
								</div>
								<h3>'우리들'만의 클래스 기능</h3>
								<p>반 생성 시, 공개 클래스와 비공개 클래스를 설정하실 수 있습니다.</p>
							</div>

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-paper"></i></a>
								</div>
								<h3>과제 생성 및 과제 확인 기능</h3>
								<p>과제를 생성하여 학생들에게 제출 뒤, 학생들에게 다시 제출 받아 코드 확인을 할 수 있습니다.</p>
							</div>

						</div>

						<div class="col-md-4 hidden-sm bottommargin center" style="margin-top: 40px;">
							<img src="images/after3.jpg" height="250px;" alt="iphone 2">
						</div>

						<div class="col-md-4 col-sm-6 bottommargin">

							<div class="feature-box topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-cloud"></i></a>
								</div>
								<h3>강의 저장 및 출력 기능</h3>
								<p>강의를 동영상이 아닌 코드로 저장하여 원하는 강의를 들을 시, 코드를 가져 올 수 있습니다.</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-check"></i></a>
								</div>
								<h3>그 외의 기능들</h3>
								<p>게시판 및 자료실 기능으로 커뮤니케이션 활용을 강화 하였습니다.</p>
							</div>

						</div>

					</div>

				</div>
				
				<div class="row clearfix">

					<div class="col-md-6 nopadding" data-animate="bounceInLeft" style="background : url('images/after4.jpg') center center no-repeat; background-size: cover; height: 600px; ">
						<div style="background-color: rgba(255,255,255, 0.2); height: 600px;">
						<div>&nbsp;</div>
						<h1 style="color: #000; opacity: 1; font-weight: bold;" class="center">선생님 사용 설명서</h1>
						<p style="color: #000; opacity: 1; font-weight: bold; margin-left: 20px; margin-top:20px; font-size: 20px;"><span class="dropcap" style="font-size: 60px;">1.</span>위 홈페이지로 가셔서 Jsp파일을 다운받으신 뒤, 사용자가 가지고 계신 「Eclipse/plugins/」안에 jsr파일을 넣으십시오.</p>
						<p style="color: #000; opacity: 1; font-weight: bold; margin-left: 20px; margin-top:40px; font-size: 20px;"><span class="dropcap" style="font-size: 60px;">2.</span>클래스 페이지로 입장하셔서 '강의 시작'버튼을 누르세요.</p>
						<p style="color: #000; opacity: 1; font-weight: bold; margin-left: 20px; margin-top:60px; font-size: 20px;"><span class="dropcap" style="font-size: 60px;">3.</span>이클립스 상단 메뉴 안 Class Ready에 존재하는 Start버튼을<br>눌러 강의를 시작하세요.</p>
						<p style="color: #000; opacity: 1; font-weight: bold; margin-left: 20px; margin-top:30px; margin-bottom: 10px; font-size: 20px;"><span class="dropcap" style="font-size: 60px;">4.</span>강의가 끝났을 시, 상단 메뉴 안 Class Ready에 존재하는 <br>End버튼을 눌러 강의를 종료하세요.</p>
						<p class="center" style="font-size: 20px; color: #000; opacity: 1; font-weight: bold;">혹시 반 생성을 아직 안하셨나요?</p>
						</div>
					</div>
					<canvas id="chart-doughnut"></canvas>
					<div class="col-md-6 nopadding" data-delay="200" data-animate="bounceInRight" style="background : url('images/after5.jpg') center center no-repeat; background-size: cover; height: 600px;">
						<div style="background-color: rgba(255,255,255, 0.2); height: 600px;">
						<div>&nbsp;</div>
						<h1 style="color: #000; opacity: 1; font-weight: bold;" class="center">학생 사용 설명서</h1>
												<p style="color: #000; opacity: 1; font-weight: bold; margin-left: 20px; margin-top:20px; font-size: 20px;"><span class="dropcap" style="font-size: 60px;">1.</span>위 홈페이지로 가셔서 Jsp파일을 다운받으신 뒤, 사용자가 가지고 계신 「Eclipse/plugins/」안에 jsr파일을 넣으십시오.</p>
						<p style="color: #000; opacity: 1; font-weight: bold; margin-left: 20px; margin-top:40px; font-size: 20px;"><span class="dropcap" style="font-size: 60px;">2.</span>클래스 페이지로 입장하셔서 '강의 참여'버튼을 눌러 강의에 참여하세요. 
						</div>
					</div>

				</div>	
				
				<div class="row clearfix common-height">

					<div class="col-md-6 center col-padding" style="background: url('images/services/main-bg.jpg') center center no-repeat; background-size: cover;">
						<div>&nbsp;</div>
					</div>

					<div class="col-md-6 center col-padding" style="background-color: #F5F5F5;">
						<div>
							<div class="heading-block nobottomborder">
								<span class="before-heading color">Easily Understandable &amp; Customizable.</span>
								<h3>Walkthrough Videos &amp; Demos</h3>
							</div>

							<div class="center bottommargin">
								<a href="http://vimeo.com/101373765" data-lightbox="iframe" style="position: relative;">
									<img src="images/services/video.jpg" alt="Video">
									<span class="i-overlay nobg"><img src="images/icons/video-play.png" alt="Play"></span>
								</a>
							</div>
							<p class="lead nobottommargin">Democracy inspire breakthroughs, Rosa Parks; inspiration raise awareness natural resources. Governance impact; transformative donation philanthropy, respect reproductive.</p>
						</div>
					</div>

				</div>

				<div class="row clearfix bottommargin-lg common-height">

					<div class="col-md-3 col-sm-6 dark center col-padding" style="background-color: #515875;">
						<div>
							<i class="i-plain i-xlarge divcenter icon-line2-directions"></i>
							<div class="counter counter-lined"><span data-from="100" data-to="846" data-refresh-interval="50" data-speed="2000"></span>K</div>
							<h5>Lines of Codes</h5>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 dark center col-padding" style="background-color: #576F9E;">
						<div>
							<i class="i-plain i-xlarge divcenter icon-line2-graph"></i>
							<div class="counter counter-lined"><span data-from="3000" data-to="21500" data-refresh-interval="100" data-speed="2500"></span></div>
							<h5>KBs of HTML Files</h5>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 dark center col-padding" style="background-color: #6697B9;">
						<div>
							<i class="i-plain i-xlarge divcenter icon-line2-layers"></i>
							<div class="counter counter-lined"><span data-from="10" data-to="408" data-refresh-interval="25" data-speed="3500"></span></div>
							<h5>No. of Templates</h5>
						</div>
					</div>

					<div class="col-md-3 col-sm-6 dark center col-padding" style="background-color: #88C3D8;">
						<div>
							<i class="i-plain i-xlarge divcenter icon-line2-clock"></i>
							<div class="counter counter-lined"><span data-from="60" data-to="1400" data-refresh-interval="30" data-speed="2700"></span></div>
							<h5>Hours of Coding</h5>
						</div>
					</div>

				</div>

				<div class="container clearfix">

					<div class="col_one_third">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-monitor"></i></a>
							</div>
							<h3>Responsive Layout</h3>
							<p>Powerful Layout with Responsive functionality that can be adapted to any screen size.</p>
						</div>
					</div>

					<div class="col_one_third">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="200">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-eye"></i></a>
							</div>
							<h3>Retina Ready Graphics</h3>
							<p>Looks beautiful &amp; ultra-sharp on Retina Displays with Retina Icons, Fonts &amp; Images.</p>
						</div>
					</div>

					<div class="col_one_third col_last">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="400">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-star"></i></a>
							</div>
							<h3>Powerful Performance</h3>
							<p>Optimized code that are completely customizable and deliver unmatched fast performance.</p>
						</div>
					</div>

					<div class="clear"></div>

					<div class="col_one_third">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="600">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-play"></i></a>
							</div>
							<h3>HTML5 Video</h3>
							<p>Canvas provides support for Native HTML5 Videos that can be added to a Full Width Background.</p>
						</div>
					</div>

					<div class="col_one_third">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="800">
							<div class="fbox-icon">
								<a href="#"><i class="icon-params"></i></a>
							</div>
							<h3>Parallax Support</h3>
							<p>Display your Content attractively using Parallax Sections that have unlimited customizable areas.</p>
						</div>
					</div>

					<div class="col_one_third col_last">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="1000">
							<div class="fbox-icon">
								<a href="#"><i class="icon-line-circle-check"></i></a>
							</div>
							<h3>Endless Possibilities</h3>
							<p>Complete control on each &amp; every element that provides endless customization possibilities.</p>
						</div>
					</div>

					<div class="clear"></div>

					<div class="col_one_third bottommargin-sm">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="600">
							<div class="fbox-icon">
								<a href="#"><i class="icon-bulb"></i></a>
							</div>
							<h3>Light &amp; Dark Color Schemes</h3>
							<p>Change your Website's Primary Scheme instantly by simply adding the dark class to the body.</p>
						</div>
					</div>

					<div class="col_one_third bottommargin-sm">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="800">
							<div class="fbox-icon">
								<a href="#"><i class="icon-heart2"></i></a>
							</div>
							<h3>Boxed &amp; Wide Layouts</h3>
							<p>Stretch your Website to the Full Width or make it boxed to surprise your visitors.</p>
						</div>
					</div>

					<div class="col_one_third bottommargin-sm col_last">
						<div class="feature-box fbox-small fbox-plain" data-animate="fadeIn" data-delay="1000">
							<div class="fbox-icon">
								<a href="#"><i class="icon-note"></i></a>
							</div>
							<h3>Extensive Documentation</h3>
							<p>We have covered each &amp; everything in our Documentation including Videos &amp; Screenshots.</p>
						</div>
					</div>

					<div class="clear"></div>

				</div>

				<div class="section topmargin nobottommargin nobottomborder">
					<div class="container clearfix">
						<div class="heading-block center nomargin">
							<h3>Our Latest Works</h3>
						</div>
					</div>
				</div>

				<div id="portfolio" class="portfolio portfolio-nomargin grid-container portfolio-notitle portfolio-full grid-container clearfix">

					<article class="portfolio-item pf-media pf-icons">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="images/portfolio/4/1.jpg" alt="Open Imagination">
							</a>
							<div class="portfolio-overlay">
								<a href="images/portfolio/full/1.jpg" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
								<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single.html">Open Imagination</a></h3>
							<span><a href="#">Media</a>, <a href="#">Icons</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-illustrations">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="images/portfolio/4/2.jpg" alt="Locked Steel Gate">
							</a>
							<div class="portfolio-overlay">
								<a href="images/portfolio/full/2.jpg" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
								<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single.html">Locked Steel Gate</a></h3>
							<span><a href="#">Illustrations</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-graphics pf-uielements">
						<div class="portfolio-image">
							<a href="#">
								<img src="images/portfolio/4/3.jpg" alt="Mac Sunglasses">
							</a>
							<div class="portfolio-overlay">
								<a href="http://vimeo.com/89396394" class="left-icon" data-lightbox="iframe"><i class="icon-line-play"></i></a>
								<a href="portfolio-single-video.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single-video.html">Mac Sunglasses</a></h3>
							<span><a href="#">Graphics</a>, <a href="#">UI Elements</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-icons pf-illustrations">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="images/portfolio/4/4.jpg" alt="Open Imagination">
							</a>
							<div class="portfolio-overlay" data-lightbox="gallery">
								<a href="images/portfolio/full/4.jpg" class="left-icon" data-lightbox="gallery-item"><i class="icon-line-stack-2"></i></a>
								<a href="images/portfolio/full/4-1.jpg" class="hidden" data-lightbox="gallery-item"></a>
								<a href="portfolio-single-gallery.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single-gallery.html">Morning Dew</a></h3>
							<span><a href="#"><a href="#">Icons</a>, <a href="#">Illustrations</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-uielements pf-media">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="images/portfolio/4/5.jpg" alt="Console Activity">
							</a>
							<div class="portfolio-overlay">
								<a href="images/portfolio/full/5.jpg" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
								<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single.html">Console Activity</a></h3>
							<span><a href="#">UI Elements</a>, <a href="#">Media</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-graphics pf-illustrations">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="images/portfolio/4/6.jpg" alt="Open Imagination">
							</a>
							<div class="portfolio-overlay" data-lightbox="gallery">
								<a href="images/portfolio/full/6.jpg" class="left-icon" data-lightbox="gallery-item"><i class="icon-line-stack-2"></i></a>
								<a href="images/portfolio/full/6-1.jpg" class="hidden" data-lightbox="gallery-item"></a>
								<a href="images/portfolio/full/6-2.jpg" class="hidden" data-lightbox="gallery-item"></a>
								<a href="images/portfolio/full/6-3.jpg" class="hidden" data-lightbox="gallery-item"></a>
								<a href="portfolio-single-gallery.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single-gallery.html">Shake It!</a></h3>
							<span><a href="#">Illustrations</a>, <a href="#">Graphics</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-uielements pf-icons">
						<div class="portfolio-image">
							<a href="portfolio-single-video.html">
								<img src="images/portfolio/4/7.jpg" alt="Backpack Contents">
							</a>
							<div class="portfolio-overlay">
								<a href="http://www.youtube.com/watch?v=kuceVNBTJio" class="left-icon" data-lightbox="iframe"><i class="icon-line-play"></i></a>
								<a href="portfolio-single-video.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single-video.html">Backpack Contents</a></h3>
							<span><a href="#">UI Elements</a>, <a href="#">Icons</a></span>
						</div>
					</article>

					<article class="portfolio-item pf-graphics">
						<div class="portfolio-image">
							<a href="portfolio-single.html">
								<img src="images/portfolio/4/8.jpg" alt="Sunset Bulb Glow">
							</a>
							<div class="portfolio-overlay">
								<a href="images/portfolio/full/8.jpg" class="left-icon" data-lightbox="image"><i class="icon-line-plus"></i></a>
								<a href="portfolio-single.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>
							</div>
						</div>
						<div class="portfolio-desc">
							<h3><a href="portfolio-single.html">Sunset Bulb Glow</a></h3>
							<span><a href="#">Graphics</a></span>
						</div>
					</article>

				</div>


				<div class="clear"></div>

				<a href="portfolio.html" class="button button-full button-dark center tright bottommargin-lg">
					<div class="container clearfix">
						More than 100+ predefined Portfolio Grid Layouts. <strong>See More</strong> <i class="icon-caret-right" style="top:4px;"></i>
					</div>
				</a>

				<div class="container clearfix">

					<div class="col_one_third bottommargin-sm center">
						<img data-animate="fadeInLeft" src="images/services/iphone6.png" alt="Iphone">
					</div>

					<div class="col_two_third bottommargin-sm col_last">

						<div class="heading-block topmargin-sm">
							<h3>Optimized for Mobile &amp; Touch Enabled Devices.</h3>
						</div>

						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero quod consequuntur quibusdam, enim expedita sed quia nesciunt incidunt accusamus necessitatibus modi adipisci officia libero accusantium esse hic, obcaecati, ullam, laboriosam!</p>

						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corrupti vero, animi suscipit id facere officia. Aspernatur, quo, quos nisi dolorum aperiam fugiat deserunt velit rerum laudantium cum magnam.</p>

						<a href="#" class="button button-border button-dark button-rounded button-large noleftmargin topmargin-sm">Learn more</a>

					</div>

				</div>

				<div class="section parallax dark nobottommargin" style="background-image: url('images/services/home-testi-bg.jpg'); padding: 100px 0;" data-stellar-background-ratio="0.4">

					<div class="heading-block center">
						<h3>What Clients Say?</h3>
					</div>

					<div class="fslider testimonial testimonial-full" data-animation="fade" data-arrows="false">
						<div class="flexslider">
							<div class="slider-wrap">
								<div class="slide">
									<div class="testi-image">
										<a href="#"><img src="images/testimonials/3.jpg" alt="Customer Testimonails"></a>
									</div>
									<div class="testi-content">
										<p>Similique fugit repellendus expedita excepturi iure perferendis provident quia eaque. Repellendus, vero numquam?</p>
										<div class="testi-meta">
											Steve Jobs
											<span>Apple Inc.</span>
										</div>
									</div>
								</div>
								<div class="slide">
									<div class="testi-image">
										<a href="#"><img src="images/testimonials/2.jpg" alt="Customer Testimonails"></a>
									</div>
									<div class="testi-content">
										<p>Natus voluptatum enim quod necessitatibus quis expedita harum provident eos obcaecati id culpa corporis molestias.</p>
										<div class="testi-meta">
											Collis Ta'eed
											<span>Envato Inc.</span>
										</div>
									</div>
								</div>
								<div class="slide">
									<div class="testi-image">
										<a href="#"><img src="images/testimonials/1.jpg" alt="Customer Testimonails"></a>
									</div>
									<div class="testi-content">
										<p>Incidunt deleniti blanditiis quas aperiam recusandae consequatur ullam quibusdam cum libero illo rerum!</p>
										<div class="testi-meta">
											John Doe
											<span>XYZ Inc.</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="section notopmargin notopborder">
					<div class="container clearfix">
						<div class="heading-block center nomargin">
							<h3>Latest from the Blog</h3>
						</div>
					</div>
				</div>

				<div class="container clear-bottommargin clearfix">
					<div class="row">

						<div class="col-md-3 col-sm-6 bottommargin">
							<div class="ipost clearfix">
								<div class="entry-image">
									<a href="#"><img class="image_fade" src="images/magazine/thumb/1.jpg" alt="Image"></a>
								</div>
								<div class="entry-title">
									<h3><a href="blog-single.html">Bloomberg smart cities; change-makers economic security</a></h3>
								</div>
								<ul class="entry-meta clearfix">
									<li><i class="icon-calendar3"></i> 13th Jun 2014</li>
									<li><a href="blog-single.html#comments"><i class="icon-comments"></i> 53</a></li>
								</ul>
								<div class="entry-content">
									<p>Prevention effect, advocate dialogue rural development lifting people up community civil society. Catalyst, grantees leverage.</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-6 bottommargin">
							<div class="ipost clearfix">
								<div class="entry-image">
									<a href="#"><img class="image_fade" src="images/magazine/thumb/2.jpg" alt="Image"></a>
								</div>
								<div class="entry-title">
									<h3><a href="blog-single.html">Medicine new approaches communities, outcomes partnership</a></h3>
								</div>
								<ul class="entry-meta clearfix">
									<li><i class="icon-calendar3"></i> 24th Feb 2014</li>
									<li><a href="blog-single.html#comments"><i class="icon-comments"></i> 17</a></li>
								</ul>
								<div class="entry-content">
									<p>Cross-agency coordination clean water rural, promising development turmoil inclusive education transformative community.</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-6 bottommargin">
							<div class="ipost clearfix">
								<div class="entry-image">
									<a href="#"><img class="image_fade" src="images/magazine/thumb/3.jpg" alt="Image"></a>
								</div>
								<div class="entry-title">
									<h3><a href="blog-single.html">Significant altruism planned giving insurmountable challenges liberal</a></h3>
								</div>
								<ul class="entry-meta clearfix">
									<li><i class="icon-calendar3"></i> 30th Dec 2014</li>
									<li><a href="blog-single.html#comments"><i class="icon-comments"></i> 13</a></li>
								</ul>
								<div class="entry-content">
									<p>Micro-finance; vaccines peaceful contribution citizens of change generosity. Measures design thinking accelerate progress medical initiative.</p>
								</div>
							</div>
						</div>

						<div class="col-md-3 col-sm-6 bottommargin">
							<div class="ipost clearfix">
								<div class="entry-image">
									<a href="#"><img class="image_fade" src="images/magazine/thumb/4.jpg" alt="Image"></a>
								</div>
								<div class="entry-title">
									<h3><a href="blog-single.html">Compassion conflict resolution, progressive; tackle</a></h3>
								</div>
								<ul class="entry-meta clearfix">
									<li><i class="icon-calendar3"></i> 15th Jan 2014</li>
									<li><a href="blog-single.html#comments"><i class="icon-comments"></i> 54</a></li>
								</ul>
								<div class="entry-content">
									<p>Community health workers best practices, effectiveness meaningful work The Elders fairness. Our ambitions local solutions globalization.</p>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div class="section">
					<div class="container clearfix">

						<div class="row topmargin-sm">

							<div class="heading-block center">
								<h3>Meet Our Team</h3>
							</div>

							<div class="col-md-3 col-sm-6 bottommargin">

								<div class="team">
									<div class="team-image">
										<img src="images/team/3.jpg" alt="John Doe">
									</div>
									<div class="team-desc team-desc-bg">
										<div class="team-title"><h4>John Doe</h4><span>CEO</span></div>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-facebook">
											<i class="icon-facebook"></i>
											<i class="icon-facebook"></i>
										</a>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-twitter">
											<i class="icon-twitter"></i>
											<i class="icon-twitter"></i>
										</a>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-gplus">
											<i class="icon-gplus"></i>
											<i class="icon-gplus"></i>
										</a>
									</div>
								</div>

							</div>

							<div class="col-md-3 col-sm-6 bottommargin">

								<div class="team">
									<div class="team-image">
										<img src="images/team/2.jpg" alt="Josh Clark">
									</div>
									<div class="team-desc team-desc-bg">
										<div class="team-title"><h4>Josh Clark</h4><span>Co-Founder</span></div>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-facebook">
											<i class="icon-facebook"></i>
											<i class="icon-facebook"></i>
										</a>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-twitter">
											<i class="icon-twitter"></i>
											<i class="icon-twitter"></i>
										</a>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-gplus">
											<i class="icon-gplus"></i>
											<i class="icon-gplus"></i>
										</a>
									</div>
								</div>

							</div>

							<div class="col-md-3 col-sm-6 bottommargin">

								<div class="team">
									<div class="team-image">
										<img src="images/team/8.jpg" alt="Mary Jane">
									</div>
									<div class="team-desc team-desc-bg">
										<div class="team-title"><h4>Mary Jane</h4><span>Sales</span></div>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-facebook">
											<i class="icon-facebook"></i>
											<i class="icon-facebook"></i>
										</a>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-twitter">
											<i class="icon-twitter"></i>
											<i class="icon-twitter"></i>
										</a>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-gplus">
											<i class="icon-gplus"></i>
											<i class="icon-gplus"></i>
										</a>
									</div>
								</div>

							</div>

							<div class="col-md-3 col-sm-6 bottommargin">

								<div class="team">
									<div class="team-image">
										<img src="images/team/4.jpg" alt="Nix Maxwell">
									</div>
									<div class="team-desc team-desc-bg">
										<div class="team-title"><h4>Nix Maxwell</h4><span>Support</span></div>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-facebook">
											<i class="icon-facebook"></i>
											<i class="icon-facebook"></i>
										</a>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-twitter">
											<i class="icon-twitter"></i>
											<i class="icon-twitter"></i>
										</a>
										<a href="#" class="social-icon inline-block si-small si-light si-rounded si-gplus">
											<i class="icon-gplus"></i>
											<i class="icon-gplus"></i>
										</a>
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>

				<div class="container clearfix">

					<div id="oc-clients" class="owl-carousel image-carousel carousel-widget" data-margin="60" data-loop="true" data-nav="false" data-autoplay="5000" data-pagi="false" data-items-xxs="2" data-items-xs="3" data-items-sm="4" data-items-md="5" data-items-lg="6">

						<div class="oc-item"><a href="#"><img src="images/clients/1.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/2.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/3.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/4.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/5.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/6.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/7.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/8.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/9.png" alt="Clients"></a></div>
						<div class="oc-item"><a href="#"><img src="images/clients/10.png" alt="Clients"></a></div>

					</div>


				</div>

			</div>

		</section><!-- #content end -->

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
	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	<script type="text/javascript" src="js/chart.js"></script>
	<script type="text/javascript" src="js/chart-utils.js"></script>
	<script>
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100);
	};

	var config = {
		type: 'doughnut',
		data: {
			datasets: [{
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
				],
				backgroundColor: [
					window.chartColors.red,
					window.chartColors.orange,
					window.chartColors.yellow,
					window.chartColors.green,
					window.chartColors.blue,
				],
				label: 'Dataset 1'
			}],
			labels: [
				"Red",
				"Orange",
				"Yellow",
				"Green",
				"Blue"
			]
		},
		options: {
			responsive: true,
			legend: {
				display: false,
				position: 'absolute'
			},
			title: {
				display: false,
				text: 'Doughnut Chart'
			},
			animation: {
				animateScale: true,
				animateRotate: true
			}
		}
	};
	window.onload = function() {
		var ctx = document.getElementById("chart-doughnut").getContext("2d");
		window.myDoughnut = new Chart(ctx, config);
		window.myRadar = new Chart(document.getElementById("chart-radar"), configRadar);
	};
	</script>
</body>
</html>