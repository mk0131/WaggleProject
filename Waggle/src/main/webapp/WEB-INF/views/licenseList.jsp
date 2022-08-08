<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인인증서 확인 목록</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
	$(function($){
	    $("#check-table").DataTable();
	});
</script>
<style type="text/css">
body {
	font-size: 16px !important;
}

.middle {
	margin: 0;
	padding: 0;
}

.guideline {
	margin: 0 auto !important;
	width: 1125px;
}

.guideline-all {
	margin: 16px 0 !important;
	height: 51px !important;
	line-height: 51px;
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
	font-size: 15px;
}

.box {
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: auto;
	margin-top: 40px;
	margin-bottom: 80px;
	width: 1000px;
}

.btn {
	cursor: pointer;
	position: relative;
	padding: 7px 15px;
	background: white;
	font-size: 15px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	transition: all 1s;
	margin-right: 30px;
	border: 2px outset;
}

.btn:after, .btn:before {
	content: " ";
	width: 10px;
	height: 10px;
	position: absolute;
	border: 0px solid #fff;
	transition: all 1s;
}

.btn:after {
	top: -1px;
	left: -1px;
	border-top: 4px solid black;
	border-left: 4px solid black;
}

.btn:before {
	bottom: -1px;
	right: -1px;
	border-bottom: 4px solid black;
	border-right: 4px solid black;
}

.btn:hover {
	border-top-right-radius: 0px;
	border-bottom-left-radius: 0px;
}

.btn:hover:before, .btn:hover:after {
	width: 100%;
	height: 100%;
}

.button-container {
	text-align: center;
	margin-bottom: 40px;
}
/*
button {
	background: #E0F8F7;
	
	margin: 2px;
	text-decoration: none;
	border: 0;
	padding: 4px 12px;  
	font-size: 12px;
	border-radius: 6px;
	box-shadow: 0px 2px #A9E2F3;
	color: #0040FF;
	&:focus {
      outline: none;
	}
}
button:active {
	box-shadow: 0 0 #A9E2F3;
	background-color: #E0F8F7;
}

.button-container button {
	margin-right: 20px;
}
*/
/* 테이블 속 버튼 */
.table-btn {
	outline: none;
	text-decoration: none;
	border-radius: 5px;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	opacity: 1;
	background-color: #ffffff;
	border: 2px outset;
	padding:5px;
	transition: 0.5s;
	margin-right:10px;
}

.table-btn span {
	color: #000000;
	font-size: 13px;
	letter-spacing: 0.9px;
}

.table-btn:hover {
	animation: rotate 0.7s ease-in-out both;
	box-shadow: inset 0 0 0 2em #efefef;
}

.table-btn:hover span {
	animation: storm 0.7s ease-in-out both;
	animation-delay: 0.06s;
}

@keyframes rotate {
  0% {
    transform: rotate(0deg) translate3d(0, 0, 0); }
  25% {
    transform: rotate(3deg) translate3d(0, 0, 0); }
  50% {
    transform: rotate(-3deg) translate3d(0, 0, 0); }
  75% {
    transform: rotate(1deg) translate3d(0, 0, 0); }
  100% {
    transform: rotate(0deg) translate3d(0, 0, 0); } }

@keyframes storm {
  0% {
    transform: translate3d(0, 0, 0) translateZ(0); }
  25% {
    transform: translate3d(4px, 0, 0) translateZ(0); }
  50% {
    transform: translate3d(-3px, 0, 0) translateZ(0); }
  75% {
    transform: translate3d(2px, 0, 0) translateZ(0); }
  100% {
    transform: translate3d(0, 0, 0) translateZ(0); } }
/* 테이블 속 버튼 */

tbody tr td {
	text-align: center;
}

.link {
	text-decoration: none;
	color: #FF1493;
}

.link:hover {
	color: #C71585;
	text-decoration: underline;
	cursor: pointer;
}
</style>
</head>
<body>
<%@ include file="header.jsp"%>
  <div id="wrap">
  <div class="middle">
			<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 인증센터</p>
        		</li>	
        	</ul>
		</div>
	</div>
	<div class="box">
		<div class="button-container">
			<button class="btn" onclick="showAll()">전체 보기</button>
			<button class="btn" onclick="showUnconfirm()">미확인 보기</button>
			<button class="btn" onclick="showPermit()">확인 보기</button>
			<button class="btn" onclick="showReject()">반려 보기</button>
			<button class="btn"onclick="showProcess()">처리중 보기</button>
		</div>
		<table id="check-table" class="table table-bordered">
			<thead>
				<tr>
					<th>check</th>
					<th>No.</th>
					<th>UserCode</th>
					<th>Status</th>
					<th>File</th>
					<th>처리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="con_dto" varStatus="status">
				<tr class="${con_dto.co_Confirm }">
					<td><input type="checkbox" name="${con_dto.co_UCode }"></td>
					<td>${fn:length(list) - status.index }</td>
					<td>${con_dto.co_UCode }</td>
					<td>${con_dto.co_Confirm }</td>
					<td><button class="table-btn" onclick="window.open('${con_dto.fi_Nm}', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes')"><span>첨부이미지확인</span></button></td>
					<td><button class="table-btn" onclick="permit([${con_dto.co_UCode }])"><span>확인처리</span></button> &nbsp; <button class="table-btn" onclick="reject([${con_dto.co_UCode }])"><span>반려처리</span></button></td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" align="right">
						<button class="table-btn" onclick="allcheck()"><span>전부 체크</span></button>
						<button class="table-btn" onclick="nocheck()"><span>체크 해제</span></button>
						<button class="table-btn" onclick="checkpermit()"><span>체크항목 확인처리</span></button>
						<button class="table-btn" onclick="checkreject()"><span>체크항목 반려처리</span></button>
						<button class="table-btn" onclick="toCSV()"><span>체크항목 CSV로 변환</span></button>
					</td>
				</tr>
			</tfoot>
		</table>
		<a class="link" href="https://www.gmd.go.kr/gmd/external/reqVerifyCerti.do" target="_blank">국가기술자격 진위 확인</a>
	</div>
  </div>
<%@ include file="footer.jsp" %>
<script type="text/javascript">

	function toCSV() { // 체크항목 CSV로 변환
		var checkbox = $("input:checkbox:checked");
		var list = new Array();
		
		if(checkbox.length == 0) {
			alert("한가지 이상 체크하세요");
		} else {
			for(var i=0; i<checkbox.length; i++) {
				list.push(checkbox[i].name);
			}
			
			let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/license/process?list='+list);
		    document.body.appendChild(f);
		    f.submit();
		}
		
		
	}

	function showAll() { // 전부 보기
		$("tbody tr:hidden").show();
	}
	
	function showUnconfirm() { // 미확인만 보기
		$("tbody tr").hide();
		$("tbody tr.미확인").show();
	}
	
	function showPermit() { // 확인만 보기
		$("tbody tr").hide();
		$("tbody tr.확인").show();
	}
	
	function showReject() { // 반려만 보기
		$("tbody tr").hide();
		$("tbody tr.반려").show();
	}
	
	function showProcess() { // 처리중만 보기
		$("tbody tr").hide();
		$("tbody tr.처리중").show();
	}

	function permit(list) { // 확인 처리
		let f = document.createElement('form');
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '/license/permit?list='+list);
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function reject(list) { // 반려 처리
		let f = document.createElement('form');
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '/license/reject?list='+list);
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function checkpermit() { // 체크 확인 처리
		var checkbox = $("input:checkbox:checked");
		var tmp_list = new Array();
		
		if(checkbox.length == 0) {
			alert("한가지 이상 체크하세요");
		} else {
			for(var i=0; i<checkbox.length; i++) {
				tmp_list.push(checkbox[i].name);
			}
			
			permit(tmp_list);			
		}
		
	}
	
	function checkreject() { // 체크 반려 처리
		var checkbox = $("input:checkbox:checked");
		var tmp_list = new Array();
		
		if(checkbox.length == 0) {
			alert("한가지 이상 체크하세요");
		} else {
			for(var i=0; i<checkbox.length; i++) {
				tmp_list.push(checkbox[i].name);
			}
			
			reject(tmp_list);
		}
		
	}
	
	function allcheck() { // 전체 체크
		$("input:checkbox:visible").prop("checked",true);
	}
	
	function nocheck() { // 전체 체크 해제
		$("input:checkbox:visible").prop("checked",false);
	}
	
</script>
</body>
</html>