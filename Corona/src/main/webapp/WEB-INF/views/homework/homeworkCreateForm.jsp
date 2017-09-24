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
	
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/et-line.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
	
	<link rel="stylesheet" href="css/fonts.css" type="text/css" />
	
	<!-- Bootstrap Switch CSS -->
	<link rel="stylesheet" href="css/components/bs-switches.css" type="text/css" />
	
	<!-- Date & Time Picker CSS -->
	<link rel="stylesheet" href="css/components/timepicker.css" type="text/css" />
	<link rel="stylesheet" href="css/components/daterangepicker.css" type="text/css" />
	
	<!-- Radio Checkbox Plugin -->
	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
<title>Insert title here</title>
<style>
#editor {
	clear: left;
	margin-right: 10px;
	padding: 5px;
	float: left;
	border-width: 1px;
	border-color: #7f7f7f;
	border-style: solid;
	border-radius: 10px;
}

</style>
</head>
<body class="stretched">
<%@ include file="../topMenu.jsp" %>
	<%@ include file="../sidebar.jsp" %>
	<div id="wrapper" class="clearfix">
	
	<div class="body-overlay"></div>

		<section id="page-title">
			<div class="container center clearfix">
				<h1>Create Home Work</h1>
			</div>
		</section>
		
		<section id="content">
			<div class="content-wrap" style="padding-top: 10px;">
				<div class="container clearfix">
					<div class="row"> <!-- 큰 row 시작 -->
					<form action="#" method="post" class="nobottommargin">
					<!-- 동 서로 컬럼을 나눈다. -->
					<div class="col-md-6"> <!-- 서쪽 컬럼 시작 -->
					
						<div class="row"> <!-- 서쪽 1번째 줄 시작 -->
						<div class="input-daterange travel-date-group bottommargin-sm">
							<div class="col_full">
							<div class="col_full"><i class="i-rounded i-light icon-edit"></i><h2>Java클래스 명</h2></div>
								<div class="row">
									<div class="col-md-10"><input type="text" type="text" id="class-form-name" name="class-form-name"
											value="" class="form-control"></div>
									<div class="col-md-2"><i class="i-circled i-light i-small icon-ok"></i></div>
								</div>
							</div>
							<div class="line topmargin-sm bottommargin-sm"></div>
						</div>
						</div> <!-- 서쪽 1번째 줄 끝 -->
						
						<div class="row"> <!-- 서쪽 2번째 줄 시작 -->	
						<div class="col_full">
							<div class="row">
								<div class="col-md-8"><i class="i-rounded i-light icon-edit"></i><h2>과제 내용</h2></div>
							</div>
							<div class="row">
								<div class="col-md-10"><textarea class="form-control" rows="5" id="comment"></textarea></div>
								<div class="col-md-2" style="margin-top: 75px"><i class="i-circled i-light i-small icon-ok"></i></div>
							</div>
						</div>
						</div> <!-- 서쪽 2번째 줄 끝 -->
							
					</div> <!-- 서쪽 컬럼 끝 -->
						
						
					<div class="col-md-6"> <!-- 동쪽 컬럼 시작 -->
						<div class="row" > <!-- 동쪽 1번째 줄 시작 -->
							<i class="i-rounded i-light icon-calendar"></i><h2>날짜 기한</h2>
							<div class="clear"></div>
<!-- 							<div class="col-sm-6 bottommargin-sm"> -->
								<div class="datetimepicker2"></div>
						</div> <!-- 동쪽 1번째 줄 끝 -->
						
					</div>	<!-- 동쪽 컬럼 끝 -->
					</form>
				</div> <!-- 큰 row 끝 -->
				<div class="line topmargin-sm bottommargin-sm"></div>
				
				
			<div class="row"> <!-- 입출력 값 추가 항목 줄 시작 -->
				<div class="col-md-4"> <!-- 입력 값 컬럼 시작 -->
				<div class="col_full"><i class="i-rounded i-light icon-edit"></i><h2>입력 값</h2></div>
				<div class="col-md-8">
				<ul>
					<li><input type="text" id="input_example" class="input1 form-control"></li>
					<div id="plus_input"></div>
				</ul>
				</div>
				</div> <!-- 입력 값 컬럼 끝 -->
			
				<div class="col-md-4"> <!-- 출력 값 컬럼 시작 -->	
				<div class="col_full"><i class="i-rounded i-light icon-edit"></i><h2>출력 값</h2></div>
				<div class="col-md-8">
				<ol>
					<li><input type="text" id="output_example" class="output1 form-control"></li>
					<div id="plus_output"></div>
				</ol>
				</div>
				</div> <!-- 출력 값 컬럼 끝 -->
				
				<div class="col-md-4"> <!-- 입출력 값 추가 버튼 컬럼 시작 -->	
					<div class="row">
						<div class="col-md-10"><i class="i-rounded i-light icon-line-marquee-plus"></i><h3>입출력값 추가</h3></div>
						<div class="col-md-2" style="margin-top: 10px"><img class="plus" alt="추가" src="resources/images/plus.png" width="35" height="35" style="cursor: pointer;"></div>
					</div>
					<div class="row">
						<div class="col-md-10"><i class="i-rounded i-light icon-line-marquee-minus"></i><h3>입출력값 삭제</h3></div>
						<div class="col-md-2" style="margin-top: 10px"><img class="calsle" alt="삭제" src="resources/images/cansle.png" width="35" height="35" style="cursor: pointer;"></div>
					</div>
					<div class="row">
						<div class="col-md-10"><i class="i-rounded i-light icon-box"></i><h3>과제 설명</h3></div>
					</div>
					<div class="row"> <!-- 입출력 값 작성 설명 -->
						<div class="col-md-12">
<!-- 						&nbsp 입력 값과 기대하는 출력 값을 입력하면, 학생이 작성한 과제 코드의 결과 값과 기대했던 출력 값과 비교하여 올바르면 제출이 가능하고, 서로 상이한 경우, 다시 과제 코드를 작성하는 방식입니다. 교사가 입력 할 수 있는 입력 값과 출력 값은 여러 개 생성이 가능합니다. -->
						<ul class="list-unstyled">
							<li style="margin-top: 20px">1. 입력 값과 기대하는 출력 값을 입력합니다.</li>
							<li style="margin-top: 20px">2. 입력 값과 출력 값은 여러 개 생성이 가능합니다.</li>
							<li style="margin-top: 20px">3. 학생이 작성한 과제 코드의 결과 값과 아까 기입한  &nbsp&nbsp 출력 값을 비교합니다.</li>
							<li style="margin-top: 20px">4. 올바르면 제출이 가능하고, 서로 상이한 경우, 다시 &nbsp&nbsp 과제 코드를 작성하는 방식입니다. </li>
						</ul>
					</div>
					</div>
				</div> <!--  입출력 값 추가 버튼 컬럼 끝 -->
			
			</div> <!-- 입출력 값 추가 항목 줄 끝 -->
			<div class="line topmargin-sm bottommargin-sm"></div>

			
				<div class="row"> <!-- 에디터 줄 시작 -->
					<div class="col_full">
						<div class="row">
							<div class="col-md-2"><i class="i-rounded i-light icon-laptop"></i><h2>에디터</h2></div>
							<div class="col-md-10" style="margin-top: 10px">
							<a href="#" class="button button-3d button-rounded button-leaf"><i class="icon-line-file"></i>클래스 명 에디터에 추가</a>
							<a href="#" class="button button-3d button-rounded button-leaf"><i class="icon-line-paper"></i>메인 추가</a></div>
						</div>
					</div>
					<!-- Editor 여기다가 넣으세요. -->
					<div id="editor" class="col-md-11"></div>
					<div class="col-md-4 col-md-offset-7">
						<button type="submit" class="button button-xlarge button-leaf button-rounded tright">만들기<i class="icon-circle-arrow-right"></i></button>
						<button type="reset" class="button button-xlarge button-leaf button-rounded tright">리셋<i class="icon-line-cross"></i></button>
					</div>
				</div> <!-- 에디터 줄 끝 -->	
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
	
	<div id="gotoTop" class="icon-angle-up"></div>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/plugins.js"></script>
	 
		<!-- Date & Time Picker JS -->
	<script type="text/javascript" src="js/components/moment.js"></script>
	<script type="text/javascript" src="js/components/timepicker.js"></script>

	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="js/components/daterangepicker.js"></script>
	
	<script type="text/javascript" src="js/components/bs-switches.js"></script>
	<script type="text/javascript" src="js/functions.js"></script>
	<script>
	
	
	$('.datetimepicker2').datetimepicker({
		inline: true,
		sideBySide: true
	});
	
$(function() {
	
	//입출력 추가 삭제를 제어하는 변수
	var count = 1;

	//입출력값 추가
	$('.plus').on('click',function() {
		count += 1;

		var html1 = '<li><input type="text" id="input_example" class="input'+count+' form-control"></li>';

		$("#plus_input").append(html1);

		var html2 = '<li><input type="text" id="output_example" class="output'+count+' form-control"></li>';

		$("#plus_output").append(html2);

	});

	//입출력값 삭제
	$('.calsle').on('click', function() {

		if (count > 1) {
			var remove_input = $(".input" + count);
			var remove_output = $(".output" + count);

			$(remove_input).parent().remove();
			$(remove_output).parent().remove();

			count -= 1;
		} else {
			alert("더 이상 입출력 테이블 삭제가 불가합니다.");
		}

	});
});	
	
	
	</script>
</body>
</html>