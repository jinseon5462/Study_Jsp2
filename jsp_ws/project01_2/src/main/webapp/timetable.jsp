<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<link rel="stylesheet" href="css/timetable.css?v1.0.8">
</head>
<body id="timetable">
	<%@ include file="header.jsp" %>
	<div class="wrap">
		<!-- 시간표 -->
		<table border="1">
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
							<td class="day${j}_startTime${i}_endTime${i + 1}"></td>
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
		<!-- 시간표 등록 -->
		<div id="addSubject_btn">+ 수업추가</div>
		<form id="addSubject_box">
			<div class="x_btn">X</div>
			<h3>새 수업 추가</h3>
			<div class="subName_wrap">
				<div class="subject_name">과목명</div>
				<input type="text" id="input_subjectName" name="subjectName" maxlength="15" placeholder="예) 일반물리학" autocomplete="off">
			</div>
			<div class="professorName_wrap">
				<div class="professor_name">교수명</div>
				<input type="text" id="input_professorName" name="professorName" maxlength="10" placeholder="예) 홍길동" autocomplete="off">
			</div>
			<div class="time_place_title">시간/장소</div>
			<div class="timeplaces">
				<div class="timeplace">
					<div class="time_place">
						<ol class="weeks">
							<li>월</li>
							<li>화</li>
							<li>수</li>
							<li>목</li>
							<li>금</li>
						</ol>
						<p class="hourplace">
							<select class="startHour">
								<option value="">시작 시간</option>
								<c:forEach var="s" begin="1" end="11" step="1">
									<c:if test="${s <= 5}">
										<option value="${s}">오전 ${s+7}시</option>
									</c:if>
									<c:if test="${s > 5}">
										<option value="${s}">오후 ${s-5}시</option>
									</c:if>
								</c:forEach>
							</select>
							<span> ~ </span>
							<select class="endHour">
								<option value="">종료 시간</option>
								<c:forEach var="e" begin="2" end="12" step="1">
									<c:if test="${e <= 5}">
										<option value="${e}">오전 ${e+7}시</option>
									</c:if>
									<c:if test="${e > 5}">
										<option value="${e}">오후 ${e-5}시</option>
									</c:if>
								</c:forEach>
							</select>
							<input type="text" id="place" maxlength="15" placeholder="예) 이과대 303호">
						</p>
					</div>
				</div>
				<!-- <div class="addMore_btn">+ 더 입력</div> -->
			</div>
			<div class="color">
				<span>적용할 색깔</span>
				<input type="color" id="myBestColor" name="color" value="#FFECA8">
			</div>
			<div class="submit">
				<button type="button" id="submit_btn">저장</button>
			</div>
		</form>
	</div>
	<%@ include file="footer.jsp" %>
<script>
	getTimetable();
	
	// 과목추가 열기
	$("#addSubject_btn").on("click", function(){
		$("#addSubject_box").css("display", "block");
	});
	
	// 과목추가 닫기버튼
	$(".x_btn").on("click", function(){
		$("#addSubject_box").css("display", "none");
		$("li").removeClass("on");	// 닫기누르면 요일선택된값 초기화
		$("#input_subjectName").val("");	// 과목명 초기화
		$("#input_professorName").val("");	// 교수명 초기화
		$(".startHour").val("");	// 시작시간 초기화
		$(".endHour").val("");	// 종료시간 초기화
		$("#place").val("");	// 장소 초기화
		$("#myBestColor").val("#FFECA8"); // 색깔 초기화
	});
	
	// 시간표 불러오기
	function getTimetable(){
		//alert("실행");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			//$("#tbody").empty();
			for(let i = 0; i < obj.length; i++){
				$(".row" + obj[i].startTime).children().eq(obj[i].day).html(
					"<div class='subInfo'>" 
						+ "<div class='deleteSubjectBtn'>X</div>"
						+ "<div id='subName'>" + obj[i].subName + "</div>" 
						+ "<div id='profName'>" + obj[i].profName + "</div>" 
						+ "<div id='info_place'>" + obj[i].place + "</div>" 
					+ "</div>"
				);
				
				$(".row" + obj[i].startTime).children().eq(obj[i].day).css("backgroundColor", obj[i].color);
			}
		}
		let id = $("#user_id").val();
		xhttp.open("GET", "getTimetable.do?id=" + id, true);
		xhttp.send();
	}
	
	/* 요일선택 */
	$("li").on("click", function(){
		$("li").not(this).removeClass("on");	// 선택된 태그를 제외하고 on class 제거
		$(this).addClass("on");	// 클릭한 자신만 on class 부여함
		/* alert($("li.on").text()); */
	});
	
	// 시간표 저장하기
	$("#submit_btn").on("click", function(){
		//alert("시작 : " + $(".startHour").val() + ", 종료 : " + $(".endHour").val())
		if($("#input_subjectName").val() == ""){
			alert("과목명을 입력해주세요.");
			return;
		}else if($("#input_professorName").val() == ""){
			alert("교수명을 입력해주세요.");
			return;
		}else if($(".weeks > li.on").text() == ""){
			alert("요일을 선택해주세요.");
			return;
		}else if($("#place").val() == ""){
			alert("장소를 입력해주세요.");
			return;
		}else if($(".startHour").val() == ""){
			alert("시작 시간을 입력해주세요.");
			return;
		}else if($(".endHour").val() == ""){
			alert("종료 시간을 입력해주세요.");
			return;
		}else if(parseInt($(".startHour").val(), 10) >= parseInt($(".endHour").val(), 10)){
			alert("강의시작시간은 강의종료시간보다 더 빨라야 합니다!");
			return;
		}
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			if(data == "1"){
				alert("등록 성공");
				$("#addSubject_box").css("display", "none");
				$("li").removeClass("on");	// 닫기누르면 요일선택된값 초기화
				$("#input_subjectName").val("");	// 과목명 초기화
				$("#input_professorName").val("");	// 교수명 초기화
				$(".startHour").val("");	// 시작시간 초기화
				$(".endHour").val("");	// 종료시간 초기화
				$("#place").val("");	// 장소 초기화
				$("#myBestColor").val("#FFECA8"); // 색깔 초기화
				getTimetable();
			}else{
				alert("등록 실패");
			}
		}
		let subName = $("#input_subjectName").val();
		let profName = $("#input_professorName").val();
		let day0 = $(".weeks > li.on").text();
		let day;
		if(day0 == "월"){
			day = 1;
		}else if(day0 == "화"){
			day = 2;
		}else if(day0 == "수"){
			day = 3;
		}else if(day0 == "목"){
			day = 4;
		}else{
			day = 5;
		}
		let startHour = $(".startHour").val();
		let endHour = $(".endHour").val();
		let place = $("#place").val();
		let id = $("#user_id").val();
		let color = $("#myBestColor").val();
		// 만약 등록하려고 하는 자리에 강의가 있다면 등록불가
		if($(".row" + startHour).children().eq(day).text() != ""){
			alert("같은 시간에 이미 수업이 있습니다!");
			return;
		}
		
		xhttp.open("POST", "regSubject.do", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send(
				"subName=" + subName 
				+ "&profName=" + profName 
				+ "&day=" + day 
				+ "&startHour=" + startHour
				+ "&endHour=" + endHour
				+ "&place=" + place
				+ "&id=" + id
				+ "&color=" + color
		);
	});
	
	// 삭제
	$("td").on("mouseenter", function() {
		$(this).find(".deleteSubjectBtn").show();
	}).on("mouseleave", function() {
		$(this).find(".deleteSubjectBtn").hide();
	});
	
	$(document).on("click", ".deleteSubjectBtn", function() {
		if(confirm("정말 삭제하시겠습니까?") == false){
			return;
		}else{
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				let result = parseInt(this.responseText, 10);
				if(result == 0){
					alert("삭제 실패");
				}else{
					alert("삭제 완료");
					history.go(0);	// 새로고침
				}
			}
			let subInfoElement = $(this).closest('.subInfo');
			let subName = subInfoElement.find('#subName').text();
			let profName = subInfoElement.find('#profName').text();
			let place = subInfoElement.find('#info_place').text();
			console.log(subName, profName, place);
			xhttp.open("post", "deleteSubject.do", true);
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("subName=" + subName + "&profName=" + profName + "&place=" + place);
		}
	});
</script>
</body>
</html>