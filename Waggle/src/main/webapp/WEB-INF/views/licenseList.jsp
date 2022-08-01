<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인인증서 확인 목록</title>
</head>
<body>
<%@ include file="header.jsp"%>
	<table>
		<thead>
			<tr>
				<td><button>전부 체크</button></td>
				<td colspan="5">
					<button>CSV로 변환</button>
					<button>확인처리</button>
					<button>반려처리</button>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>check</th>
				<th>No.</th>
				<th>UserCode</th>
				<th>Status</th>
				<th>File</th>
				<th>처리</th>
			</tr>
		</tbody>
		<tfoot>
			<c:forEach items="${list }" var="con_dto" varStatus="status">
			<tr>
				<td><input type="checkbox"></td>
				<td>${status.count }</td>
				<td>${con_dto.co_UCode }</td>
				<td>${con_dto.co_Confirm }</td>
				<td><button onclick="window.open('${con_dto.fi_Nm}', 'window_name', 'width=430, height=500, location=no, status=no, scrollbars=yes')">첨부이미지확인</button></td>
				<td><button>확인처리</button> &nbsp; <button>반려처리</button></td>
			</tr>
			</c:forEach>
		</tfoot>
	</table>
		
<%@ include file="footer.jsp" %>
</body>
</html>