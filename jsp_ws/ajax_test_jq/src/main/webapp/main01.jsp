<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.3.js" 
    integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
    crossorigin="anonymous"></script> -->
<script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
<button id="btn1">실행(txt)</button>
<button id="btn2">실행(json_txt)</button>
<button id="btn3">실행(json_txt_Array)</button>
<button id="btn4">실행(json)</button>

<hr>
<div id="demo"></div>
<div>
	<table border="1">
		<thead>
			<tr>
				<th>이름</th><th>나이</th>
			</tr>
		</thead>
		<tbody id="tbody">
		<!-- 여기에 데이터를 넣으세요. -->
		</tbody>
	</table>
</div>
<script>
	// 버튼을 클릭하면 ajax_info.txt 파일을 서버에 요청하여,
	// 해당 파일의 텍스트를 받아 div영역에 표시한다.
	// .on("click") , .click
	$("#btn1").click(function(){
		//alert("clicked!");
		$.ajax({
			url: "ajax_info.txt",
			type: "get",
			dataType: "text", // 서버로부터 받을 데이터의 타입
			success: function(data){ 
				// 서버의 응답이 성공적으로 끝나면 실행되는 함수.
				// 서버가 제공하는 데이터는 'data'에 담겨있다. 이 'data'라는 이름은 임의로 정할 수 있다.
				$("#demo").text(data);
				// document.querySelector("#demo").innerText = date;
			},
			error: function(){
				alert("error...");
			}
		});
	});
	
	$("#btn2").click(function(){
		$.ajax({
			url: "ajax_info2.txt",
			type: "get",
			dataType: "text",
			success: function(data){
				alert(data);
				let obj = JSON.parse(data);
				alert(obj);
				$("tbody").html(
				"<tr><td>" + obj.name 
				+ "</td><td>" + obj.age 
				+ "</td></tr>");
			},
			error: function(){
				alert("error...");
			}
		});
	});
	
	$("#btn3").click(function(){
		$.ajax({
			url: "ajax_info3.txt",
			type: "get",
			dataType: "text",
			success: function(data){
				alert(data);
				let obj = JSON.parse(data);
				alert(obj);
				$("tbody").empty();
				$.each(obj, function(index, value){
					$("tbody").append("<tr><td>" + value.name + "</td><td>" + value.age + "</td></tr>")
				});
			},
			error: function(){
				alert("error...");
			}
		});
	});
	
	$("#btn4").click(function(){
		$.ajax({
			url: "ajax_info4.json",
			type: "get",
			dataType: "json",
			success: function(man){
				alert(man);
				//let man = JSON.parse(data);
				$("tbody").empty();
				$("tbody").append("<tr><td>" + man.name + "</td><td>" + man.age + "</td></tr>")
			},
			error: function(){
				alert("error...");
			}
		});
	});
</script>
</body>
</html>