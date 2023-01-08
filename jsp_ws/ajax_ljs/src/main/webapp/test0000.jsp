<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

* {
   margin: 0;
   padding: 0;
}

#form input {
   background-color: beige;
   border-radius: 50px;
}

#form button {
   font-size: 20px;
   width: 165px;
}

#form {
   width: 200px;
   margin: 0 auto;
}

h1 {
   font-size: 100px;
   text-align: center;
}

#list {
   margin: 0 auto;
}

#list #table {
   position: relative;
   left: 42%;
   background-color: #e6e6fa;
   border-radius: 20px;
}

#list #table tr {
   font-weight: bold;
   font-style: solid black;
}

#list #table tr td {
   border-radius: 50px;
}

#btn_dele {
   
}

#update {
   display: block;
}
.modalbg{
   display:none;
   width:100%;
   height:100%;
   background-color:#D3D3D3;
   position:absolute;
   top:0;
   left:0;
   opacity:50%;
   
}

.window { 
    display:none;
   border: black;
   width: 500px;
   height: 250px;
   position: absolute;
   background-color: gray;
   border-radius: 20px;
   
}

.close_btn {
   width: 80px;
   height: 80px;
   font-size: 50px;
   background-color: orange;
   text-align: center;
   border-radius: 20px;
   display: inline-block;
   position: absolute;
   top: 24px;
   right: 5px;
   cusor: pointer;
}
</style>

</head>
<body>
	

   <select id="search">
      <option value="id">아이디로검색</option>
      <option value="name">이름으로검색</option>
      <option value="tel ">전화번호로검색</option>
   </select>
   <input type="text" id="keyword" name="keyword">


   <h1>회원등록</h1>
   <div id="form">
      <input type="text" name="id" size="20" placeholder="아이디를 입력하세요"><br>
      <input type="text" name="pw" size="20" placeholder="패스워드를 입력하세요"><br>
      <input type="text" name="name" size="20" placeholder="이름을 입력하세요"><br>
      <input type="text" name="tel" size="20" placeholder="전화번호를 입력하세요"><br>
      <button id="btn_reg" onclick="loadDoc()">등록</button>
   </div>
   <hr>
   <!-- 목록 -->
   <div id="list">
      <h1>회원목록</h1>
      <table border="1" id="table">
         <thead>
            <tr>
               <th>id</th>
               <th>pw</th>
               <th>name</th>
               <th>tel</th>
               <th>삭제버튼</th>
            </tr>
         </thead>
         <tbody id="tbody">
            <!-- <tr>
            	<td>1</td>
            	<td>1</td>
            	<td>1</td>
            	<td>1</td>
            	<td><button>삭제</button></td>
            </tr>
            <tr>
            	<td>2</td>
            	<td>2</td>
            	<td>2</td>
            	<td>2</td>
            	<td><button>삭제</button></td>
            </tr>
            <tr>
            	<td>3</td>
            	<td>3</td>
            	<td>3</td>
            	<td>3</td>
            	<td><button>삭제</button></td>
            </tr>
            <tr>
            	<td>4</td>
            	<td>4</td>
            	<td>4</td>
            	<td>4</td>
            	<td><button>삭제</button></td>
            </tr> -->
         </tbody>
      </table>
   </div>
   <hr>
   <div class="modalbg">
   </div>
   <div class="window">
      <div class="close_btn" onclick="goaway()">X</div>
      <input type="text" id= "update_id" name ="id"value="" readonly><br> 
      <input type="text" id= "update_pw" name ="pw" value="" placeholder="수정하실 비밀번호를 입력하세요"><br>
      <input type="text" id= "update_name" name ="name" value="" placeholder="수정하실 이름을 입력하세요"><br>
      <input type="text" id= "update_tel" name ="tel" value="" placeholder="수정하실 전화번호를 입력하세요"><br>
      <!-- <input type="button" id="updt_btn" value="수정"> -->
      <button onclick="go()">수정</button>
   </div>
   <script>
      getList();
      /* 회원등록 */
      const tbody = document.querySelector("#tbody");
      function loadDoc() {
         const xhttp = new XMLHttpRequest();
         xhttp.onload = function() {
         }
         xhttp.open("POST", "reg.do");
         xhttp.setRequestHeader("Content-type",
               "application/x-www-form-urlencoded");
         let pid = document.querySelector("input[name='id']").value;
         let ppw = document.querySelector("input[name='pw']").value;
         let pname = document.querySelector("input[name='name']").value;
         let ptel = document.querySelector("input[name='tel']").value;
         let data = "id=" + pid + "&pw=" + ppw + "&name=" + pname + "&tel="
               + ptel;

         xhttp.send(data);
         alert("등록완료");
         tbody.replaceChildren();
         getList();

      }
	
      /* 전체 목록 */
      function getList() {
         const tbody = document.querySelector("tbody");
         tbody.replaceChildren();

         const xhr = new XMLHttpRequest();
         xhr.onload = function() {

            let data = this.responseText;
            let list = JSON.parse(data);

            for (let i = 0; i < list.length; i++) {
               tbody.innerHTML += "<tr id=tr><td>" + list[i].id
                     + "</td><td>" + list[i].pw + "</td><td>"
                     + list[i].name + "</td><td>" + list[i].tel
                     + "</td><td>" + "<button>삭제</button></td></tr>";
            }
         }

         const url = "getList.do";
         xhr.open("get", url, true);
         xhr.send();

      }
      /* 키워드 검색 */
      const keyword = document.querySelector("#keyword");
      keyword.addEventListener("keyup", searchList);
      function searchList(e) {
         const tbody = document.querySelector("tbody");
         tbody.replaceChildren();
         const xhr = new XMLHttpRequest();
         var keyword = document.querySelector("#keyword").value;
         var search = document.querySelector("#search");
         var search = search.options[search.selectedIndex].value;
         if (keyword == null) {
            tbody.replaceChildren();
            return;
         }
         xhr.onload = function() {
            let data = this.responseText;
            let list = JSON.parse(data);
            for (let i = 0; i < list.length; i++) {
               tbody.innerHTML += "<tr><td>" + list[i].id
                     + "</td><td>" + list[i].pw + "</td><td>"
                     + list[i].name + "</td><td>" + list[i].tel
                     + "</td><td>" + "<button>삭제</button></td></tr>";
            }
         }

         const url = "select.do?keyword=" + keyword + "&sel=" + search;
         xhr.open("get", url, true);
         xhr.send();

      }
      tbody.addEventListener('click', delCell);
		
      /* 회원삭제 */
      function delCell(e) {
         if (e.target.tagName != 'BUTTON') {
            return; 
         }
         const xhttp = new XMLHttpRequest();
         xhttp.onload = function() {
            getList();
         }
         let id = e.target.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.innerText;
         xhttp.open("POST", "delete.do", true);
         alert("삭제 되었습니다.");
         xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         xhttp.send("id=" + id);
      }
      
      /* 수정 */
      tbody.addEventListener('click',function(e){
    	  const id = e.target.parentElement.children[0].innerText;
          const xhttp = new XMLHttpRequest();
          
          xhttp.onload = function() {
         	/* 수정부분 */
         	let member = this.responseText;
			let obj = JSON.parse(member);
         	document.querySelector("#update_id").value = obj[0].id;
 			document.querySelector("#update_pw").value = obj[0].pw;
 			document.querySelector("#update_name").value = obj[0].name;
 			document.querySelector("#update_tel").value = obj[0].tel;
 			alert(obj[0].id);
             document.querySelector(".window").style.display= "block";
         	/*  */
         	
            
          }
          	xhttp.open("GET", "update.do?id=" + id, true);
  			xhttp.send();
      });
      
      /* 원래 코드 */
      function modal(e){
    	  const id = e.target.parentElement.children[0].innerText;
         const xhttp = new XMLHttpRequest();
         xhttp.onload = function() {
        	/* 수정부분 */
        	document.querySelector("#update_id").value = obj[0].id;
			document.querySelector("#update_pw").value = obj[0].pw;
			document.querySelector("#update_name").value = obj[0].name;
			document.querySelector("#update_tel").value = obj[0].tel;
        	/*  */
            document.querySelector(".window").style.display='block';
            document.querySelector(".modalbg").style.display='block';
         }
            
      }
      
      function goaway(){
            document.querySelector(".close_btn").parentElement.style.display='none'; //스타일중에 디스플레이를 블록으로 바꿔라
            document.querySelector(".modalbg").style.display='none';
         }
      
      //삭제버튼 위 부모의 이전 엘리먼트시블링 tr 을 누르면 수정창이 떠서 그 수정창
   </script>
</body>
</html>