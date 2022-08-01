<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

.middle {
   margin: 0;
   padding: 0;
}

.guideline {
   margin: 0 auto;
   width: 1125px;
}

.guideline-all i {
	display: inline-block;
	color: #151515;
}

.guideline-all li {
	display: inline-block;
}

.guideline-all p {
	display: inline-block;
	font-size: 14px;
}
#scroll{
	--ms-overflow-style: none;
	background-color: #9bbbd4;
}

#scroll::-webkit-scrollbar{
  display:none;
}

#my_chat{
 width: 100%;
 display: flex;
 float: right;
 text-align: right;
 align-items: center;
 justify-content: flex-end;
 padding: 2px;
}

#your_chat{
 width: 100%;
 text-align: left;
 float: right;
 display: flex;
 align-items: center;
 padding: 2px;
}

#my_1{
display: inline-block;
align-items: center;
}

#my_2{
 width: 100px;
 font-size: 12px;
 color: #556677;
}
#my_3{
 width: 100px;
 font-size: 12px;
 color: #556677;
 
}

#my_4{
 display: inline-block;
 border-radius: 8px;
 max-width: 600px;
 font-size: 20px;
 align-self: center;
 text-align: left;
 background-color: #fef01b;

}

#your_1{
 display: inline-block;
 border-radius: 8px;
 max-width: 600px;
 font-size: 20px;
 align-self: center;
 background-color: #ffffff;
 
}

#your_2{
 display: inline-block;
 align-items: center;
}

#your_3{
 width: 100px;
 font-size: 12px;
 color: #556677;
 
}

#scroll{
position: absolute;
left: 450px;
width: 800px;
height: 600px;
border: 1px solid;
overflow: auto;
}

#input{
 position: absolute;
 top: 800px;
 left: 450px;
}
#area{
 display: flex;
}

#chat_Content{
 width: 650px;
 height: 50px;
 display: inline-block;
}

#send{
width: 100px;
height: 80px;
display: inline-block;
}
/* From uiverse.io by @alexruix */
.input-group {
 position: relative;
}

.input {
 border: solid 1.5px #9e9e9e;
 border-radius: 1rem;
 background: none;
 padding: 1rem;
 font-size: 1rem;

 transition: border 150ms cubic-bezier(0.4,0,0.2,1);
}

.user-label {
 position: absolute;
 left: 15px;
 pointer-events: none;
 transform: translateY(1rem);
 transition: 150ms cubic-bezier(0.4,0,0.2,1);
}

.input:focus, input:valid {
 outline: none;
 border: 1.5px solid #1a73e8;
}

.input:focus ~ label, input:valid ~ label {
 transform: translateY(-50%) scale(0.8);
 background-color: #212121;
 padding: 0 .2em;
 color: #2196f3;
}
/* From uiverse.io */
.btn {
 position: relative;
 font-size: 17px;
 text-transform: uppercase;
 text-decoration: none;
 transition: all .2s;
 border: none;
 font-family: inherit;
 font-weight: 500;
 color: black;
 background-color: yellow;
}

.btn:hover {
 transform: translateY(-3px);
 box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.btn:active {
 transform: translateY(-1px);
 box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.btn::after {
 content: "";
 display: inline-block;
 height: 100%;
 width: 100%;
 border-radius: 100px;
 position: absolute;
 top: 0;
 left: 0;
 z-index: -1;
 transition: all .4s;
}

.btn::after {
 background-color: #fff;
}

.btn:hover::after {
 transform: scaleX(1.4) scaleY(1.6);
 opacity: 0;
}

#btn_img{
 width: 50px;
 height: 50px;
}

#date{
text-align: center;
}

</style>
<body>
<%@ include file="./header.jsp" %>

<div id="wrap">
	  <div class="middle">
		<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 채팅방</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	  <!-- 다른사람 채팅 못보게 하기 -->
	  <c:if test="${user_Code == param.chat_UCode }"> 
	   <div id="scroll" >
	 </div>
	 <div id="input" >
	 <form onsubmit="return false">
	 <div  id="area">
	 <div class="input-group">
     <textarea class="input" id="chat_Content"  autocomplete="off" ></textarea>
     <label class="user-label">Type here</label>
     </div> &nbsp;<button class="btn" id="send"> <img id="btn_img" alt="send" src="https://cdn-icons-png.flaticon.com/512/149/149444.png"></button>
	 </div>
	 </form>
	 </div>
	 </c:if>
	 </div>



<%@ include file="./footer.jsp" %>
<script type="text/javascript">
 var date2 = null;
 var size = 0;
 // 채팅내역 불러오기
 function ChatHistory(){
		let num = ${param.room_No};
		let code = ${user_Code};
		let data = {room_No : num, chat_UCode : code};
	$.ajax({
		type : "post",
		url : "/chat/chatting",
		data : data,
		success : function(data){
			$("#scroll").empty();
			 console.log(size);
			 console.log(data.length);
			 if(data.length > size){
				 down();
			 }
			 size = data.length;
		     $.each(data, function(i){
		    	
		    	 var time = new Date(data[i].chat_Date).getHours();
		    	 var date = new Date(data[i].chat_Date).getDay();
		    	 var normal = data[i].chat_Date;
		    	 
		    	 // Date 가 변하면 화면중앙에 출력
		    	 if(date != date2){
		    		 data[i].chat_Date = new Date(data[i].chat_Date).getFullYear() + " 년 " + (new Date(data[i].chat_Date).getMonth()+1) + " 월 " + new Date(data[i].chat_Date).getDate() + " 일";
		    		 $("#scroll").append('<div id="date">'+data[i].chat_Date+'</div>');
		    	 }
		    	 
		    	 // 다시 원래 형식으로 변환
		    	 data[i].chat_Date = normal
		    	 
		    	 // 오전,오후,시간,분 나오게 설정 10분 미만은 0 붙여서 가져오기
		    	 if(time <=12 && time >=0 ){
		    		 data[i].chat_Date = "오전 " + new Date(data[i].chat_Date).getHours() + " : " + String(new Date(data[i].chat_Date).getMinutes()).padStart(2,"0");
		    	 } else {
		    		 data[i].chat_Date = "오후 " + (new Date(data[i].chat_Date).getHours() -12) + " : " + String(new Date(data[i].chat_Date).getMinutes()).padStart(2,"0");
		    	 }
		    	 
		    	 // 읽었는지 체크
		    	 if(data[i].chat_Chk == false){
		    		 
		    		 data[i].chat_Chk = "";
		    	 } else {
		    		 data[i].chat_Chk = "읽음";
		    	 }
		    	 
		    	 // 날짜 확인
		    	 date2 = date;
		    	 
		    	 // 내가 작성하면 오른쪽 상대방이 작성하면 왼쪽
		    	 if(data[i].chat_UCode == code){
		    	 $("#scroll").append('<div id = "my_chat" >'
		    	 +'<div id="my_1"><div id="my_2" >'+data[i].chat_Chk+'&nbsp;&nbsp;</div>'
		    	 +'<div id="my_3" >'+data[i].chat_Date+'&nbsp;&nbsp;</div></div>'
		    	 +'<div id="my_4" >&nbsp;'+data[i].chat_Content+'&nbsp;</div>'
		    	 +'&nbsp;</div>');
		    	 } else {
		    	 $("#scroll").append('<div id = "your_chat" >'
		    	 +'&nbsp; '+data[i].chat_UCode+'&nbsp;&nbsp;&nbsp;<div id="your_1" >&nbsp;'+data[i].chat_Content+'&nbsp;</div>'
		    	 +'<div id="your_2">'
		    	 +'<div id="your_3" >&nbsp;'+data[i].chat_Date+'</div></div>'
		    	 +'</div>');
		    	 }
		    	 
		     });
		     
			 
		 
		} 
			
	})
}
// 시작시 불러오기
 ChatHistory();
//스크롤 맨밑으로
window.onload = function (){
	down();
};
function down(){
	$("#scroll").scrollTop($("#scroll")[0].scrollHeight); 
}
	  
 // 채팅 입력하기
 $("#send").on("click",function(){
	  down();
	  let con = $("#chat_Content").val().replaceAll(/(\n|\r\n)/g, "<br>&nbsp;"); // 엔터키 인식
	  let num = ${param.room_No};
	  let code = ${user_Code};
	  let data = {chat_Num : num , chat_Content : con, chat_UCode : code };
	 $.ajax({
			type : "post",
			url : "/chat/content",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$("#chat_Content").val(null);
				} else {
					
				}
			}
		})
 });
  // 스크롤바 위치 구하기 & 채팅내역 1초마다 불러오기
 $(function() {

	 timer = setInterval( function () {
		 
	    //ChatHistory();
	     }, 1000);

	 });
 

</script>
</body>
</html>