<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.middle {
	margin: 0;
	padding: 0;
}

.middle-profile {
	margin: 0 auto;
	width: 1125px;
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
}

.button {
	background: transparent;
	width: 110px;
	border-radius: 10px;
	border: 3px solid;
	margin-left: 40px;
	float: right;
}

.button p {
	font-family: "Roboto";
	text-align: center;
	text-transform: uppercase;
	color: #2e2e2e;
	user-select: none;
	font-size: 15px;
	font-weight: bold;
}

.button:hover {
	cursor: pointer;
}

.description {
	height: 70px;
	background: #ffffff;
	margin: 40px 40px 0 40px;
	border-bottom: solid;
	border-width: 1px;
}

.desc-nav {
	position: relative;
	width: 750px;
}

.desc-list {
	margin: 0;
	padding: 0;
	list-style: none;
}

.desc-list li {
	float: left;
	position: relative;
}

.desc-list li a, .desc-list a:visited {
	display: block;
	padding: 0 20px;
	line-height: 70px;
	background: transparent;
	color: #898989;
	text-decoration: none;
	font-size: 11pt;
	border-bottom: solid;
	border-width: 5px;
}

.desc-list li a:hover, .desc-list li a:visited:hover {
	color: #000000;
}


.desc-content{
	display: -webkit-inline-box;
}

textarea:focus ~ label,	textarea:valid ~ label {
	font-size: 0.75em;
	color: #999;
	top: -5px;
	-webkit-transition: all 0.225s ease;
	transition: all 0.225s ease;
}

.styled-input {
	float: left;
	width: 760px;
	margin: 1rem 0;
	position: relative;
	border-radius: 4px;
}

.styled-input label {
	color: #999;
	padding: 1.3rem 30px 1rem 30px;
	position: absolute;
	top: 10px;
	left: 0;
	-webkit-transition: all 0.25s ease;
	transition: all 0.25s ease;
	pointer-events: none;
}

textarea {
	padding: 30px;
	border: 0;
	font-size: 1rem;
	background-color: #2d2d2d;
	color: white;
	border-radius: 4px;
	width: 700px;
	min-height: 15em;
}

.desc-content-button{
	float:right;
}
</style>

</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="wrap">
	<div class="middle">
		<div class="guideline">
			<ul class="guideline-all">
				<li><a href="javascript:void(0)"> <i
						class="fa-solid fa-house"></i>
				</a></li>
				<p>HOME > 나의 프로필</p>
			</ul>
		</div>

		<div class="middle-profile">
			<div class="profile" style="text-align: center">
				<div class="profile-left" style="display: inline-block">
					<img src="/images/profile/profile_default.jpg"
						style="width: 100px; height: 100px">
					<div>10000 P</div>
					<div>포인트 충전하기</div>
				</div>
				<div class="profile-right" style="display: inline-block">
					<div>
						<span>user 님</span><span>1 등급</span>
					</div>
					<div>나이: xx</div>
					<div>성별: 남</div>
					<div>내가 딴 꿀 수확량!</div>
					<div>|--------------|</div>
					<div>
						<span>공인중개사이신가요?</span><span><a href="">인증하기</a></span>
					</div>
				</div>
				<div class="profile-bottom">
					<div class="button">
						<p>회원정보 수정</p>
					</div>
				</div>
			</div>
			<div class="description" style="text-align: center">
				<div class="desc-nav">
					<ul class="desc-list">
						<li><a href="#!">자기소개</a></li>
						<li><a href="#!">완료된 리스트</a></li>
						<li><a href="#!">이용 횟수</a></li>
					</ul>
				</div>
				<div class="desc-content">
					<div class="styled-input">
						<textarea required></textarea>
						<label>Message</label>
					</div>
				</div>
				<div></div>
				<div class="desc-content-button">
					<div class="button" style="display:inline-block; width:150px">
						<p>자기소개 수정하기</p>
					</div>
					<div class="button" style="display:inline-block">
						<p>수정 완료</p>
					</div>
					<div class="button" style="display:inline-block">
						<p>수정 취소</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</html>