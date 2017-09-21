<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Lesson</title>
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
<!-- 접속한 사용자의 ip를 알기위한 외부 사이트 주소 -->
<script src="http://jsgetip.appspot.com"></script>
<!-- ACE web editor Library -->
<script src="js/ace/ace.js"></script>
<!-- FancyTree Library -->
<script src="js/jquery.fancytree.js/"></script>
<!-- Building for project explorer -->
<script src="js/customJS/project_explorer.js/"></script>
<script>
var sock = null;

$(document).ready(function() {
	//현재 사용자의 IP를 로딩
// 	var connIp = ip();
	//테스트 용 IP 설정 (== localhost)
	var connIp = '127.0.0.1';
// 	var connIp = '172.20.10.3';
	//web editor 객체 생성 (Code part)
	var editor = ace.edit("editor");
	//web editor 객체 생성 (Console part)
	var consoleView = ace.edit("console");
	
	$('input#start').on('click', function() {
		//강의 제목 입력
		var title = $('input#title').val();
		//선생님 id 입력
// 		var id = $('input#id').val();
		var id = '${teacher_id}';
		//강의 번호 입력
// 		var classNum = $('input#classNum').val();
		var classNum = '${classNum}';
		
		//서버에 보낼 메세지를 객체로 만듦
		var teacherInfo = {};
		teacherInfo.classNum = classNum;
		teacherInfo.title = title;
		teacherInfo.id = id;
		teacherInfo.ip = connIp;
		
		var startResult = -100;
		//서버에 강의 시작 명령 전달(Server Socket생성 및 대기, 선생님의 기본 정보 등록)
		$.ajax({
			url : "startLesson"
			, async: false
			, method : "post"
			, data : teacherInfo
			, success : function(resp) {
				startResult = resp;
			}
		});
		
		//서버에 명령 전달이 성공하면 실행
		if(startResult == 1) {
			//웹소켓 연결 후 수켓 객체를 sock에 저장
			sock = new WebSocket("ws://" + window.location.host +"/cl/ws/teacherSideLesson");
			
			//웹소켓 생성 직후 실행
			sock.onopen = function() {
				//서버에 보낼 메세지를 객체로 만듦
				var sendMessage = {};
				sendMessage.action = "init";
				sendMessage.title = title;
				sendMessage.id = id;
				sendMessage.ip = connIp;
				
				//JSON 형태로 변환
				var sendMessageJSON = JSON.stringify(sendMessage);
// 				console.log(sendMessageJSON);
				
				//웹소켓을 통해 서버에서 메세지 전달
				sock.send(sendMessageJSON);
				console.log('websocket connected');
			}
			
			//사용자에게 다음 행동 지시(알림)
			$('div#connInfo').empty();
			$('div#connInfo').append('<br>Eclipse를 켜서 강의를 시작해 주세요.');
			
			//웹소켓을 통해 서버에서 메세지가 전송 되었을 때 실행
			sock.onmessage = function(evt) {
// 				console.log(evt.data);

				//받은 메세지를 JSON 객체로 parsing
				var parsedData = JSON.parse(evt.data);
				//메시지의 action 부분을 추출
				var action = parsedData.action;
				
				//action 부분의 내용에 따라 다른 코드 실행
				//서버에 웹소켓 등록 완료 후 실행
				if(action == 'initSuccess') {
					$('div#connInfo').append('<br>웹소켓에 ip등록 완료하였습니다.');
				} 
				//선생님 Eclipse와 연결 완료 및 클래스 Thread 실행 후 실행
				else if(action == 'eclipseConnSuccess') {
					$('div#startDiv').css('display', 'none');
					$('div#lessonDiv').css('display', 'block');
// 					$('div#connInfo').append('<br>eclipse와 연결 완료하였습니다. 강의를 시작합니다.');
				}
				//학생이 강의에 참가하면 실행
				else if(action == 'studentListUpdate') {
					var studentList = parsedData.data;
// 					console.log(studentList);
					//select tag에 접속 한 학생의 아이디 등록
					var listHtml;
					for(var index in studentList) {
						listHtml += '<option user-ip="' + studentList[index].ip + '">' + studentList[index].id + '</option>';
					}
					$('div#studentList select').html(listHtml);
					//student 버튼을 누르면 학생의 eclipse에 접속
					$('input#startStudentView').on('click', function() {
						var sendMessage = {};
						sendMessage.action = "viewStudentEclipse";
						sendMessage.ip = $('select option:selected').attr("user-ip");
						var sendMessageJSON = JSON.stringify(sendMessage);
						sock.send(sendMessageJSON);
					});
				} 
				//action 부분의 내용에 따라 다른 코드 실행
				//학생 eclipse 접속 성공 시 실행
				else if(action == 'connStudentEclipseSuccess') {
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
				} 
				//학생 eclipse 접속 직후 Project Explorer 정보 로딩
				else if(action == 'initProjectExplorer') {
//	 				console.log(parsedData.projectExplorer);
					projectExplorerObject = parsedData.projectExplorer;
					initProjectExplorer(parsedData.projectExplorer);
				} 
				//학생 eclipse 접속 직후 활성화 된 Editor 정보 로딩
				else if(action == 'initActivatedEditor') {
					//활성화된 Editor의 파일 경로 표시
					$('a#fileName').html(parsedData.nowPath);
					//받은 코드를 현재 editor에 그대로 덮어쓰기
					editor.setValue(parsedData.nowCode);
					editor.clearSelection();
				} 
				//학생 Eclipse의 Editor에서 변화가 일어 났을 때 실행
				else if(action == 'changeCode') {
					//받은 코드를 현재 editor에 그대로 덮어쓰기
					editor.setValue(parsedData.code);
					editor.clearSelection();
				} 
				//학생 Eclipse의 Console에서 변화가 일어 났을 때 실행
				else if(action == 'changeConsole') {
					//받은 코드를 현재 editor에 그대로 덮어쓰기
					consoleView.setValue(parsedData.console);
					editor.clearSelection();
				} 
				//학생 Eclipse의 활성화 Editor가 바뀌었을 때 실행
				else if(action == 'changeActivatedEditor') {
					//활성화된 Editor의 파일 경로 표시
					$('a#fileName').html(parsedData.nowPath);
					//받은 코드를 현재 editor에 그대로 덮어쓰기
					editor.setValue(parsedData.nowCode);
					editor.clearSelection();
				} 
				//파일, 패키지, 프로젝트의 변화가 생겼을 때 실행
				else if(action == 'changeProject') {
//	 				console.log(parsedData.projectExplorer);
					projectExplorerObject = parsedData.projectExplorer;
					updateProjectExplorer(parsedData.projectExplorer);
				}
				else if(action == 'chatMessage') {
					var existMessage = $('#chatMessage').val();
					var message = parsedData.from + ": " + parsedData.chatMessage;
					
					if(existMessage == '') {
						existMessage = message;
					} else {
						existMessage = existMessage + '\n' + message;
					}
					
					$('#chatMessage').val(existMessage);
					$('#chatMessage').scrollTop(999999);
				}
				else if (action == 'disconnect') {
					alert('수업이 종료되었습니다.');
				}
			}
		} else if(startResult == 0) {
			$('div#connInfo').append('<br>서버소켓이 사용 중 입니다. 다음에 다시 연결하세요.');
		}
	});
	
	$('input#cancel').on('click', function() {
		var cancelResult = -100;
		
		//서버에 강의 시작 명령 전달(Server Socket생성 및 대기, 선생님의 기본 정보 등록)
		$.ajax({
			url : "cancelLesson"
			, async: false
			, method : "post"
			, success : function(resp) {
				cancelResult = resp;
				console.log(result);
			}
		});
		
		if(cancelResult == 1) {
			$('div#connInfo').append('<br>강의 시작을 취소하였습니다.');
		}
	});
	
	//엔터키를 누르면 메시지를 보내도록 설정
	$("#message").keydown(function (key) {
		if (key.keyCode == 13) {
			$("#sendMessage").click();
		}
	});
    
	//보내기 버튼을 클릭했을 때
	$("#sendMessage").click(function() {
		if( $("#message").val() != "") { 
			var sendMessage = {};
			sendMessage.action = "chatMessage";
			sendMessage.chatMessage = $("#message").val();
			var sendMessageJSON = JSON.stringify(sendMessage);
			sock.send(sendMessageJSON);
			$("#message").val("");
		}
	});
	
	//학생 eclipse 접속 종료
	$('input#stopStudentView').on('click', function() {
		var sendMessage = {};
		sendMessage.action = "closeStudentEclipse";
		var sendMessageJSON = JSON.stringify(sendMessage);
		sock.send(sendMessageJSON);
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
<div id="startDiv">
	<div id="lessonStartForm">
		강의 제목<input type="text" name="title" id="title"><br>
		선생님 id<input type="text" name="id" id="id"><br>
		반 번호<input type="text" name="classNum" id="classNum"><br>
		<input type="button" id="start" value="start">
		<input type="button" id="cancel" value="cancel">
	</div>
	<div id="connInfo"></div>
</div>

<div id="lessonDiv" class="container" style="display: none">
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
				참여학생목록
				<div id="studentList">
					<select size="10" style="width: 150px; height: 200px"></select>
				</div>
			</div>
			<div id="rightSecondPanel" class="row editorArea">
				채팅창
				<div id="chatDiv">
					<textarea id="chatMessage" cols="19" rows="7"></textarea>
					<input type="text" id="message" size="15" placeholder="메시지 내용" />
					<input type="button" id="sendMessage" value="전송" />
				</div>
			</div>
			<div id="rightThirdPanel" class="row editorArea">
				<div id="connStudentEclipse">
					<input type="button" id="startStudentView" value="conn"> 
					<input type="button" id="stopStudentView" value="disconn">
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