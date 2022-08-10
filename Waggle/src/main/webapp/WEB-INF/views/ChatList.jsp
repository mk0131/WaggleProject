<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <!DOCTYPE html>
      <html>

      <head>
         <meta charset="UTF-8">
         <title>Waggle 채팅</title>
         <link rel="icon" href="/images/importToJsp/favicon.png">
      </head>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <style type="text/css">
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
            font-size: 16px;
         }
         
         .fixed-list{
            height:60px;
            font-size:20pt;
            font-weight:bold;
            color:#343434;
            padding-top:15px;
            padding-left:15px;
         }
         
         #list{
             --ms-overflow-style: none;
            left: 100px;
            width: 340px;
            height: 500px;
            border: 1px solid #e6e6e6;
            overflow: auto;
            display:inline-block;
            padding-bottom:30px;
         }
         
         #list::-webkit-scrollbar {
            display: none;
         }
         
         #list_1{

            

            height: 90px;
            border-bottom: 1px solid #eceff1;
            padding-left:15px;
            padding-right:15px;
            padding-top:5px;

         }
         
         #list_1:hover{
            background-color:#f2f2f28c;
         }   
         #list_2{
            width: 65px;
            height: 65px;
            border-radius: 40%;
            border: 1px solid #f1f1f1;
            display: inline-block;
            
         }
         
         #list_3{
            width: 150px;
            font-weight:bold;
            font-size:12pt;
            color:#282828;
         }
         
         #list_4{
            width: 150px;
            font-size:12pt;
            height: 50px;
            overflow: hidden;
            text-overflow: ellipsis; 
            color:#737373;
         }
         
         #list_5{
            width: 150px;
            display:inline-block;
            position: relative;
            padding-left:15px;
            
         }
         
         #list_6{
            position: relative;
            font-size: 13px;
            color:#898989;
            
         }
         
         #list_7{
            width: 25px;
            height: 25px;
            text-align: center;
            border-radius: 50%;
            color:white;
            background-color:#ff7a6b;
            position: relative;
            margin-top: 10px;
            float:right;
            
            
            
         }
         
         #list_8{
            display: inline-block;
            float:right;
         }
         #scroll {
            --ms-overflow-style: none;
            background-color: #b2c7d9;
            width: 630px;
            height: 458px;
            border: 1px solid #e6e6e6;
            border-bottom:none;
            overflow: auto;
            padding-bottom:10px;
         }

         #scroll::-webkit-scrollbar {
            display: none;
         }

         #my_chat {
            width: 100%;
            display: flex;
            float: right;
            text-align: right;
            align-items: center;
            justify-content: flex-end;
            padding-right:5px;
            padding-bottom:10px;
         }

         #your_chat {
            width: 100%;
            text-align: left;
            float: right;
            display: flex;
            align-items: end;
            padding-bottom:10px;
         }

         #my_1 {
            display: inline-block;
            align-items: center;
         }

         #my_2 {
            width: 100px;
            font-size: 12px;
            color: #556677;
         }

         #my_3 {
            width: 100px;
            font-size: 12px;
            color: #556677;

         }

         #my_4 {
            display: inline-block;
            border-radius: 8px;
            max-width: 600px;
            font-size: 20px;
            align-self: center;
            text-align: left;
            background-color: #fef01b;
            padding:1px;
            padding-right:5px;

         }
         
         #your_code{
            margin-left: 7px;
            margin-bottom: 3px;
         }
         #your_1 {
            display: inline-block;
            border-radius: 8px;
            max-width: 600px;
            font-size: 20px;
            align-self: center;
            background-color: #ffffff;
            padding:1px;
            padding-right:7px;

         }
         

         #your_2 {
            display: inline-block;
            align-items: center;
         }

         #your_3 {
            width: 100px;
            font-size: 12px;
            color: #556677;

         }

         #area {
            display: flex;
            border: 1px solid #e6e6e6;
            border-top:none;
            height:70px;
         }

         #chat_Content {
            width: 470px;
            height: 20px;
            display: inline-block;
         }

         #send {
            width: 85px;
            height: 50px;
            display: inline-block;
            float:right;
            margin:5px;
            margin-top:10px;
            border:1px solid #f5f6f6;
         }

         /* From uiverse.io by @alexruix */
         .input-group {
            position: relative;
            border-radius: 10px;
            width:610px;
            margin:0 auto;
            margin-left: 10px;
         }

         .input {
         --ms-overflow-style: none;
            border: solid 2px #f5f6f6;
            border-radius: 1rem;
            background: none;
            padding: 1rem;
            font-size: 1rem;
            margin-top:7px;
            transition: border 150ms cubic-bezier(0.4, 0, 0.2, 1);
         }
         
          .input::-webkit-scrollbar {
            display: none;
         }
         
        
         
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
            background-color: #ffeb33;
            border-radius:5px;
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

         #btn_img {
            width: 40px;
            height: 40px;
            padding-top:3px;
         }

         #date {
            text-align: center;
            border: 1px solid #a9bdce;
            border-radius:10px;
            width:145px;
            margin:0 auto;
            background-color:#a9bdce;
            color:#69717f;
            margin-top:28px;
            display:flex;
            padding-left:25px;
         }

         #updown {
            display:inline-block;
         }

         #up {
            border: 1px solid #898989;
            border-bottom: none;
         }

         #down {
            border: 1px solid #898989;
         }

         #your_img {
            width: 50px;
            height: 50px;
            border-radius: 40%;
         }
         
         .content{
            margin: 0 auto;
            width: 1250px;
            padding-left:120px;
         }
         
         .chat-content{
            display:none;
            width:660px;
         }
         
         .chat-content-left{
            display:inline-block;
         }
         
         .chat-content-right{
            display:inline-block;
            float:right;
            margin-top:445px;
         }
         
         #chat_header {
          
         	width: 100%;
          	height: 100px;
         }
         
         #chat_img {
          position: absolute;
          width: 67;
          height: 67;
          border-radius: 8px;
         }         
         
         .closeChat{
         	margin-left:auto;
         	font-size:13pt;
         	font-weight:bold;
         	color:#4f5860;
         }
         
         .closeChat:hover{
         	color: #79838b;
         	cursor:pointer;
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
                           <p>HOME > 채팅방 목록</p>
                        </li>
                     </ul>
                  </div>
               </div>
               <div class="content">
                  <div id="list">
                     <div class="fixed-list">
                        <div>Waggle 채팅 목록</div>
                     </div>
                  </div>
                  <div class="chat-content">
                     <div class="chat-content-left">
                        <div id="scroll">
                        </div>
                        <div id="input">
                           <form onsubmit="return false">
                              <div id="area">
                                 <div class="input-group">
                                    <textarea  class="input" id="chat_Content" autocomplete="off" placeholder="건전한 채팅 문화를 만들어 갑시다."></textarea>
                                    <button class="btn" id="send" disabled="disabled"> <img id="btn_img" alt="send"
                                       src="https://cdn-icons-png.flaticon.com/512/149/149444.png"></button>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                     <div class="chat-content-right">
                        <div id="updown">
                           <div id="up">△</div>
                           <div id="down">▽</div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <%@ include file="./footer.jsp" %>
               <script type="text/javascript">
               var date2 = null;
               var size = 0; // 현재 채팅 개수
               var scroll = 0; // 전체 채팅 개수
               var length = 0; // 불러올 채팅 숫자
               var num = 0;
               
               // 채팅방 불러오기
                  function chatList() {  
                     let code = ${ user_Code };
                     let data = { room_UCode1: code };
                     $.ajax({
                        type: "post",
                        url: "/chat/show",
                        data: data,
                        success: function (data) {
                        
                           
                           $("#list").empty();
                           if(data.length == 0){
                      		 $("#list").append('<div class="fixed-list"><div>채팅목록 이 없습니다.</div></div>');
                      	} else {
                      		 $("#list").append('<div class="fixed-list"><div>Waggle 채팅 목록</div></div>');
                      	}
                          
                           for(let i = 0; i <data.length; i++){
                              
                              // 대화 시간이 없을 시
                              if(data[i].chat_Date == null){
                                 var time = 100;
                                 var diffTime = 0;
                                 var start = 0;
                                 var end = 0;
                                 data[i].chat_Date = ""; 
                                 
                              } else if(data[i].chat_Date != null){
                                 var now = new Date();
                                 var time = new Date(data[i].chat_Date).getHours();
                                 var start = new Date(data[i].chat_Date);
                                 var end = new Date();
                                 var diffTime = (end.getTime() - start.getTime()) / (1000*60*60*24);
                              }
                              
                              // 오전 오후 구분
                              if (time <= 12 && time >= 0) {
                                 
                                 data[i].chat_Date = "오전 " +start.getHours() + " : " + String(start.getMinutes()).padStart(2, "0");
                                 
                              } else if(time >= 12 && time <= 24) {
                                 data[i].chat_Date = "오후 " + (start.getHours() - 12) + " : " + String(start.getMinutes()).padStart(2, "0");
                              }
                              // 하루가 지나면 년-월-일 형식으로 표현
                               if(diffTime >= 1 ){
                                  
                                  data[i].chat_Date = start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate();
                                 
                               } 
                              // 대화기록이 없으면 안보인다
                              if(data[i].chat_Content == null){
                                 data[i].chat_Content = "";
                              }
                              
                              
                              var x = (i+1);
                              $("#list").append('<div class="list'+(i+1)+'" onclick="clickBackground(\''+x+'\');" id="list_1"><input type="hidden" value="'+data[i].room_No+'" id="room">'
                                    +'<img id ="list_2" src="' + data[i].fi_Nm + '" onerror=this.src="/images/importToJsp/profile_default.jpg">'
                                    +'<div id ="list_5"><div id="list_3">'+data[i].user_Nm+'</div>'
                                    +'<div id ="list_4">&nbsp;'+data[i].chat_Content+'</div></div>'
                                    +'<div id="list_8"><div id ="list_6">'+data[i].chat_Date+'</div>'
                                    +'<div id ="list_7">'+data[i].chat_Chk+'</div></div></div>');
                           }
                        }
               
                     })
                     
                  }
                  
                  // 처음 채팅방 보이기
                  chatList();
                  
                  // 채팅방 더블 클릭시 채팅내역 환경 리셋, send 버튼 활성화 1초후 마지막 대화내용으로 이동
                  $(document).on("dblclick","div[id='list_1']",function(){
                         $(".chat-content").fadeIn('fast');
                         $(".chat-content").css("display","inline-block");
                          $("#scroll").empty();
                          var user = $(this).find("div[id='list_3']").html();
                          var pro = $(this).find("img").attr("src");
                          $("#scroll").append('<div style="width: 610px; display:inline-flex; position: absolute; background-color:#a9bdce; padding:10px;">'
                          +'<img style="margin-right:10px;" id ="your_img" src="'+pro+'" onerror=this.src="/images/importToJsp/profile_default.jpg">'
                          +'<div style="font-weight:bold; color:#4f5860;">'+user+'</div><div class="closeChat" onclick="closeChat();">X</div></div><br><br>');
                          length = 0;
                          size = 0;
                          scroll = 0;
                          date2 = null;
                          $("#send").attr("disabled", false);
                          $("#chat_Content").val(null);
                         num = $(this).find("input").val();
                         ChatHistory();
                         timer = setTimeout(down,1000);
                         
                        
                     
                  });
                  

			

                  function ChatHistory() {
                     let code = ${ user_Code };
                     let data = { room_No: num, chat_UCode: code };
                     $.ajax({
                        type: "post",
                        url: "/chat/chatting",
                        data: data,
                        success: function (data) {
                           scroll = data.length;

                           for (let i = length; i < data.length; i++) { // 채팅 내용이 늘어나면 그만큼 추가

                              var time = new Date(data[i].chat_Date).getHours();
                              var date = new Date(data[i].chat_Date).getDay();
                              var normal = data[i].chat_Date;

                              // Date 가 변하면 화면중앙에 출력
                              if (date != date2) {
                                 data[i].chat_Date = new Date(data[i].chat_Date).getFullYear() + " 년 " + (new Date(data[i].chat_Date).getMonth() + 1) + " 월 " + new Date(data[i].chat_Date).getDate() + " 일";
                                 $("#scroll").append('<div id="date">' + data[i].chat_Date + '</div>');
                              }

                              // 다시 원래 형식으로 변환
                              data[i].chat_Date = normal

                              // 오전,오후,시간,분 나오게 설정 10분 미만은 0 붙여서 가져오기
                              if (time <= 12 && time >= 0) {
                                 data[i].chat_Date = "오전 " + new Date(data[i].chat_Date).getHours() + " : " + String(new Date(data[i].chat_Date).getMinutes()).padStart(2, "0");
                              } else {
                                 data[i].chat_Date = "오후 " + (new Date(data[i].chat_Date).getHours() - 12) + " : " + String(new Date(data[i].chat_Date).getMinutes()).padStart(2, "0");
                              }

                              // 읽었는지 체크
                              if (data[i].chat_Chk == false) {

                                 data[i].chat_Chk = "";
                              } else {
                                 data[i].chat_Chk = "읽음";
                              }

                              // 날짜 확인
                              date2 = date;

                              // 내가 작성하면 오른쪽 상대방이 작성하면 왼쪽
                              if (data[i].chat_UCode == code) {
                                 $("#scroll").append('<div id = "my_chat" >'
                                    + '<div id="my_1"><div id="my_2" >' + data[i].chat_Chk + '&nbsp;&nbsp;</div>'
                                    + '<div id="my_3" >' + data[i].chat_Date + '&nbsp;&nbsp;</div></div>'
                                    + '<div id="my_4" >&nbsp;' + data[i].chat_Content + '&nbsp;</div>'
                                    + '&nbsp;</div>');
                              } else {
                                 $("#scroll").append('<div id = "your_chat" >&nbsp;<img id="your_img" src="' + data[i].fi_Nm + '" onerror=this.src="/images/importToJsp/profile_default.jpg">'
                                    + '&nbsp;<div><div id = "your_code"> ' + data[i].user_Nm + '</div>&nbsp;&nbsp;<div id="your_1" >&nbsp;' + data[i].chat_Content + '&nbsp;</div></div>'
                                    + '<div id="your_2">'
                                    + '<div id="your_3" >&nbsp;' + data[i].chat_Date + '</div></div>'
                                    + '</div>');
                              }

                           };
                           length = data.length; // 채팅내역 길이 저장

                        }

                     })
                  }
                  
                  function down() {
                     $("#scroll").scrollTop($("#scroll")[0].scrollHeight);
                  }
                  
                  $("#up").on("click", function () {
                     $("#scroll").animate({ scrollTop: 0 }, 400); // 스크롤 맨위로
                  })
                  $("#down").on("click", function () {
                     $("#scroll").animate({ scrollTop: $("#scroll")[0].scrollHeight }, 400); // 스크롤 맨 아래로
                  })
                  
                  // 엔터키 입력시 전송 , shift + 엔터 입력시 줄바꿈
                  $(function() {
    					$('textarea').on('keydown', function(event) {
        						if (event.keyCode == 13)
            					if (!event.shiftKey){
               				 event.preventDefault();
               				 $('#send').click();
            				}
    				});

				});
                  
                  // 채팅 입력
                  $("#send").on("click", function () {
                     down();
                     let con = $("#chat_Content").val().replaceAll(/(\n|\r\n)/g, "<br>&nbsp;"); // 엔터키 인식
                     let code = ${ user_Code };
                     let data = { chat_Num: num, chat_Content: con, chat_UCode: code };
                     $.ajax({
                        type: "post",
                        url: "/chat/content",
                        data: data,
                        success: function (result) {
                           if (result != 'fail') {
                              $("#chat_Content").val(null);
                              $("#chat_Content").focus();
                              chatList();
                              
                           } else {

                           }
                        }
                     })
                  });
                  
                  $(function () {

                     timer = setInterval(function () {

                        var scval = $("#scroll").scrollTop(); // 현재 스크롤바 위치
                        var domhg = $("#scroll").innerHeight(); // 화면의 길이
                        var end = $("#scroll").prop('scrollHeight'); // 스크롤바 끝

                        ChatHistory();

                        if (scroll > size) { // 대화 내용이 늘어나면 

                           if (scval + domhg + 300 >= end) { // 현재 스크롤이 밑쪽에 있으면
                              down();
                           }
                           size = scroll;
                        }
                     }, 1000);

                  });

               </script>
      </body>
      <script>
      function clickBackground(num){
         var y = '.list'+num;
         for(var i=1; i<num+2; i++){
            if(i==num){
               $(y).attr("style","background-color: #f2f2f2");
            }else{
               var z = '.list'+i;
               $(z).attr("style","background-color:white");
            }
         }
      };
      
      function closeChat(){
		$(".chat-content").fadeOut();    	  
      };
      </script>

      </html>