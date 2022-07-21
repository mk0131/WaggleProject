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
<style type="text/css">

.pop-up-wrapper {
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.pop-up-inner {
	width: calc(100%-48px);
	background-color: white;
	border-radius: 6px;
 	padding: 24px;
	box-sizing: border-box; 
}

.bottom-info .title {
	font-size: 14px;
}

.bottom-info .description {
	margin-top: 45px;
	line-height: 19px;
	font-size: 12px;
}

.bottom-info button {
	padding: 5px 10px;
	position: absolute;
	right: 0px;
	bottom: 0px;
}

.bottom-info {
	height: 212px;
	position: relative;
}

.overlay {
	width: 100vw;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.7);
}
</style>
</head>
<body>

<!--     <div class="pop-up-wrapper">
    	<div class="pop-up-inner">
    		<div class="thumb"></div>
    		<div class="bottom-info">
    			<div class="title">챗봇에게 질문하기</div>
    			<div class="description">
    				Lorem Ipsum is simply dummy text of the
    				printing and typesetting
    				industry. It has been the industry's
    				standard.
    			</div>
    			<a href="/inquiry/list"><button>Close</button></a>
    		</div>
    	</div>
    </div> -->
    
    <div class="form-group">
        <label for="connect">챗봇 : </label>
        <button id="connect" class="btn btn-default" type="submit">연결</button>
        <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">해제
        </button>
    </div>
	<div class="form-group">
	  <form>
		 <div>
         <label for="msg">문의사항</label>
         <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요....">
         </div>
     	<button id="send" class="btn btn-default" type="submit">보내기</button>
      </form>
     </div>
	<div class="col">
        <table id="conversation" class="table table-striped">
            <thead>
            <tr>
                <th>메세지</th>
            </tr>
            </thead>
            <tbody id="communicate">
             <tr>
             	<th id="welcome"></th>
             </tr>
            </tbody>
        </table>
    </div>

</body>
<script>
	var stompClient = null;

	function connect() {

		var socket = new SockJS('/ws');
		stompClient = Stomp.over(socket);
		stompClient.connect({}, onConnected, function(frame) {
			setConnected(true);
			console.log('Connected: ' + frame);
		});

	}

	function onConnected() {
		stompClient.subscribe('/topic/public', function(message) {
			showMessage("받은 메시지: " + message.body); //서버에 메시지 전달 후 리턴받는 메시지
		});
		sendMessage("");
	}

	function onMessageReceived(payload) {
		console.log(payload);
	}

	function sendMessage() {
		let message = $("#msg").val()
		showMessage("보낸 메시지: " + message);

		stompClient.send("/app/sendMessage", {}, JSON.stringify(message));
	}

	function showMessage(message) {
		$("#communicate").append("<tr><td>" + message + "</td></tr>");
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
</script>
</html>