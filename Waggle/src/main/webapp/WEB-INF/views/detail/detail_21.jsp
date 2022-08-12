<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 요청글</title>
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
	font-weight: bold;
	font-size: 24pt;
	margin-right: auto;
}

#ongoing-detail {
	text-align: center;
}

.ongoing21-content {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 25px;
	border-spacing: 50px;
	font-size: 16px;
	width: 100%;
}

/* #yellow {
	color: #f48c06;
} */
#incontent {
	outline: none;
	resize: none;
	border-radius: 5px;
	box-shadow: rgba(67, 71, 85, 0.27) 0px 0px 0.25em,
		rgba(90, 125, 188, 0.05) 0px 0.25em 1em;
}

#userrealname {
	font-weight: bold;
}

#userrealname:hover {
	cursor: pointer;
	color: #898989;
}
.b-line {
	border-top-width: 1px;
    border-top-style: solid;
    border-top-color: rgb(245, 245, 245);
}
#w-date {
	display: flex;
	font-weight: bold;
	margin: 0;
	color: #868e96;
	font-size: 18px;
}

button {
	font-weight: 600;
	color: #fff;
	background-color: #222;
	border-radius: 12px;
	border: none;
	font-size: 16px;
	font-family: inherit;
	letter-spacing: .14px;
	line-height: normal;
	padding: 11px 11px;
	cursor: pointer;
	width:200px;
	height:50px;
	margin-right:50px;
}

button:active {
	outline: none;
	border: none;
	background-color: #353535;
}

#progress_bar {
	background-color: #dcf1c6;
	height: 110%;
	position: absolute;
	top: -3px;
	left: 0px;
	border-top: 1px solid #e5ebf4;
	border-radius: 20px;
	box-shadow: 0 3px 10px #717171;
	width: 0%;
	transition: all 3s 0s cubic-bezier(0.83, 0, 0.17, 1);;
}

.ongoing21-top {
	display: flex;
	justify-content: center;
	align-items: center;
}

#ongoing21-img {
	width: 800px;
	height: 600px;
}

#ongoing21-img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 8px;
}

.imp {
	border: 1px solid rgb(221, 221, 221);
	border-radius: 12px;
	padding: 24px;
	box-shadow: rgb(0 0 0/ 12%) 0px 6px 16px;
	width: 345px;
	height: 315px;
	/* margin: 0px 30px 0px 30px; */
	position: relative;
	top: 40px;
}

.imp-line {
	border: 1px solid rgb(221, 221, 221);
	border-radius: 8px;
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

#title2 {
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
	border-top: 1px solid rgb(221, 221, 221);
	border-bottom: 1px solid rgb(221, 221, 221);
	padding: 15px;
}

#imp-text-center2 {
	text-align: center;
	padding: 15px;
}

.ongoing21-content-bottom {
	border-bottom: 2px solid #e9ecef;
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
	padding-top: 20px
}

.imp-flex {
	flex: 0 0 auto;
	width: 400px;
	position: relative;
}

.ongoing21-flex {
	padding: 0px 80px 0px 30px;
	width: 50%;
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
	justify-content: center;
}

.fix {
	position: fixed;
	z-index: 100;
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

.h3-font {
	font-size: 20px;
	margin: 0px 0px 25px 0px;
}

.profile-img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	border: 1px solid #f7f9fa;
	vertical-align: middle;
	aspect-ratio:1;
}

.profile-img:hover {
	box-shadow: 2px 2px 2px 2px #b3b3b3;
}

.userinfo-left {
	width: 80px;
	height: 80px;
	display: inline-block;
	margin-left: 70px;
	margin-right: 10px;
	margin-bottom: 15px;
}

.userinfo-right {
	vertical-align: middle;
}

.userinfo-honey {
	display: inline-block;
	float: right;
	margin-right: 80px;
}
/* 꿀 수확량 CSS */
#bar_container {
	height: 10px;
	background: #dcdbd7;
	border-radius: 20px;
	border-top: 1px solid #cfcec9;
	border-bottom: 1px solid #f7f6f4;
	box-shadow: 0 -1px 0 #bab9b4;
	margin-bottom: 24px;
	position: relative;
	margin-top: 10px;
	width: 200px;
}

#progress_bar {
	background-color: #dcf1c6;
	height: 110%;
	position: absolute;
	top: -3px;
	left: 0px;
	border-top: 1px solid #e5ebf4;
	border-radius: 20px;
	box-shadow: 0 3px 10px #717171;
	width: 0%;
	transition: all 3s 0s cubic-bezier(0.83, 0, 0.17, 1);;
}

#progress_percentage {
	position: absolute;
	top: -40px;
	right: -10px;
	width: 40px;
	height: 24px;
	padding-top: 6px;
}

#progress_percentage::before {
	/* used for the border of the arrow */
	content: "";
	position: absolute;
	left: 14px;
	bottom: -11px;
}

#progress_percentage::after {
	/* the actual little arrow in the baloon */
	content: "";
	position: absolute;
	left: 14px;
	bottom: -10px;
}

:root { 
	-clr-white: rgb(255, 255, 255); 
	-clr-black: rgb(0, 0, 0); 
	-clr-light: rgb(245, 248, 255); 
	-clr-light-gray: rgb(196, 195, 196); 
	-clr-blue: rgb(63, 134, 255); 
	-clr-light-blue: rgb(171, 202, 255);
}

.honey-letter {
	font-size: 14pt;
	font-weight: bold;
	margin-bottom: 19px;
	margin-top: 15px;
}
/* 꿀 수확량 CSS */

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

/* */
</style>

</head>
<body>
	<%@ include file="../header.jsp"%>
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
			<h2 id="ongoing-detail">${req_dto.req_Title }(${req_dto.req_Stat })</h2>

			<div class="ongoing21-middle-bottom">
				<div class="ongoing21-top">
					<input type="hidden" name="req_dto.req_No"
						value="${req_dto.req_No }">

					<div class="ongoing21-content">
						<c:if test="${req_dto.fi_Nm == null }">
							<div id="ongoing21-img">
								<img src="/images/importToJsp/detail_default_img.png">
							</div>
						</c:if>
						<c:if test="${req_dto.fi_Nm != null}">
							<div id="ongoing21-img">
								<img src=${req_dto.fi_Nm } onerror=this.src="/images/importToJsp/detail_default_img.png">
							</div>
						</c:if>
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

					<div class="userinfo-honey">
						<div class="honey-letter">${user_dto.user_Nm}님의 꿀 수확량:
							${user_dto.user_Grade}</div>
						<div id="bar_container">
							<div id="progress_bar">
								<div id="progress_percentage" data-percentage="10"></div>
							</div>
						</div>
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
					<input type="hidden" id="v_Date" value="${res_dto2.res_WDate }">
					<div class="ongoing21-content-bottom">
						<br><br>
	      				<h3 class="h3-font">일을 진행중인 꿀벌 정보</h3>
						<c:choose>
							<c:when test="${not empty bee_img }">
								<img class="profile-photo-img" alt="프로필사진o" src="${bee_img }" onerror=this.src="/images/importToJsp/profile_default.jpg">
							</c:when>
							<c:otherwise>
								<img class="profile-photo-img" alt="프로필사진x" src="/images/importToJsp/profile_default.jpg">
							</c:otherwise>
						</c:choose>
						<div class="bubble" onclick="window.open('/mypage/other?ucode=${bee_dto.user_Code}')">
						<div class="bubble-text">
						<h4 class="bubble-text-inner" style="font-size:16pt;">${bee_dto.user_Nm } 님</h4> 
						<P class="bubble-text-inner" style="font-size:15px;">평점 ${bee_dto.user_Grade }</P> 
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
											<div class="imp-bold-title">요청 매물과 나와의 거리</div>
											<div class="imp-title-content"></div>
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
			<div class="detail-end">
				<div class="detail-point">
					<b>포인트 비용 : ${req_dto.req_Point }P</b>
				</div>
				<c:if test="${who eq '제3자'}">
					<div class="btn1" id="btn1">
						<button type="button" value="목록"
							onclick="location.href='/board/list'">목록으로 돌아가기</button>
					</div>
				</c:if>
				<c:if test="${who eq '작성자'}">
					<div class="btn2" id="btn2">
						<button type="button" id="cancel" value="요청취소"
							onclick="location.href='/board/revoke?req_No=${req_dto.req_No}'">요청
							취소</button>
						<button type="button" value="목록"
							onclick="location.href='/board/list'">목록으로 돌아가기</button>
					</div>
				</c:if>
				<c:if test="${who eq '수행자'}">
					<div class="btn3" id="btn3">
						<button type="button" id="vol1"
							onclick="location.href='/vol/undo?vo_UCode=${user_Code}&vo_No=${req_dto.req_No }'">수행취소(24시간
							이내)</button>
						<button type="button" id="vol2"
							onclick="location.href='/vol/lateundo?vo_UCode=${user_Code}&vo_No=${req_dto.req_No }'">수행취소</button>
						<button type="button"
							onclick="location.href='/board/completeform?userName=${user_dto.user_Nm}&req_No=${req_dto.req_No}'">심부름
							완료하기</button>
						<button type="button" value="목록"
							onclick="location.href='/board/list'">목록으로 돌아가기</button>
					</div>
				</c:if>
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
	     <p id="username">작성자 </p>&nbsp;
	      <p id="userrealname">${user_dto.user_Nm}</p>
	       </div>
	    <div class="ongoing21-all">
	   <input type="hidden" name="req_dto.req_No" value="${req_dto.req_No }">
	    <table class="ongoing21-content">
	     <tbody style="border-bottom: 1px solid;">
	      <tr>
	       <th>제목</th>
	       <td>${req_dto.req_Title }</td>
	      </tr>
	      <tr>
	       <th>내가 본 집 링크 첨부<br/>(ex.직방, 다방 등등..)</th>
	       <td><a style="color: #f48c06;" id="link" href="" target="_blank">${req_dto.req_Link }</a></td>
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
	      </tbody>
	     </table>
	     <input type="hidden" id="v_Date" value="${res_dto2.res_WDate }">
	     <div class="ongoing21-content-bottom">
	       <h4>자세하게 봐야 될 부분</h4>
	       <textarea id="incontent" rows="14" cols="80" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea>
	       <br/><br/><br/>
	    <c:if test="${who eq '제3자'}">
	     <div class="btn1" id="btn1">
	      <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
	     </div>
	    </c:if>
	    <c:if test="${who eq '작성자'}">
	     <div class="btn2" id="btn2">
	      <button type="button" id="cancel" value="요청취소" onclick="location.href='/board/revoke?req_No=${req_dto.req_No}'">요청 취소</button>
	      <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
	     </div>
	    </c:if>
	    <c:if test="${who eq '수행자'}">
	     <div class="btn3" id="btn3">
	      <button type="button" id="vol1" onclick="location.href='/vol/undo?vo_UCode=${user_Code}&vo_No=${req_dto.req_No }'">수행취소(24시간 이내)</button>
	      <button type="button" id="vol2" onclick="location.href='/vol/lateundo?vo_UCode=${user_Code}&vo_No=${req_dto.req_No }'">수행취소</button>
	      <button type="button"  onclick="location.href='/board/completeform?userName=${user_dto.user_Nm}&req_No=${req_dto.req_No}'">심부름 완료하기</button>
	      <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
	     </div>
	    </c:if>
	     </div>
	    </div>
	   </div>
	   -->


	</div>
	<%@ include file="../footer.jsp"%>
	<script type="text/javascript">
		$(function(){
			
			var start2 = new Date($("#v_Date").val());
			var end2 = new Date();
			var diffTime2 = (end2.getTime() - start2.getTime()) / (1000*60*60*24);
			if(diffTime2 >= 1 ){
				
				$("#vol1").hide();
				$("#vol2").show();
				
			}else {
				$("#vol1").show();
				$("#vol2").hide();
			}
			
		})
		
		// 내가본 집 링크 연결
		let link = $("#link").text();
		if (link.includes("https://")) {
			$("#link").attr('href',link);
		} else {
			$("#link").attr('href',"https://"+link);			
		}
	</script>
	<script type="text/javascript">
		   $(window).scroll(  function() {
			 var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
			 var currentPosition = parseInt($(".imp").css("top")); 
			 
			 if(nVScroll > 930 && nVScroll <=1300) {
				 $(".imp").css("position", "fixed").css("top", "135" + "px")
			} else if(nVScroll > 1300){
				$(".imp").css("position", "absolute").css("top", "450" + "px")
			}
			else {
				$(".imp").css("position", "absolute").css("top", "40" + "px")
			}
		}); 
		
	</script>
	<script>
	//꿀 수확량 구현
	window.addEventListener("load", () => {
		  if(${user_dto.user_Grade} <= 100){
			  $("#progress_bar").css({
			    width: ${user_dto.user_Grade}+"%"
			  });
		  }else if(${user_dto.user_Grade} > 100){
			  $("#progress_bar").css({
				    width: 100+"%"
				  });
		  }
	  
	  if(${user_dto.user_Grade}>=0 && ${user_dto.user_Grade}<=29){
		  $('#progress_bar').css('background-image','linear-gradient(rgb(199 112 0) 0%, rgb(145 81 0) 100%)');
	  }else if(${user_dto.user_Grade}>=30 && ${user_dto.user_Grade}<=45){
		  $('#progress_bar').css('background-image','linear-gradient(rgb(241 241 241) 0%, rgb(161 161 161) 100%)');
	  }else if(${user_dto.user_Grade}>=46 && ${user_dto.user_Grade}<=60){
		  $('#progress_bar').css('background-image','linear-gradient(rgb(253 255 178) 0%, rgb(225 197 0) 100%)');
	  }else if(${user_dto.user_Grade}>=61 && ${user_dto.user_Grade}<=100){
		  $('#progress_bar').css('background-image','linear-gradient(rgb(202 255 241) 0%, rgb(0 209 132) 100%)');
	  }else{
		  $('#progress_bar').css('background-image','linear-gradient(rgb(196 244 255) 0%, rgb(0 180 209) 100%)');
	  }
	  
	  function animateValue(obj, start, end, duration) {
	    let startTimestamp = null;
	    const step = (timestamp) => {
	      if (!startTimestamp) startTimestamp = timestamp;
	      const progress = Math.min((timestamp - startTimestamp) / duration, 1);
	      obj.innerHTML = Math.floor(progress * (end - start) + start);
	      if (progress < 1) {
	        window.requestAnimationFrame(step);
	      }
	    };
	    window.requestAnimationFrame(step);
	  }

	  const obj = document.getElementById("point_counter");
	  animateValue(obj, 0, 12345, 3000);
	});

</script>
</body>
</html>