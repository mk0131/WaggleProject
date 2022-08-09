<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</style>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("xDkhcqAWvvHzWB6YfVIG", "http://localhost:8787/home");
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
			location.href ="/home";
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
		        <div class="swiper-slide"><img src="images/mainhome/frame 2.jpg"><div id="gopagebtn1" onclick="location.href='/board/requestform'"></div></div>
		        <div class="swiper-slide"><img src="images/mainhome/frame 3.jpg"><div id="gopagebtn2" onclick="location.href='/board/list'"></div></div>
				<div class="swiper-slide"><img src="images/mainhome/frame 12.png"></div>
		      </div>
		      <div class="swiper-button-next"></div>
		      <div class="swiper-button-prev"></div>
		      <div class="swiper-pagination"></div>
		    </div>
		    
		    
		   <div class="mainhome-bottom">
		    <div class="homelist-all">
		     <h3 id="homelist-title">오늘 올라온 완료목록</h3>
		    	<img class="homelist" src="images/mainhome/frame 4.png" onclick="location.href='/board/list'">
		    	<img class="homelist" src="images/mainhome/frame 5.png" onclick="location.href='/board/list'">
		    	<img class="homelist" src="images/mainhome/frame 9.png" onclick="location.href='/board/list'">
		    </div>
		    
			    <div class="inquiry-notice">
			     <h3 id="inquiry-notice-title">공지사항</h3>
			     <div class="notice-detail-title" onclick="location.href='/inquiry/list?user_Code=${user_Code}'">[공지] WAGGLE 카카오페이 결제 관련 안내</div>
			     <div class="notice-detail-title" onclick="location.href='/inquiry/list?user_Code=${user_Code}'">[공지] WAGGLE 카카오페이 결제 관련 안내</div>
			     <div class="notice-detail-title" onclick="location.href='/inquiry/list?user_Code=${user_Code}'">[공지] WAGGLE 개인정보 처리방침(2022/08/02) 개정 안내</div>
			     <div class="notice-detail-title" onclick="location.href='/inquiry/list?user_Code=${user_Code}'">[공지] WAGGLE 개인정보 처리방침(2022/06/30) 개정 안내</div>
			     <div class="notice-detail-title" onclick="location.href='/inquiry/list?user_Code=${user_Code}'">[공지] WAGGLE 개인정보 처리방침(2022/05/12) 개정 안내</div>
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
					location.href ="/home";
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