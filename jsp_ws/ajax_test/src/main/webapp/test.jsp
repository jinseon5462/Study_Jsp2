<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	div{
		backgroud-color: black;
		color: white;
	}
</style>
<body>
<h1 id="greet"></h1>
<input type="text" name="greet">

<script>
	loadDoc();
	
	function loadDoc(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let result = this.responseText;
			document.getElementById("greet").innerHTML = result;
			document.querySelector("input[name='greet']").value = result;
			//document.querySelector("#t_greet").innerHTML = result;
			
			let div = document.createElement('div');
			//let result = document.createTextNode(result);
			
			//div.innerHTML ="<h1>" + result + "<h1>";
			//document.body.appendChild(div);
			
			let table = document.createElement("table");
			let thead = document.createElement("thead");
			let h_tr = document.createElement("tr");
			let h_td1 = document.createElement("td");
			let h_td2 = document.createElement("td");
			
			h_tr.appendChild(h_td1);
			h_tr.appendChild(h_td2);
			thead.appendChild(h_tr);
			table.appendChild(thead);
			
			let tbody = document.createElement("tbody");
			table.appendChild(tbody);
			tbody.setAttribute("id", "tbody");
			document.body.appendChild(table);
			tbody.innerHTML = "<tr><td>aaa</td><td>bbb</td></tr>";
		}
		xhttp.open("GET", "greet.do", true);
		xhttp.send();
	}
</script>
</body>
</html>