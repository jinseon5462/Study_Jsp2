<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
</head>
<body>
	<h2>웹 소켓 채팅 - 대화명 적용해서 채팅창 띄워주기</h2>
	대화명: <input type="text" id="chatId">
	<button onclick="chatWinOpen()">채팅참여</button>
	
	<script>
		function chatWinOpen(){
			let id = document.querySelector("#chatId");
			if(id.value == ""){
				alert("대화명을 입력 후, 채팅창을 열어 주세요 ^^~");
				id.focus();
				return ;
			}
			window.open("ChatWindow.jsp?chatId=" + id.value, "", "width=450, height=450");
		};
	</script>
</body>
</html>