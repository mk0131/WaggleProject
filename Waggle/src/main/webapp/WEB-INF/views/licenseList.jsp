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
				<th>No.</th>
				<th>UserCode</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="con_dto" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${con_dto.co_UCode }</td>
				<td>${con_dto.co_Confirm }</td>
				<td><button></button></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
		
<%@ include file="footer.jsp" %>
</body>
</html>