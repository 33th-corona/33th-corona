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
<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

<link rel="stylesheet" href="css/fonts.css" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Submit Homework Page</title>
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

<%@ include file="../topMenu.jsp" %>
<%@ include file="../sidebar.jsp" %>
<body class="stretched">
<div id="wrapper" class="clearfix">
<div class="body-overlay"></div>
<!-- Page Title
============================================= -->
<section id="page-title" class="page-title-mini bottommargin-sm">
	<div class="container clearfix">
		<h1>Submit Homework Page</h1>
		<span>Submit Homework Page</span>
	</div>
</section>
<section id="content">
	<div class="container clearfix">
		<div class="row"><!-- 큰 row 시작 -->
			<div class="col-md-3"><!-- 서쪽 컬럼 시작 -->
				<div class="row"><!-- 서쪽 1번째 줄 시작 -->
					<div class="col_full">
						<div class="row">
							<div class="col-md-12">
								<i class="i-rounded i-light icon-edit"></i>
								<h2 class="nobottommargin">과제 제목</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<input type="text" id="homeworkTitle" class="form-control" readonly="readonly">
							</div>
						</div>
					</div>
				</div><!-- 서쪽 1번째 줄 끝 -->
				<div class="line bottommargin-sm notopmargin"></div>

				<div class="row"><!-- 서쪽 2번째 줄 시작 -->
					<div class="col_full">
						<div class="row">
							<div class="col-md-12">
								<i class="i-rounded i-light icon-edit"></i>
								<h2 class="nobottommargin">과제 내용</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<textarea id="homeworkContent" rows="5" class="form-control" readonly="readonly"></textarea>
							</div>
						</div>
					</div>
				</div><!-- 서쪽 2번째 줄 끝 -->
				<div class="line bottommargin-sm notopmargin"></div>

				<div class="row"><!-- 서쪽 3번째 줄 시작 -->
					<div class="col_full">
						<div class="row">
							<div class="col-sm-12">
								<i class="i-rounded i-light icon-calendar"></i>
								<h2 class="nobottommargin">날짜 기한</h2>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="clear"></div>
								<input type="text" id="homeworkDeadline" class="tleft sm-form-control" readonly>
							</div>
						</div>
					</div>
				</div><!-- 서쪽 3번째 줄 끝 -->
			</div><!-- 서쪽 컬럼 끝 -->

			<div class="col-md-9"><!-- 동쪽 컬럼 시작 -->
				<div class="row"><!-- 에디터 줄 시작 -->
					<div class="col-md-12 divcenter">
						<div class="col_full nobottommargin">
							<div class="row">
								<div class="col-md-6">
									<i class="i-rounded i-light icon-laptop"></i>
									<h2 class="nobottommargin">에디터</h2>
								</div>
								<div class="col-md-6 text-right">
									<input type="button" id="homeworkSubmit" class="button button-xlarge button-leaf button-rounded tright" value="테스트"> 
									<input type="button" id="editorReset" class="button button-xlarge button-leaf button-rounded tright" value="리셋">
								</div>
							</div>
							<div class="row">
								<div id="editor" class="col-md-11 divcenter">${task.code}</div>
							</div>
							<div class="row text-right" id="editorOption"
								style="margin: 10px">
								<div class="col-sm-11">
									<div id="editorThemeChange" style="display: inline-block">
										Theme <select id="themeChange">
											<option value="eclipse">Eclipse</option>
											<option value="xcode">XCode</option>
											<option value="idle_fingers">idle Fingers</option>
											<option value="monokai">Monokai</option>
											<option value="gob">Green on Black</option>
										</select>
									</div>
									&nbsp;
									<div id="editorShowInvisibles" style="display: inline-block">
										Invisibles <select id="showInvisibles">
											<option value="true">on</option>
											<option value="false" selected="selected">off</option>
										</select>
									</div>
									&nbsp;
									<div id="editorIndentGuides" style="display: inline-block">
										IndentGuides <select id="indentGuides">
											<option value="true">on</option>
											<option value="false">off</option>
										</select>
									</div>
									&nbsp;
									<div id="editorShowGutte" style="display: inline-block">
										Gutte <select id="showGutte">
											<option value="true">on</option>
											<option value="false">off</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 에디터 줄 끝 -->
			</div><!-- 동쪽 컬럼 끝 -->
		</div><!-- 큰 row 끝 -->


		<div class="row bottommargin"><!-- 입출력 값 추가 항목 줄 시작 -->
			<div class="col_full">
				<div class="col-md-12"><!-- 입출력 값 추가 버튼 컬럼 시작 -->
					<div class="row">
						<div class="col-md-9"></div>
						<div class="col-md-3" data-toggle="modal" data-target="#explainHomework">
							<i class="i-rounded i-light icon-box"></i>
							<h2>과제 설명</h2>
						</div>
					</div>
					<div class="modal fade" tabindex="-1" id="explainHomework" role="dialog" aria-labelledby="mySmallModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-body">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h2 class="modal-title" id="myModalLabel">작성 방법</h2>
									</div>
									<div class="modal-body" style="font-size: 20px">
										<p class="nobottommargin">1. 선생님이 작성한 과제 내용을 확인합니다.</p>
										<p class="nobottommargin">2. 과제 내용을 기반으로 비어있는 부분의 코드를
											작성합니다.</p>
										<p class="nobottommargin">3. '테스트' 버튼을 클릭하여 올바르게 코드가
											작성되어있는지 확인합니다.</p>
										<p class="nobottommargin">4. 올바르면 제출이 가능하고, 다른 결과가 출력 될
											경우 다시 작성해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!--  입출력 값 추가 버튼 컬럼 끝 -->
			</div>
		</div><!-- 입출력 값 추가 항목 줄 끝 -->
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
<!-- <script type="text/javascript" src="js/plugins.js"></script>  -->

<!-- <script type="text/javascript" src="js/functions.js"></script> -->

<!-- ACE web editor Library -->
<script src="js/ace/ace.js"></script>
<script src="js/ace/ext-language_tools.js"></script>

<script>
$(function() {
	
	$('input#homeworkTitle').val('${task.title}');
	$('textarea#homeworkContent').val('${task.content}');
	$('input#homeworkDeadline').val('${task.deadline}');
	
	//입출력 추가 삭제를 제어하는 변수
	var count = 1;

	//입출력값 추가
	$('.plus').on('click', function() {
        if (count < 3) {
            count += 1;
            var html1 = '<input type="text" placeholder="Input value No.'+count+'" class="input'+count+' form-control" style="display: block; margin-bottom: 10px">';
            $("#plus_input").append(html1);
            var html2 = '<input type="text" placeholder="Output value No.'+count+'" class="output'+count+' form-control" style="display: block; margin-bottom: 10px">';
            $("#plus_output").append(html2);
        }
	});

	//입출력값 삭제
	$('.calsle').on('click', function() {
		if (count > 1) {
			var remove_input = $(".input" + count);
			var remove_output = $(".output" + count);

			$(remove_input).remove();
			$(remove_output).remove();

			count -= 1;
		}
	});
	
	var langTools = ace.require("ace/ext/language_tools");
	var editor = ace.edit("editor");
    
	//web editor의 maxline을 설정
	editor.setOptions({
		maxLines : 21,
		minLines : 21,
		autoScrollEditorIntoView : true,
        enableBasicAutocompletion: true,
		enableSnippets: true,
		enableLiveAutocompletion: false
	});
	//web editor의 syntaxing 언어 설정(java)
	editor.getSession().setMode("ace/mode/java");
	//web editor의 테마 설정
	editor.setTheme("ace/theme/eclipse");
	editor.setFontSize(20);
	editor.setHighlightActiveLine(false);
	editor.renderer.setShowPrintMargin(false);
	editor.setShowInvisibles(false);
	editor.setDisplayIndentGuides(true);
	editor.$blockScrolling = Infinity;
	
    var initEditor = editor.getValue();
    
    $('input#editorReset').on('click', function() {
        editor.setValue(initEditor); 
        editor.clearSelection();
    });
    
    $('select#themeChange').on('change', function() {
        var selectTheme = "ace/theme/" + $(this).val();
        editor.setTheme(selectTheme);
        consoleView.setTheme(selectTheme);
        saveEditorOption(editor);
    });

    $('select#showInvisibles').on('change', function() {
        var showInvisibles = $(this).val();
        console.log(showInvisibles);
        if (showInvisibles == 'true') {
            editor.setShowInvisibles(true);
            consoleView.setShowInvisibles(true);
        } else {
            editor.setShowInvisibles(false);
            consoleView.setShowInvisibles(false);
        }
        saveEditorOption(editor);
    });

    $('select#indentGuides').on('change', function() {
        var indentGuides = $(this).val();
        console.log(indentGuides);
        if (indentGuides == 'true') {
            editor.setDisplayIndentGuides(true);
            consoleView.setDisplayIndentGuides(true);
        } else {
            editor.setDisplayIndentGuides(false);
            consoleView.setDisplayIndentGuides(false);
        }
        saveEditorOption(editor);
    });

    $('select#showGutte').on('change', function() {
        var showGutte = $(this).val();
        console.log(showGutte);
        if (showGutte == 'true') {
            editor.renderer.setShowGutter(true);
            consoleView.renderer.setShowGutter(true);
        } else {
            editor.renderer.setShowGutter(false);
            consoleView.renderer.setShowGutter(false);
        }
    });
    
});
</script>
</body>
</html>