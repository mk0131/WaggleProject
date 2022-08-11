<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 문의글 상세</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
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
	font-size: 14px;
}

.notice h1 {
	text-align: center;
}

.btn1 button {
	font-weight: 600;
	color: #fff;
	background-color: #222;
	border-radius: 12px;
	border: none;
	font-size: 13px;
	font-family: inherit;
	letter-spacing: .14px;
	line-height: normal;
	padding: 11px 11px;
	cursor: pointer;
	margin: 1px;
}

.btn1 button:active {
	outline: none;
	border: none;
	background-color: #353535;
}

.Inquiry-detail {
	display:flex;
  	align-items: center;
  	justify-content: center;
    padding: 50px;
    border-spacing: 10px;
}

.Inauiry-board-content {
	border: none;
	resize: none;
}

.Inauiry-board-content:focus {
	border: none;
	outline: none;
	resize: none;
}

th {
	width:200px;
}

tr {
	width:200px;
	height: 75px;
	border: 1px solid;
}

.btn1 {
	top: 150px;
	padding: 45px 0px;
}

.Inquiry-text-center {
	text-align: center;
}

.Inquiry-text {
	border-bottom: 1px solid;
	display: inline-block;
	margin: 0 auto;
	width: 630px;
}

.Inquiry-text p {
	font-size: 13px;
}

#incontent {
	resize: none;
	padding: 20px;
	border: 1px solid #d3d3d3;
	font-size: 15px;
	letter-spacing: .5px;
}

#incontent:focus {
	resize: none;
	padding: 20px;
	outline: none;
}

.inq-detail-td {
	letter-spacing: .55px;
}

</style>
</head>
<body>
  <%@ include file="header.jsp" %>
	<div id="wrap">
		<div class="middle">
			<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 1:1문의</p>
        		</li>	
        	</ul>
		</div>
	</div>
		
		<br/>
	   <div class="Inquiry-text-center">
		<div class="Inquiry-text">
		   <h4>1:1 문의</h4>
			<p>고객님께서 1:1문의에서 작성하신 내용입니다.</p>
			</div>
			 </div>
			<div class="notice-container">
	 			<div class="conbox con3">
	              <input type="hidden" name="user_Code" value="${user_Code }">
					<table class="Inquiry-detail">
						<tr>
						<th>문의 유형</th>
						<td class="inq-detail-td">${dto.in_Type }</td>
						</tr>
						<tr>
						<th>작성일</th>
						<td class="inq-detail-td">${dto.in_Date }</td>
						</tr>
						<tr>
						<th>제목</th>
						<td class="inq-detail-td">${dto.in_Title }</td>
						</tr>
						<tr>
						<th>작성자</th>
						<td class="inq-detail-td">${user_dto.user_Nm}</td>						
						</tr>
						<tr>
						<th>내용</th>
						<td class="inq-detail-td"><textarea id="incontent" rows="10" cols="60" readonly="readonly" style="font-family: 'Noto Sans KR', 'Helvetica Neue', Helvetica, Arial, sans-serif;">${dto.in_Content }</textarea></td>
						</tr>
						<tr>
						<th>답변상태</th>
						<td class="inq-detail-td">${dto.in_Stat }</td>
						</tr>
						<tr>         
				         <td class="btn1" colspan="2" align="right">
				          <c:if test="${user_dto.user_Nm eq user_Nm && dto.in_Stat ne '답변완료' }">
				         	<c:if test="${user_Nm ne 'admin' }">
				         	<button type="button" value="수정" onclick="location.href='/inquiry/updateform?in_Code=${dto.in_Code}'">수정</button>
				         	</c:if>
				         	</c:if>
				         	<c:if test="${user_Nm eq 'admin' }">
				         	<button type="button" value="답변 작성" onclick="location.href='/inquiry/admininsertform?in_Code=${dto.in_Code}'">답변 작성</button>
				         	<button type="button" value="삭제" onclick="location.href='/inquiry/delete?in_Code=${dto.in_Code}&user_Code=${user_Code }'">삭제</button>  
				         	</c:if>
				         	<button type="button" value="목록" onclick='history.back();'>목록</button>
				         </td>   
						</tr>
					</table>

		 </div>
 	</div>
 	</div>

  <%@ include file="footer.jsp" %>
</body>
</html>