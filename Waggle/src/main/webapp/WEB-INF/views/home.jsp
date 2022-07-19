<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" 
	rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet" />
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<style type="text/css">

.container {
	max-width: 1000px;
	margin: 0 auto;
}

.navigation {
	height: 70px;
	background: #ffffff;
	margin: 40px;
	margin-bottom: 70px;
	border-bottom: solid;
	border-width: 1px;
}

.brand-container {
	position: absolute;
	padding-left: 20px;
	float: left;
	line-height: 70px;
	text-transform: uppercase;
	font-size: 1.4em;
}

.brand-container a, .brand-container a:visited, .login a, .login a:visited, .login span{
	color: #000000;
	text-decoration: none;
}

.img01, .img02 {
	            position:relative;
}

.img01 > a> svg, .img02 > a > svg {
            position:absolute;
            margin:auto;
            top:0; bottom:0; right:0;
}

.nav-container {
	position: relative;
	float: right;
	width: 750px;
	margin: 0 auto;
}

nav {
	float: left;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

nav ul li {
	float: left;
	position: relative;
}

nav ul li a, nav ul li a:visited {
	display: block;
	padding: 0 20px;
	line-height: 70px;
	background: #ffffff;
	color: #000000;
	text-decoration: none;
}

nav ul li a:hover, nav ul li a:visited:hover {
	background: #2581DC;
	color: #ffffff;
}

.login {
	position: relative;
	padding-right: 20px;
	float: right;
	line-height: 70px;
	font-size: 1em;
}

#wrap {
	padding-top: 50px;
}

.home-image {
	display: flex;
	justify-content: center;
}

.home-image img {
	display: block;
	width: 80%;
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
		<section>
			<div class="home-image">
				<img src="https://images.unsplash.com/photo-1479839672679-a46483c0e7c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2020&q=80">
			</div>
		</section>
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

</script>
</html>