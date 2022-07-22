<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

button {
 background-color: #151515;
 border-radius: 8px;
 border-style: none;
 box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
 box-sizing: border-box;
 color: #fff;
 font-size: 12px;
 font-weight: 500;
 font-family: inherit;
 letter-spacing: .25px;
 line-height: normal;
 padding: 11px 11px;
 transition: background box-shadow 280ms ease;
}

button:hover {
 background: #fff;
 color: #151515;
}

button:active {
 box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
 outline: none;
 border: 1px solid #ffffff;
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
	position: relative;
	top: 150px;
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
						<td>${dto.in_Type }</td>
						</tr>
						<tr>
						<th>제목</th>
						<td>${dto.in_Title }</td>
						</tr>
						<tr>
						<th>작성자</th>
						<td>${user_Nm}</td>						
						</tr>
						<tr>
						<th>작성일</th>
						<td>${dto.in_Date }</td>
						</tr>
						<tr>
						<th>내용</th>
						<td>${dto.in_Content }</td>
						</tr>
						<tr>
						<th>답변상태</th>
						<td>${dto.in_Stat }</td>
						</tr>
						<tr>         
				         <td class="btn1" colspan="2" align="right">
				         	<button type="button" value="문의" onclick="location.href='/inquiry/list?user_Code=${user_Code}'">목록</button>
				         	<button type="button" value="수정" onclick="location.href='/inquiry/updateform?in_Code=${dto.in_Code}'">수정</button>
				         	<button type="button" value="삭제" onclick="location.href='/inquiry/delete?in_Code=${dto.in_Code}&user_Code=${user_Code }'">삭제</button>  
				         </td>   
						</tr>
					</table>

		 </div>
 	</div>
 	</div>

  <%@ include file="footer.jsp" %>
</body>
</html>