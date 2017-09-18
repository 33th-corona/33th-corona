<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="resources/style.css" type="text/css" />
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<!-- Bootstrap Data Table Plugin -->
	<link rel="stylesheet" href="css/components/bs-datatable.css" type="text/css" />

	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
<title>Insert title here</title>
<style>
	table{
		 white-space: nowrap;
	}
</style>
</head>
<body class="stretched">
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>
	<div id="wrapper" class="clearfix">
	
	<div class="body-overlay"></div>

		<section id="page-title">

			<div class="container center clearfix">
				<h1>ClassName</h1>
			</div>

		</section>
	<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">
					<div id="posts" class="post-grid grid-container grid-2 clearfix" data-layout="fitRows">
						<!-- 일반 게시판 -->
						<div class="entry clearfix" style="margin-bottom: 10px; padding-bottom: 10px;">
						  <div class="col-md-8"><h2>일반 게시판</h2></div>
						  <div class="col-md-4"><a href="${pageContext.request.contextPath}/boardLocation?status=normal" class="button button-3d button-rounded button-leaf"><i class="icon-tags"></i>자세히 보기</a></div>
							<div class="table-responsive col_full">
								<table id="datatable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Num</th>
									<th>Title</th>
									<th>ID</th>
									<th>Hit</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Num</th>
									<th>Title</th>
									<th>ID</th>
									<th>Hit</th>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>B</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
								</tr>
								<tr>
									<td>A</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
								</tr>
								<tr>
									<td>Angelica Ramos</td>
									<td>Chief Executive Officer (CEO)</td>
									<td>London</td>
									<td>47</td>
								</tr>
								<tr>
									<td>Gavin Joyce</td>
									<td>Developer</td>
									<td>Edinburgh</td>
									<td>42</td>
								</tr>
								<tr>
									<td>Jennifer Chang</td>
									<td>Regional Director</td>
									<td>Singapore</td>
									<td>28</td>
								</tr>
								<tr>
									<td>Brenden Wagner</td>
									<td>Software Engineer</td>
									<td>San Francisco</td>
									<td>28</td>
								</tr>
								<tr>
									<td>Fiona Green</td>
									<td>Chief Operating Officer (COO)</td>
									<td>San Francisco</td>
									<td>48</td>
								</tr>
								<tr>
									<td>Shou Itou</td>
									<td>Regional Marketing</td>
									<td>Tokyo</td>
									<td>20</td>
								</tr>
								<tr>
									<td>Michelle House</td>
									<td>Integration Specialist</td>
									<td>Sidney</td>
									<td>37</td>
								</tr>
								<tr>
									<td>Suki Burks</td>
									<td>Developer</td>
									<td>London</td>
									<td>53</td>
								</tr>
								<tr>
									<td>Prescott Bartlett</td>
									<td>Technical Author</td>
									<td>London</td>
									<td>27</td>
								</tr>
								<tr>
									<td>Gavin Cortez</td>
									<td>Team Leader</td>
									<td>San Francisco</td>
									<td>22</td>
								</tr>
								<tr>
									<td>Martena Mccray</td>
									<td>Post-Sales support</td>
									<td>Edinburgh</td>
									<td>46</td>
								</tr>
								<tr>
									<td>Unity Butler</td>
									<td>Marketing Designer</td>
									<td>San Francisco</td>
									<td>47</td>
								</tr>
								<tr>
									<td>Howard Hatfield</td>
									<td>Office Manager</td>
									<td>San Francisco</td>
									<td>51</td>
								</tr>
								<tr>
									<td>Hope Fuentes</td>
									<td>Secretary</td>
									<td>San Francisco</td>
									<td>41</td>
								</tr>
								<tr>
									<td>Vivian Harrell</td>
									<td>Financial Controller</td>
									<td>San Francisco</td>
									<td>62</td>
								</tr>
								<tr>
									<td>Timothy Mooney</td>
									<td>Office Manager</td>
									<td>London</td>
									<td>37</td>
								</tr>
								<tr>
									<td>Jackson Bradshaw</td>
									<td>Director</td>
									<td>New York</td>
									<td>65</td>
								</tr>
								<tr>
									<td>Olivia Liang</td>
									<td>Support Engineer</td>
									<td>Singapore</td>
									<td>64</td>
								</tr>
								<tr>
									<td>Bruno Nash</td>
									<td>Software Engineer</td>
									<td>London</td>
									<td>38</td>
								</tr>
								<tr>
									<td>Sakura Yamamoto</td>
									<td>Support Engineer</td>
									<td>Tokyo</td>
									<td>37</td>
								</tr>
								<tr>
									<td>Thor Walton</td>
									<td>Developer</td>
									<td>New York</td>
									<td>61</td>
								</tr>
								<tr>
									<td>Finn Camacho</td>
									<td>Support Engineer</td>
									<td>San Francisco</td>
									<td>47</td>
								</tr>
								<tr>
									<td>Serge Baldwin</td>
									<td>Data Coordinator</td>
									<td>Singapore</td>
									<td>64</td>
								</tr>
								<tr>
									<td>Zenaida Frank</td>
									<td>Software Engineer</td>
									<td>New York</td>
									<td>63</td>
								</tr>
								<tr>
									<td>Zorita Serrano</td>
									<td>Software Engineer</td>
									<td>San Francisco</td>
									<td>56</td>
								</tr>
								<tr>
									<td>Jennifer Acosta</td>
									<td>Junior Javascript Developer</td>
									<td>Edinburgh</td>
									<td>43</td>
								</tr>
								<tr>
									<td>Cara Stevens</td>
									<td>Sales Assistant</td>
									<td>New York</td>
									<td>46</td>
								</tr>
								<tr>
									<td>Hermione Butler</td>
									<td>Regional Director</td>
									<td>London</td>
									<td>47</td>
								</tr>
								<tr>
									<td>Lael Greer</td>
									<td>Systems Administrator</td>
									<td>London</td>
									<td>21</td>
								</tr>
								<tr>
									<td>Jonas Alexander</td>
									<td>Developer</td>
									<td>San Francisco</td>
									<td>30</td>
								</tr>
								<tr>
									<td>Shad Decker</td>
									<td>Regional Director</td>
									<td>Edinburgh</td>
									<td>51</td>
								</tr>
								<tr>
									<td>Michael Bruce</td>
									<td>Javascript Developer</td>
									<td>Singapore</td>
									<td>29</td>
								</tr>
								<tr>
									<td>Donna Snider</td>
									<td>Customer Support</td>
									<td>New York</td>
									<td>27</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
					<!-- 자료실  -->
					<div class="entry clearfix" style="margin-bottom: 10px; padding-bottom: 10px;">
						<div class="col-md-8"><h2>자료실</h2></div>
						  <div class="col-md-4"><a href="${pageContext.request.contextPath}/boardLocation?status=tesk" class="button button-3d button-rounded button-leaf"><i class="icon-tags"></i>자세히 보기</a></div>
							<div class="table-responsive col_full">
								<table id="datatable2" class="table table-striped table-bordered" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Num</th>
									<th>Title</th>
									<th>ID</th>
									<th>File</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Num</th>
									<th>Title</th>
									<th>ID</th>
									<th>File</th>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>B</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
								</tr>
								<tr>
									<td>A</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
					<div class="entry clearfix" style="margin-bottom: 10px;">
						<div class="col-md-8"><h2>Home Work</h2></div>
						  <div class="col-md-4"><a href="${pageContext.request.contextPath}/boardLocation?status=homeWork" class="button button-3d button-rounded button-leaf"><i class="icon-tags"></i>자세히 보기</a></div>
							<div class="table-responsive col_full">
								<table id="datatable3" class="table table-striped table-bordered" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Num</th>
									<th>Title</th>
									<th>Final Date</th>
									<th>File</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Num</th>
									<th>Title</th>
									<th>Final Date</th>
									<th>File</th>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td>B</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
								</tr>
								<tr>
									<td>A</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
					<!-- 과제 제출율 -->
						<div class="entry clearfix" style="margin-bottom: 10px; padding-bottom: 10px;">
							<div class="center"><h2>과제 제출율</h2></div>
							<div class="postcontent nobottommargin clearfix">
								<div class="center col-md-8 nobottommargin">
							<div class="rounded-skill nobottommargin" data-color="#3F729B" data-size="200" data-percent="85" data-width="3" data-speed="6500">
								<div class="counter counter-inherit"><span data-from="1" data-to="85" data-refresh-interval="50" data-speed="6000"></span>%</div>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
				
	</section>
	<footer id="footer" class="dark noborder">

			<div id="copyrights">
				<div class="container center clearfix">
					Copyright HanJo 2017 | All Rights Reserved
				</div>
			</div>

		</footer><!-- #footer end -->
	</div>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/ellipsis.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	
	<!-- Bootstrap Data Table Plugin -->
	<script type="text/javascript" src="js/components/bs-datatable.js"></script>
	
	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>
	
	<script>

		$(function() {
			$('#datatable1').dataTable({
				  "columns": [
					    { "width": "10%" },
					    { "width": "50%" },
					    { "width": "30%" },
					    { "width": "10%" },
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
					  
			});
			$('#datatable2').dataTable({
				  "columns": [
					    { "width": "10%" },
					    { "width": "50%" },
					    { "width": "30%" },
					    { "width": "10%" },
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
			});
			$('#datatable3').dataTable({
				  "columns": [
					    { "width": "10%" },
					    { "width": "50%" },
					    { "width": "30%" },
					    { "width": "10%" },
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
			});
		});
			
	

	</script>
</body>
</html>