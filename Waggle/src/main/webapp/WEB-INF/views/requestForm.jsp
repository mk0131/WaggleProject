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
</head>
<body>
	<%@ include file="header.jsp"%>
	
   	<div class="guideline">
   		<ul class="guideline-all">
			<li>
				<a href="javascript:void(0)">
					<i class="fa-solid fa-house"></i>
				</a>
				<p>HOME > 꿀단지 > 요청하기</p>
			</li>
   		</ul>
   	</div>
   	
	<div class="middle">
		<div><h1>요청페이지</h1></div>
		<form action="/board/request" method="post">
		<input type="hidden" value="${user_Code }" name="req_UCode">
		<div><input type="text" placeholder="제목을 입력해주세요." name="req_Title" required="required"> </div>
		<div><span>내가 본 집 링크</span><input type="text" placeholder="링크를 입력해주세요." name="req_Link"></div>
		<div><span>방문기한</span><input type="date" name="req_EDate" required="required"> </div>
		<div>
			<span>내가 본 집 주소</span>
			<input type="hidden" name="home_Post" id="home_Post">
			<input type="text" name="home_Addr" id="home_Addr" readonly="readonly" onclick="kakaopost()" required="required"> 
            <input type="button" value="주소 찾기" onclick="kakaopost()">
		</div>
		<div><span>상세주소</span><input type="text" placeholder="ㅇㅇㅇ동 ㅇㅇㅇ호" name="home_DAddr"> </div>
		<div><span>공인중개사 연락처</span><input type="text" placeholder="선택사항입니다." name="req_Phone"></div>
	    <hr style="width : 80%;">
	    <div><span>디테일 요구사항</span><br><textarea rows="20" cols="100" placeholder="원하는 요구사항을 입력해 주세요." name="req_Detail"></textarea> </div>
	    <div><span>심부름 비용:</span><input type="text" placeholder="최소금액 5000포인트" name="req_Point" required="required"></div>
	    <div>
	    	<input type="submit" value="작성">
	    	<input type="button" value="취소">	    	
	    </div>
	    </form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>