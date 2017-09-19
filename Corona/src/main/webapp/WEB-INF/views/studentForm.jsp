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
	<link rel="stylesheet" href="css/components/bs-datatable.css" type="text/css" />
	<!-- Bootstrap File Upload CSS -->
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<link rel="stylesheet" href="css/customHeader.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css">
.button-orange { background-color: #ff9800; }
.button-3d.button-orange:hover,
.button-reveal.button-orange:hover,
.button-border.button-orange:hover,
.button-border.button-orange.button-fill:before { background-color: #ff9800 !important; }
</style>
</head>

<body class="stretched side-panel-left">
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>
	<div class="body-overlay"></div>
		<div id="wrapper" class="clearfix">
			<section id="page-title">

			<div class="container center clearfix">
				<h1>${classInfo.name}</h1>
			</div>
			</section>
		<section id="content">

			<div class="content-wrap" style="padding-top: 20px; padding-bottom: 20px;">

				<div class="container clearfix">
				<div class="col-md-8">
				<a href="#" class="button  button-3d button-xlarge button-rounded button-orange tright nomargin" style="border-bottom-left-radius: 50%; border-top-left-radius: 50%;">일반 게시판<i class="icon-list"></i></a>
				<a href="#" class="button  button-3d button-xlarge button-rounded button-orange tright nomargin">자료실<i class="icon-line-paper"></i></a>
				<a href="#" class="button  button-3d button-xlarge button-rounded button-orange tright nomargin">과제 게시판<i class="icon-gift"></i></a>
				<a href="#" class="button  button-3d button-xlarge button-rounded button-orange tright nomargin" style="border-bottom-right-radius: 50%; border-top-right-radius: 50%;">과제 작성<i class="icon-edit"></i></a>
				</div>
				<div class="col-md-4">
				<form action="lessonJoin" method="POST" id="lesson">
				<input type="hidden" value="${id}" name="studentId">
				<input type="hidden" value="${classInfo.num}" name="classNum">
				<a href="#" id="lessonbtn" class="button button-3d button-xlarge button-reveal button-aqua button-rounded tright center" style="font-size: 40px; font-weight: bold;"><i class="icon-angle-right"></i>강의실  입장</a>
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
					<div class="panel panel-default col_full">
					<h2>가입자 명단</h2>
							<!-- Default panel contents -->

							<!-- Table -->
							<table class="table">
								<thead>
									<tr>
										<th>Num</th>
										<th>UserId</th>
										<th>Email</th>
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
		$('.datatable').dataTable({
			  "columns": [
				    { "width": "50%" },
				    { "width": "25%", "orderable": false },
				    { "width": "25%", "orderable": false },
				  ], scrollY: 300,
				  scrollCollapse: true,
				  columnDefs: [ {
				        targets: 0,
				        render: function ( data, type, row ) {
				        return type === 'display' && data.length > 10 ?
				            data.substr( 0, 10 ) +'…' :
				            data;
				    }
				    } ]
				, "bSortClasses" : false
		});
		$('#lessonbtn').on('click', function() {
			$('#lesson').submit();
		})
	})
	</script>
</body>
</html>