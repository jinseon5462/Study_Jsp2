<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
<style>
	.myMsg{
		width: fit-content;
		padding: 5px;
		border: solid 1px black;
		background-color: yellow;
		border-radius: 10px;
		margin-bottom: 10px;
		text-align: right;
	}
	.myMsgWrap{
		display: flex;
		float:right;
		clear: both;
	}
	.normalMsg{
		width: fit-content;
		padding: 5px;
		background-color: yellow;
		border-radius: 10px;
		border: 1px solid black;
		margin-bottom: 10px;
	}
	.normalWrap{
		display: flex;
		clear: both;
	}
	img{
		border-radius: 10px;
		width: 30px;
		height: 30px;
	}
	.whisperMsg{
		border: 1px solid blue;
		width: 150px;
		padding: 5px;
		background-color: yellow;
		border-radius: 10px;
		border: 1px solid black;
		margin-bottom: 10px;
		clear: both;
	}
	input{
		outline: none;
	}
	
	#chatWindow{
		background-color: gray;
		border:1px solid black;
		width: 310px;
		height: 310px;
		overflow: scroll;
		padding: 5px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	#chatMessage{
		width: 272px; 
		height: 20px;
	}
	#sendBtn{
		height: 27px;
		position: relative;
		
	}
	#closeBtn{
		margin-bottom: 3px;
		height: 30px;
		position: relative;
		 left: -2px;
	}
	#chatId{
		width: 158px;
		height: 24px;
		border: 1px solid black;
		background-color: #EEEEEE;
	}
	.box{
		margin-right: 5px;
		margin-left: 5px;
	}
</style>
</head>
<script>
	let webSocket = new WebSocket("ws://localhost:8090/mywebsocket02/ChatingServer");
	let chatWindow, chatMessage, chatId;
	
	//채팅창이 열리면,,
	window.onload = function(){
		chatWindow = document.querySelector("#chatWindow");
		chatMessage = document.querySelector("#chatMessage");
		chatId = document.querySelector("#chatId").value;
	};
	//메세지 전송
	function sendMessage(){
		let val = document.querySelector("#chatMessage").value;
		if(val == ""){
			alert("내용을 입력해주세요.");
			return;
		}
		//대화창에 표시
		chatWindow.innerHTML += "<div class='myMsgWrap'>" 
									+ "<div class='myMsg'>" + chatMessage.value + "</div>" 
									+ "<div class='box'>" 
										+ "<img src='images/profile_img.png'>" 
										+ "<div>me</div>" 
									+ "</div>" 
								+ "</div>";
								
		webSocket.send(chatId + " | " + chatMessage.value);
		chatMessage.value = ""; // 메세지 입력창 내용 지우기
		chatWindow.scrollTop = chatWindow.scrollHeight; //대화창 스크롤
	};
	
	function disconnect(){
		webSocket.close();
	};
	
	function enterKey(){
		let val = document.querySelector("#chatMessage").value;
		
		if(window.event.keyCode == 13 && val != ""){
			sendMessage();
		}
	};
	//웹소켓 서버에 연결되었을때 실행
	webSocket.onopen = function(event){
		chatWindow.innerHTML += "익명채팅방에 오신걸 환영합니다! <br/><br/>"
	};
	
	//웹소켓이 닫혔을때 (서버와의 연결이 끊겼을때) 실행
	webSocket.onclose = function(event){
		chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.";
	};
	
	//에러 발생 시 실행
	webSocket.onerror = function(event){
		chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.";
	};
	
	//메세지를 받았을 때 실행
	webSocket.onmessage = function(event){
		let message = event.data.split("|"); //대화명과 메세지분리
		let sender = message[0]; //보낸 사람의 대화명
		let content = message[1]; //메세지 내용
		if(content != ""){
			if(content.match("/")){ //귓속말 기호
				if(content.match("/" + chatId)){ //나에게 보낸 메세지만 출력
					let temp = content.replace(("/"+chatId), "[귓속말] : ");
					chatWindow.innerHTML += 
						"<div class='normalWrap'>"
							+ "<div class='box'>"
							+ "<img src='images/profile_img.png'>"
							+ "<div class='name'>" + sender + "</div>"
							+ "</div>"
							+ "<div class='whisperMsg'>" + temp + "</div>"
						+ "</div>";
				}
			}else{ // 일반대화
				chatWindow.innerHTML += "<div class='normalWrap'>" 
											+ "<div class = 'box'>"
												+ "<img src='images/profile_img.png'>"
												+ "<div class = 'name'>" + sender + "</div>"
											+ "</div>"
											+ "<div class='normalMsg'>" + content + "</div>"
										+ "</div>";
			}
		}
		chatWindow.scrollTop = chatWindow.scrollHeight;
	};
</script>
<body>
	대화명 : <input type="text" id="chatId" value="${param.chatId }" readonly >
	<button id="closeBtn" onclick="disconnect()">채팅 종료</button>
	<div id="chatWindow"></div>
	<div>
		<input type="text" id="chatMessage" onkeyDown="enterKey()">
		<button id="sendBtn" onclick="sendMessage()">전송</button>
	</div>
</body>
</html>