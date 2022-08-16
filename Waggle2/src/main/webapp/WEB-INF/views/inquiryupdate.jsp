<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 문의글 수정</title>
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

.btn1 input {
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
}

.btn1 input:active {
	outline: none;
	border: none;
	background-color: #353535;
}

/* 
th {
	width:200px;
}

tr {
	width:200px;
	height: 75px;
	border: 1px solid;
} */

.btn1 {
	top: 150px;
    padding: 45px 0px;
}

.Inquiry-update {
	display: flex;
    justify-content: center;
    border-spacing: 50px;
}

/* .Inquiry-insert input {
	border: 0;
    border-bottom: 1px solid;
} */

#in_title {
	width: 440px;
    height: 30px;
    border: 0;
    border-bottom: 1px solid;
    font-size: 15px;
	letter-spacing: .55px;
}

#in_title:focus {
	outline: none;
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
        		<p>HOME > 공지사항</p>
        		</li>	
        	</ul>
		</div>
	</div>
		
		<br/>
	   <div class="Inquiry-text-center">
		<div class="Inquiry-text">
		   
			</div>
			 </div>
			<div class="notice-container">
	 			<div class="conbox con3">
	 			 <form action="/inquiry/update" method="post">
	              <input type="hidden" name="in_Code" value="${param.in_Code}">
					<table class="Inquiry-update">
						<tr>
						<th>문의유형</th>
						<td>
						<input id="in_type" type="hidden" value="${dto.in_Type }">
						  <select>
						  <option id="1:1문의">1:1 문의</option> 
						  <option id="결제관련문의">결제 관련 문의</option> 
						  <option id="환불관련문의">환불 관련 문의</option>
						  <option id="회원신고하기">회원 신고 하기</option>
						  </select></td>
						</tr>
						<tr>
						<th>제목</th>
						<td><input type="text" id="in_title" name="in_Title" value="${dto.in_Title }"></td>
						</tr>
						<tr>
						<th>작성자</th>
						<td>${user_dto.user_Nm}</td>						
						</tr>
						<tr>
						<th>내용</th>
						<td><textarea id="incontent" rows="10" cols="60" name="in_Content" placeholder="문의할 내용을 입력해주세요." style="font-family: 'Noto Sans KR', 'Helvetica Neue', Helvetica, Arial, sans-serif;">${dto.in_Content }</textarea></td>
						</tr>
						<tr>         
				         <td class="btn1" colspan="2" align="right">
				         	<input type="submit" value="완료">
				         	<input type="button" value="취소" onclick="location.href='/inquiry/list?user_Code=${user_Code}'">  
				         </td>   
						</tr>
					</table>
				   </form>
		 </div>
 	</div>
 	</div>

  <%@ include file="footer.jsp" %>
<script type="text/javascript">
	$(function() {
		var type = $("#in_type").val();
		type = type.replaceAll(' ','');
		console.log(type);
		$("#"+type).attr("selected","selected");
	});
</script>
</body>
</html>