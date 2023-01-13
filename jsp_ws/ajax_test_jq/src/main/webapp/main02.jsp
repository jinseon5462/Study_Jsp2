<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
<form name="frm">
	<input type="text" name="name" value="hong"><br>
	<input type="text" name="age" value="23"><br>
	<input type="submit" value="전송">
</form>
<div id="demo"></div>

<script>
	$("input[type='submit']").click(function(e){
		e.preventDefault();	// form안에 submit 역할을 하는 버튼을 눌렀어도 새로 실행 X(submit은 작동)
		alert($(frm));
		const formData = $(frm).serialize();	// 직렬화
		$.ajax({
			url: "ajax.do",
			type: "post",
			data: formData,  // 클라이언트(jsp:javascript) --> 서버(Servlet) : 보내는 데이터
			dataType: "json",	// 서버(Servlet) --> 클라이언트(jsp:javascript) : 받는 데이터
			success: function(data){
				alert(data);
				$("#demo").text(data.name);
			}
		});
	});
	
	$("input[type='submit']").click(function(e){
		e.preventDefault();
		const formData = $(frm).serialize();
		$.ajax({
			url: "ajax.do",
			type: "post",
			data: formData,
			dataType: "json",
			success: function(data){
				$("#demo").text(data.name);
			}
		});
	});
</script>
</body>
</html>