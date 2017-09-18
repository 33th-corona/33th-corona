<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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
	<link rel="stylesheet" href="css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<link rel="stylesheet" href="css/fonts.css" type="text/css" />
	
	<!-- Bootstrap Switch CSS -->
	<link rel="stylesheet" href="css/components/bs-switches.css" type="text/css" />

	<!-- Radio Checkbox Plugin -->
	
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
<title>CreateClass</title>
<style>
#nameOk {
	cursor: default;
}

#idOk {
	cursor: default;
}

#statusIcon {
	cursor: default;
}

.i-circled:hover {
	background-color: #F5F5F5 !important;
	color: #444 !important;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
	box-shadow: 0 0 0 rgba(0, 0, 0, 0.2);
}

.i-rounded:hover, .hoveri-circled:hover {
	background-color: #ff9800 !important;
	color: #fff !important;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
	box-shadow: 0 0 0 rgba(0, 0, 0, 0.2);
}

.button.button-dark:hover {
	background-color: #ff9800 !important;
}


.id-i-circled {
	display: block;
	float: left;
	margin: 4px 11px 7px 0;
	text-align: center !important; font-size : 14px;
	color: #FFF;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
	cursor: pointer;
	font-style: normal;
	width: 28px !important; height : 28px !important; line-height : 28px
	!important;
	background-color: #ff9800 !important;
	border-radius: 3px;
	border-radius: 50%;
	height: 28px !important;
	line-height: 28px !important;
	font-size: 14px;
}

.id-i-light {
	background-color: #ff9800 !important;
	color: #FFF;
}

.name-i-light {
	background-color: #f5f5f5 !important;
	color: #444 !important;
}

.button.publicbutton-3d {
	border-radius: 3px;
	border-bottom: 3px solid rgba(0, 0, 0, 0.15);
	-webkit-transition: none;
	-o-transition: none;
	transition: none;
}

.button.publicbutton-3d.button-light:hover {
	text-shadow: none;
	color: #FFF;
}
</style>
</head>

<body class="stretched">
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>
	<div id="wrapper" class="clearfix">
	
		
		<div class="body-overlay"></div>
	
		<section id="page-title" class="page-title-mini">
			<div class="container clearfix">
				<h1>Class Create</h1>
			</div>
		</section>
	
	<section id="page-title" class="page-title-parallax page-title-dark page-title-video" style="padding : 30px 0;">
			<div class="video-wrap">
				<video poster="images/videos/explore.jpg" preload="auto" loop autoplay muted style="width: 1300px !important;">
					<source src='images/videos/classCreateForm.webm' type='video/webm' />
				</video>
				<div class="video-overlay"></div>
			</div>
			<div class="container clearfix" style="z-index: 1;">
					<div class="emphasis-title">
							<span class="t-rotate t700 font-body col_full" style="font-size: 60px; color:#444 !important;">Create Class</span>
					</div>
			</div>
			
	</section>
	
	
	<section id="content">
		
		<form id="class-form" name="class-form"
								class="nobottommargin" action="createClass" method="post">
			<div  class="content-wrap" style="padding: 30px;" >
				<div class="divcenter postcontent clearfix bottommargin-sm">
					<div class="col_full" >
					<div class="col-md-3" ><i id="nameIcon" class="i-rounded icon-edit i-small className"></i><span class="h2 className">반 이름</span></div>
					<div class="col-md-8"><input type="text" type="text" id="class-form-name" name="name"
										value="" class="form-control"></div>
					<div class="col-md-1"><i id="nameOk" class="i-circled name-i-light i-small icon-ok"></i></div>
					</div>
			   </div>
			   <div class="line bottommargin-sm topmargin-sm"></div>
			   <div class="divcenter postcontent clearfix bottommargin-sm" >
					<div class="col_full"  >
					<div class="col-md-3" ><i id="teacherIcon" class="i-rounded icon-user i-small" style=" " ></i><span class="h2">강사 ID</span></div>
					<div class="col-md-8"><input type="text" type="text" id="class-form-name" name="teacher_id"
										value="${id}" class="form-control" readonly="readonly"></div>
					<div class="col-md-1"><i id="idOk" class="id-i-circled id-i-light i-small icon-ok"></i></div>
					</div>
			   </div>
			   <div class="line bottommargin-sm topmargin-sm"></div>
			   <div class="divcenter postcontent clearfix" >
					<div class="col_full" >
					<div class="col-sm-3" ><i id="publicIcon" class="i-rounded icon-cog i-small"></i><span class="h2">반 설정</span></div>
					<div class="col-sm-4">
					<input id="publicStatus" class="bt-switch" name="is_public" type="checkbox" value="y" data-on-text="<i class='icon-lock3'></i>" data-off-text="<i class='icon-unlock'></i>" data-on-color="danger" data-off-color="default">
					</div>
					<div id ="publicwordForm" class="col-sm-4">
							<button disabled="disabled" id="publicbtn"
						class="button publicbutton-3d tright nomargin" role="button" data-lightbox="inline" style="cursor: default; width: 100px; background-color: #ff9800;">공개<i class="icon-unlock" style="width: 15px"></i></button>
					</div>
			   </div>
			   </div>
			   <div class="divcenter postcontent clearfix" >
					<div class="col_full">
						<div class="center" >
								<button type="submit" class="button button-xlarge button-dark button-rounded tright">Create!<i class="icon-circle-arrow-right"></i></button>
								&nbsp<button type="reset" id="re" class="button button-xlarge button-dark button-rounded tright">Reset!<i class="icon-line-cross"></i></button>
						</div>
			   		</div>	   
			</div>
		</div>
		</form>
	</section>
	<footer id="footer" class="dark noborder">

			<div id="copyrights">
				<div class="container center clearfix">
					Copyright HanJo 2017 | All Rights Reserved
				</div>
			</div>

		</footer><!-- #footer end -->
	</div>
	
	<div id="gotoTop" class="icon-angle-up"></div>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	
	<script type="text/javascript" src="js/components/bs-switches.js"></script>
	<script type="text/javascript" src="js/functions.js"></script>
	<script>
		
	
	
	$(function(){
		$('.i-circled:hover').unbind(
					'mouseenter mouseleave mouseover select');
			$('#nameIcon').on('click', nameFocus);
			$('#nameOk').unbind('hover');

			$('#class-form-name').keyup(
					function(evt) {
						var checkName = $('#class-form-name').val();
						$.ajax({
							url : 'checkClassName',
							method : 'GET',
							data : "name=" + checkName,
							success : function(repo) {
								if (repo == 0) {
									$('#nameOk').css({
										'background-color' : '#ff9800',
										'color' : '#FFF',
										'text-shadow' : '1px 1px 1px rgba(0,0,0,0.3)',
										'box-shadow' : '0 0 0 rgba(0,0,0,0.2)'
									})
									$('#nameOk').hover(
											$('#nameOk').addClass("hoveri-circled") , 
											$('#nameOk').removeClass("name-i-light") 
									);
								} else {
									$('#nameOk').css({
										'background-color' : '#F5F5F5',
										'color' : '#444',
										'text-shadow' : '1px 1px 1px rgba(0,0,0,0.3)',
										'box-shadow' : '0 0 0 rgba(0,0,0,0.2)'
									})
									$('#nameOk').hover(
											$('#nameOk').removeClass("hoveri-circled"),
											$('#nameOk').addClass("name-i-light")
									);
								}
							},
							error : function(repo) {
								alert("오류 = " + repo);
							}
						})
					})
			$(".bt-switch").bootstrapSwitch();
			var pub = '공개<i class="icon-unlock" style="width: 15px"></i>';
			var nopub = '비공개<i class="icon-lock3" style="width: 15px"></i>';
			$(".bt-switch").on('switchChange.bootstrapSwitch',
					function(event, state) {
						var publicWordForm = $("#publicbtn");
						if (state == false) {
							$(publicWordForm).css({
								'border-radius': '3px',
							'border-bottom': '3px solid rgba(0,0,0,0.15)',
							'background-color': '#FF9800 !important',
							'color': '#fff !important',
							'text-shadow': '1px 1px 1px rgba(0,0,0,0.3)',
							'box-shadow': '0 0 0 rgba(0,0,0,0.2)'
							})
							$(publicWordForm).hover(
									$(publicWordForm).css({
										'background-color': '#ff9800 !important',
										'opacity': '0.9'
									})
							)
							$(publicWordForm).html(pub);
						}
						if (state == true) {
							$(publicWordForm).css({
								'border-radius': '3px',
							'border-bottom': '3px solid rgba(0,0,0,0.15)',
							'background-color': '#F5F5F5 !important',
							'color': '#444 !important',
							'text-shadow': '1px 1px 1px rgba(0,0,0,0.3)',
							'box-shadow': '0 0 0 rgba(0,0,0,0.2)'
							})
							$(publicWordForm).hover(
									$(publicWordForm).css({
										'background-color': '#F5F5F5 !important',
										'opacity': '0.9'
									})
							)

							$(publicWordForm).html(nopub);
						}
					});
		});

		function nameFocus() {
			$('#class-form-name').focus();
		}
	</script>
</body>
</html>