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
</head>
<body>
	<div class="form-group">
        <label for="connect">챗봇 : </label>
        <button id="connect" class="btn btn-default" type="submit">연결</button>
        <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">해제
        </button>
    </div>
	<div class="form-group">
         <label for="msg">문의사항</label>
         <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요....">
     </div>
     <button id="send" class="btn btn-default" disabled type="submit">보내기</button>
	<div class="col">
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
	
</body>
<script>


	var stompClient = null;

	function setConnected(connected) {
		$("#connect").prop("disabled", connected);
		$("#disconnect").prop("disabled", !connected);
		$("#send").prop("disabled", !connected);
		if (connected) {
			$("#conversation").show();
		} else {
			$("#conversation").hide();
		}
		$("#msg").html("");
	}

	function connect() {
		var socket = new SockJS('/ws');
		stompClient = Stomp.over(socket);
		stompClient.connect({}, function(frame) {
			setConnected(true);
			console.log('Connected: ' + frame);
			stompClient.subscribe('/topic/public', function(message) {
				showMessage("받은 메시지: " + message.body); //서버에 메시지 전달 후 리턴받는 메시지
			});
		});
	}

	function disconnect() {
		if (stompClient !== null) {
			stompClient.disconnect();
		}
		setConnected(false);
		console.log("Disconnected");
	}

	function sendMessage() {
		let message = $("#msg").val()
		showMessage("보낸 메시지: " + message);

		stompClient.send("/app/sendMessage", {}, JSON.stringify(message));  //서버에 보낼 메시지
	}

	function showMessage(message) {
		$("#communicate").append("<tr><td>" + message + "</td></tr>");
	}

	$(function() {
		$("form").on('submit', function(e) {
			e.preventDefault();
		});
		$("#connect").click(function() {
			connect();
		});
		$("#disconnect").click(function() {
			disconnect();
		});
		$("#send").click(function() {
			sendMessage();
		});
	});
</script>
</html>