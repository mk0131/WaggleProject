<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청상세페이지(모집중)</title>
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
    font-size: 16px;
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
  line-height: 1.4em;
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
	cursor: pointer;
	height: 50px;
	width: 90px;
}

.ongoing21-top {
	display: flex;
    justify-content: center;
    align-items: center;
    padding: 35px 0px 50px 0px;
}

#ongoing21-img img {
	width: 400px;
    height: 400px;
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
    padding-top: 40px;
}

.imp-flex {
	flex: 0 0 auto;
    width: 400px;
    position: relative;
}

.ongoing21-flex {
    padding: 0px 80px 0px 30px;
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
}

.h3-font {
	font-size: 20px;
	margin: 0px 0px 25px 0px;
}


</style>
<body>
	
	<%@ include file="../header.jsp" %>
	 <div id="wrap">
	  <div class="middle">
		<div class="guideline">
			<ul class="guideline-all">
        		<li><i class="fa-solid fa-house"></i>
        		<p>HOME > 요청 상세페이지</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	  
	   <div class="ongoing21-all">
	    <h2 id="ongoing-detail">${req_dto.req_Title }(${req_dto.req_Stat })</h2>
	     <p id="w-date">작성일 ${req_dto.req_WDate }</p>
<%-- 	    <div class="ongoing21-user-name">
	     <p id="username">작성자</p>&nbsp;
	      <p id="userrealname">${user_dto.user_Nm}</p>
	       </div> --%>
	      <div class="ongoing21-middle-bottom">
	      <div class="ongoing21-top">
		   <input type="hidden" name="req_dto.req_No" value="${req_dto.req_No }">
		   
		    <div class="ongoing21-content">
		     <div id="ongoing21-img">
		      <img src=${req_dto.fi_Nm }>
		     </div>
		   </div>
		  </div>
		  
		  <div id="flex-please">
		  <div class="ongoing21-flex">
		    <div class="ongoing21-middle">
		    
		     <h3 class="h3-font">${user_dto.user_Nm}님이 요청하신 내용입니다.</h3>
		    
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
	       <h3 class="h3-font">지원자</h3>
	       
	       
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
												<img class="profile-photo-img" alt="프로필사진o" src="${dto.fi_Nm }">
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
	    	  <div class="imp-title" id="title2"><div class="imp-bold-title">요청 매물과 나와의 거리</div><div class="imp-title-content"></div></div>
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

	      <button type="button" value="요청취소" onclick="location.href='/board/cancel?req_No=${req_dto.req_No}'" style="width: 170px; margin-right: 100px;" >요청 취소하기</button>

	     <button type="button" value="수정하기" onclick="location.href='/board/updateform?req_No=${req_dto.req_No }'" style="width: 170px; margin-right: 100px;" >수정하기</button>

	      <button type="button" value="목록" onclick="location.href='/board/list'" style="width: 170px;">목록으로 돌아가기</button>
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
			 
			 if(nVScroll > 750) {
				 $(".imp").css("position", "fixed").css("top", "135" + "px")
			} 
			else {
				$(".imp").css("position", "absolute").css("top", "40" + "px")
			}
		}); 
		
	</script>
</body>
</html>