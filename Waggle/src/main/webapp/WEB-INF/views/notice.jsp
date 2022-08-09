<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 공지글 작성</title>
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

.btn1 input:hover {
 background: #fff;
 color: #151515;
}

.btn1 input:active {
 box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
 outline: none;
 border: 1px solid #ffffff;
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
	position: relative;
	top: 130px;
}

.Inquiry-insert {
	display: flex;
    justify-content: center;
    border-spacing: 50px;
}

/* .Inquiry-insert input {
	border: 0;
    border-bottom: 1px solid;
} */

#title {
	width: 440px;
    height: 30px;
    border: 0;
    border-bottom: 1px solid;
}

#title:focus {
	outline: none;
}

#incontent {
	border: 0;
	resize: none;
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
	 			 <form action="/notice/insert" method="post">
	 			 <input type="hidden" name="user_Code" value="${user_Code }">
					<table class="Inquiry-insert">
						<tr>
						<th>유형</th>
						<td>
						  <select name="no_Type">
						  <option value="공지">공지</option> 
						  <option value="질문">질문</option> 
						  </select>
						</td>
						</tr>
						<tr>
						<th>제목</th>
						<td><input type="text" id="title" name="no_Title" placeholder="제목을 입력해주세요."></td>
						</tr>
						<tr>
						<th>내용</th>
						<td><textarea id="incontent" rows="14" cols="70" name="no_Content" placeholder="내용을 입력해주세요."></textarea></td>
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
</body>
</html>