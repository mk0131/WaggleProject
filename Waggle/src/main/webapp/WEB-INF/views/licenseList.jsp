<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인인증서 확인 목록</title>
</head>
<body>
<%@ include file="header.jsp"%>
	<div>
		<button onclick="showAll()">전체 보기</button>
		<button onclick="showUnconfirm()">미확인 보기</button>
		<button onclick="showPermit()">확인 보기</button>
		<button onclick="showReject()">반려 보기</button>
		<button onclick="showProcess()">처리중 보기</button>
	</div>
	<table>
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
				<td><button onclick="window.open('${con_dto.fi_Nm}', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes')">첨부이미지확인</button></td>
				<td><button onclick="permit([${con_dto.co_UCode }])">확인처리</button> &nbsp; <button onclick="reject([${con_dto.co_UCode }])">반려처리</button></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<button onclick="allcheck()">전부 체크</button>
		<button onclick="nocheck()">체크 해제</button>
		<button onclick="checkpermit()">체크항목 확인처리</button>
		<button onclick="checkreject()">체크항목 반려처리</button>
	</div>
	<div>
		<button onclick="toCSV()">체크항목 CSV로 변환</button>
	</div>
		
<%@ include file="footer.jsp" %>
<script type="text/javascript">

	function toCSV() { // 체크항목 CSV로 변환
		var checkbox = $("input:checkbox:checked");
		var list = new Array();
		
		for(var i=0; i<checkbox.length; i++) {
			list.push(checkbox[i].name);
		}
		
		let f = document.createElement('form');
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '/license/process?list='+list);
	    document.body.appendChild(f);
	    f.submit();
		
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
		
		for(var i=0; i<checkbox.length; i++) {
			tmp_list.push(checkbox[i].name);
		}
		
		permit(tmp_list);
		
	}
	
	function checkreject() { // 체크 반려 처리
		var checkbox = $("input:checkbox:checked");
		var tmp_list = new Array();
		
		for(var i=0; i<checkbox.length; i++) {
			tmp_list.push(checkbox[i].name);
		}
		
		reject(tmp_list);
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