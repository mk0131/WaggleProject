<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 요청글</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
</head>
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

 #ongoing-detail {
	text-align: center;
}

.ongoing21-content-bottom {
	text-align: center;
}

.ongoing21-content td {
	width: 380px;
}

/* #yellow {
	color: #f48c06;
} */

#incontent {
	outline: none;
    resize: none;
    border-radius: 5px;
	box-shadow: rgba(67, 71, 85, 0.27) 0px 0px 0.25em, rgba(90, 125, 188, 0.05) 0px 0.25em 1em;
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

.bubble {
  width: 450px;
  line-height: 0.4em;
  padding: 20px;
  background-color: rgb(250, 250, 250);
  position: relative;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;
  -ms-border-radius: 8px;
  -o-border-radius: 8px;
  border-radius: 8px;
  text-align: left;
  display: inline-block; 
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

.accept-btn {
	padding: 15px;
}

#accept-btn-inner {
	height: 50px;
	width: 90px;
}

.ongoing21-top {
	display: flex;
    justify-content: center;
    align-items: center;
}
#ongoing21-img {
	width: 800px;
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
	border-top: 1px solid rgb(221, 221, 221);
	border-bottom: 1px solid rgb(221, 221, 221);
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
    padding-top: 20px;
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

.ongoing21-content-bottom {
	padding-top: 120px;
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

.profile-photo-img {
	width: 80px; 
	height: 80px; 
	border-radius: 75px; 
	padding: 16px;
	aspect-ratio:1;
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
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	line-height: 1.4em;
	}
	

.h3-font {
	font-size: 20px;
	margin: 0px 0px 25px 0px;
}

/* 프로필 유저 정보 css */
#userrealname {
	font-weight: bold;
}

#userrealname:hover{
	cursor:pointer;
	color:#898989;
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

.ongoing21-user-name {
	display: flex;
    font-weight:bold;
    font-size:24pt;
    margin-right:auto;
}

#w-date {
	display: flex;
    font-weight: bold;
    margin:0;
    color:#868e96;
    font-size:18px;
}

.profile-img{
	width: 80px;
	height: 80px;
	border-radius: 50%;
	border: 1px solid #f7f9fa;
	vertical-align:middle;
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
  width:200px;
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
  --clr-white: rgb(255, 255, 255);
  --clr-black: rgb(0, 0, 0);
  --clr-light: rgb(245, 248, 255);
  --clr-light-gray: rgb(196, 195, 196);
  --clr-blue: rgb(63, 134, 255);
  --clr-light-blue: rgb(171, 202, 255);
}

.honey-letter{
	font-size: 14pt; 
	font-weight: bold; 
	margin-bottom:19px; 
	margin-top: 15px;
}
/* 꿀 수확량 CSS */

</style>
<body>
	
	<%@ include file="../header.jsp" %>
	 <div id="wrap">
	  <div class="middle">
		<div class="guideline">
			<ul class="guideline-all">
        		<li><i class="fa-solid fa-house"></i>
        		<p>HOME > 꿀단지목록 > 요청글</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	  
	   <div class="ongoing21-all">
	    <h2 id="ongoing-detail">${req_dto.req_Title }(${req_dto.req_Stat })</h2>
	      <div class="ongoing21-middle-bottom">
	      <div class="ongoing21-top">
		   <input type="hidden" name="req_dto.req_No" value="${req_dto.req_No }">
		   
		    <div class="ongoing21-content">
		    <c:if test="${req_dto.fi_Nm == null }">
		    <div id="ongoing21-img">
		      <img src="/images/importToJsp/detail_default_img.png">
		     </div>
		    </c:if>
		    <c:if test="${req_dto.fi_Nm != null}">
		     <div id="ongoing21-img">
		      <img src=${req_dto.fi_Nm }>
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
							<img src="${Pro_fi_Nm }" class="profile-img" onerror=this.src="/images/importToJsp/profile_default.jpg">
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
						style="border-bottom: 2px solid #e9ecef; width: 94%; margin: 0 auto;"></div>
				</div>

				<div id="flex-please">
		  <div class="ongoing21-flex">
		    <div class="ongoing21-middle">
		    
		      <div class="middle-content"><div class="middle-title">내가 본 집 링크 첨부<br/>(ex.직방, 다방 등등..)</div> <a class="middle-tcontent" id="link" href="" target="_blank">${req_dto.req_Link }</a></div>
		        <div class="b-line"></div>
		     <div class="middle-content"><div class="middle-title">방문기한</div> <div class="middle-tcontent">${req_dto.req_EDate }</div></div>
		       <div class="b-line"></div>
		     <div class="middle-content"><div class="middle-title">내가 본 집 주소</div> <div class="middle-tcontent">${req_dto.home_Addr }</div></div>
		       <div class="b-line"></div>
		     <div class="middle-content"><div class="middle-title">상세주소</div> <div class="middle-tcontent">${req_dto.home_DAddr }</div></div>
		       <div class="b-line"></div>
		     <div class="middle-content"><div class="middle-title">공인중개사 연락처</div> <div class="middle-tcontent">${req_dto.req_Phone }</div></div>
		       <div class="b-line"></div>
		     <div class="middle-content"><div class="middle-title">자세하게 봐야 될 부분</div><div class="middle-tcontent">${req_dto.req_Detail }</div></div>
	
		     
		    </div>
	     
	     
	     
	     <div class="ongoing21-content-bottom">
	       <h3 class="h3-font">지원자 목록</h3>
	       
	       
				<c:choose>
					<c:when test="${empty vol }">
						<td colspan="4">-------------지원자가 없습니다.-------------</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${vol }" var="dto">
							<form id="user-profile-reply">
							<input type="hidden" value="${dto.user_Code }">
									
										<c:choose>
											<c:when test="${not empty dto.fi_Nm }">
												<img class="profile-photo-img" alt="프로필사진o" src="${dto.fi_Nm }" onerror=this.src="/images/importToJsp/profile_default.jpg">
											</c:when>
											<c:otherwise>
												<img class="profile-photo-img" alt="프로필사진x" src="/images/importToJsp/profile_default.jpg">
											</c:otherwise>
										</c:choose>
									
									<div class="bubble" onclick="window.open('/mypage/other?ucode=${dto.user_Code}')">
									
									<div class="bubble-text">
									<h4 class="bubble-text-inner">${dto.user_Nm } 님</h4> 
									<P class="bubble-text-inner">평점 ${dto.user_Grade }</P> 
									</div>	
									
									<P id="bubble-user-intro">${dto.user_Intro }</P>
									
										<div class="over-bubble">클릭 시 지원자의 프로필 창이 켜집니다.</div>
									</div>
									
									<div class="accept-btn"><button id="accept-btn-inner" onclick="location.href='/board/accept?req_UCode=${user_Code}&res_UCode=${dto.user_Code }&req_No=${req_dto.req_No }'" type="button">수락하기</button></div>
									 
									
							</form>
							 <div class="b-line"></div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

	       	<br><br><br>
	        <br><br>
	        
	     </div>
	     
	    </div>
	    
	   <div class="imp-flex"> 
	   <div class="imp-all" style="position: static;">
	    <div class="imp">
	    	<h3>요약 정보</h3>
	     <div class="imp-line">
	    	 <div class="imp-box">
	    	  <div class="imp-title" id="title1"><div class="imp-bold-title">방문기한</div><div class="imp-title-content">${req_dto.req_EDate }</div></div>
	    	  <div class="imp-title" id="title2"><div class="imp-bold-title">요청 매물과 나와의 거리</div><div class="imp-title-content" id="distance"></div></div>
	    	  </div>
	    	  
	    	  
	    	 <div class="imp-title" id="imp-text-center1"><div class="imp-bold-title">포인트 비용</div><div class="imp-title-content" id="imp-content-other1">${req_dto.req_Point }P</div></div>
	    	
	    	<div class="imp-title" id="imp-text-center2"><div class="imp-bold-title">자세하게 봐야 될 부분</div><div class="imp-title-content" id="imp-content-other2">${req_dto.req_Detail }</div></div>
	      </div>
	     </div>
	    </div> 
	   </div>
	    
	    
	    
	    
	   </div>
	   </div>
	   
	   <div class="detail-end">
	    <div class="detail-point"><b>포인트 비용 : ${req_dto.req_Point }P</b> </div>
	   <div class="btn2" id="btn2">

					<button type="button" value="요청취소"
						onclick="location.href='/board/cancel?req_No=${req_dto.req_No}'"
						style="width: 170px; margin-right: 100px;">요청 취소하기</button>

					<button type="button" value="수정하기"
						onclick="location.href='/board/updateform?req_No=${req_dto.req_No }'"
						style="width: 170px; margin-right: 100px;">수정하기</button>

					<button type="button" value="목록"
						onclick="location.href='/board/list'" style="width: 170px;">목록으로
						돌아가기</button>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript">
		// 내가본 집 링크 연결
		let link = $("#link").text();
		if (link.includes("https://")) {
			$("#link").attr('href',link);
		} else {
			$("#link").attr('href',"https://"+link);			
		}
		
		 
		   $(window).scroll(  function() {
			 var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
			 var currentPosition = parseInt($(".imp").css("top")); 
			 
			 if(nVScroll > 930 && nVScroll <=1300) {
				 $(".imp").css("position", "fixed").css("top", "135" + "px")
			} else if(nVScroll > 1300){
				$(".imp").css("position", "relative").css("top", "400" + "px")
			}
			else {
				$(".imp").css("position", "relative").css("top", "40" + "px")
			}
		}); 
		
	</script>
<script type="text/javascript">
	//꿀 수확량 구현
	$(function() {
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
	  
		// 거리
		if(${checking} == 0) {
			var check = false;
		} else {
			var check = true;
			var user_lat = ${user_add.ua_Lat};
			var user_lng = ${user_add.ua_Lng};		
		}
		var home_lat = ${req_dto.home_Lat};
		var home_lng = ${req_dto.home_Lng};

		if(check) {
			var distance = getDistanceFromLatLonInKm(user_lat,user_lng,home_lat,home_lng);
			if(distance > 1) {
				$("#distance").text(distance.toFixed(1)+' Km');					
			} else {
				$("#distance").text( (distance.toFixed(3) * 1000) + ' m');
			}
			
		} else {
			$("#distance").html("??km");
		}
		
		
	});
	
	function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
	    function deg2rad(deg) {
	        return deg * (Math.PI/180)
	    }

	    var R = 6371; // Radius of the earth in km
	    var dLat = deg2rad(lat2-lat1);  // deg2rad below
	    var dLon = deg2rad(lng2-lng1);
	    var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
	    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    var d = R * c; // Distance in km
	    return d;
	}

</script>
</body>
</html>