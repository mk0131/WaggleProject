<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청상세페이지 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/guideline.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function kakaopost(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#home_Addr").val(data.address);
	        	$("#home_Post").val(data.zonecode);
	        }
	    }).open();		
	}
</script>
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

.ongoing21-user-name {
	display: flex;
    justify-content: flex-end;
    max-width: 1280px;
}


#ongoing-detail {
	text-align: center;
}


.ongoing21-content {
	display:flex;
  	align-items: center;
  	justify-content: center;
    padding: 25px;
    border-spacing: 50px;
    font-size: 14px;
}

.ongoing21-content-bottom {
	text-align: center;
}

.ongoing21-content td {
	width: 380px;
}

#yellow {
	color: #f48c06;
}

#incontent {
	outline: none;
    resize: none;
    border-radius: 5px;
	box-shadow: rgba(67, 71, 85, 0.27) 0px 0px 0.25em, rgba(90, 125, 188, 0.05) 0px 0.25em 1em;
}

#userrealname {
	font-weight: bold;
}

#w-date {
	display: flex;
    justify-content: flex-end;
    max-width: 1280px;
    font-weight: bold;
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

input[type="text"] {
	font-size:15px;
	padding:5px 5px 5px 0px;
	display:block;
	width:300px;
	border:none;
	border-bottom:1px solid #757575;
}

input[type="date"] {
	font-size:15px;
	padding:5px 5px 5px 0px;
	display:block;
	width:150px;
	border:none;
	border-bottom:1px solid #757575;
}

.required:after {
	content:" *";
	color: red;
}

#incontent{
	font-size:15px;
	line-height: 150%;
	padding: 10px;
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
        		<p>HOME > 꿀단지 > 요청 상세페이지</p>
        		</li>	
        	</ul>
		</div>
	  </div>
   	
	<div class="ongoing21-all">
		<h3 id="ongoing-detail">요청페이지</h3>
		<div class="ongoing21-all">
			<form action="/board/request" method="post">
			<input type="hidden" value="${user_Code }" name="req_UCode">
			<input type="hidden" name="home_Post" id="home_Post">
				<table class="ongoing21-content">
					<tbody style="border-bottom: 1px solid;">
						<tr>
							<th><label class="required">제목</label></th>
							<td><input type="text" placeholder="Title" name="req_Title" required="required"></td>
						</tr>
						<tr>
							<th>내가 본 집 링크 첨부(직방)</th>
							<td><input type="text" placeholder="LInk" name="req_Link"></td>
						</tr>
						<tr>
							<th><label class="required">방문기한</label></th>
							<td><input type="date" name="req_EDate" required="required"></td>
						</tr>
						<tr>
							<th><label class="required">집 주소</label><br><br><br></th>
							<td>
								<input type="text" placeholder="클릭해서 주소 입력" name="home_Addr" id="home_Addr" readonly="readonly" onclick="kakaopost()" required="required">
								<br><input type="text" placeholder="상세주소(선택)" name="home_DAddr">
							</td>
						</tr>
						<tr>
							<th><label class="required">요청 포인트</label></th>
							<td><input type="text" placeholder="Point" name="req_Point" required="required"></td>
						</tr>
						<tr>
							<th>공인중개사 연락처</th>
							<td><input type="text" placeholder="" name="req_Phone"></td>
						</tr>
					</tbody>
		    	</table>
				<div class="ongoing21-content-bottom">
					<h4>디테일 요구사항</h4>
					<textarea id="incontent" rows="12" cols="70"  placeholder="요구사항을 입력해주세요" name="req_Detail"></textarea>
					<br><br>
					<div class="btn1" id="btn1">
						<button type="submit" value="작성">작성 완료</button>
						<button type="button" value="취소" onclick="location.href='/board/list'">취소</button>	    	
					</div>
					<br/><br/><br/>
				</div>
		    </form>
	    </div>
	</div>
	
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>