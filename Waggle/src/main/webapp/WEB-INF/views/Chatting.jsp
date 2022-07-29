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
}

#scroll::-webkit-scrollbar{
  display:none;
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
	   <div id="scroll" style="margin:1px; position: absolute; left: 500px; width: 800px; height: 700px; border: 1px solid; overflow: auto;">
	   
			
		
	 </div>
	 <div style="position: absolute; top: 900px; left: 500px;">
	 <form onsubmit="return false">
	 <input type="text" id="chat_Content" style="width: 740px; height: 50px;" placeholder="메세지를 입력해 주세요"> &nbsp;<input id="send" type="button" style="width:50px; height: 60px;" value="send">
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
		    	 $("#scroll").append('<div style="width: 100%; text-align: right;">'
		    	 +'<P style="display: inline-block;">'+data[i].chat_Date+'&nbsp;</p>'
		    	 +'<P style="display: inline-block;">'+data[i].chat_Chk+'&nbsp;</p>'
		    	 +'<p style=" display:inline-block;  border: 1px solid; border-radius: 8px; max-width: 600px;">&nbsp;'+data[i].chat_Content+'&nbsp;</p>'
		    	 +'&nbsp;&nbsp;&nbsp;'+data[i].chat_UCode+' &nbsp;</div>');
		    	 } else {
		    	 $("#scroll").append('<div style="width: 100%; text-align: left;">'
		    	 +'&nbsp; '+data[i].chat_UCode+'&nbsp;&nbsp;&nbsp;<p style=" display:inline-block;  border: 1px solid; border-radius: 8px; max-width: 600px;">&nbsp;'+data[i].chat_Content+'&nbsp;</p>'
		    	 +'<P style="display: inline-block;">&nbsp;'+data[i].chat_Chk+'</p>'
		    	 +'<P style="display: inline-block;">&nbsp;'+data[i].chat_Date+'</p>'
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
	  let con = $("#chat_Content").val();
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