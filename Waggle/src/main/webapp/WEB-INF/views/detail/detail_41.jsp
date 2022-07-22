<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청상세페이지(완료)</title>
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
    padding: 5px;
    border-spacing: 30px;
    font-size: 14px;
}

.ongoing21-content2 {
	display:flex;
  	align-items: center;
  	justify-content: center;
    padding: 5px;
    border-spacing: 30px;
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

#revcontent {
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

.my-hr {
	width: 700px;
	height: 1px;
	background: #ccc;
	color: #eee;
	border: 0 none;
}

div#file_container img {
	width: 400px;
	height: 250px;
}

div#detail_container {
	display:inline-block;
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
	margin-top: 20px;
}

#revcontent {
	margin-top: 10px;
 	font-size:15px;
	line-height: 150%;
	padding: 10px;
}

td label {
	margin-left: 3px;
	margin-right: 50px;
}

/* 게이지 바 */
div#loader_container {
  width: 300px;
  margin: 10px auto;
  text-align: center;
  padding-top: 5px;
}

div#bar_container {
  height: 10px;
  background: #dcdbd7;
  border-radius: 20px;
  border-top: 1px solid #cfcec9;
  border-bottom: 1px solid #f7f6f4;
  box-shadow: 0 -1px 0 #bab9b4;
  margin-bottom: 5px;
  position: relative;
}

div#progress_bar {
  background-color: #dcf1c6;
  background-image: -webkit-gradient(
    linear,
    center top,
    center bottom,
    color-stop(0%, #9fbff4),
    color-stop(100%, #555bb4)
  );
  background-image: -webkit-linear-gradient(top, #ffed8a 0%, orange 100%);
  background-image: -moz-linear-gradient(top, #ffed8a 0%, orange 100%);
  background-image: -ms-linear-gradient(top, #ffed8a 0%, orange 100%);
  background-image: -o-linear-gradient(top, #ffed8a 0%, orange 100%);
  background-image: linear-gradient(to bottom, #ffed8a 0%, orange 100%);
  height: 110%;
  position: absolute;
  top: -3px;
  left: 0px;
  border-top: 1px solid #e5ebf4;
  border-radius: 20px;
  box-shadow: 0 3px 10px #717171;
  width: 0%;
  transition: all 3s 0s cubic-bezier(0.83, 0, 0.17, 1);
}

div#progress_percentage {
  position: absolute;
  top: -40px;
  right: -10px;
  width: 40px;
  height: 24px;
  padding-top: 6px;
}

div#progress_percentage::before {
  /* used for the border of the arrow */
  content: "";
  position: absolute;
  left: 14px;
  bottom: -11px;
  border-top: 5px solid #999;
  border-right: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-left: 5px solid transparent;
}

div#progress_percentage::after {
  content: "";
  position: absolute;
  left: 14px;
  bottom: -10px;
}

/* 라디오버튼 disabled */
[type="radio"]:disabled:checked {
	border: 4px solid;
	border-color: #FFFF66 !important;
	background-color: orange !important;
    appearance: none;
    width: 16px;
	height: 16px;
	border-radius: 50%;
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

/* make all stars orange on rating group hover */
/*
.rating-group:hover .rating__label .rating__icon--star {
  color: orange;
}
*/
/* make hovered input's following siblings grey on hover */
/*
.rating__input:hover ~ .rating__label .rating__icon--star {
  color: #ddd;
}
*/


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
        		<p>HOME > 요청 상세페이지</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	  
	   <div class="ongoing21-all">
	    <h3 id="ongoing-detail">요청 상세 페이지(${req_dto.req_Stat })</h3>
	     <p id="w-date">요청날짜 : ${req_dto.req_WDate }</p>
	     <div class="ongoing21-user-name">
	      <p id="userrealname">작성자 : ${user_dto.user_Nm}</p>
	     </div>
	    <div class="ongoing21-all">
	   <input type="hidden" name="req_dto.req_No" value="${req_dto.req_No }">
	    <table class="ongoing21-content">
	     <tbody>
	      <tr>
	       <th>제목</th>
	       <td>${req_dto.req_Title }</td>
	      </tr>
	      <tr>
	       <th>내가 본 집 링크 첨부</th>
	       <td><a style="color: #f48c06;" id="link" href="">${req_dto.req_Link }</a></td>
	      </tr>
	      <tr>
	       <th>방문기한</th>
	       <td id="yellow">${req_dto.req_EDate }</td>
	      </tr>
	      <tr>
	       <th>내가 본 집 주소</th>
	       <td id="yellow">${req_dto.home_Addr }</td>
	      </tr>
	      <tr>
	       <th>상세주소</th>
	       <td>${req_dto.home_DAddr }</td>
	      </tr>
	      <tr id="phone-number">
	       <th>공인중개사 연락처</th>	
	       <td>${req_dto.req_Phone }</td>
	      </tr>
	      <tr>
	       <th colspan="2">디테일 요구사항</th>
	      </tr>
	      </tbody>
	     </table>
	     <div class="ongoing21-content-bottom">
	       <textarea id="incontent" rows="12" cols="70" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea>
	       <br/><br/><hr class="my-hr">
	       
	       <br><h4>요청자님이 꿀벌님을 이렇게 평가하셧어요!</h4>
	         <div id="loader_container">
	           <div id="bar_container">
			      <div id="progress_bar">
			        <div id="progress_percentage" data-percentage="10">
			        </div>
			      </div>
			    </div>
			 </div>
			 
	       <table class="ongoing21-content2">
		       <tbody>
		        <tr>
		       	 <th>
		       	 	친절하고 매너가 좋아요
		       	 </th>
		       	</tr>
		       	<tr>
		       	 <td>
		       	  <input type="radio" id="ur_Attr1_1" name="ur_Attr1">
		       	  <label for="ur_Attr1_1">좋아요</label>
		       	  <input type="radio" id="ur_Attr1_2" name="ur_Attr1">
		       	  <label for="ur_Attr1_2">보통이에요</label>
		       	  <input type="radio" id="ur_Attr1_3" name="ur_Attr1">
		       	  <label for="ur_Attr1_3">별로에요</label>
		       	 <td>
		       	</tr>
		       	<tr>
		       	 <th>
		       	 	응답이 빠르고 약속을 잘 지켜요
		       	 </th>
		       	</tr>
		        <tr>
		       	 <td>
		       	  <input type="radio" id="ur_Attr2_1" name="ur_Attr2">
		       	  <label for="ur_Attr2_1">좋아요</label>
		       	  <input type="radio" id="ur_Attr2_2" name="ur_Attr2">
		       	  <label for="ur_Attr2_2">보통이에요</label>
		       	  <input type="radio" id="ur_Attr2_3" name="ur_Attr2">
		       	  <label for="ur_Attr2_3">별로에요</label>
		       	 <td>
		       	</tr>
		       	<tr>
		       	 <th>
		       	 	설명이 꼼꼼하고 자세해요
		       	 </th>
		       	</tr>
		       	<tr>
		       	 <td>
		       	  <input type="radio" id="ur_Attr3_1" name="ur_Attr3">
		       	  <label for="ur_Attr3_1">좋아요</label>
		       	  <input type="radio" id="ur_Attr3_2" name="ur_Attr3">
		       	  <label for="ur_Attr3_2">보통이에요</label>
		       	  <input type="radio" id="ur_Attr3_3" name="ur_Attr3">
		       	  <label for="ur_Attr3_3">별로에요</label>
		       	 <td>
		       	</tr>
		       </tbody>
	       </table>
	       
		   <br/><br/><hr class="my-hr">
		   
		   <br><h4>기본 선택사항</h4>
		   <table class="ongoing21-content2">
	       <tbody>
	        <tr>
	       	 <th>
	       	 	일조량
	       	 </th>
	       	</tr>
	       	<tr>
	       	 <td>
	       	  <input type="radio" id="res_Attr1_1" name="res_Attr1">
	       	  <label for="res_Attr1_1">좋아요</label>
	       	  <input type="radio" id="res_Attr1_2" name="res_Attr1">
	       	  <label for="res_Attr1_2">보통이에요</label>
	       	  <input type="radio" id="res_Attr1_3" name="res_Attr1">
	       	  <label for="res_Attr1_3">별로에요</label>
	       	 <td>
	       	</tr>
	       	<tr>
	       	 <th>
	       	 	수압
	       	 </th>
	       	</tr>
	        <tr>
	       	 <td>
	       	  <input type="radio" id="res_Attr2_1" name="res_Attr2">
	       	  <label for="res_Attr2_1">좋아요</label>
	       	  <input type="radio" id="res_Attr2_2" name="res_Attr2">
	       	  <label for="res_Attr2_2">보통이에요</label>
	       	  <input type="radio" id="res_Attr2_3" name="res_Attr2">
	       	  <label for="res_Attr2_3">별로에요</label>
	       	 <td>
	       	</tr>
	       	<tr>
	       	 <th>
	       	 	외부소음
	       	 </th>
	       	</tr>
	       	<tr>
	       	 <td>
	       	  <input type="radio" id="res_Attr3_1" name="res_Attr3">
	       	  <label for="res_Attr3_1">좋아요</label>
	       	  <input type="radio" id="res_Attr3_2" name="res_Attr3">
	       	  <label for="res_Attr3_2">보통이에요</label>
	       	  <input type="radio" id="res_Attr3_3" name="res_Attr3">
	       	  <label for="res_Attr3_3">별로에요</label>
	       	 <td>
	       	</tr>
	       	<tr>
	       	 <th>
	       	 	냄새
	       	 </th>
	       	</tr>
	       	<tr>
	       	 <td>
	       	  <input type="radio" id="res_Attr4_1" name="res_Attr4">
	       	  <label for="res_Attr4_1">좋아요</label>
	       	  <input type="radio" id="res_Attr4_2" name="res_Attr4">
	       	  <label for="res_Attr4_2">보통이에요</label>
	       	  <input type="radio" id="res_Attr4_3" name="res_Attr4">
	       	  <label for="res_Attr4_3">별로에요</label>
	       	 <td>
	       	</tr>
	       	<tr>
	       	 <th>
	       	 	곰팡이
	       	 </th>
	       	</tr>
	       	<tr>
	       	 <td>
	       	  <input type="radio" id="res_Attr5_1" name="res_Attr5">
	       	  <label for="res_Attr5_1">좋아요</label>
	       	  <input type="radio" id="res_Attr5_2" name="res_Attr5">
	       	  <label for="res_Attr5_2">보통이에요</label>
	       	  <input type="radio" id="res_Attr5_3" name="res_Attr5">
	       	  <label for="res_Attr5_3">별로에요</label>
	       	 <td>
	       	</tr>
	       	<tr>
	       	 <th>
	       	 	벌레
	       	 </th>
	       	</tr>
	       	<tr>
	       	 <td>
	       	  <input type="radio" id="res_Attr6_1" name="res_Attr6">
	       	  <label for="res_Attr6_1">좋아요</label>
	       	  <input type="radio" id="res_Attr6_2" name="res_Attr6">
	       	  <label for="res_Attr6_2">보통이에요</label>
	       	  <input type="radio" id="res_Attr6_3" name="res_Attr6">
	       	  <label for="res_Attr6_3">별로에요</label>
	       	 <td>
	       	</tr>
	       	</tbody>
	       </table>
	       
		   <br/><br/><hr class="my-hr">
		   
		   <br><h4>디테일 요청사항</h4>
		   <div id="detail_container">
		    <div id="file_container">
		    <c:forEach items="${file }" var="dto">
		   	 <c:choose>
		   	  <c:when test="${dto.fi_Type eq 'img' }">
		   	   <img src="${dto.fi_Nm }" alt="방사진">
		   	  </c:when>
		   	  <c:otherwise>
		   	   <video controls width="400px"><source src="${dto.fi_Nm }"> </video>
		   	  </c:otherwise>
		   	 </c:choose>
		    </c:forEach>
		    </div>
		    <div id="review_containser">
		     <span style="font-size: 12pt;">간단한 집 평가</span><br>
		     <textarea id="revcontent" rows="30" cols="40"  placeholder="디테일 리뷰가 없습니다." readonly="readonly"></textarea>
		    </div>
		   </div>
		   
		   <br/><br/><hr class="my-hr">
		   
		   <br><h4>집 평가를 이렇게 받았어요!</h4>
			<div id="full-stars-example-two">
			    <div class="rating-group">
			        <input disabled checked class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
			        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
			        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
			        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
			        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
			        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
			    </div>
			</div>
		   
		   
		   <br/><br/>
		    <c:if test="${who eq '제3자' or who eq '수행자'}">
		     <div class="btn1" id="btn1">
		      <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
		     </div>
		    </c:if>
		    <c:if test="${who eq '작성자'}">
		     <div class="btn2" id="btn2">
		      <c:if test="${fn:length(user_rating) eq 1}">
			   <button type="button" value="재평가" onclick="location.href=''">꿀벌 다시평가하기</button>
			  </c:if>
		      <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
		     </div>
		    </c:if>
	     </div>
	    </div>
	   </div>
	   
	   
	 </div>
	<%@ include file="../footer.jsp" %>
</body>
<script type="text/javascript">
	var res_content = ${res_dto}
	var user_rate = ${user_rating};
	
	// 최근 리뷰 가져오기
	var rate_last = user_rate[user_rate.length - 1];
	
	// 꿀벌 평점 -3~3을 0~100로 정규화한 값
	var percent_val = ((rate_last.ur_Rate + 3)/6)*100;

	$(function(){
		// 내가본 집 링크 연결
		let link = $("#link").text();
		if (link.includes("https://")) {
			$("#link").attr('href',link);
		} else {
			$("#link").attr('href',"https://"+link);			
		}
		
		// 꿀벌 평가 게이지바
		$("#progress_bar").css({
		    width: percent_val+"%"
		});
		
		// 라디오 버튼 사용 불가능하게 만들기
		$("input[type='radio']").attr('disabled', true);
		// $(".rating-group input[type='radio']").attr('disabled', false);
		
		// 라디오 버튼에 값 넣기(꿀벌 평가)
		for (var i=1; i<4; i++) {
			var attr = eval('rate_last.ur_Attr'+i);
			if (attr === "좋아요") {
				$("input[id='ur_Attr"+i+"_1']").prop('checked', true);
			} else if (attr === "그냥 그래요") {
				$("input[id='ur_Attr"+i+"_2']").prop('checked', true);
			} else {
				$("input[id='ur_Attr"+i+"_3']").prop('checked', true);
			}
		}
		// 라디오 버튼에 값 넣기(집 평가)
		for (var i=1; i<7; i++) {
			var attr = eval('res_content.res_Attr'+i);
			if (attr === "좋아요") {
				$("input[id='res_Attr"+i+"_1']").prop('checked', true);
			} else if (attr === "그냥 그래요") {
				$("input[id='res_Attr"+i+"_2']").prop('checked', true);
			} else {
				$("input[id='res_Attr"+i+"_3']").prop('checked', true);
			}
		}
		
		// 디테일 요청사항에 값 넣기
		$("#revcontent").text(res_content.res_Detail);
		
		// 집평가 별점 값 넣기
		var num = res_content.res_Rate;
		$(".rating__input[value='"+num+"']").prop('checked', true);
		
	});
</script>

</html>