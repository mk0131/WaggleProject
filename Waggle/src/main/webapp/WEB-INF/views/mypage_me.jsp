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

.desc-content {
	display: -webkit-inline-box;
}

textarea:focus ~ label, textarea:valid ~ label {
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

.desc-content-button {
	float: right;
}

#bar_container {
  height: 16px;
  background: #dcdbd7;
  border-radius: 20px;
  border-top: 1px solid #cfcec9;
  border-bottom: 1px solid #f7f6f4;
  box-shadow: 0 -1px 0 #bab9b4;
  margin-bottom: 24px;
  position: relative;
  margin-top: 50px;
}

#progress_bar {
  background-color: #dcf1c6;
  background-image: -webkit-gradient(
    linear,
    center top,
    center bottom,
    color-stop(0%, #9fbff4),
    color-stop(100%, #555bb4)
  );
  background-image: -webkit-linear-gradient(top, #9fbff4 0%, #555bb4 100%);
  background-image: -moz-linear-gradient(top, #9fbff4 0%, #555bb4 100%);
  background-image: -ms-linear-gradient(top, #9fbff4 0%, #555bb4 100%);
  background-image: -o-linear-gradient(top, #9fbff4 0%, #555bb4 100%);
  background-image: linear-gradient(to bottom, #ffd12b 0%, #ffb100 100%);
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
						<div style="font-weight: bold; font-size: 20pt">10000 P</div>
						<div>
							<a href="/point" style="color: #2d7eac">포인트 충전하기</a>
						</div>
					</div>
					<div class="profile-right"
						style="display: inline-block; margin-left: 40px; text-align: left">
						<div>
							<span
								style="font-size: 20pt; margin-bottom: 20px; font-weight: bold">user
								님</span><span style="float: right; font-size: 20pt">1 등급</span>
						</div>
						<div style="font-size: 14pt">나이: xx</div>
						<div style="font-size: 14pt; margin-bottom: 60px">성별: 남</div>
						<div style="font-size: 14pt; font-weight: bold">내가 딴 꿀 수확량!</div>
							<div id="bar_container">
								<div id="progress_bar">
									<div id="progress_percentage" data-percentage="10">
										<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
											width="100%" height="100%"
											viewBox="0 0 1280.000000 1416.000000"
											preserveAspectRatio="xMidYMid meet">
         								 	 <g
												transform="translate(0.000000,1216.000000) scale(0.100000,-0.100000)"
												fill="#000000" stroke="none">
             								 <path
												d="M8320 12153 c-440 -44 -844 -292 -1102 -677 -348 -520 -382 -1212
													-87 -1765 64 -119 111 -188 205 -301 40 -49 68 -87 61 -85 -40 15 -1156 307
													-1172 307 -26 0 -1866 -499 -1876 -509 -4 -4 -170 -368 -369 -808 -383 -849
													-378 -839 -611 -1251 -82 -147 -147 -270 -142 -274 8 -8 674 -163 678 -158 1
													2 295 355 654 786 358 430 658 782 666 782 24 0 469 -112 478 -120 5 -4 -12
													-101 -37 -216 -62 -289 -376 -1739 -437 -2019 -27 -126 -59 -270 -69 -320 -10
													-49 -62 -288 -115 -530 -52 -242 -95 -449 -95 -460 0 -14 -320 -322 -1045
													-1005 -575 -542 -1050 -984 -1055 -983 -5 2 -507 372 -1114 823 l-1105 819
													-316 -155 -315 -156 108 -209 107 -209 645 -843 c355 -464 822 -1075 1039
													-1359 l394 -515 176 72 c97 40 374 153 616 253 242 99 1050 430 1795 735
													l1355 555 1005 261 c553 144 1011 264 1018 266 15 6 -13 73 261 -620 864
													-2188 863 -2185 876 -2185 7 0 149 -18 316 -40 168 -22 306 -35 309 -30 3 5
													32 190 65 411 l59 402 -258 1681 c-142 924 -261 1684 -264 1687 -6 6 -883 160
													-2022 357 -179 30 -326 56 -328 58 -3 1 65 182 465 1244 63 168 207 550 320
													850 112 300 208 549 212 553 7 7 405 -149 1893 -740 274 -109 371 -143 380
													-135 7 6 416 550 908 1210 l895 1199 165 88 c91 49 166 89 168 90 5 4 120 590
													117 596 -2 3 -119 59 -259 124 -234 108 -257 117 -273 103 -10 -8 -518 -425
													-1130 -925 l-1111 -911 -702 468 -701 467 92 17 c399 73 752 309 988 661 135
													201 226 433 267 680 26 156 24 419 -4 577 -129 714 -666 1246 -1342 1328 -80
													9 -222 11 -300 3z" />
								            </g>
								        </svg>
									</div>
								</div>
							</div>

						<!-- div style="margin-bottom:20px">|--------------|</div> -->
						<div>
							<span style="font-size: 11pt; color: #898989">공인중개사이신가요?</span><span><a
								href=""
								style="font-size: 11pt; color: #2d7eac; margin-left: 5px">인증하기</a></span>
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
							<li><a href="#!" onclick="showDescMe();"
								style="color: #000000" class="desc-list1">자기소개</a></li>
							<li><a href="#!" onclick="showFinishlist();"
								class="desc-list2">완료된 리스트</a></li>
							<li><a href="#!" class="desc-list3">이용 횟수</a></li>
						</ul>
					</div>
					<div class="desc-content-aboutme">
						<div class="desc-content">
							<div class="styled-input">
								<textarea required></textarea>
								<label>Message</label>
							</div>
						</div>
						<div></div>
						<div class="desc-content-button">
							<div class="button" style="display: inline-block; width: 150px">
								<p>자기소개 수정하기</p>
							</div>
							<div class="button" style="display: inline-block">
								<p>수정 완료</p>
							</div>
							<div class="button" style="display: inline-block">
								<p>수정 취소</p>
							</div>
						</div>
					</div>
					<div></div>
					<div class="desc-content-finishlist"
						style="margin: 0 auto; width: 900px; display: none">
						<div class="finish-top" style="float: right; width: 900px">
							<div style="float: right">예상거리: ??km</div>
						</div>
						<div class="finish-mid" style="width: 900px">
							<div class="finish-mid-left"
								style="display: inline-block; width: 200px; height: 200px; float: left; border:3px solid #80808075; border-radius: 10px">
								<div class="room-img">img</div>
							</div>
							<div class="finish-mid-right"
								style="display: inline-block; width: 670px; height: 200px; float: right; border:3px solid #80808075; border-radius: 10px">
								<div class="req-desc"
									style="display: inline-block; float: left; height: 200px">
									<p style="margin: 5px 10px; font-size: 16pt">기한 : ??/??/??</p>
									<p
										style="margin: 95px 10px 0 10px; font-size: 16pt; text-align: left">?시간
										전</p>
									<p style="margin: 0 10px; font-size: 16pt">서울특별시 ??동</p>
								</div>
								<div class="req-title" style="display: inline-block">
									<p style="line-height: 150px; font-size: 20pt">동작구 원룸 좀
										봐주세요!</p>
								</div>
								<div class="req-point"
									style="display: inline-block; float: right; height: 200px">
									<p style="font-size: 20pt; line-height: 200px; margin: 0 18px">????P</p>
								</div>
							</div>
						</div>
						<div class="finish-bot" style="width: 900px;">
							<div class="button"
								style="float: left; width: 80px; margin-top: 10px; margin-left: 55px; border-radius: 30px">
								<p style="margin: 5px">완료</p>
							</div>
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

	function showDescMe() {
		$(".desc-content-aboutme").show();
		$(".desc-content-finishlist").hide();
		$(".desc-list1").css("color", "#000000");
		$(".desc-list2").css("color", "#898989");

	}

	function showFinishlist() {
		$(".desc-content-aboutme").hide();
		$(".desc-content-finishlist").show();
		$(".desc-list1").css("color", "#898989");
		$(".desc-list2").css("color", "#000000");

	}
	
	window.addEventListener("load", () => {
		  $("#progress_bar").css({
		    width: "75%"
		  });

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
</html>