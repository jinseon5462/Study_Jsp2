<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script>
	test();
	function test(){
		var cardCompany = "hee";
		var installmentMonth = "3";
		var payApp = "dd";
		var url = 'butPage.jsp?cardCompany=' + cardCompany + '&installmentMonth=' + installmentMonth + '&payApp=' + payApp;
		alert(url);
	}
</script>
</html>