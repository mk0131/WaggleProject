<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>Welcome to Waggle</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" 
	rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<style type="text/css">

.swiper {
  width: 100%;
  height: 100%;
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
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.swiper-button-next::after,
.swiper-button-prev::after {
  color: white;
  padding: 100px;
}

.swiper .swiper-pagination-bullet {
  background-color: white;
  margin: 0 10px;
}

#gopagebtn1 {
	width: 500px;
    height: 360px;
    cursor: pointer;
    position: absolute;
}

#gopagebtn2 {
	width: 500px;
    height: 360px;
    cursor: pointer;
    position: absolute;
}

#gopagebtn3 {
	width: 500px;
    height: 360px;
    cursor: pointer;
    position: absolute;
}

.homelist {
	width: 250px;
	border-radius: 16px;
	padding: 10px;
}

.homelist:hover {
	background-color: #ebebeb;
	cursor: pointer;
}

.homelist-all {
	display: inline-block;
	padding-right: 20px;
}

#homelist-title {
	border-bottom: 1px solid #ebebeb;
    padding-bottom: 12px;
}

.mainhome-bottom {
	display: flex;
    /* justify-content: space-evenly; */
    justify-content: center;
    align-items: center;
    padding: 80px 0px 80px 0px;
}

.inquiry-notice {
	height: 352px;
	padding-left: 20px;
	width: 500px;
}

#inquiry-notice-title {
	border-bottom: 1px solid #ebebeb;
    padding-bottom: 12px;
}

.notice-detail-title {
	height: 32px;
	padding: 10px 0px 10px 0px;
	cursor: pointer;
}

.inquiry-notice-inner-content {
	padding: 5px;
	margin: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.inquiry-notice-inner-content a {
	text-decoration: none;
	color: #222;
	letter-spacing: 1px;
}

.inquiry-notice-inner-content a:visited {
	color: #222;
}

#inner-date {
	display: inline-block;
    width: 83px;
    text-decoration: none;
    color: #222;
}

#inner-date:visited {
	color: #222;
}

#notice-inner1 {
	display: flex;
    align-items: center;
    justify-content: space-between;
}

</style>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("xDkhcqAWvvHzWB6YfVIG", "http://15.164.3.37:8787/");
  // 접근 토큰 값 출력
  console.log(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  
    let data = {user_Email : naver_id_login.getProfileData('email'), user_Naver : naver_id_login.getProfileData('id'),
    		user_Nm : naver_id_login.getProfileData('nickname'), user_Gender : naver_id_login.getProfileData('gender')}
    
    $.ajax({
		type : "post",
		url : "/login/naver",
		data : data,
		success : function(result){
			location.href ="/";
		}
	})
    
    
  }
</script>

</head>
<body>
  <%@ include file="header.jsp"%>
	<div id="wrap">
		<div class="section">
		 	<div class="swiper mySwiper">
		      <div class="swiper-wrapper">
		        <div class="swiper-slide"><img src="/images/mainhome/Frame2.jpg"><div id="gopagebtn1" onclick="location.href='/board/requestform'"></div></div>
		        <div class="swiper-slide"><img src="/images/mainhome/Frame3.jpg"><div id="gopagebtn2" onclick="location.href='/board/list'"></div></div>
				<div class="swiper-slide"><img src="/images/mainhome/Frame12.png"></div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		      <div class="swiper-pagination"></div>
		    </div>
		    
		    
		   <div class="mainhome-bottom">
		    <div class="homelist-all">
		     <h3 id="homelist-title">오늘 올라온 완료목록</h3>
		     	<c:if test="${req1 != 0}">
		     		<img class="homelist" src="/images/mainhome/Frame4.png" onclick="location.href='/board/detail?req_No=${req1}'">
				</c:if>
		     	<c:if test="${req1 == 0}">
		     		<img class="homelist" src="/images/mainhome/Frame4.png" onclick="location.href='/board/list'">
				</c:if>
		     	<c:if test="${req2 != 0}">
		     		<img class="homelist" src="/images/mainhome/Frame5.png" onclick="location.href='/board/detail?req_No=${req2}'">
				</c:if>
		     	<c:if test="${req2 == 0}">
		     		<img class="homelist" src="/images/mainhome/Frame5.png" onclick="location.href='/board/list'">
				</c:if>
		     	<c:if test="${req3 != 0}">
		     		<img class="homelist" src="/images/mainhome/Frame9.png" onclick="location.href='/board/detail?req_No=${req3}'">
				</c:if>
		     	<c:if test="${req3 == 0}">
		     		<img class="homelist" src="/images/mainhome/Frame9.png" onclick="location.href='/board/list'">
				</c:if>
		    </div>
		    
			    <div class="inquiry-notice">
			     <h3 id="inquiry-notice-title">공지사항</h3>
		      	  <div class="inquiry-notice-inner">
		      	  
		      	  <c:choose>
		      	  <c:when test="${empty list }">
		      	  	<p>공지사항이 없습니다.</p>
		      	  </c:when>
		      	  <c:otherwise>
			       <c:forEach items="${list }" var="dto">
			       <c:if test="${user_Code != null }">
			        <div id="notice-inner1">
			        <div class="inquiry-notice-inner-content"><a href="/inquiry/list?user_Code=${user_Code }">[공지] ${dto.no_Title }</a></div>
			        <div><a id="inner-date" href="/inquiry/list?user_Code=${user_Code }"><fmt:formatDate value="${dto.no_Date}" pattern="yyyy-MM-dd"/></a></div>
			        </div>
			        </c:if>
			        <c:if test="${user_Code == null }">
			        <div id="notice-inner1">
			        <div class="inquiry-notice-inner-content"><a href="/login">[공지] ${dto.no_Title }</a></div>
			        <div><a id="inner-date"  href="/login"><fmt:formatDate value="${dto.no_Date}" pattern="yyyy-MM-dd"/></a></div>
			        </div>
			        </c:if>
			       </c:forEach>
			       </c:otherwise>
			       </c:choose>
			       
			       </div>
			    </div>
		    </div>
		    	 	
		</div>
	</div>
  <%@ include file="footer.jsp" %>
</body>
<script>
	(function($) { // Begin jQuery
		$(function() { // DOM ready
			// Toggle open and close nav styles on click
			$('#nav-toggle').click(function() {
				$('nav ul').slideToggle();
			});
			// Hamburger to X toggle
			$('#nav-toggle').on('click', function() {
				this.classList.toggle('active');
			});
		}); // end DOM ready
	})(jQuery); // end jQuery
</script>
<script type="text/javascript">
	$(function(){
		
		let url = new URL(window.location.href);
		let urlParams = url.searchParams;
		let data = urlParams.get('code');
		
		if( data != null){
			$.ajax({
				type : "get",
				url : "/login/kakao?code=" + data,
				data : data,
				success : function(result){
					location.href ="/";
				}
				
			})
		}
		
	})

	<!-- Initialize Swiper -->
	/* var swiper = new Swiper(".mySwiper", {
        cssMode: true,
        autoplay: {
        	delay:3000
        },
        loop:true,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev"
        },
        pagination: {
          el: ".swiper-pagination"
        },
        mousewheel: true,
        keyboard: true
      }); */
	
	var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        autoplay: {
        	delay:4000
        },
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