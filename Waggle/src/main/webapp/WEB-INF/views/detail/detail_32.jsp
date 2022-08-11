<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 요청글</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
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
	font-size: 15px;
}

.ongoing21-user-name {
	display: flex;
    font-weight:bold;
    font-size:24pt;
    margin-right:auto;
}
#ongoing-detail {
	text-align: center;
	font-size:20pt;
}
.ongoing21-content {
	display:flex;
  	align-items: center;
  	justify-content: center;
    padding: 25px;
    border-spacing: 50px;
    font-size: 16px;
    width:100%;
}

.ongoing21-content2 {
  	align-items: center;
    padding: 5px;
    border-spacing: 15px;
    font-size: 16px;
    display:inline-block;
}

.ongoing21-content2 div{
	display:inline-block;
	margin-left:20px;
}

.ongoing21-content2 td{
	padding-left:50px;
	padding-bottom:16px;
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
	border: none;
	padding: 10px;
	letter-spacing: .55px;
	font-size: 15px;
}

#userrealname {
	font-weight: bold;
}

#userrealname:hover{
	cursor:pointer;
	color:#898989;
}

#w-date {
	display: flex;
    font-weight: bold;
    margin:0;
    color:#868e96;
    font-size:18px;
}

button {
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
 	width:200px !important;
	height:50px !important;
	font-size:13pt !important;
	margin-right:35px;
	margin-left:35px;
}

button:active {
 outline: none;
 border: none;
 background-color: #353535;
}


#ongoing21-img{
	width:800px;
}
#ongoing21-img img {
	width: 100%;
    height: 100%;
	object-fit: cover;
	border-radius: 8px;
}

.my-hr {
	width: 90%;
	height: 2px;
	background: #e9ecef;
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
	margin-right:110px;
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
  transition: all 1s 0s cubic-bezier(0.83, 0, 0.17, 1);
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



.h3-font {
	font-size: 20px;
	margin: 0px 0px 25px 0px;
}

.profile-img{
	width: 80px;
	height: 80px;
	border-radius: 50%;
	border: 1px solid #f7f9fa;
	vertical-align:middle;
	cursor: pointer;
	aspect-ratio:1;
}

.profile-img:hover{
	box-shadow:2px 2px 2px 2px #b3b3b3;
}

.userinfo-left{
	width: 80px; 
	height: 80px; 
	display: inline-block; 
	margin-left: 70px; 
	margin-right: 10px;
	margin-bottom: 15px;
}
.userinfo-right{
	vertical-align:middle;
}

.userinfo-honey{
	display:inline-block;
	float:right;
	margin-right:80px;
}

/* 요청글 부분 */

.imp {
	border: 1px solid rgb(221, 221, 221);
    border-radius: 12px;
    padding: 24px;
    box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
    width: 345px;
    height: 315px;
    /* margin: 0px 30px 0px 30px; */
   	position: relative;
   	top: 40px;
}

.imp-line {
	border: 1px solid rgb(221, 221, 221);
    border-radius: 8px;
    margin-top:25px;
}

.imp-box {
	display: flex;
}

#title1 {
	flex: 1 1 0%;
	font-size: 14px;
	padding: 15px;
	border-right: 1px solid rgb(221, 221, 221);	
}

#title2  {
	flex: 1 1 0%;
	font-size: 14px;
	padding: 15px;
}

.imp-title {
	font-size: 13px;
}

.imp-title-content {
	font-size: 15px;
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

#imp-text-center1 {
	text-align: center;
	border-bottom: 1px solid rgb(221, 221, 221);
	border-top: 1px solid rgb(221, 221, 221);
	padding: 15px;
}

#imp-text-center2 {
	text-align: center;
	padding: 15px;
}

.b-line {
	border-top-width: 1px;
    border-top-style: solid;
    border-top-color: rgb(245, 245, 245);
}

.ongoing21-middle {
	max-width: 1120px;
    text-align: center;
    display: flex;
    flex-direction: column;
    margin: 0 auto;
    letter-spacing: .25px;
    -webkit-box-flex: 1;
    flex-grow: 1;
    padding-top:20px
}

.imp-flex {
	flex: 0 0 auto;
    width: 400px;
    position: relative;
}

.ongoing21-flex {
    padding: 0px 80px 0px 30px;
    width:50%;
}

#flex-please {
	height: auto;
}

#flex-please {
	width: 1200px;
    height: 100%;
    margin: 0px auto;
    padding: 0px 10px;
    display: flex;
    justify-content:center;
}


.fix {
	position:fixed;
	z-index:100;
}

#user-profile-reply {
	display: flex;
	justify-content: space-around;
	align-items: center;
	padding: 16px 0px;
}

.middle-content {
	display: flex;
	padding: 30px 0px;
	align-items: center;
}

.middle-tcontent {
	padding-left: 20px;
	color: #000000;
	text-decoration: none;
	word-break: break-all;
}

.middle-tcontent:visited {
	padding-left: 20px;
	color: #000000;
	text-decoration: none;
}

.middle-title {
	width: 160px;
    font-size: 16px;
    line-height: 26px;
    font-weight: 700;
}

.imp-bold-title {
	font-weight: bold;
	font-size:15px;
}

.detail-point {
	padding: 30px 0px;
	text-align: right; 
	width: 750px; 
	font-size: 16pt;
}

.detail-end {
	display: flex;
    flex-direction: column;
    align-items: center;
    padding: 16px 0px;
}

#show-box {
   display: none;
}

/* 요청글 부분 */

/* 평가 부분 */
#hide-box{
	width: 1200px;
	margin:0 auto;
	text-align:center;
}

.full-rating{
	width:1200px;
	margin:0 auto;
	margin-bottom:50px;
	text-align:center;
}

/* 버튼 부분 */
.btn1{
	float:right;
}
.btn2{
	width:1200px;
	margin:0 auto;
	text-align:center;
	margin-top:70px;
}
.last-content{
	width:1200px;
	margin:0 auto;
	text-align:center;
	
}

/* 꿀벌 css */

.profile-photo-img {
	width: 100px; 
	height: 100px; 
	border-radius: 50%;; 
	padding: 16px;
}

.bubble-text {
	display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0px 5px;
}

.bubble-text-inner {
	display: inline-block;
	font-weight: bold;
}

#bubble-user-intro {
	padding: 0px 5px;
	margin:0px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	line-height: 1.4em;
}

.h3-font {
	font-size: 20px;
	margin: 0px 0px 25px 0px;
	padding-top:10px;
	border-top: 2px solid #e9ecef;
}

.bubble {
  width: 420px;
  line-height: 0.4em;
  height:100px;
  padding: 20px;
  padding-top:0;
  padding-bottom:0;
  margin-top:18px;
  background-color: rgb(250, 250, 250);
  position: relative;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;
  -ms-border-radius: 8px;
  -o-border-radius: 8px;
  border-radius: 8px;
  text-align: left;
  display: inline-block; 
  float:right;
}

.bubble:hover > .over-bubble {
    opacity: 1; 
}

.over-bubble {
	line-height: 1.4em;
	background-color: rgba(236, 240, 241, 0.8);
	position: relative;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	-ms-border-radius: 8px;
	-o-border-radius: 8px;
	border-radius: 8px;
	text-align: center;
	display: flex;
	position: absolute !important;
	justify-content: center;
	align-items: center;
	height: 100%;
	width: 100%;
	opacity: 0;
	top: 0;
	left: 0;
	z-index: 999;
	-webkit-transition-property: all;
	-moz-transition-property: all;
	-o-transition-property: all;
	transition-property: all;
	-webkit-transition-duration: 0.3s;
	-moz-transition-duration: 0.3s;
	-o-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-timing-function: ease-in;
	-moz-transition-timing-function: ease-in;
	-o-transition-timing-function: ease-in;
	transition-timing-function: ease-in;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
}

/* 슬라이드 css */

.swiper {
	width: 800px;
	height: 600px;
}

.swiper-slide {
	 text-align: center;
	 font-size: 18px;
	 background: #fff;

  /* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 600px;
	height: 600px;
	object-fit: cover;
	border-radius:20px;
}

.swiper {
	margin-left: auto;
	margin-right: auto;
}

.swiper-button-next::after,
.swiper-button-prev::after {
  color: #495057;
  padding: 100px;
}

.swiper .swiper-pagination-bullet {
  background-color: black;
  margin: 0 10px;
}

/* 슬라이드 css 끝 */

</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div id="wrap">
		<div class="middle">
			<div class="guideline">
				<ul class="guideline-all">
					<li><a href="javascript:void(0)"> <i
							class="fa-solid fa-house"></i>
					</a>
						<p>HOME > 꿀단지목록 > 요청글</p></li>
				</ul>
			</div>
		</div>
		<div class="ongoing21-all">
			<h3 id="ongoing-detail">${req_dto.req_Title }(${req_dto.req_Stat })</h3>
			<div class="ongoing21-middle-bottom">
				<div class="ongoing21-top">
					<input type="hidden" name="req_dto.req_No"
						value="${req_dto.req_No }">

					 <div class="swiper mySwiper">
				      <div class="swiper-wrapper">
				       <c:choose>
						<c:when test="${file eq '[null]' }">
				         <div class="swiper-slide">
				        	<img src="/images/importToJsp/detail_default_img2.png" alt="방사진">
				         </div>
				        </c:when>
				        
				        <c:otherwise>
						 <c:forEach items="${file }" var="dto">
						  <c:choose>
						   <c:when test="${dto.fi_Type eq 'img' }">
				            <div class="swiper-slide">
				             <img src="${dto.fi_Nm }" alt="방사진">
				            </div>
						    </c:when>
						   
						  <c:otherwise>
						  <div class="swiper-slide">
						   <video controls width="600px"><source src="${dto.fi_Nm }"> </video>
						  </div>
						  </c:otherwise>
						 </c:choose>
						</c:forEach>		    	
					   </c:otherwise>
					  </c:choose>  
						    
				      </div>
				      <div class="swiper-button-next"></div>
				      <div class="swiper-button-prev"></div>
				      <div class="swiper-pagination"></div>
				    </div>
					
				</div>
				<div class="info-content" style="width: 1300px; margin: 0 auto;">
					<div class="userinfo-left"
						onclick="window.open('/mypage/other?ucode=${user_dto.user_Code}')">
						<c:if test="${user_dto.user_Pro == 0}">
							<img src="/images/importToJsp/profile_default.jpg"
								class="profile-img" />
						</c:if>
						<c:if test="${user_dto.user_Pro != 0 }">
							<img src="${Pro_fi_Nm }" class="profile-img" onerror=this.src="/images/importToJsp/profile_default.jpg"/>
						</c:if>
					</div>
					<div class="userinfo-right" style="display: inline-block;">
						<div class="ongoing21-user-name">
							<span id="userrealname"
								onclick="window.open('/mypage/other?ucode=${user_dto.user_Code}')">${user_dto.user_Nm}</span>
						</div>
						<fmt:parseDate value="${req_dto.req_WDate }"
							pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
						<p id="w-date">
							작성일
							<fmt:formatDate value="${parsedDateTime }" pattern="yyyy-MM-dd" />
						</p>
					</div>

					<div
						style="border-bottom: 2px solid #e9ecef; width: 90%; margin: 0 auto;"></div>
				</div>
				<div id="flex-please">
					<div class="ongoing21-flex">
						<div class="ongoing21-middle">
							<div class="middle-content">
								<div class="middle-title">
									내가 본 집 링크 첨부<br />(ex.직방, 다방 등등..)
								</div>
								<a class="middle-tcontent" id="link" href="" target="_blank">${req_dto.req_Link }</a>
							</div>
							<div class="b-line"></div>
							<div class="middle-content">
								<div class="middle-title">방문기한</div>
								<div class="middle-tcontent">${req_dto.req_EDate }</div>
							</div>
							<div class="b-line"></div>
							<div class="middle-content">
								<div class="middle-title">내가 본 집 주소</div>
								<div class="middle-tcontent">${req_dto.home_Addr }</div>
							</div>
							<div class="b-line"></div>
							<div class="middle-content">
								<div class="middle-title">상세주소</div>
								<div class="middle-tcontent">${req_dto.home_DAddr }</div>
							</div>
							<div class="b-line"></div>
							<div class="middle-content">
								<div class="middle-title">공인중개사 연락처</div>
								<div class="middle-tcontent">${req_dto.req_Phone }</div>
							</div>
							<div class="b-line"></div>
							<div class="middle-content">
								<div class="middle-title">자세하게 봐야 될 부분</div>
								<div class="middle-tcontent">${req_dto.req_Detail }</div>
							</div>
						</div>
						<div class="ongoing21-content-bottom">
							<br> <br>
							<h3 class="h3-font">일을 진행중인 꿀벌 정보</h3>
							<c:choose>
								<c:when test="${not empty bee_img }">
									<img class="profile-photo-img" alt="프로필사진o" src="${bee_img }" onerror=this.src="/images/importToJsp/profile_default.jpg">
								</c:when>
								<c:otherwise>
									<img class="profile-photo-img" alt="프로필사진x"
										src="/images/importToJsp/profile_default.jpg">
								</c:otherwise>
							</c:choose>
							<div class="bubble"
								onclick="window.open('/mypage/other?ucode=${bee_dto.user_Code}')">
								<div class="bubble-text">
									<h4 class="bubble-text-inner" style="font-size: 16pt;">${bee_dto.user_Nm }
										님</h4>
									<P class="bubble-text-inner" style="font-size: 15px;">평점
										${bee_dto.user_Grade }</P>
								</div>
								<P id="bubble-user-intro">${bee_dto.user_Intro }</P>
								<div class="over-bubble">클릭 시 꿀벌의 프로필 창이 켜집니다.</div>
							</div>
						</div>
					</div>
					<div class="imp-flex">
						<div class="imp-all" style="position: static;">
							<div class="imp">
								<h3>요약 정보</h3>
								<div class="imp-line">
									<div class="imp-box">
										<div class="imp-title" id="title1">
											<div class="imp-bold-title">방문기한</div>
											<div class="imp-title-content">${req_dto.req_EDate }</div>
										</div>
										<div class="imp-title" id="title2">
											<div class="imp-bold-title">요청 매물의 주소</div>
											<div class="imp-title-content" id="distance">${req_dto.home_Addr }</div>
										</div>
									</div>


									<div class="imp-title" id="imp-text-center1">
										<div class="imp-bold-title">포인트 비용</div>
										<div class="imp-title-content" id="imp-content-other1">${req_dto.req_Point }P</div>
									</div>

									<div class="imp-title" id="imp-text-center2">
										<div class="imp-bold-title">자세하게 봐야 될 부분</div>
										<div class="imp-title-content" id="imp-content-other2">${req_dto.req_Detail }</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div id="hide-box">
			<br /> <br />
			<hr class="my-hr">
			<br>
			<h2 style="color:#868e96;">꿀벌이 요청 매물을 이렇게 평가했어요!</h2>
			<table class="ongoing21-content2">
				<tbody>
					<tr id="choice-name">
						<th>일조량</th>
					</tr>
					<tr id="choice-option">
						<td>
							<div id="choice-option-all">
								<div>
									<input type="radio" id="res_Attr1_1" name="res_Attr1">
									<label for="res_Attr1_1">좋아요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr1_2" name="res_Attr1">
									<label for="res_Attr1_2">보통이에요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr1_3" name="res_Attr1">
									<label for="res_Attr1_3">별로에요</label>
								</div>
							</div>
						</td>
					</tr>
					<tr id="choice-name">
						<th>수압</th>
					</tr>
					<tr id="choice-option">
						<td>
							<div id="choice-option-all">
								<div>
									<input type="radio" id="res_Attr2_1" name="res_Attr2">
									<label for="res_Attr2_1">좋아요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr2_2" name="res_Attr2">
									<label for="res_Attr2_2">보통이에요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr2_3" name="res_Attr2">
									<label for="res_Attr2_3">별로에요</label>
								</div>
							</div>
						</td>
					</tr>
					<tr id="choice-name">
						<th>외부소음</th>
					</tr>
					<tr id="choice-option">
						<td>
							<div id="choice-option-all">
								<div>
									<input type="radio" id="res_Attr3_1" name="res_Attr3">
									<label for="res_Attr3_1">좋아요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr3_2" name="res_Attr3">
									<label for="res_Attr3_2">보통이에요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr3_3" name="res_Attr3">
									<label for="res_Attr3_3">별로에요</label>
								</div>
							</div>
						</td>
					</tr>
					<tr id="choice-name">
						<th>냄새</th>
					</tr>
					<tr id="choice-option">
						<td>
							<div id="choice-option-all">
								<div>
									<input type="radio" id="res_Attr4_1" name="res_Attr4">
									<label for="res_Attr4_1">좋아요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr4_2" name="res_Attr4">
									<label for="res_Attr4_2">보통이에요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr4_3" name="res_Attr4">
									<label for="res_Attr4_3">별로에요</label>
								</div>
							</div>
						</td>
					</tr>
					<tr id="choice-name">
						<th>곰팡이</th>
					</tr>
					<tr id="choice-option">
						<td>
							<div id="choice-option-all">
								<div>
									<input type="radio" id="res_Attr5_1" name="res_Attr5">
									<label for="res_Attr5_1">좋아요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr5_2" name="res_Attr5">
									<label for="res_Attr5_2">보통이에요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr5_3" name="res_Attr5">
									<label for="res_Attr5_3">별로에요</label>
								</div>
							</div>
						</td>
					</tr>
					<tr id="choice-name">
						<th>벌레</th>
					</tr>
					<tr id="choice-option">
						<td>
							<div id="choice-option-all">
								<div>
									<input type="radio" id="res_Attr6_1" name="res_Attr6">
									<label for="res_Attr6_1">좋아요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr6_2" name="res_Attr6">
									<label for="res_Attr6_2">보통이에요</label>
								</div>
								<div>
									<input type="radio" id="res_Attr6_3" name="res_Attr6">
									<label for="res_Attr6_3">별로에요</label>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="review_containser">
				<span style="font-size: 14pt; font-weight: bold">매물에 대한 자세한
					설명</span><br>
				<textarea id="revcontent" rows="18" cols="40"
					placeholder="디테일 리뷰가 없습니다." readonly="readonly" style="font-family: 'Noto Sans KR', 'Helvetica Neue', Helvetica, Arial, sans-serif;"></textarea>
			</div>
			<br /> <br />
			<div class="full-rating">
				<h4>전체적인 집 평가는 이렇대요!</h4>
				<div id="full-stars-example-two">
					<div class="rating-group">
						<input disabled checked class="rating__input rating__input--none"
							name="rating3" id="rating3-none" value="0" type="radio">
						<label aria-label="1 star" class="rating__label" for="rating3-1"><i
							class="rating__icon rating__icon--star fa fa-star"></i></label> <input
							class="rating__input" name="rating3" id="rating3-1" value="1"
							type="radio"> <label aria-label="2 stars"
							class="rating__label" for="rating3-2"><i
							class="rating__icon rating__icon--star fa fa-star"></i></label> <input
							class="rating__input" name="rating3" id="rating3-2" value="2"
							type="radio"> <label aria-label="3 stars"
							class="rating__label" for="rating3-3"><i
							class="rating__icon rating__icon--star fa fa-star"></i></label> <input
							class="rating__input" name="rating3" id="rating3-3" value="3"
							type="radio"> <label aria-label="4 stars"
							class="rating__label" for="rating3-4"><i
							class="rating__icon rating__icon--star fa fa-star"></i></label> <input
							class="rating__input" name="rating3" id="rating3-4" value="4"
							type="radio"> <label aria-label="5 stars"
							class="rating__label" for="rating3-5"><i
							class="rating__icon rating__icon--star fa fa-star"></i></label> <input
							class="rating__input" name="rating3" id="rating3-5" value="5"
							type="radio">
					</div>
				</div>
			</div>
		</div>


		<div class="btn2" id="btn2">
			<form action="/board/reCompleteForm" method="post"
				style="display: inline-block;">
				<input type="hidden" name="req_No" value="${req_dto.req_No }">
				<input type="hidden" name="userName" value="${user_dto.user_Nm}">
				<button type="submit" value="수정">집 평가 수정하기</button>
			</form>
			<button type="button" value="목록"
				onclick="location.href='/board/list'">목록으로 돌아가기</button>
		</div>

	</div>

	<!-- 
	   <div class="ongoing21-all">
	    <h3 id="ongoing-detail">요청 상세 페이지(${req_dto.req_Stat })</h3>
	     <p id="w-date">요청날짜 : 
	     	<fmt:parseDate value="${req_dto.req_WDate }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
	     	<fmt:formatDate value="${parsedDateTime }" pattern="yyyy-MM-dd"/>
     	</p>
	     <div class="ongoing21-user-name">
	      <p id="userrealname">작성자 : ${user_dto.user_Nm}</p>
	     </div>
	    <div class="ongoing21-all">
	   
	    <table class="ongoing21-content">
	     <tbody>
	      <tr>
	       <th>제목</th>
	       <td>${req_dto.req_Title }</td>
	      </tr>
	      <tr>
	       <th>내가 본 집 링크 첨부(ex.직방, 다방 등등..)</th>
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
	       <th colspan="2">자세하게 봐야 될 부분</th>
	      </tr>
	      </tbody>
	     </table>
	     <div class="ongoing21-content-bottom">
	       <textarea id="incontent" rows="12" cols="70" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea>
	       
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
		    <c:choose>
		    	<c:when test="${file eq '[null]' }">
		    		<div>디테일 사진이 존재하지 않습니다.</div>
		    	</c:when>
		    	<c:otherwise>
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
		    	</c:otherwise>
		    </c:choose>
		    </div>
		    <div id="review_containser">
		     <span style="font-size: 12pt;">간단한 집 평가</span><br>
		     <textarea id="revcontent" rows="30" cols="40"  placeholder="디테일 리뷰가 없습니다." readonly="readonly"></textarea>
		    </div>
		   </div>
		   <br/><br>
		   <hr class="my-hr">
		   
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

		   <br/><br/>
	       <div class="btn2" id="btn2">
	        <form action="/board/reCompleteForm" method="post" style="display: inline-block;">
	         <input type="hidden" name="req_No" value="${req_dto.req_No }">
	         <input type="hidden" name="userName" value="${user_dto.user_Nm}">
		     <button type="submit" value="수정">집 평가 수정하기</button>
		    </form>
	       <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
	      </div>
	      
	     </div>
	    </div>
	   </div>
	   -->

	<%@ include file="../footer.jsp" %>
</body>
<script type="text/javascript">
	var res_content = ${res_dto};

	$(function(){
		// 내가본 집 링크 연결
		let link = $("#link").text();
		if (link.includes("https://")) {
			$("#link").attr('href',link);
		} else {
			$("#link").attr('href',"https://"+link);			
		}
		
		// 라디오 버튼 사용 불가능하게 만들기
		$("input[type='radio']").attr('disabled', true);
		$(".rate_bee_table input[type='radio']").attr('disabled', false);
		// $(".rating-group input[type='radio']").attr('disabled', false);
		
		// 라디오 버튼에 값 넣기(집 평가)
		for (var i=1; i<7; i++) {
			var attr = eval('res_content.res_Attr'+i);
			if (attr === "좋아요") {
				$("input[id='res_Attr"+i+"_1']").prop('checked', true);
			} else if (attr === "보통이에요") {
				$("input[id='res_Attr"+i+"_2']").prop('checked', true);
			} else {
				$("input[id='res_Attr"+i+"_3']").prop('checked', true);
			}
		}
		
		// 디테일 요청사항에 값 넣기 & 높이 조정
		$("#revcontent").text(res_content.res_Detail);
		
		
		// 집평가 별점 값 넣기
		var num = res_content.res_Rate;
		$(".rating__input[value='"+num+"']").prop('checked', true);
		
		// 꿀벌 평가 보통으로 세팅해놓기
		for (var i=1; i<4; i++) {
			$("input[id='ur_Attr"+i+"_2']").prop('checked', true);
		}
		
		// 꿀벌 평가 게이지바 중간값으로 세팅
		$("#progress_bar").css({
		    width: 50+"%"
		});
		
		
	});
	공지
	// 버경고튼 클릭시 꿀벌 평가 게이지바 조정
	$(".rate_bee").click(function(){
		var val1 = parseInt($("input[name='ur_Attr1']:checked").val());
		var val2 = parseInt($("input[name='ur_Attr2']:checked").val());
		var val3 = parseInt($("input[name='ur_Attr3']:checked").val());
		
		var val_sum = val1 + val2 + val3;

		// 꿀벌 평점 -3~3을 0~100로 정규화
		var percent_val = ((val_sum + 3)/6)*100;
		
		$("#progress_bar").css({
		    width: percent_val+"%"
		});
		
		// ur_rate 값 지정
		$("#bee_rating").prop('value', val_sum);
	});
	
</script>
<script>
$(window).scroll(  function() {
	 var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
	 var currentPosition = parseInt($(".imp").css("top")); 
	 
	 if(nVScroll > 930 && nVScroll <=1300) {
		 $(".imp").css("position", "fixed").css("top", "135" + "px")
	} else if(nVScroll > 1300){
		$(".imp").css("position", "relative").css("top", "450" + "px")
	}
	else {
		$(".imp").css("position", "relative").css("top", "40" + "px")
	}
}); 

var swiper = new Swiper(".mySwiper", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

</script>
</html>