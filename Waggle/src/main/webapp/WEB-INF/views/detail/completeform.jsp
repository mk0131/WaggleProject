<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

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

#ongoing-detail {
	text-align: center;
}


.ongoing21-content {
	display:flex;
  	align-items: center;
  	justify-content: center;
    padding: 5px;
    border-spacing: 30px;
    font-size: 14px;
}

.ongoing21-content2 {
    display: inline-table;
    border-spacing: 10px;
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

#revcontent {
	outline: none;
    resize: none;
    border-radius: 5px;
	box-shadow: rgba(67, 71, 85, 0.27) 0px 0px 0.25em, rgba(90, 125, 188, 0.05) 0px 0.25em 1em;
}

#w-date {
	display: flex;
    justify-content: flex-end;
    max-width: 1280px;
    font-weight: bold;
}

#choice-option-all {
	display: flex;
	padding: 15px;
}

#choice-option-all div {
	width: 200px;
}

#btn2 {
	display: inline-block;
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

.my-hr {
	width: 700px;
	height: 1px;
	background: #ccc;
	color: #eee;
	border: 0 none;
}


div#detail_container {
	display:inline-flex;
  	align-items: center;
  	justify-content: center;
    padding: 5px;
    border-spacing: 30px;
    font-size: 14px;
    width: 800px;
    margin-top: 20px;
    
}

div#file_container {
	float: left;
	width: 400px;
}

div#review_containser{
	width: 400px;
	float: right;
}

#revcontent {
	margin-top: 10px;
 	font-size:15px;
	line-height: 150%;
	padding: 10px;
}

/* 별 */
.rating-group {
  display: inline-flex;
}

/* make hover effect work properly in IE */
.rating__icon {
  pointer-events: none;
}

/* hide radio inputs */
.rating__input {
 position: absolute !important;
 left: -9999px !important;
}

/* hide 'none' input from screenreaders */
.rating__input--none {
  display: none
}

/* set icon padding and size */
.rating__label {
  cursor: pointer;
  padding: 0 0.1em;
  font-size: 2rem;
}

/* set default star color */
.rating__icon--star {
  color: orange;
}

/* if any input is checked, make its following siblings grey */
.rating__input:checked ~ .rating__label .rating__icon--star {
  color: #ddd;
}

</style>
</head>
<body>

	<%@ include file="../header.jsp" %>
	 <div id="wrap">
	  <div class="middle">
		<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 요청 완료 페이지</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	  
	   <div class="ongoing21-all">
	    <h3 id="ongoing-detail">${userName}님이 요청한 리스트 상세</h3>
	     <p id="w-date">요청날짜 : ${req_dto.req_WDate }</p>
	    <div class="ongoing21-all">
	    <table class="ongoing21-content">
	     <tbody>
	      <tr>
	       <th>제목</th>
	       <td>${req_dto.req_Title }</td>
	      </tr>
	      <tr>
	       <th>방문기한</th>
	       <td id="yellow">${req_dto.req_EDate }</td>
	      </tr>
	      <tr>
	       <th>주소</th>
	       <td id="yellow">${req_dto.home_Addr }</td>
	      </tr>
	      <tr>
	       <th>상세주소</th>
	       <td>${req_dto.home_DAddr }</td>
	      </tr>
	      <tr>
	       <th colspan="2">디테일 요구사항</th>
	      </tr>
	      </tbody>
	     </table>
	     <div class="ongoing21-content-bottom">
	       <textarea id="incontent" rows="12" cols="70" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea>
	       <br/><br/><hr class="my-hr"><br>
	       		      
		   
	<form action="/board/complete" method="post" enctype="multipart/form-data">
	 <input type="hidden" name="req_No" value="${req_dto.req_No }">
	 <input type="hidden" name="res_No" value="${req_dto.req_No }">
	 <input type="hidden" name="res_UCode" value="${user_Code }">
		   <h4>기본 선택사항</h4>
		   <table class="ongoing21-content2">
	       <tbody>
	        <tr id="choice-name">
	       	 <th>
	       	 	일조량
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	  <div id="choice-option-all">
				<div>
					<input type="radio" id="res_Attr1_1" name="res_Attr1" value="좋아요" required>
					<label for="res_Attr1_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr1_2" name="res_Attr1" value="보통이에요">
					<label for="res_Attr1_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr1_3" name="res_Attr1" value="별로에요">
					<label for="res_Attr1_3">별로에요</label>
				</div>
			   </div>
	       	 </td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	수압
	       	 </th>
	       	</tr>
	        <tr id="choice-option">
	       	 <td>
	       	  <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr2_1" name="res_Attr2" value="좋아요" required>
					<label for="res_Attr2_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr2_2" name="res_Attr2" value="보통이에요">
					<label for="res_Attr2_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr2_3" name="res_Attr2" value="별로에요">
					<label for="res_Attr2_3">별로에요</label>
				</div>
			   </div>
	       	 </td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	외부소음
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	   <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr3_1" name="res_Attr3" value="좋아요" required>
					<label for="res_Attr3_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr3_2" name="res_Attr3" value="보통이에요">
					<label for="res_Attr3_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr3_3" name="res_Attr3" value="별로에요">
					<label for="res_Attr3_3">별로에요</label>
				</div>
			   </div>
	       	 </td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	냄새
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	   <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr4_1" name="res_Attr4" value="좋아요" required>
					<label for="res_Attr4_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr4_2" name="res_Attr4" value="보통이에요">
					<label for="res_Attr4_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr4_3" name="res_Attr4" value="별로에요">
					<label for="res_Attr4_3">별로에요</label>
				</div>
			  </div>
	       	 </td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	곰팡이
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	  <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr5_1" name="res_Attr5" value="좋아요" required>
					<label for="res_Attr5_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr5_2" name="res_Attr5" value="보통이에요">
					<label for="res_Attr5_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr5_3" name="res_Attr5" value="별로에요">
					<label for="res_Attr5_3">별로에요</label>
				</div>
			  </div>
	       	 </td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	벌레
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	  <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr6_1" name="res_Attr6" value="좋아요" required>
					<label for="res_Attr6_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr6_2" name="res_Attr6" value="보통이에요">
					<label for="res_Attr6_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr6_3" name="res_Attr6" value="별로에요">
					<label for="res_Attr6_3">별로에요</label>
				</div>
			  </div>
	       	 <td>
	       	</tr>
	       	</tbody>
	       </table>
	       
	       <br/>
		   <br/><br/><hr class="my-hr">
		   
		   <br><h4>디테일 요청사항</h4>
		   <div id="detail_container">
		    <div id="file_container">
		     <input type="file" name="myfile" multiple="multiple">
		    </div>
		    <div id="review_containser">
		     <span style="font-size: 12pt;">간단한 집 평가</span>
		     <textarea id="revcontent" rows="18" cols="40" name="res_Detail" placeholder="디테일 리뷰가 없습니다."></textarea>
		    </div>
		   </div>
		    <br/><br/>
		    <br/><br/><hr class="my-hr">
		   
		    <br><h4>집이 어땠나요?</h4>
			<div id="full-stars-example-two">
			    <div class="rating-group">
			        <input disabled checked class="rating__input rating__input--none" name="res_Rate" id="rating3-none" value="0" type="radio">
			        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="res_Rate" id="rating3-1" value="1" type="radio">
			        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="res_Rate" id="rating3-2" value="2" type="radio">
			        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="res_Rate" id="rating3-3" value="3" type="radio">
			        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="res_Rate" id="rating3-4" value="4" type="radio">
			        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="res_Rate" id="rating3-5" value="5" type="radio">
			    </div>
			</div>
		   <br/><br/>
		   <br/><br/>
		     <div class="btn2" id="btn2">
			   <button type="submit" value="완료하기">완료하기</button>
		      <button type="button" value="취소" onclick="location.href='/board/list'">취소</button>
		     </div>
	     </div>
	    </div>
	</form>
 
	   </div>
	   
	   
	 </div>
	<%@ include file="../footer.jsp" %>

</body>

</html>