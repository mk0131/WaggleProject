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
height: 700px;
border: 1px solid;
overflow: auto;
}

#input{
 position: absolute;
 top: 900px;
 left: 450px;
}
#area{
 display: flex;
}

#chat_Content{
 width: 740px;
 height: 50px;
 display: inline-block;
}

#send{
width: 50px;
height: 58px;
display: inline-block;
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
	   <div id="scroll" >
	 </div>
	 <div id="input" >
	 <form onsubmit="return false">
	 <div  id="area">
	 <textarea  id="chat_Content" placeholder="메세지를 입력해 주세요"></textarea> &nbsp;<input id="send" type="button" value="send">
	 </div>
	 </form>
	 </div>
	 </div>



<%@ include file="./footer.jsp" %>
<script type="text/javascript">

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
			
		     $.each(data, function(i){
		    	
		    	 var time = new Date(data[i].chat_Date).getHours();
		    	
		    	 // 오전,오후,시간,분 나오게 설정
		    	 if(time <=12 && time >=0 ){
		    		 data[i].chat_Date = "오전 " + new Date(data[i].chat_Date).getHours() + " : " + new Date(data[i].chat_Date).getMinutes();
		    	 } else {
		    		 data[i].chat_Date = "오후 " + new Date(data[i].chat_Date).getHours() + " : " + new Date(data[i].chat_Date).getMinutes();
		    	 }
		    	 
		    	 if(data[i].chat_Chk == false){
		    		 
		    		 data[i].chat_Chk = "";
		    	 } else {
		    		 data[i].chat_Chk = "읽음";
		    	 }
		    	 
		    	
		    	 
		    	 // 내가 작성하면 오른쪽 상대방이 작성하면 왼쪽
		    	 if(data[i].chat_UCode == code){
		    	 $("#scroll").append('<div id = "my_chat" >'
		    	 +'<div id="my_1"><div id="my_2" >'+data[i].chat_Chk+'&nbsp;&nbsp;</div>'
		    	 +'<div id="my_3" >'+data[i].chat_Date+'&nbsp;&nbsp;</div></div>'
		    	 +'<div id="my_4" >&nbsp;'+data[i].chat_Content+'&nbsp;</div>'
		    	 +'&nbsp;&nbsp;&nbsp;'+data[i].chat_UCode+' &nbsp;</div>');
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
	  let con = $("#chat_Content").val().replaceAll(/(\n|\r\n)/g, "<br>&nbsp;");
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
		 var scval = $("#scroll").scrollTop(); // 현재 스크롤바 위치
		 var domhg = $("#scroll").innerHeight(); // 화면의 길이
		 var end = $("#scroll").prop('scrollHeight'); // 스크롤바 끝
		 
		 if(scval + domhg +300 >= end){
			 down();
		 } 
		 
	    ChatHistory();
	     }, 1000);

	 });
 

</script>
</body>
</html>