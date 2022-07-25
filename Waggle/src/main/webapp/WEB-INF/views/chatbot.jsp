<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">

html, body {
	margin: 0;
	padding: 20px;
}

body {
	font-family: 'Noto Sans KR', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

#template {
	display: flex;
    justify-content: center;
}

#persistent-menu {
	margin: 10px;
}


#chatform {
	display: flex;
    justify-content: center;
    margin: 10px;
    padding: 10px;
}



button {
	background-color: #ffffff;
	border-radius: 8px;
	border: 1px solid;
	box-sizing: border-box;
	color: #151515;
	font-size: 13px;
	font-weight: 500;
	font-family: inherit;
	letter-spacing: .25px;
	line-height: normal;
	padding: 11px 11px;
}

button:hover {
	background: #151515;
	color: #ffffff;
}

button:active {
	box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
	outline: none;
	border: 1px solid #ffffff;
}


#chatBox {
    height: 100%;
    padding-bottom: 50px;
}

#msg {
	border: none;
	border-bottom: 1px solid;
	height: 20px;
	width: 260px;
}

</style>
</head>
<body>

  <div id="probee-chatbot">
    <form id="chatform">
	<div class="form-group" style="margin: 10px;">
         <label for="msg">문의사항</label>
         <input type="text" id="msg" class="form-control" placeholder="문의 내용을 입력하세요.">
     </div>
     <button type="submit" id="send">보내기</button>
     </form>
     
	<div id="chatBox">
        <table id="conversation" class="table table-striped">
            <thead>
            <tr>
                <th>메세지</th>
            </tr>
            </thead>
            <tbody id="communicate">
            </tbody>
        </table>
   </div>
     <div id="template">
    		<button id="persistent-menu" onclick="menu1()">이용 안내</button>
    		<button id="persistent-menu" onclick="menu2()">결제 문의</button>
    		<button id="persistent-menu" onclick="menu3()">환불 문의</button>
     </div>
   </div>
    
</body>
<script>
	
	
	var stompClient = null;

	function connect() {

	    var socket = new SockJS('/ws');
	    stompClient = Stomp.over(socket);
			stompClient.connect({}, onConnected, function(frame) {
		        console.log('Connected: ' + frame);
		});

	}			
			
	function onConnected() {
	    stompClient.subscribe('/topic/public', function (message) {
            showMessage("Probee: " + message.body); //서버에 메시지 전달 후 리턴받는 메시지
		});
	    sendMessage2();
	}

 	function onMessageReceived(payload) {
	    console.log(payload);
	} 


	function sendMessage() {
		let message = $("#msg").val()
	    showMessage("보낸 메시지: " + message);
		
	    stompClient.send("/app/sendMessage", {}, JSON.stringify(message));
	}
	
	function sendMessage2() {
		let message = $("#msg").val()
		
	    stompClient.send("/app/sendMessage", {}, JSON.stringify(message));
	}
	
	function showMessage(message) {
	    $("#communicate").append("<br/><tr><td>" + message + "</td></tr><br/>");
	}

	connect();
	
	$(function () {
	    $("form").on('submit', function (e) {
	        e.preventDefault();
	    });
	    $( "#send" ).click(function() { sendMessage(); });
	});
	
	function menu1() {
		showMessage("Probee: " + "waggle은 이사를 위한 집에 대한 이전 리뷰 기록을 조회할 수 있는 정보 열람 기능과 직접 탐색할 추가 정보를 요청할 수 있는 정보요청 서비스를 제공하는 플랫폼이에요! 회원가입 후, 보고싶은 집의 정보와 함께 요청글을 작성하시거나 꿀벌이 되어 집을 탐색해주세요.");
	}
	
	function menu2() {
		showMessage("Probee: " + "결제는 [마이페이지 > 포인트 충전하기] 에서 가능합니다. 만약 결제 중 문제가 발생한다면 [고객센터 > 결제 관련 문의] 에 글을 작성해주시기 바랍니다.");
	}
	
	function menu3() {
		showMessage("Probee: " + "서로 합의된 내용을 기반하여 제공된 결과물에 대해서는 고객의 단순 변심으로 환불은 불가능합니다. 만약 대행인이 기존에 합의된 서비스 요청 내용을 이행하지 않았을 경우 [고객센터 > 환불 문의] 를 통해 고객센터에 작성해주시기 바랍니다.");
	}
	
</script>
</html>