<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="box">
	<div id="main_box">
		<aside>
			<!-- 사이드바 프로필카드 -->
			<div id="profile_box">
				<div id="profile_img">
				<c:if test="${sessionScope.user.univ eq '부산대' }">
					<img src="images/busan.png" alt="프로필 이미지">
				</c:if>
				<c:if test="${sessionScope.user.univ eq '동아대' }">
					<img src="images/donga.png" alt="프로필 이미지">
				</c:if>
				<c:if test="${sessionScope.user.univ eq '동의대' }">
					<img src="images/donge.png" alt="프로필 이미지">
				</c:if>
				<c:if test="${sessionScope.user.univ eq '부경대' }">
					<img src="images/pukyeong.png" alt="프로필 이미지">
				</c:if>
				<c:if test="${sessionScope.user.univ eq '경성대' }">
					<img src="images/kyungsung.png" alt="프로필 이미지">
				</c:if>
				<c:if test="${sessionScope.user == null }">
					<img src="images/profile_img.png" alt="프로필 이미지">
				</c:if>
				</div>
				 <c:if test="${sessionScope.user != null }">
					<div id="profile_nickname">${sessionScope.user.grade }</div>
					<div id="profile_name">${sessionScope.user.name }</div>
					<div id="profile_id">${sessionScope.user.id }</div>
					<button id="profile_logout" onclick="location.href='logout.jsp'">로그아웃</button>
				</c:if>
				<c:if test="${sessionScope.user == null }">
					<div id="profile_nickname">로그인 후 이용가능합니다.</div>
					<button type="button" id="profile_login" onclick="login()">로그인</button>
					<button type="button" id="profile_regist" onclick="location.href='regist.jsp'">회원가입</button>
				</c:if>
			</div>
			<!-- 광고칸 -->
			<div id="ad">
			    <img src="images/ad1.png" alt="광고1">
			    <img src="images/ad2.png" alt="광고2">
			    <img src="images/ad3.png" alt="광고3">
			</div>
		</aside>
		<!-- 메인 -->
		<section id="main">
		    <!-- 공지사항 -->
			<div id="notice_board">
			    <h3 class="title1"><a href="noticeboard.jsp">공지사항</a></h3>
			    <ul class="notice_list">
			        <!-- <li class="items">
			            <a href="#">에브리데이에 오신걸 환영합니다!</a><span>01.10</span>
			        </li>
			        <li class="items">
			            <a href="#">다들 글쓰기 매너를 지켜주세요!</a><span>01.09</span>
			        </li>
			        <li class="items">
			            <a href="#">매너를 지키지않은 유저의 게시글은</a><span>01.08</span>
			        </li>
			        <li class="items">
			            <a href="#">무통보 삭제하도록 하겠습니다.</a><span>01.07</span>
			        </li> -->
			    </ul>
			</div>
			<!-- 자유 게시판 -->
			<div id="free_board">
			    <h3 class="freeBoard_title"><a href="freeboard.jsp">자유 게시판</a></h3>
			    <ul class="free_list">
			        <!-- <li class="items">
			            <a href="#">솔직히 이건좀 아니지않냐</a><span>01.10</span>
			        </li>
			        <li class="items">
			            <a href="#">사고와 표현 책 나눔</a><span>01.09</span>
			        </li>
			        <li class="items">
			            <a href="#">행복한 오카리나 드랍합니다~</a><span>01.08</span>
			        </li>
			        <li class="items">
			            <a href="#">남자인데 발레수업 들어도되나요?</a><span>01.07</span>
			        </li> -->
			    </ul>
			</div>
		</section>
	</div>
</div> <!-- box -->

<script>
	getNoticeList();
	getFreeList();
	function login(){
		let url = "login.jsp";
		window.open(url,"_blank",
			"width=301, height=301"		
		);
	}
	
	/* 공지섹션 */
	function getNoticeList(){
		const notice_list = document.querySelector(".notice_list");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			for(let i = 0; i < obj.length; i++){
				console.log(obj[i].title.length);
				if(obj[i].title.length < 30){
					notice_list.innerHTML += 
						"<li class='items'>" + obj[i].title + "<span>"
						+ obj[i].regdate + "</span></li>";
				}else{
					let content = obj[i].title.substring(0, 30);
					notice_list.innerHTML += 
						"<li class='items'>" + content + "..." + "<span>"
						+ obj[i].regdate + "</span></li>";
				}
				if(i == 8){
					break;
				}
			}
		}
		xhttp.open("GET", "getNoticeList.do", true);
		xhttp.send();
	}
	/* 자유게시글 섹션 */
	function getFreeList(){
		const freeList = document.querySelector(".free_list");
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			let data = this.responseText;
			let obj = JSON.parse(data);
			for(let i = 0; i < obj.length; i++){
				if(obj[i].title.length < 30){
					freeList.innerHTML += 
						"<li class='items'>" + obj[i].title + "<span>"
						+ obj[i].regdate + "</span></li>";
				}else{
					let title = obj[i].title.substring(0, 30);
					freeList.innerHTML += 
						"<li class='items'>" + title + "..." + "<span>"
						+ obj[i].regdate + "</span></li>";
				}
				if(i == 8){
					break;
				}
			}
		}
		xhttp.open("GET", "getFreeboardList.do", true);
		xhttp.send();
	}
</script>

