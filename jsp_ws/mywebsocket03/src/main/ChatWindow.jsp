<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
<script>
	var webSocket = new WebSocket("ws://localhost:8090/mywebsocket/ChatingServer");
	var chatWindow, chatMessage, chatId;
	
	// 채팅창이 열리면...
	window.onload = function(){
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById("chatId").value;
	}

	//메시지 전송
	function sendMessage(){
		//대화창에 표시
		chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>";
		webSocket.send(chatId + "|" + chatMessage.value); // 서버로 전송
		chatMessage.value = ""; // 메시지 입력창 내용 지우기
		chatWindow.scrollTop = chatWindow.scrollHeight; // 대화창 스크롤
	}
	
	function disconnect(){
		webSocket.close();
	}
	
	function enterKey(){
		if(window.event.keyCode == 13){ // 키보드의 키코드값이 13(엔터)이면... 엔터키를 누르면이라는 의미
			sendMessage();
		}
	}
	
	//웹소켓서버에 연결되었을 때 실행
	webSocket.onopen = function(event){
		chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
	};
	
	//웹소켓이 닫혔을 때(서버와의 연결이 끊겼을 때) 실행
	webSocket.onclose = function(event){
		chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.";
	};
	
	//에러 발생 시 실행
	webSocket.onerror = function(event){
		chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.";
	};
	
	//메시지를 받았을 때 실행
	webSocket.onmessage = function(event){
		var message = event.data.split("|"); // 대화명과 메시지 분리 (예: aaa|hi~)
		var sender = message[0]; // 보낸사람의 대화명 (예: aaa)
		var content = message[1]; // 메시지 내용(예: hi~)
		if(content != ""){
			if(content.match("/")){ //귓속말 기호
				if(content.match("/" + chatId)){ // 나에게 보낸 메시만 출력
					var temp = content.replace(("/" + chatId), "[귓속말] : ");
					chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
				}
			}else{ // 일반 대화
				chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div>";
			}
		}
		chatWindow.scrollTop = chatWindow.scrollHeight;
	};
	
	
	
</script>
<style>
	#chatWindow{
		border: 1px solid black;
		width: 310px; height: 310px;
		overflow: scroll;
		padding: 5px; 
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	#chatMessage{
		width: 268px; height: 30px;
	}
	
	#sendBtn{
		height: 30px;
		position: relative;
		top: 2px;
		left: -2px;
	}
	#closeBtn{
		margin-bottom: 3px;
		position: relative;
		top: 2px;
		left: -2px;
	}
	#chatId{
		width: 158px;
		height: 24px;
		border: 1px solid #AAAAAA;
		background-color: #EEEEEE;
	}
</style>
</head>
<body>
	대화명 : <input type="text" id="chatId" value="${param.chatId }" readonly />
	<button id="closeBtn" onclick="disconnect()">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyup="enterKey()" />
		<button id="sendBtn" onclick="sendMessage()" >전송</button>
	</div>
</body>
</html>