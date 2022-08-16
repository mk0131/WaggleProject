<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 챗봇</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">

html, body {
	margin: 0;
}

body {
	font-family: 'Noto Sans KR', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

#template {
	display: flex;
    justify-content: center;
}

#persistent-menu {
	margin-top: 10px;
	width:200px;
	height:50px;
	font-size:12pt;
	border: none;
	border-top: 1px solid #dbdada;
	border-bottom: 1px solid #dbdada;
}


#chatform {
	display: flex;
    justify-content: center;
    margin: 10px;
    padding: 5px;
}



button {
	background-color: #ffffff;
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
}


#chatBox {
    height: 360px;
    padding-bottom: 50px;
    overflow-y: auto;
/*    display: flex;
    flex-direction: column-reverse; */
}

#msg {
	border: none;
	background-color: #f2f2f3;
	font-size:13pt;
	margin-top: 4px;
}

input:focus{
	outline:none;
}

#communicate{
	font-size:15pt
}

.logo{
	display:inline-block;
	width:30px;
}

.conversation{
	display:inline-block;
/* 	width:80%; */
	font-size:12pt;
	background-color:#f2f2f3;
	border-radius:25px;
	padding:20px;
	padding-top:10px;
	padding-bottom:10px;
}

.send{
/* 	width:80%; */
	font-size:14pt;
	background-color:#d2d4f6;
	border-radius:25px;
	padding:20px;
	padding-top:10px;
	padding-bottom:10px;
/* 	margin-left:70px;
	text-align:right; */
	display: inline-block;
	float: right;
	margin-bottom: 13px;
}

img {
	width:30px;
}

#chatbot-title {
	font-size:20px; 
	text-align:center;
}

#chatbot-middle-title {
	color:#898989; 
	text-align:center; 
	margin-top:7px; 
	font-size:10pt;
}

#chatform {
	 border-radius: 20px; 
	 background-color:#f2f2f3; 
	 position:fixed; 
	 bottom: 0px; 
	 margin-left:7px; 
	 margin: 10px; 
	 width:94%;
}

.form-group {
	margin: 10px; 
}

/* #msg {
	 width:100%;
} */

#send {
	border:none;
	background-color:#d2d4f6; 
	border-radius:20px; 
	font-size:12pt; 
	font-weight:bold;
	color:#4f5bff;
}

#probee-chatbot {
	padding-bottom: 57px;
}

</style>
</head>
<body>
	<div class="chatbot-header" style="padding:13px">
		<div class="img01" style="text-align:center">
		<img src="/images/mainhome/chat-logo.png" style="width:50px"/>
		</div>
		<div id="chatbot-title">Waggle에게 문의하기</div>
		<div id="chatbot-middle-title">보러가야하는 집이 있지만 시간이 없을 때! Waggle을 이용하세요!</div>
	</div>
	<div id="probee-chatbot">
		<div id="template">
			<button id="persistent-menu" onclick="menu1()" style="border-right:1px solid #dbdada">이용 안내</button>
			<button id="persistent-menu" onclick="menu2()" style="border-right:1px solid #dbdada">결제 문의</button>
			<button id="persistent-menu" onclick="menu3()">환불 문의</button>
		</div>

		<div id="chatBox" style="padding:10px">
			
		</div>
		
		<form id="chatform">
			<div class="form-group" style="margin: 10px; width:80%">
				<input type="text" id="msg" class="form-control" placeholder="문의 메세지를 입력해주세요.">
			</div>
			<button type="submit" id="send">전송</button>
		</form>
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
		stompClient.subscribe('/topic/public', function(message) {
			showReceiveMessage(message.body); //서버에 메시지 전달 후 리턴받는 메시지
		});
		sendMessage2();
	}

	function onMessageReceived(payload) {
		console.log(payload);
	}

	function sendMessage() {
		let message = $("#msg").val()
		showSendMessage(message);
		$("#msg").val("")

		stompClient.send("/app/sendMessage", {}, JSON.stringify(message));
	}

	function sendMessage2() {
		let message = $("#msg").val()

		stompClient.send("/app/sendMessage", {}, JSON.stringify(message));
	}

	//보낸메시지 보여주는 함수
	function showSendMessage(message) {
		$("#chatBox").append("<div class='send'><div>" + message + "</div></div><br/>");
		
	}
	
	//받은메시지 보여주는 함수
	function showReceiveMessage(message){
		$("#chatBox").append("<div class='logo'><img src='/images/mainhome/chat-logo.png'/></div>"
							+ "<div class='conversation'><div>" + message + "</div></div><br/><br/>");
		$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight)
	}
	
	
	connect();

	$(function() {
		$("form").on('submit', function(e) {
			e.preventDefault();
		});
		$("#send").click(function() {
			sendMessage();
		});
	});

	function menu1() {
		showReceiveMessage("waggle은 이사를 위한 집에 대한 이전 리뷰 기록을 조회할 수 있는 정보 열람 기능과 직접 탐색할 추가 정보를 요청할 수 있는 정보요청 서비스를 제공하는 플랫폼이에요! 회원가입 후, 보고싶은 집의 정보와 함께 요청글을 작성하시거나 꿀벌이 되어 집을 탐색해주세요.");
	}

	function menu2() {
		showReceiveMessage("결제는 [마이페이지 > 포인트 충전하기] 에서 가능합니다. 만약 결제 중 문제가 발생한다면 [고객센터 > 결제 관련 문의] 에 글을 작성해주시기 바랍니다.");
	}

	function menu3() {
		showReceiveMessage("서로 합의된 내용을 기반하여 제공된 결과물에 대해서는 고객의 단순 변심으로 환불은 불가능합니다. 만약 대행인이 기존에 합의된 서비스 요청 내용을 이행하지 않았을 경우 [고객센터 > 환불 문의] 를 통해 고객센터에 작성해주시기 바랍니다.");
	}
</script>
</html>