<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Waggle 수행 완료</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
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
    width:700px;
}

.ongoing21-content2 div{
	display:inline-block;
	text-align:center;
}

.ongoing21-content2 td{
	padding-bottom: 25px;
	border-bottom: 1px solid #f1f1f1;
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

#choice-option-all {
	display: flex;
}

#choice-option-all div {
	width: 200px;
}

#btn2 {
	display: inline-block;
	margin:0 auto;
	width:1200px;
	text-align:center;
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
	margin-left:25px;
	margin-right:25px;
}

button:active {
 outline: none;
 border: none;
 background-color: #353535;
}

.my-hr {
	width: 90%;
	height: 2px;
	background: #e9ecef;
	border: 0 none;
}


div#file_container img {
	width: 100%;
	height: 200px;
}

div#file_container{
	width: 300px;
	margin:0 auto;
}

div#review_containser{
	width: 400px;
	float: right;
	display:inline-block;
	
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


/* 파일 업로드 css 시작 */
#upload{
	float: left;
	clear: both;
	width: 100%;
	padding: 2rem 1.5rem;
	text-align: center;
	background: #fff;
	border-radius: 7px;
	border: 3px solid #eee;
	box-sizing: border-box;
	transition: all .2s ease;
	user-select: none;
	color: #5f6982;
	margin-bottom:25px;
}

#upload:hover{
	border-color: #454cad;
}

#file-upload{
	display: none;
}

#error{
	display: none;
	color: red;
	margin-bottom: 5px;
}

#warning{
	display: none;
	color: orange;
	margin-bottom: 5px;
}

#files{
	display: block;
}

#files .file-thumb{
	display: inline-block;
	margin: 5px;
	position: relative;
	border-radius: 5px;
	border: 1px solid black;
}

#files img{
	height: 7.5em;
	object-fit: cover;
}

#files .file-thumb .fa-times{
	position: absolute;
	right: 0;
	top: 0;
	color: black;
	margin: 3px;
}

#files .progress{
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
}

#files .progress .fill{
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 0%;
	background-color: rgba(0, 0, 0, 0.5);
	transition: width 0.2s ease;
}

#files .progress .value{
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}

#files .file-thumb .status{
	position: absolute;
	height: 1em;
	width: 1em;
	border-radius: 2px;
	border: 1px solid black;
	background-color: white;
	bottom: -0.3em;
	right: -0.3em;
	color: green;
}

#icon{
	font-size: 4rem;
	margin-bottom: 1rem;
	transition: all .2s ease-in-out;
}

.hover{
	border: 3px solid #454cad !important;
	box-shadow: inset 0 0 0 6px #eee;
}

.hover #icon{
	transform: scale(0.8);
	opacity: 0.3;
}

#btn{
	display: inline-block;
	background-color: #454cad;
	color: white;
	padding: 8px 12px;
	margin: 10px 0;
	border-radius: 5px;
}

#upload-btn{
	display: none;
	color: white;
	height: 3em;
	width: 15em;
	border-radius: 5px;
	background-color: #4564ad;
}

#upload-btn:focus{
	outline: none;
}

/*파일 업로드 css 끝 */


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

.review-container-radio{
	margin:0 auto;
	width: 1120px;
}

h4{
	text-align:center;
	font-size:20pt;
	margin-bottom:25px;
	color:#868e96;
}	
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
						<p>HOME > 요청글 > 심부름 완료하기</p></li>
				</ul>
			</div>
		</div>


		<div class="ongoing21-all">
			<h3 id="ongoing-detail">심부름 완료하기</h3>
			<div class="ongoing21-middle-bottom">
				<div class="ongoing21-top">
					<input type="hidden" name="req_dto.req_No"
						value="${req_dto.req_No }">

					<div class="swiper mySwiper">
						<div class="swiper-wrapper">
							<c:choose>
								<c:when test="${file eq '[null]' }">
									<div class="swiper-slide">
										<img src="/images/importToJsp/detail_default_img2.png"
											alt="방사진">
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
													<video controls width="600px">
														<source src="${dto.fi_Nm }">
													</video>
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
				<div class="info-content" style="width: 1200px; margin: 0 auto;">
					<div class="userinfo-left"
						onclick="window.open('/mypage/other?ucode=${user_dto.user_Code}')">
						<c:if test="${user_dto.user_Pro == 0}">
							<img src="/images/importToJsp/profile_default.jpg"
								class="profile-img" />
						</c:if>
						<c:if test="${user_dto.user_Pro != 0 }">
							<img src="${Pro_fi_Nm }" class="profile-img" />
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
								<div class="middle-title">자세한 요청 사항</div>
								<div class="middle-tcontent">${req_dto.req_Detail }</div>
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
										<div class="imp-bold-title">자세한 요청 사항</div>
										<div class="imp-title-content" id="imp-content-other2">${req_dto.req_Detail }</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="width:1200px; margin:0 auto;">
		<hr class="my-hr">
		</div>
				<!-- 
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
	       <th colspan="2">자세하게 봐야 될 부분</th>
	      </tr>
	      </tbody>
	     </table>
	     <div class="ongoing21-content-bottom">
	       <textarea id="incontent" rows="12" cols="70" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly" style="font-family: 'Noto Sans KR', 'Helvetica Neue', Helvetica, Arial, sans-serif;">${req_dto.req_Detail }</textarea>
	       <br/><br/><hr class="my-hr"><br>
	       		      
		   -->
		<form action="/board/complete" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="req_No" value="${req_dto.req_No }">
			<input type="hidden" name="res_No" value="${req_dto.req_No }">
			<input type="hidden" name="res_UCode" value="${user_Code }">
			<div class="review-container-radio">
				<h4>기본 선택사항</h4>
				<table class="ongoing21-content2">
					<tbody>
						<tr id="choice-name">
							<th>일조량</th>
						</tr>
						<tr id="choice-option">
							<td>
								<div id="choice-option-all">
									<div>
										<input type="radio" id="res_Attr1_1" name="res_Attr1"
											value="좋아요" required> <label for="res_Attr1_1">좋아요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr1_2" name="res_Attr1"
											value="보통이에요"> <label for="res_Attr1_2">보통이에요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr1_3" name="res_Attr1"
											value="별로에요"> <label for="res_Attr1_3">별로에요</label>
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
										<input type="radio" id="res_Attr2_1" name="res_Attr2"
											value="좋아요" required> <label for="res_Attr2_1">좋아요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr2_2" name="res_Attr2"
											value="보통이에요"> <label for="res_Attr2_2">보통이에요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr2_3" name="res_Attr2"
											value="별로에요"> <label for="res_Attr2_3">별로에요</label>
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
										<input type="radio" id="res_Attr3_1" name="res_Attr3"
											value="좋아요" required> <label for="res_Attr3_1">좋아요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr3_2" name="res_Attr3"
											value="보통이에요"> <label for="res_Attr3_2">보통이에요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr3_3" name="res_Attr3"
											value="별로에요"> <label for="res_Attr3_3">별로에요</label>
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
										<input type="radio" id="res_Attr4_1" name="res_Attr4"
											value="좋아요" required> <label for="res_Attr4_1">좋아요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr4_2" name="res_Attr4"
											value="보통이에요"> <label for="res_Attr4_2">보통이에요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr4_3" name="res_Attr4"
											value="별로에요"> <label for="res_Attr4_3">별로에요</label>
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
										<input type="radio" id="res_Attr5_1" name="res_Attr5"
											value="좋아요" required> <label for="res_Attr5_1">좋아요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr5_2" name="res_Attr5"
											value="보통이에요"> <label for="res_Attr5_2">보통이에요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr5_3" name="res_Attr5"
											value="별로에요"> <label for="res_Attr5_3">별로에요</label>
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
										<input type="radio" id="res_Attr6_1" name="res_Attr6"
											value="좋아요" required> <label for="res_Attr6_1">좋아요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr6_2" name="res_Attr6"
											value="보통이에요"> <label for="res_Attr6_2">보통이에요</label>
									</div>
									<div>
										<input type="radio" id="res_Attr6_3" name="res_Attr6"
											value="별로에요"> <label for="res_Attr6_3">별로에요</label>
									</div>
								</div>
							<td>
						</tr>
					</tbody>
				</table>

				<div id="review_containser">
					<span style="font-size: 12pt; font-weight:bold">요청 매물의 자세한 평가</span>
					<textarea id="revcontent" rows="18" cols="40" name="res_Detail"
						placeholder="디테일 리뷰가 없습니다."></textarea>
				</div>
			</div>

			<br />
			<div style="width: 1200px; margin: 0 auto;">
				<hr class="my-hr">
			</div>
			<h4>요청매물 자세한 파일 업로드</h4>
			<div id="detail_container">
				<div id="file_container">
					<div id="multi-file-upload"></div>
				</div>

			</div>
			<div style="width: 1200px; margin: 0 auto;">
				<hr class="my-hr">
			</div>
			
			<div class="last-rating-container" style="width:1200px; margin: 0 auto;">
			<h4>집이 어땠나요?</h4>
			<div id="full-stars-example-two" style="text-align:center;">
				<div class="rating-group">
					<input disabled checked class="rating__input rating__input--none"
						name="res_Rate" id="rating3-none" value="0" type="radio">
					<label aria-label="1 star" class="rating__label" for="rating3-1"><i
						class="rating__icon rating__icon--star fa fa-star"></i></label> <input
						class="rating__input" name="res_Rate" id="rating3-1" value="1"
						type="radio"> <label aria-label="2 stars"
						class="rating__label" for="rating3-2"><i
						class="rating__icon rating__icon--star fa fa-star"></i></label> <input
						class="rating__input" name="res_Rate" id="rating3-2" value="2"
						type="radio"> <label aria-label="3 stars"
						class="rating__label" for="rating3-3"><i
						class="rating__icon rating__icon--star fa fa-star"></i></label> <input
						class="rating__input" name="res_Rate" id="rating3-3" value="3"
						type="radio"> <label aria-label="4 stars"
						class="rating__label" for="rating3-4"><i
						class="rating__icon rating__icon--star fa fa-star"></i></label> <input
						class="rating__input" name="res_Rate" id="rating3-4" value="4"
						type="radio"> <label aria-label="5 stars"
						class="rating__label" for="rating3-5"><i
						class="rating__icon rating__icon--star fa fa-star"></i></label> <input
						class="rating__input" name="res_Rate" id="rating3-5" value="5"
						type="radio">
				</div>
			</div>
			<br /> <br /> <br /> <br />
			<div class="btn2" id="btn2">
				<button type="submit" value="완료하기">완료하기</button>
				<button type="button" value="취소"
					onclick="location.href='/board/list'">취소</button>
			</div>
			</div>
		</form>
	</div>

	<%@ include file="../footer.jsp" %>

</body>
<script type="text/javascript">

	$("input[name=myfile]").off().on("change", function(){
	
		if (this.files && this.files[0]) {
	
			var maxSize = 20 * 1024 * 1024;
			var fileSize = this.files[0].size;
	
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
				$(this).val('');
				return false;
			}
		}
	});

</script>
<script>
class Upload{
	constructor(selector){
		this.root = document.querySelector(selector);
		//container upload
		this.obj = document.createElement('div');
		this.obj.setAttribute('id', 'upload');
		this.obj.setAttribute('style','width:300px');
		this.root.appendChild(this.obj);
		//input object
		this.input = document.createElement('input');
		this.input.setAttribute('type', 'file');
		this.input.setAttribute('multiple', 'multiple');
		this.input.setAttribute('name', 'myfile');
		this.input.setAttribute('data-max-file-size', '100MB');
		this.input.setAttribute('id', 'file-upload');
		this.obj.appendChild(this.input);
		//error div
		this.error = document.createElement('div');
		this.error.setAttribute('id', 'error');
		this.obj.appendChild(this.error);
		//warning div
		this.warning = document.createElement('div');
		this.warning.setAttribute('id', 'warning');
		this.obj.appendChild(this.warning);
		//thumbs container
		this.thumbs = document.createElement('div');
		this.thumbs.setAttribute('id', 'files');
		this.obj.appendChild(this.thumbs);
		//download icon
		this.icon = document.createElement('i');
		this.icon.setAttribute('class', 'fa fa-download');
		this.icon.setAttribute('id', 'icon');
		this.obj.appendChild(this.icon);
		//message div
		this.message = document.createElement('div');
		this.message.setAttribute('id', 'message');
		this.message.innerText = '업로드할 이미지를 클릭해주세요';
		this.obj.appendChild(this.message);
		//button
		this.btn = document.createElement('div');
		this.btn.setAttribute('id', 'btn');
		this.btn.innerText = '파일 찾기';
		this.obj.appendChild(this.btn);
		//adding event listeners
		this.input.addEventListener('change', this.__fileSelectHandler__, false);
		this.obj.addEventListener('click', () => {this.input.click()}, false);
		this.obj.addEventListener('drop', this.__fileSelectHandler__, false);
		this.upload.addEventListener('click', this.__upload__, false);
		//file list
		this.files = [];
		this.sizeLimit = this.root.dataset.maxsize?parseFloat(this.root.dataset.maxsize):5;
		this.aboveLimit = [];
	}

	__fileDragHover__  = (e) => {
		e.stopPropagation();
		e.preventDefault();

		this.obj.className = (e.type === 'dragover' ? 'hover' : '');
	}

	__fileSelectHandler__ = (e) => {
		var files = e.target.files || e.dataTransfer.files;
		this.__fileDragHover__(e);
		this.error.style.display = 'none';
		this.message.style.display = 'none';

		var name;

		for (var i = 0, file; file = files[i]; i++) {
			name = this.__parseFile__(file);
			if (name != undefined) {this.aboveLimit.push(name)}
		}
		this.__warning__();
		e.stopPropagation();
		e.preventDefault();
		this.input.value = "";
	}


	__parseFile__ (file){
		var isGood = file.type.indexOf('image')!=-1?true:false;
		var isGood2 = file.type.indexOf('video')!=-1?true:false;
		var isEmpty = () => {
			if (!this.thumbs.childElementCount){
				this.icon.style.display = "block";
				this.message.style.display = "block";
				this.btn.innerText = 'Select a file';
				this.upload.style.display = "none";
			}
		}
		if (isGood){
			this.icon.style.display = "none";
			this.message.style.display = "none";
			this.btn.innerText = "파일 추가하기";
			//creating thumbnail
			var div = document.createElement('div');
			div.setAttribute('class', 'file-thumb');
			div.setAttribute('style', 'width:240px');
			this.thumbs.appendChild(div);
			var img = document.createElement('img');
			img.setAttribute('width','100%');
			img.src = URL.createObjectURL(file);
			div.appendChild(img);
			var prog = document.createElement('div');
			prog.setAttribute('class', 'progress');
			div.appendChild(prog);
			var fill = document.createElement('div');
			fill.setAttribute('class', 'fill');
			prog.appendChild(fill);
			var val = document.createElement('div');
			val.setAttribute('class', 'value');
			val.innerText = '0%';
			prog.appendChild(val);
			var i = document.createElement('i');
			i.setAttribute('class', 'fa fa-times');
			div.appendChild(i);
			//append file to the list
			var obj = {
				file: file,
				node: div,
			};
			//binding click event to close
			i.addEventListener('click', (event) => {
				event.stopPropagation();
				event.preventDefault();
				this.thumbs.removeChild(div);
				var index = this.files.indexOf(obj);
				if (index >= 0){
					this.files.splice(index, 1);
				}
				isEmpty();
			}, false);
		}else if(isGood2){
			this.icon.style.display = "none";
			this.message.style.display = "none";
			this.btn.innerText = "파일 추가하기";
			//creating thumbnail
			var div = document.createElement('div');
			div.setAttribute('class', 'file-thumb');
			div.setAttribute('style', 'width:240px');
			this.thumbs.appendChild(div);
			var video = document.createElement('video');
			video.setAttribute('width','100%');
			video.setAttribute('height','100%');
			video.setAttribute('controls','controls');
			div.appendChild(video);
			var source = document.createElement('source');
			source.src = URL.createObjectURL(file);
			video.appendChild(source);
			var prog = document.createElement('div');
			prog.setAttribute('class', 'progress');
			div.appendChild(prog);
			var fill = document.createElement('div');
			fill.setAttribute('class', 'fill');
			prog.appendChild(fill);
			var val = document.createElement('div');
			val.setAttribute('class', 'value');
			val.innerText = '0%';
			prog.appendChild(val);
			var i = document.createElement('i');
			i.setAttribute('class', 'fa fa-times');
			div.appendChild(i);
			//append file to the list
			var obj = {
				file: file,
				node: div,
			};
			//binding click event to close
			i.addEventListener('click', (event) => {
				event.stopPropagation();
				event.preventDefault();
				this.thumbs.removeChild(div);
				var index = this.files.indexOf(obj);
				if (index >= 0){
					this.files.splice(index, 1);
				}
				isEmpty();
			}, false);
		}else{
			var i = document.createElement('i');
			i.setAttribute('class', 'fa fa-exclamation-circle');
			this.error.textContent = "";
			this.error.appendChild(i);
			this.error.appendChild(document.createTextNode(' Invalid file type'));
			this.error.style.display = "block";
			isEmpty();
		}
	}

	__upload__ = () => {
		var xhr;
		this.error.style.display = "";
		for(var i = 0, file; file = this.files[i]; i++){
			this.__uploadFile__(file);
		}
	}

	__uploadFile__ = (obj) => {
		var xhr = new XMLHttpRequest();
		xhr.upload.addEventListener('loadstart', function(e){
			obj.node.querySelector('.progress').style.display = "block";
			obj.node.querySelector('.fill').style.width = '0%';
			obj.node.querySelector('.value').innerText = "0%";
			obj.node.querySelector('i').style.display = ""
		}, false);
		xhr.upload.addEventListener('progress', (event) => {
			var width = Math.floor((event.loaded/event.total)*100) + '%'
			obj.node.querySelector('.fill').style.width = width;
			obj.node.querySelector('.value').innerText = width;
		}, false);
		xhr.onreadystatechange = (event) => {
			obj.node.querySelector('.progress').style.display = "";
			console.log(xhr.status)
			if (xhr.status == 200){
				if (xhr.status == 200){
					var box = obj.node.querySelector('.status');
					if (box){
						var icon = box.querySelector('i');
						icon.classList.remove('fa-exclamation-circle');
						icon.classList.add('fa-check');
						icon.style.color = 'green';
					} else {
						box = document.createElement('div');
						box.setAttribute('class', 'status');
						var icon = document.createElement('i');
						obj.node.appendChild(box);
						box.appendChild(icon);
						icon.setAttribute('class', 'fa fa-check');
						icon.style.color = 'green';
					}
					this.files.splice(this.files.indexOf(obj), 1);
				} else{
					xhr.abort();
					var box = obj.node.querySelector('.status');
					if (box){
						var icon = box.querySelector('i');
						icon.classList.remove('fa-check');
						icon.classList.add('fa-exclamation-circle');
						icon.style.color = 'red';
					} else {
						box = document.createElement('div');
						box.setAttribute('class', 'status');
						var icon = document.createElement('i');
						obj.node.appendChild(box);
						box.appendChild(icon);
						icon.setAttribute('class', 'fa fa-exclamation-circle');
						icon.style.color = 'red';
					}
					var i = document.createElement('i');
					i.setAttribute('class', 'fa fa-exclamation-circle');
					this.error.textContent = "";
					this.error.appendChild(i);
					this.error.appendChild(document.createTextNode(' Some uploads failed. Click "Upload" to try again.'));
					this.error.style.display = "block";
				}
			}
		}
		xhr.open('POST', '', true);
		xhr.setRequestHeader('X-File-Name', obj.file.name);
		xhr.setRequestHeader('X-File-Size', obj.file.size);
        xhr.setRequestHeader('Content-Type', 'multipart/form-data; boundary=----------');
        //If backend requires use of csrf-token for POST
        // xhr.setRequestHeader("X-CSRFToken", CSRF_TOKEN);
        xhr.send(obj.file);
	}
}

var upload = new Upload('#multi-file-upload');
</script>
<script>
$(window).scroll(  function() {
	 var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
	 var currentPosition = parseInt($(".imp").css("top")); 
	 
	 if(nVScroll > 230 && nVScroll <=350) {
		 $(".imp").css("position", "fixed").css("top", "135" + "px")
	} else if(nVScroll > 350){
		$(".imp").css("position", "relative").css("top", "150" + "px")
	}
	else {
		$(".imp").css("position", "relative").css("top", "40" + "px")
	}
}); 
</script>
<script>
$("#upload").click(function(){
	$(".file-thumb").remove();
})
</script>
</html>