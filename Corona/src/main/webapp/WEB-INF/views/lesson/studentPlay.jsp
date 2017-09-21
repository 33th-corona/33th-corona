<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
<link rel="stylesheet" href="css/bootstrap.css">
<!-- FancyTree Skin -->
<link rel="stylesheet" href="css/skin-lion/ui.fancytree.css" />
<style>
div#editorOption div {
	display: inline-block;
}

.editorArea {
	padding: 5px;
	border: 1px solid black;
	border-radius: 5px;
}

ul.fancytree-container {
	border: none !important;
	outline: none !important;
}
</style>
<script src="js/jquery-3.2.1.min.js/"></script>
<script src="js/jquery-ui.js/"></script>
<script src="js/bootstrap.min.js"></script>
<!-- ACE web editor Library -->
<script src="js/ace/ace.js"></script>
<!-- FancyTree Library -->
<script src="js/jquery.fancytree.js/"></script>
<!-- Building for project explorer -->
<script src="js/customJS/project_explorer.js/"></script>

<script>
var first = true;
$(function() {
	//web editor 객체 생성 (Code part)
	var editor = ace.edit("editor");
	//web editor의 maxline을 설정
	editor.setOptions({
		maxLines : 25,
		minLines : 25,
		autoScrollEditorIntoView : true
	});
	//web editor의 syntaxing 언어 설정(java)
	editor.getSession().setMode("ace/mode/java");
	//web editor의 테마 설정
	editor.setTheme("ace/theme/eclipse");
	//web editor를 읽기 전용으로 설정
	editor.setFontSize(13);
	editor.setReadOnly(true);
	editor.setHighlightActiveLine(false);
	editor.renderer.setShowPrintMargin(false);
	editor.setShowInvisibles(true);
	editor.setDisplayIndentGuides(true);
	editor.$blockScrolling = Infinity;
	
	saveEditorOption(editor);
	
	var consoleView = ace.edit("console");
	consoleView.setOptions({
		maxLines : 3,
		minLines : 3,
		autoScrollEditorIntoView : true
	});
	consoleView.getSession().setMode(
			"ace/mode/text");
	consoleView.setTheme("ace/theme/eclipse");
	consoleView.setFontSize(13);
	consoleView.setReadOnly(true);
	consoleView.setHighlightActiveLine(false);
	consoleView.renderer.setShowPrintMargin(false);
	consoleView.setDisplayIndentGuides(true);
	consoleView.$blockScrolling = Infinity;
	
	var oVideo = document.getElementById("myVideo");
	// 자막 리스트들을 가지고 옴
	var oTrackList = oVideo.textTracks;
	// 자막 리스트들 중 첫번째 자막 선택
	var oTextTrack = oTrackList[0];
	// 자막 텍스트가 바뀔때 마다 트리거 발생
	oTextTrack.oncuechange = function(e) {
		var cue = this.activeCues[0];
		//display에 뿌려줌
		if(cue) {
			var aa = JSON.parse(cue.text);
			console.log(aa);
// 			console.log(editor);
			$('a#fileName').html(aa.nowPath);
			editor.setValue(aa.nowCode);
			editor.clearSelection();
			if(aa.changedConsole) {
				consoleView.setValue(aa.changedConsole);
				consoleView.moveCursorTo(0, 0); 
			} else {
				consoleView.setValue("");
			}
			
			if(first) {
				projectExplorerObject = aa.projectExplorer;
				initProjectExplorer(aa.projectExplorer);
				first = false;
			} else {
				projectExplorerObject = aa.projectExplorer;
				updateProjectExplorer(aa.projectExplorer);
			}
			
			if(aa.chatMessage) {
				$("#chatMessage").empty();
				var chatMessages = aa.chatMessage;
				console.log(chatMessages);
				var message = '';
				for(var i in chatMessages) {
					message += chatMessages[i].from + ": " + chatMessages[i].chatMessage + '\n';
				}
				$('#chatMessage').val(message);
		        $("#chatMessage").scrollTop(99999999);
			} else {
				$("#chatMessage").empty();
			}
		}
	}
	
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

function saveEditorOption(editor) {
	var editorTheme = editor.getTheme();
	codeForm.theme.value = editorTheme;
	
	var editorInvisibles = editor.getShowInvisibles();
	codeForm.invisibles.value = editorInvisibles;
	
	var editorIndentGuides = editor.getDisplayIndentGuides();
	codeForm.indentGuides.value = editorIndentGuides;
}
</script>
</head>
<body>
<div class="container">
	<div class="row">
		<div id="rightSecondPanel" class="editorArea">
			<!-- 오디오  -->
<!-- 				<audio id="myVideo" controls="controls" controlsList="nodownload" preload="auto"> -->
			<audio id="myVideo" controls="controls" controlsList="nodownload noremote" preload="auto">
				<source src="videoPlay" type="audio/mpeg">
				<!-- 자막 -->
				<track id="entrack" src="captionPlay" kind="metadata" default></track>
			</audio>
		</div>
	</div>
	<div class="row">
		<div id="leftPanel" class="col-sm-10">
			<div id="leftUpperPanel" class="row">
				<div id="treePanel" class="col-sm-3 editorArea"	style="height: 440px; overflow: auto;">
					<div id="tree"></div>
				</div>
				<div id="editorPanel" class="col-sm-9">
					<div id="fileNamePanel" class="row editorArea">
						<a id="fileName" style="color: black">FilePath</a>
					</div>
					<div id="editor" class="row editorArea"></div>
					<div id="editorOption" class="row editorArea text-right">
						<div id="editorThemeChange">
							Theme 
							<select id="themeChange">
								<option value="eclipse">Eclipse</option>
								<option value="xcode">XCode</option>
								<option value="idle_fingers">idle Fingers</option>
								<option value="monokai">Monokai</option>
								<option value="gob">Green on Black</option>
							</select>
						</div>
						&nbsp;
						<div id="editorShowInvisibles">
							Invisibles 
							<select id="showInvisibles">
								<option value="true">on</option>
								<option value="false">off</option>
							</select>
						</div>
						&nbsp;
						<div id="editorIndentGuides">
							IndentGuides 
							<select id="indentGuides">
								<option value="true">on</option>
								<option value="false">off</option>
							</select>
						</div>
						&nbsp;
						<div id="editorShowGutte">
							Gutte 
							<select id="showGutte">
								<option value="true">on</option>
								<option value="false">off</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div id="leftLowerPanel" class="row">
				<div id="console" class="editorArea"></div>
			</div>
		</div>
		<div id="rightPanel" class="col-sm-2">
			<div id="rightFirstPanel" class="row editorArea">
				채팅창
				<div id="chatDiv">
					<textarea id="chatMessage" cols="18" rows="7"></textarea>
				</div>
			</div>
		</div>
	</div>
</div>

<form id="codeForm" action="sourceCode" method="POST" target="">
	<input type="hidden" name="code">
	<input type="hidden" name="theme">
	<input type="hidden" name="invisibles">
	<input type="hidden" name="indentGuides">
</form>

</body>
</html>