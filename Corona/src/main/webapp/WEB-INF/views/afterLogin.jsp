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
		<section id="content" style="background-image: url(images/after1.jpg); background-size: 1400px; height: 580px;">

			<div class="content-wrap">

				<div class="container clearfix">

					<div class="center">
						<h1>Welcome to Corona!</h1>
					</div>
				</div>
			</div>
		</section>
		<section id="content" style="background-color: rgba(255, 152, 0, 1);">

			<div class="content-wrap">

				<div class="container clearfix">

					<div class="center">
						
						<br>
					</div>

					<div class="line"></div>

					<div class="col_full">
						Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id ligula porta felis euismod semper.
					</div>

					<div class="col_half">
						<h5>Half Width</h5>
						Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus.
					</div>

					<div class="col_half col_last">
						<h5>Half Width (Last)</h5>
						Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus.
					</div>

					<div class="clear"></div>

					<div class="col_two_third">
						<h5>2/3 Width</h5>
						Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id ligula porta felis euismod semper.
					</div>

					<div class="col_one_third col_last">
						<h5>1/3 Width (Last)</h5>
						Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus.
					</div>

					<div class="clear"></div>

					<div class="col_one_fourth nobottommargin">
						<h5>1/4 Width</h5>
						Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante.
					</div>

					<div class="col_three_fourth nobottommargin col_last">
						<h5>3/4 Width (Last)</h5>
						Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id ligula porta felis euismod semper.
					</div>

					<div class="clear"></div>

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
	<script>
	
	</script>
</body>
</html>