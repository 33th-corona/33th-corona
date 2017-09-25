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
	<link href="http://maps.googleapis.com/maps/api/geocode/outputFormat?parameters">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
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

.olColor {
  color: #ccc;
  list-style-type: none;
}
 
.liFont {
  position: relative;
  font: bold italic 45px/1.5 Helvetica, Verdana, sans-serif;
  margin-bottom: 20px;
}
 
.pFont {
  font: 14px/1.5 Helvetica, sans-serif;
  padding-left: 60px;
  color: #555;
}
 
.spanFont {
  position: absolute;
  font: 0.8em Helvetica, sans-serif;
  font-style: italic;
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
               <li><a href="#content">Skills</a></li>
               <li><a href="#manual">Manual</a></li>
               <li><a href="#location">Location</a></li>
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
									<p data-caption-animate="fadeInUp" data-caption-delay="200">이클립스를 이용한 Pure Java 수업 지원 서비스. <br>선생님의 이클립스를 실시간으로 확인하여<br>학생의 웹 페이지로 전송합니다.</p>
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

							<div class="feature-box fbox-right topmargin"  data-animate="fadeIn">
								<div class="fbox-icon" >
									<a href="#"><i class="icon-line-heart" style="background-color: #000530;"></i></a>
								</div>
								<h3>'우리들'만의 클래스 기능</h3>
								<p>반 생성 시, 공개 클래스와 비공개 클래스를 설정하실 수 있습니다.</p>
							</div>

							<div class="feature-box fbox-right topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-paper" style="background-color: #ff9800;"></i></a>
								</div>
								<h3>과제 생성 및 과제 확인 기능</h3>
								<p>과제를 생성하여 학생들에게 제출 뒤, 학생들에게 다시 제출 받아 코드 확인을 할 수 있습니다.</p>
							</div>

						</div>

						<div class="col-md-4 hidden-sm bottommargin center" style="margin-top: 40px; border-radius: 50%;">
							<img src="images/after3.jpg" height="250px;" alt="iphone 2" style="border-radius: 50%;">
						</div>

						<div class="col-md-4 col-sm-6 bottommargin">

							<div class="feature-box topmargin" data-animate="fadeIn">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-cloud" style="background-color: #ff9800;"></i></a>
								</div>
								<h3>강의 저장 및 출력 기능</h3>
								<p>강의를 동영상이 아닌 코드로 저장하여 원하는 강의를 들을 시, 코드를 가져 올 수 있습니다.</p>
							</div>

							<div class="feature-box topmargin" data-animate="fadeIn" data-delay="200">
								<div class="fbox-icon">
									<a href="#"><i class="icon-line-check" style="background-color: #000530;"></i></a>
								</div>
								<h3>그 외의 기능들</h3>
								<p>게시판 및 자료실 기능으로 커뮤니케이션 활용을 강화 하였습니다.</p>
							</div>

						</div>

					</div>

				</div>
				<div id="manual"></div> <!-- 라벨 영역 -->
				<div class="section  topmargin nobottommargin nobottomborder" style="padding-bottom: 15px; padding-top: 15px;">
					<div class="container clearfix">
						<div class="col_half heading-block center nomargin">
							<h3>선생님 사용 설명서</h3>
						</div>
						<div class="col_half col_last heading-block center nomargin">
							<h3>학생 사용 설명서</h3>
						</div>
					</div>
				</div>
				<div class="row clearfix parallax" style=" background-image: url(images/after6.jpg); background-size: cover; height: 300px;" data-stellar-background-ratio="0.4">
				</div>
				<div class="row clearfix" style="margin-top: 20px;">
				<div class="col-md-6 nopadding">
				 <div class="col_full" style="margin-left: 30px;">
				  <ol class="olColor">
   					 <li class="liFont"><span class="spanFont">1.</span><p class="pFont">jar파일을 다운받으신 뒤, 사용자가 가지고 계신 「Eclipse/plugins/」안에 <br> jar파일을 넣으십시오.</p></li>
    				 <li class="liFont"><span class="spanFont">2.</span><p class="pFont">클래스 페이지로 입장하셔서 '강의 시작'버튼을 누르세요.</p>
    				 <li class="liFont"><span class="spanFont">3.</span><p class="pFont">이클립스 상단 메뉴 안 Class Ready에 존재하는 Start버튼을 눌러 강의를 시작하세요.</p>
    				 <li class="liFont"><span class="spanFont">4.</span><p class="pFont">강의가 끝났을 시, 상단 메뉴 안 Class Ready에 존재하는 <br>End버튼을 눌러 강의를 종료하세요.</p>
    				 </ol>
 				 </div> 
					</div>
					<div class="col-md-6 nopadding">
					<div class="col_full" style="margin-left: 30px;">
				  <ol class="olColor">
   					 <li class="liFont"><span class="spanFont">1.</span><p class="pFont">jar파일을 다운받으신 뒤, 사용자가 가지고 계신 「Eclipse/plugins/」안에 <br> jar파일을 넣으십시오.</p></li>
    				 <li class="liFont"><span class="spanFont">2.</span><p class="pFont">클래스 페이지로 입장하셔서 '강의 참여'버튼을 눌러 강의에 참여하세요.</p>
    				 </ol>
 				 </div>
					</div>
					</div>
				<div class="col_full center nomargin">
						<div class="col_half">
						 <button class="btn btn-default btn-lg button button-xlarge button-circle button-3d"><i class="fa fa-circle-o-notch fa-spin"></i>Teacher Plug-In Dowload!</button>
						</div>
						<div class="col_half col_last">
						 <button class="btn btn-default btn-lg button button-xlarge button-circle button-3d"><i class="fa fa-circle-o-notch fa-spin"></i>Student Plug-In Dowload!</button>
						</div>
					</div>	
				
			</div>
			<div id="location" ></div> <!-- 라벨 영역 -->
				<div class="section topmargin nobottommargin nobottomborder" style="padding-bottom: 15px; padding-top: 15px;">
					<div class="container clearfix">
						<div class="heading-block center nomargin">
							<h3>오시는 길</h3>
						</div>
					</div>
				</div>
				<div class="row clearfix parallax" style=" background-image: url(images/after8.jpg); background-size: cover; height: 800px;" data-stellar-background-ratio="0.4">
				<h2 style="background-color: white; margin-bottom: 0; margin-top: 120px;">&nbsp;</h2>
				<div id="google-map5" style="height: 400px;" class="gmap"></div>
				<div class="col_full" style="background-color: white;">
				<h4 style="margin-top: 0; margin-left: 30px;">Address</h4>
				<blockquote style="margin-left: 30px;">
							<p>COEX Convention Center Grand Ball Room 513 Yeongdong-daero, Samseong 1(il)-dong, Gangnam-gu, Seoul, Tel : 02-6002-2005</p>
							<footer>Poscode : 06164, CEO : LEE</footer>
				</blockquote>
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
	<script type="text/javascript" src="js/jquery.vmap.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.world.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.usa.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.europe.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.germany.js"></script>
	<script type="text/javascript" src="js/vmap/jquery.vmap.sampledata.js"></script>
	<script type="text/javascript" src="https://maps.google.com/maps/api/js?key=AIzaSyDMxJ92oBkSnVNHFX3R8XhtYQPEgk1_IiI"></script>
	<script type="text/javascript" src="js/jquery.gmap.js"></script>
	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	<script>
	$('#google-map5').gMap({
		 address: 'Yeongdong-daero, Samseong 1(il)-dong, Gangnam-gu, Seoul,Republic Of Korea',
		 maptype: 'ROADMAP',
		 zoom: 13,
		 markers: [
			{	
				latitude: 37.5120661,
				longitude: 127.0587000,
				html: "주소 : 513 Yeongdong-daero, Samseong 1(il)-dong, Gangnam-gu, Seoul"
			}
		 ],
		 doubleclickzoom: false,
		 controls: {
			 panControl: true,
			 zoomControl: true,
			 mapTypeControl: false,
			 scaleControl: false,
			 streetViewControl: false,
			 overviewMapControl: false
		}
	});

		function findLocation( selector, getLatitude, getLongitude ) {
			jQuery(selector).gMap('clearMarkers').gMap('addMarker', {
				latitude: getLatitude,
				longitude: getLongitude,
				content: 'You have selected this Location.',
				popup: true
			}).gMap('centerAt', {
				latitude: getLatitude,
				longitude: getLongitude,
				zoom: 12
			});
		}


		jQuery(window).load( function(){

			var t = setTimeout( function(){
				if(navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(function(position) {
						jQuery('#google-map-custom').gMap('addMarker', {
							latitude: position.coords.latitude,
							longitude: position.coords.longitude,
							content: 'You are here!',
							popup: true
						}).gMap('centerAt', {
							latitude: position.coords.latitude,
							longitude: position.coords.longitude,
							zoom: 14
						});
					}, function() {
						alert('Couldn\'t find you :(');
					});
				}
			}, 200 );

		});

		jQuery('#location-submit').click( function(e){

			var locationFinder = jQuery(this).parent().parent().find('#location-input').val();
			var locationFinderIcon = jQuery(this).parent().parent().find('.input-group-addon').find('i');

			jQuery('#location-coordinates').fadeOut();

			if( locationFinder != '' ){
				locationFinderIcon.removeClass('icon-map-marker').addClass('icon-line-loader icon-spin');

				jQuery.ajax({
					url: 'http://maps.google.com/maps/api/geocode/json?address=' + encodeURI(locationFinder),
					//force to handle it as text
					dataType: "text",
					success: function(data) {
						var json = jQuery.parseJSON(data);
						findLocation( '#google-map-custom', json.results[0].geometry.location.lat, json.results[0].geometry.location.lng );
						jQuery('#latitude-text').html('<strong>Latitude:</strong> ' + json.results[0].geometry.location.lat);
						jQuery('#longitude-text').html('<strong>Longitude:</strong> ' + json.results[0].geometry.location.lng);
						jQuery('#location-coordinates').fadeIn();
						locationFinderIcon.removeClass('icon-line-loader icon-spin').addClass('icon-map-marker');
					}
				});
			} else {
				alert('Please enter your Location!');
			}
			e.preventDefault();
		});
	</script>
</body>
</html>