<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<style>
	
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="timetable_sidebar">
		
	</div>
	<div class="wrap">
		<table class="tablehead">
			<tbody>
				<tr>
					<th></th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th></th>
				</tr>
			</tbody>		
		</table>
		<table class="tablebody">
			<tbody>
				<tr>
					<th>
						<div class="hours">
							<div class="hour">0교시</div>
							<div class="hour">1교시</div>
							<div class="hour">2교시</div>
							<div class="hour">3교시</div>
							<div class="hour">4교시</div>
							<div class="hour">5교시</div>
							<div class="hour">6교시</div>
							<div class="hour">6교시</div>
							<div class="hour">7교시</div>
							<div class="hour">8교시</div>
							<div class="hour">9교시</div>
							<div class="hour">10교시</div>
						</div>
					</th>
				</tr>
			</tbody>
		</table>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>