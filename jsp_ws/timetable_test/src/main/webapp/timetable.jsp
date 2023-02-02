<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<!-- 시간표 -->
		<table border="1" width="500px;">
			<thead>
				<tr>
					<th></th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th></th>
				</tr>
			<thead>
			<tbody id="tbody">
				<c:forEach var="i" begin="1" end="12" step="1">
					<tr class="row${i }">
						<th class="period">${i}교시</th>
						<c:forEach var="j" begin="1" end="5" step="1">
							<td></td>
						</c:forEach>
						<c:if test="${i <= 5}">
							<th class="timeth">오전 ${i+7}시</th>
						</c:if>
						<c:if test="${i > 5 }">
							<th class="timeth">오후 ${i-5}시</th>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="text" name="id" id="user_id" value="lee">
<script>
	getTimetable();
	//시간표 불러오기
	function getTimetable(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			//alert(obj.length);
			let arr = [];
			for(let i = 0; i < obj.length; i++){
				$(".row" + obj[i].startTime).children().eq(obj[i].day).text(obj[i].subName);
				$(".row" + obj[i].startTime).children().eq(obj[i].day).addClass(obj[i].subjectLabel);
				//arr.push(obj[i].subjectLabel)
			}
			/* for(let i = 1; i < 6; i++){
				for(let j = 1; i < 12; j++){
					if($(".row" + j).children().eq(i).text() == $(".row" + (j + 1)).children().eq(i).text()){
						//$(".row" + j).children().eq(i).attr("rowspan", "2");
					}
				}
			} */
			//alert($(".sub1").length);
			/* $(".sub1").eq(0).attr("rowspan", $(".sub1").length);
			$(".sub1").not(":eq(0)").remove();
			$(".sub2").eq(0).attr("rowspan", $(".sub2").length);
			$(".sub2").eq(1).remove();
			$(".sub2").last().remove();
			$(".sub3").eq(0).attr("rowspan", $(".sub3").length);
			$(".sub3").last().remove();
			$(".sub4").eq(0).attr("rowspan", $(".sub4").length);
			$(".sub4").last().remove(); */
			
			
		}
		let id = $("#user_id").val();
		xhttp.open("GET", "getTimetable.do?id=" + id, true);
		xhttp.send();
	}
</script>
</body>
</html>