<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 마이페이지</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
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

#point {
	color: #487cbd;
}
#point:hover{
	color: #faaa44 !important;
}

/* 버튼 */
.button {
  color: var(--color);
  transition: 0.25s;
}
.button:hover, .button:focus {
  box-shadow: inset 0 0 0 2em var(--hover);
  border-color: var(--hover);
  color: #fff;
}

.button {
  background: none;
  border-radius: 10px;
  border: 3px solid;
  font: inherit;
  line-height: 1;
  margin: 0.5em;
  width: 110px;
  float: right;
  --color: #262626;
  --hover: #f9a73d;
  font-weight:bold;
  text-align:center;
}
/* 버튼 */
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

.desc-intro {
	width: 900px;
	height: 300px;
	display: inline-block; background : #ffffff;
	padding: 1em;
	border: 1px solid #d4d7e1;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), 0 5px 10px
		rgba(0, 0, 0, 0.05);
	border-radius: 30px;
	overflow: hidden;
	background: #ffffff;
	margin-top:30px;
	font-size:1.2em;
}

textarea:focus ~ label, textarea:valid ~ label {
	font-size: 0.75em;
	color: #999;
	top: -5px;
	display:none;
	-webkit-transition: all 0.225s ease;
	transition: all 0.225s ease;
	padding:1.2em;
}

textarea {
	border: 1px solid #d4d7e1;
	box-shadow: 0 1px 2px rgb(0 0 0 / 5%), 0 5px 10px rgb(0 0 0 / 5%);
	font-size: 1.2rem;
	background-color: #ffffff;
	border-radius: 30px;
	width: 900px;
	height: 300px;
	padding:1em;
}

.styled-input {
	width: 1000px;
	height:350px;
	display:inline-block;
	padding:1em;
	overflow: hidden;
	position: relative;
	margin-top:20px;
	
}

.styled-input label {
	color: #5e5e5e;
	padding: 1.5rem 0 0 3.4rem;
	position: absolute;
	top: 10px;
	left: 0;
	-webkit-transition: all 0.25s ease;
	transition: all 0.25s ease;
	pointer-events: none;
	text-align:left;
}


.desc-content-button {
	float: right;
}

.desc-content-finishlist{
	margin: 0 auto;
	width: 1000px;
	height:900px;
	overflow-y:auto;
	display: none;
	text-align:left;
}


.desc-content-finishlist img{
	width:300px;
	height:300px;
	border-radius:10px;
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

/* 공인중개사 인증 태그 css 시작 */
.upload-area {
  width: 100%;
  max-width: 25rem;
  background-color: var(--clr-white);
  box-shadow: 0 0 15px #898989;
  border: 2px solid #898989;
  border-radius: 24px;
  padding: 2rem 1.875rem 5rem 1.875rem;
  margin: 0 auto;
  text-align: center;
}

.upload-area--open { /* Slid Down Animation */
  animation: slidDown 500ms ease-in-out;
}

@keyframes slidDown {
  from {
    height: 28.125rem; /* 450px */
  }

  to {
    height: 35rem; /* 560px */
  }
}

/* Header */

.upload-area__title {
  font-size: 1.8rem;
  font-weight: 500;
  margin-bottom: 0.3125rem;
}

.upload-area__paragraph {
  font-size: 0.9375rem;
  color: var(--clr-light-gray);
  margin-top: 0;
}

.upload-area__tooltip {
  position: relative;
  color: var(--clr-light-blue);
  cursor: pointer;
  transition: color 300ms ease-in-out;
}

.upload-area__tooltip:hover {
  color: var(--clr-blue);
}

.upload-area__tooltip-data {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -125%);
  min-width: max-content;
  background-color: var(--clr-white);
  color: var(--clr-blue);
  border: 1px solid var(--clr-light-blue);
  padding: 0.625rem 1.25rem;
  font-weight: 500;
  opacity: 0;
  visibility: hidden;
  transition: none 300ms ease-in-out;
  transition-property: opacity, visibility;
}

.upload-area__tooltip:hover .upload-area__tooltip-data {
  opacity: 1;
  visibility: visible;
}

/* Drop Zoon */
.upload-area__drop-zoon {
  position: relative;
  height: 11.25rem; /* 180px */
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  border: 2px dashed #898989;
  border-radius: 15px;
  margin-top: 2.1875rem;
  cursor: pointer;
  transition: border-color 300ms ease-in-out;
}

.upload-area__drop-zoon:hover {
  border-color: #000000;
  background-color:#f7f9fa;
}

.drop-zoon__icon {
  display: flex;
  font-size: 3.75rem;
  color: var(--clr-blue);
  transition: opacity 300ms ease-in-out;
}

.drop-zoon__paragraph {
  font-size: 0.9375rem;
  color: var(--clr-light-gray);
  margin: 0;
  margin-top: 0.625rem;
  transition: opacity 300ms ease-in-out;
}

.drop-zoon:hover .drop-zoon__icon,
.drop-zoon:hover .drop-zoon__paragraph {
  opacity: 0.7;
}

.drop-zoon__loading-text {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: none;
  color: #000000;
  z-index: 10;
}

.drop-zoon__preview-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: contain;
  border-radius: 10px;
  display: none;
  z-index: 1000;
  transition: opacity 300ms ease-in-out;
}

.drop-zoon:hover .drop-zoon__preview-image {
  opacity: 0.8;
}

.drop-zoon__file-input {
  display: none;
}

/* (drop-zoon--over) Modifier Class */
.drop-zoon--over {
  border-color: #000000;
}

.drop-zoon--over .drop-zoon__icon,
.drop-zoon--over .drop-zoon__paragraph {
  opacity: 0.7;
}

/* (drop-zoon--over) Modifier Class */
.drop-zoon--Uploaded {
  
}

.drop-zoon--Uploaded .drop-zoon__icon,
.drop-zoon--Uploaded .drop-zoon__paragraph {
  display: none;
}

/* File Details Area */
.upload-area__file-details {
  height: 0;
  visibility: hidden;
  opacity: 0;
  text-align: left;
  transition: none 500ms ease-in-out;
  transition-property: opacity, visibility;
  transition-delay: 500ms;
}

/* (duploaded-file--open) Modifier Class */
.file-details--open {
  height: auto;
  visibility: visible;
  opacity: 1;
}

.file-details__title {
  font-size: 1.125rem;
  font-weight: 500;
  color: var(--clr-light-gray);
}

/* Uploaded File */
.uploaded-file {
  display: flex;
  align-items: center;
  padding: 0.625rem 0;
  visibility: hidden;
  opacity: 0;
  transition: none 500ms ease-in-out;
  transition-property: visibility, opacity;
}

/* (duploaded-file--open) Modifier Class */
.uploaded-file--open {
  visibility: visible;
  opacity: 1;
}

.uploaded-file__icon-container {
  position: relative;
  margin-right: 0.3125rem;
}

.uploaded-file__icon {
  font-size: 3.4375rem;
  color: var(--clr-blue);
}

.uploaded-file__icon-text {
  position: absolute;
  top: 1.5625rem;
  left: 50%;
  transform: translateX(-50%);
  font-size: 0.9375rem;
  font-weight: 500;
  color: var(--clr-white);
}

.uploaded-file__info {
  position: relative;
  top: -0.3125rem;
  width: 100%;
  display: flex;
  justify-content: space-between;
}

.uploaded-file__info::before,
.uploaded-file__info::after {
  content: '';
  position: absolute;
  bottom: -0.9375rem;
  width: 0;
  height: 0.5rem;
  background-color: #ffffff;
  border-radius: 0.625rem;
}

.uploaded-file__info::before {
  width: 100%;
}

.uploaded-file__info::after {
  width: 100%;
  background-color: #ffb202;
}

/* Progress Animation */
.uploaded-file__info--active::after {
  animation: progressMove 800ms ease-in-out;
  animation-delay: 300ms;
}

@keyframes progressMove {
  from {
    width: 0%;
    background-color: transparent;
  }

  to {
    width: 100%;
    background-color: #ffb202;
  }
}

.uploaded-file__name {
  width: 100%;
  max-width: 6.25rem; /* 100px */
  display: inline-block;
  font-size: 1rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.uploaded-file__counter {
  font-size: 1rem;
  color: var(--clr-light-gray);
}

/* 이용횟수 통계 그림 */
@keyframes bar-fill {
  0% {
    width: 0;
  }
}
@-webkit-keyframes bar-fill {
  0% {
    width: 0;
  }
}
@-moz-keyframes bar-fill {
  0% {
    width: 0;
  }
}
@-o-keyframes bar-fill {
  0% {
    width: 0;
  }
}
.bar-graph {
  list-style: none;
  margin: 50px 0px auto;
}

.bar-wrap {
  -moz-border-radius: 10px 10px 10px 10px;
  -webkit-border-radius: 10px 10px 10px 10px;
  -ms-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background-color: rgba(149, 149, 149, 0.2);
  margin-bottom: 10px;
  height: 27px;
}

.bar-fill {
  -moz-border-radius: 10px 10px 10px 10px;
  -webkit-border-radius: 10px 10px 10px 10px;
  -ms-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  -moz-animation: bar-fill 1s;
  -webkit-animation: bar-fill 1s;
  -ms-animation: bar-fill 1s;
  animation: bar-fill 1s;
  background-color: #979797;
  display: block;
  height: 27px;
  width: 0px;
}

.bar-graph p {
  text-align:left;
  color: #000000;
  font-family: "Helvetica";
  font-size: 16px;
  font-weight: 100;
  text-transform: uppercase;
}

/* 이용횟수 통계 그림 끝 */

/*이용횟수 간단 css */
#bold{
	font-weight:bold;
	color:#fc4f4f;
}

#ratio{
	text-align: center;
	font-size: 18px;
	font-weight: bold;
}

#line{
	width:100%;
	height:50px;
	border-bottom: 1px dashed #898989;
}


#ul-left{
	width:445px;
	padding:0;
	padding-left:20px;	
}

#ul-right{
	width:420px;
	padding:0;
}
/*이용횟수 간단 css */

/*완료한 리스트 css */

#my-res-list-img {
	display: inline-block;
    vertical-align: top;
    align-self: center;
    padding: 0px 40px 0px 0px;
}
 
#my-res-list-text {
	display:inline-block;
	width: 550px;
    height: 300px;
    padding: 40px 0px 40px 40px;
    border-left: 1px solid #ebebeb;
}
 
#my-res-list-content-all:hover{
	box-shadow: inset 0 0 0 15em #f7f9fa;
}

#my-res-list-content-all {
	display: flex;
    justify-content: center;
    transition: 1s;
}

#my-res-list-point {
	display: flex;
    justify-content: center;
    align-items: center;
    width: 550px;
    height: 60px;
    border: 1px solid #d3d3d3;
    border-radius: 10px;
}
 
#my-res-list-dl {
	display: flex;
    min-height: 20px;
    padding-top: 20px;
    padding-bottom: 20px;
} 

#my-res-list-dt {
	line-height: 14px;
    font-size: 15px;
    letter-spacing: -.06px;
    letter-spacing: -.33px;
    color: rgba(34,34,34,.5);
}

#my-res-list-dd {
	margin: 4px 0px 0px 0px;
    word-break: break-word;
    line-height: 17px;
    font-size: 15px;
    
}
 
#my-res-list-ltd-box {
	padding: 0 12px;
/* 	padding-left: 0;
	padding-right: 0; */
	flex: 1;
} 

.my-res-list-ltd-detail-box {
	border-left: 1px solid #ebebeb;
}

#my-res-list-dl-dt-dd {
	border-top: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb;
}

#my-res-list-ltd-title {
	line-height: 22px;
    padding: 21px 0 12px;
    font-size: 18px;
    letter-spacing: -.15px;
    margin: 0;
}
 
#my-res-list-stat {
	display: inline-block;
	padding-top: 1px;
    margin-bottom: 9px;
    font-size: 18px;
}
 
#res-stat {
	font-weight: 800;
    border-bottom: 2px solid #222;
}
 
#my-res-list-title {
	margin-bottom: 6px;
    font-size: 18px;
    letter-spacing: -.09px;
    font-weight: 400;
}
/* 완료한 리스트 css 끝 */

/* 등급 제도 */
.grade{
	display:inline-block;
	height:30px;
	border-radius:25px;
	padding:10px;
	padding-top:0px;
	padding-bottom:0px;
	line-height:28px;
	margin-left:10px;
	background-color:#110902;
	font-weight:bold;
	color:white;
	
}

.grade_tooltip{
	position:relative;
	color:var(--clr-light-gray);
	cursor:pointer;
	transition:color 300ms ease-in-out;
}

.grade_tooltip:hover{
	color:var(--clr-gray);
}

.grade_tooltip-data{
	position:absolute;
	top:750%;
	left:270%;
	transform: translate(-50%, -125%);
	min-width: max-content;
	background-color: var(--clr-white);
	color: var(--clr-gray);
	border:1px solid var(--clr-light-gray);
	padding: 0.625rem 1.25rem;
	font-weight:500;
	display:none;
	color:#898989;
}
/* 등급 제도 */

/* 인증서 파일 업로드 글자 hover */
.confirmspan:hover{
	color: orange !important;
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
					<p>HOME > 마이페이지</p>
				</ul>
			</div>

			<div class="middle-profile">
				<div class="profile" style="text-align: center; display: flex; justify-content: center;">
					<div class="profile-left" style="display: inline-block">
						<c:if test = "${dto.user_Pro == 0}">
						<img src="/images/importToJsp/profile_default.jpg"
							style="width: 100px; height: 100px">
						</c:if>
						<c:if test = "${dto.user_Pro != 0 }">
						<img src="${Pro_fi_Nm }" style="width:200px; height: 200px; border-radius:200px" onerror=this.src="/images/importToJsp/profile_default.jpg">
						</c:if>
						<div style="font-weight: bold; font-size: 20pt">${dto.user_Point } P</div>
						<div>
							<a href="/point/use" id="point">포인트 충전하기</a>
						</div>
					</div>
					<div class="profile-right"
						style="display: inline-block; margin-left: 40px; text-align: left">
						<c:if test="${dto.user_Code != null }">
						<div>
							<span style="font-size: 20pt; margin-bottom: 20px; font-weight: bold">${dto.user_Nm} 님</span>
							<c:choose>
								<c:when test="${dto.user_Grade < 0}">
									<div class="grade" >사기꾼</div>
								</c:when>
								<c:when test="${dto.user_Grade >= 0 and dto.user_Grade < 30}">
									<div class="grade" >Bronze</div>
								</c:when>
								<c:when test="${dto.user_Grade >= 30 and dto.user_Grade < 46}">
									<div class="grade" >Silver</div>
								</c:when>
								<c:when test="${dto.user_Grade >= 46 and dto.user_Grade < 61}">
									<div class="grade" >Gold</div>
								</c:when>
								<c:when test="${dto.user_Grade >= 61 and dto.user_Grade < 101}">
									<div class="grade">Platinum</div>
								</c:when>
								<c:when test="${dto.user_Grade >= 101}">
									<div class="grade" >Diamond</div>
								</c:when>
							</c:choose>
							<strong class="grade_tooltip">등급제도란?
							<span class="grade_tooltip-data"></span>
							</strong>
						</div>
						<c:choose>
							<c:when test="${dto.user_Age >= 10 and dto.user_Age < 20}">
								<div style="font-size: 14pt">나이: 10대</div>
							</c:when>
							<c:when test="${dto.user_Age >= 20 and dto.user_Age < 30}">
								<div style="font-size: 14pt">나이: 20대</div>
							</c:when>
							<c:when test="${dto.user_Age >= 30 and dto.user_Age < 40}">
								<div style="font-size: 14pt">나이: 30대</div>
							</c:when>
							<c:when test="${dto.user_Age >= 40 and dto.user_Age < 50}">
								<div style="font-size: 14pt">나이: 40대</div>
							</c:when>
							<c:when test="${dto.user_Age >= 50 and dto.user_Age < 60}">
								<div style="font-size: 14pt">나이: 50대</div>
							</c:when>
							<c:when test="${dto.user_Age >= 60 and dto.user_Age < 70}">
								<div style="font-size: 14pt">나이: 60대</div>
							</c:when>
							<c:when test="${dto.user_Age >= 70 and dto.user_Age < 80}">
								<div style="font-size: 14pt">나이: 70대</div>
							</c:when>
							<c:when test="${dto.user_Age >= 80 and dto.user_Age < 90}">
								<div style="font-size: 14pt">나이: 80대</div>
							</c:when>
							<c:when test="${dto.user_Age >= 90 and dto.user_Age < 100}">
								<div style="font-size: 14pt">나이: 90대</div>
							</c:when>
							<c:otherwise>
								<div style="font-size: 14pt">나이: <span style="font-size:11pt">'회원정보 수정'에서 나이를 입력해주세요.</span></div>
							</c:otherwise>
						</c:choose>
						<c:if test="${dto.user_Gender == 'M'}">
						<div style="font-size: 14pt; margin-bottom: 60px">성별: 남</div>
						</c:if>
						<c:if test="${dto.user_Gender == 'F'}">
						<div style="font-size: 14pt; margin-bottom: 60px">성별: 여</div>
						</c:if>
						<div style="font-size: 14pt; font-weight: bold">내가 딴 꿀 수확량: ${dto.user_Grade}</div>
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
						<c:if test="${con_ucode != null}">
							<c:if test="${con_stat == '미확인' }">
							<span style="font-size: 11pt; color: #898989">업로드한 자격증을 확인중입니다.</span>
							<span class="confirmspan" style="font-size: 11pt; color: #2d7eac; margin-left: 5px" onclick="showProof();">파일 다시 업로드하기</span>
							</c:if>
							<c:if test="${con_stat == '확인' }">
							<span style="font-size: 11pt; color: #5c5c5c; font-weight:bold">${dto.user_Nm }님은 <span style="color:red">인증된 공인중개사</span>이십니다!</span>
							</c:if>
							<c:if test="${con_stat == '반려' }">
							<span style="font-size: 11pt; color: #898989">신청한 자격증이 반려되었습니다.</span>
							<span class="confirmspan" style="font-size: 11pt; color: #2d7eac; margin-left: 5px" onclick="showProof();">파일 다시 업로드하기</span>
							</c:if>
							<c:if test="${con_stat == '처리중' }">
							<span style="font-size: 11pt; color: #898989">신청한 자격증이 처리중입니다.</span>
							</c:if>
						</c:if>
						<c:if test="${con_ucode == null}">
						<div>
							<span style="font-size: 11pt; color: #898989">공인중개사이신가요?</span>
							<span class="confirmspan" style="font-size: 11pt; color: #2d7eac; margin-left: 5px" onclick="showProof();">인증하기</span>
						</div>
						</c:if>
					</c:if>
					</div>
				</div>
				<div class="profile-bottom">
						<div class="button" id="uedit" onclick="location.href='/mypage/profileEdit?ua_UCode=${user_Code}'">
							<a><p style="margin:5px">회원정보 수정</p></a>
						</div>
					</div>
				<div class="description" style="text-align: center">
					<div class="desc-nav">
						<ul class="desc-list">
							<li><a href="#!" onclick="showDescMe();" style="color: #000000" class="desc-list1">자기소개</a></li>
							<li><a href="#!" onclick="showFinishlist();" class="desc-list2">완료된 리스트</a></li>
							<li><a href="#!" onclick="showUsage();" class="desc-list3">이용 횟수</a></li>
						</ul>
					</div>
					<div class="desc-content-aboutme">
						<div class="desc-content">
							<c:if test="${ dto.user_Intro == null}">
								<form action="/mypage/descInsert" method="POST">
								<input type="hidden" name="code" value="${user_Code }">
								<div class="styled-input">
									<textarea required name="description"></textarea>
									<label>자기소개 예시:<br>
									 제 이름은 OOO입니다. 현재까지 Waggle에서 총 ?건의 수행을 완료하였고 모두 좋은 꿀벌 평가를 받았습니다!<br>요구하는 사항을 꼼꼼하게 반영해서 신속하게 수행하겠습니다 :)</label>
								</div>
								<div></div>
								<div class="desc-content-button">
									<input type="submit" class="button" id="desc-edit-finish" value="자기소개 작성완료" style="width:150px; display: inline-block; margin-top:20px; padding:5px; font-size:15px; font-weight:bold">
								</div>
								</form>	
							</c:if>
							<c:if test="${ dto.user_Intro != null }">
								<form name="form" method="POST">
								<div class="desc-intro" data-behaviour="search-on-list" style="text-align:initial">
									<span class="counter"	data-search-on-list="counter">
										<div >${dto.user_Intro}</div>
									</span>
								</div>
								<div class="styled-input" id="desc-edit-input" style="display:none">
										<textarea id="desc-text" required  name="description">${dto.user_Intro}</textarea>
										<label>${dto.user_Intro }</label>
								</div>
								<div class="desc-content-button">
									<input type="hidden" name="code" value="${user_Code}">
									<div class="button" id="desc-edit" style="display: inline-block; width: 150px; margin-top:20px">
										<p style="margin: 5px">자기소개 수정하기</p>
									</div>
									<input type="submit" class="button" value="자기소개 삭제" onclick="javascript: form.action='/mypage/descDelete';" style="display: inline-block; margin-top:20px; padding:5px; font-size:15px; font-weight:bold">
									<input type="submit" class="button" id="desc-edit-finish" value="수정 완료" onclick="javascript: form.action='/mypage/descEdit';" style="display: inline-block; margin-top:20px; display:none; padding:5px; font-size:15px; font-weight:bold">
									<div class="button" id="desc-edit-cancel" style="display: inline-block; margin-top:20px; display:none">
										<p style="margin: 5px">수정 취소</p>
									</div>
								</div>
								</form>
							</c:if>
						</div>
					</div>
					<div></div>
					<div class="desc-content-finishlist">
					</div>
					<div class="desc-usage" style="margin: 0 auto; width: 900px; padding-top: 60px; display: none">
						<div class="usage-left" style="width:420px; display:inline-block; float: right; padding-top:15px">
							<ul class="bar-graph" id="ul-left">
								<li>
									<p style="font-size:20pt; font-weight:bold"><꿀벌></p>
									<p style="font-size:16pt; font-weight:bold; color:#5a76ff">[모든 기간] 의뢰 수행완료 비율</p>
									<p>${dto.user_Nm} 님이 현재까지 <span id="bold">지원</span>한 의뢰 총 갯수 : ${resTotal } 건<p>
									<p>${dto.user_Nm} 님이 현재 <span id="bold">진행중</span>인 의뢰 갯수 : ${resTotal-resFinish-resCancel-resCancelZero } 건<p>
									<p>${dto.user_Nm} 님이 현재까지 <span id="bold">수행완료</span>한 의뢰 갯수 : ${resFinish } 건<p>
									<p>현재까지 의뢰 시작 24시간 후 <span id="bold">수행취소</span>한 의뢰 갯수 : ${resCancel } 건<p>
									<br>
									<p id="ratio">꿀벌 지원 총 ${resTotal }건 중 수행완료 ${resFinish}건</p>
									<div class="bar-wrap">
										<span class="bar-fill" style="width:${ratio2}%;">${ratio2 }%</span>
									</div>
								</li>
							</ul>
							<div id="line" style="margin-left:20px; width: 110%;"></div>
							<ul class="bar-graph" id="ul-left">
								<li>
									<p style="font-size:16pt; font-weight:bold; color:#5a76ff">[최근 3개월] 의뢰 수행완료 비율</p>
									<p>${dto.user_Nm} 님이 최근 3개월 동안 <span id="bold">지원</span>한 의뢰 총 갯수 : ${resTotal3M } 건<p>
									<p>${dto.user_Nm} 님이 최근 3개월 동안 <span id="bold">수행완료</span>한 의뢰 갯수 : ${resFinish3M } 건<p>
									<p>최근 3개월간 의뢰 시작 24시간 후 <span id="bold">수행취소</span>한 의뢰 갯수 : ${resCancel3M } 건<p>
									<br>
									<p id="ratio">꿀벌 지원 총 ${resTotal3M }건 중 수행완료 ${resFinish3M}건</p>
									<div class="bar-wrap">
										<span class="bar-fill" style="width:${ratio2_3M}%;">${ratio2_3M }%</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="usage-right" style="width: 420px; display: inline-block; border-right: 1px dashed #898989; padding-right:35px">
							<ul class="bar-graph" id="ul-right">
								<li>
									<p style="font-size:20pt; font-weight:bold"><의뢰인></p>
									<p style="font-size:16pt; font-weight:bold; color:#5a76ff">[모든 기간] 의뢰 대비 꿀벌평가 완료 비율</p>
									<p>${dto.user_Nm} 님이 현재까지 <span id="bold">의뢰</span>한 게시글 총 갯수 : ${reqTotal } 건<p>
									<p>${dto.user_Nm} 님이 현재 <span id="bold">의뢰중</span>인 게시글 갯수 : ${reqTotal - reqFinish -reqCancel} 건<p>
									<p>${dto.user_Nm} 님이 현재까지 <span id="bold">꿀벌 평가 완료</span>한 게시글 : ${reqFinish } 건<p>
									<p>${dto.user_Nm} 님이 현재까지 <span id="bold">요청취소</span>한 게시글 갯수 : ${reqCancel } 건<p>
									<br>
									<p id="ratio">의뢰글 총 ${reqTotal }건 중 꿀벌평가 ${reqFinish }건 완료</p>
									<div class="bar-wrap">
										<span class="bar-fill" style="width: ${ratio}%;">${ratio }%</span>
									</div>
								</li>
							</ul>
							<div id="line"></div>
							<ul class="bar-graph" id="ul-right">
								<li>
									<p style="font-size:16pt; font-weight:bold; color:#5a76ff">[최근 3개월] 의뢰 대비 꿀벌평가 완료 비율</p>
									<p>${dto.user_Nm} 님이 최근 3개월 간 <span id="bold">의뢰</span>한 게시글 총 갯수 : ${reqTotal3M } 건<p>
									<p>${dto.user_Nm} 님이 최근 3개월 간 <span id="bold">꿀벌 평가 완료</span>한 게시글 : ${reqFinish3M } 건<p>
									<p>${dto.user_Nm} 님이 최근 3개월 간 <span id="bold">요청취소</span>한 게시글 갯수 : ${reqCancel3M } 건<p>
									<br>
									<p id="ratio">의뢰글 총 ${reqTotal3M }건 중 꿀벌평가 ${reqFinish3M }건 완료</p>
									<div class="bar-wrap">
										<span class="bar-fill" style="width: ${ratio3M}%;">${ratio3M }%</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
					<form action="/mypage/confirm" method="post" enctype="multipart/form-data">
						<!-- Upload Area -->
						<div id="uploadArea" class="upload-area" style="display:none; margin-top:50px">
						  <div class="upload-area__header">
						  	<c:if test="${condto == 0}">
						    <h1 class="upload-area__title">Upload your file</h1>
						   	</c:if>
						   	<c:if test="${condto != 0}">
						   	<h1 class="upload-area__title">Change your file</h1>
						   	</c:if>
						    <p class="upload-area__paragraph">
						      File should be an image
						      <strong class="upload-area__tooltip">
						        Like
						        <span class="upload-area__tooltip-data"></span> <!-- Data Will be Comes From Js -->
						      </strong>
						    </p>
						  </div>
						  <!-- Drop Zoon -->
						  <div id="dropZoon" class="upload-area__drop-zoon drop-zoon">
						    <span class="drop-zoon__icon">
						      <i class='bx bxs-file-image'></i>
						    </span>
						    <p class="drop-zoon__paragraph">Drop your file here or Click to browse</p>
						    <span id="loadingText" class="drop-zoon__loading-text">Please Wait</span>
						    <img src="" alt="Preview Image" id="previewImage" class="drop-zoon__preview-image" draggable="false">
						    <input type="file" name="myfile" data-max-file-size="10MB" id="fileInput" class="drop-zoon__file-input" accept="image/*">
						  </div>
						  <!-- End Drop Zoon -->
						
						  <!-- File Details -->
						  <div id="fileDetails" class="upload-area__file-details file-details">
						    <h3 class="file-details__title">Uploaded File</h3>
						
						    <div id="uploadedFile" class="uploaded-file">
						      <div class="uploaded-file__icon-container">
						        <i class='bx bxs-file-blank uploaded-file__icon'></i>
						        <span class="uploaded-file__icon-text"></span> <!-- Data Will be Comes From Js -->
						      </div>
						
						      <div id="uploadedFileInfo" class="uploaded-file__info">
						        <span class="uploaded-file__name">Project 1</span>
						        <button type="submit">자격증 업로드하기</button>
						      </div>
						    </div>
						  </div>
						  <!-- End File Details -->
							<c:if test="${condto != 0}">
								<br>
								<div style="text-align:left">이전 업로드된 파일:</div>
								<img src="${con_file_Name }" style="width:380px; height:380px">
							</c:if>
						</div>
						<!-- End Upload Area -->
				</form>
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
			$('#wrap').css('min-height','150vh');
		}); // end DOM ready
	})(jQuery); // end jQuery

	//자기소개 보여줌
	function showDescMe() {
		$(".desc-content-aboutme").fadeIn(600);
		$(".upload-area").hide();
		$(".desc-usage").hide();
		$(".desc-content-finishlist").hide();
		$(".desc-list1").css("color", "#000000");
		$(".desc-list2").css("color", "#898989");
		$(".desc-list3").css("color", "#898989");

	}
	
	//이용횟수 보여줌
	function showUsage() {
		$(".desc-content-aboutme").hide();
		$(".upload-area").hide();
		$(".desc-usage").fadeIn();
		$(".desc-content-finishlist").hide();
		$(".desc-list1").css("color", "#898989");
		$(".desc-list2").css("color", "#898989");
		$(".desc-list3").css("color", "#000000");

	}

	//완료된 리스트 보여줌
	function showFinishlist() {
		$(".desc-content-aboutme").hide();
		$(".upload-area").hide();
		$(".desc-usage").hide();
		$(".desc-content-finishlist").fadeIn();
		$(".desc-list1").css("color", "#898989");
		$(".desc-list2").css("color", "#000000");
		$(".desc-list3").css("color", "#898989");
		
		let stat = "완료"
		let ucode = ${user_Code};
		let data = {stat : stat, ucode : ucode};
		
		$.ajax({
			type: "post",
			url: "/mypage/reqroom",
			data : data,
			success : function(result){
				$(".desc-content-finishlist").empty();
				if(result.length == 0){
					$(".desc-content-finishlist").append('<div style="width:900px;height:300px;padding-top:130px">완료한 수행내역이 없습니다.</div>');
				}else{
					for(let i=0; i<result.length; i++){
						$(".desc-content-finishlist").append('<div class="my-res-list-content-all" id="my-res-list-content-all">'
																+'<div class="my-res-list-content-inner" id="my-res-list-img" onclick="location.href=\'/board/detail?req_No='+result[i].req_No+'\'">'
																+(result[i].fi_Nm != null? '<img src="'+result[i].fi_Nm+'">':'<img src="/images/importToJsp/homeimg.png">')
																+'</div>'
																+'<div id="my-res-list-text">'
																+'<div class="my-res-list-content-inner" id="my-res-list-stat" onclick="location.href=\'/board/detail?req_No='+result[i].req_No+'\'">'
																+'<label id="res-stat">'+result[i].req_Stat+'</label></div>'
																+'<div class="my-res-list-content-inner" id="my-res-list-title"	onclick="location.href=\'/board/detail?req_No='+result[i].req_No+'\'">'+result[i].req_Title+'</div>'
																+'<div class="my-res-list-content-inner" id="my-res-list-point"	onclick="location.href=\'/board/detail?req_No='+result[i].req_No+'\'">'+result[i].req_Point+'&nbsp; <i class="fa-solid fa-p"> </i></div>'
																+'<h4 class="my-res-list-content-inner" id="my-res-list-ltd-title" onclick="location.href=\'/board/detail?req_No='+result[i].req_No+'\'">요청 정보</h4>'
																+'<div class="my-res-list-content-inner" id="my-res-list-dl-dt-dd" onclick="location.href=\'/board/detail?req_No='+result[i].req_No+'\'">'
																+'<dl id="my-res-list-dl">'
																+'<div id="my-res-list-ltd-box">'
																	+'<dt id="my-res-list-dt">매물주소</dt>'
																	+'<dd id="my-res-list-dd">'+result[i].home_Addr+'</dd>'
																	+'</div>'
																	+'<div id="my-res-list-ltd-box" class="my-res-list-ltd-detail-box">'
																	+'<dt id="my-res-list-dt">방문기한</dt>'
																	+'<dd id="my-res-list-dd">'+result[i].req_EDate+'</dd>'
																	+'</div></dl></div></div></div>');
					}
				}
			},
			error: function(){
				console.log("완료리스트 ajax 에러");
			}
		})

	}
	//공인중개사 파일 업로드 태그 보여줌
	function showProof(){
		$(".desc-content-aboutme").hide();
		$(".desc-content-finishlist").hide();
		$(".desc-usage").hide();
		$(".upload-area").fadeIn();
		$(".desc-list1").css("color", "#898989");
		$(".desc-list2").css("color", "#898989");
		$(".desc-list3").css("color", "#898989");
		
	}
	//내가 딴 꿀 수확량 구현
	window.addEventListener("load", () => {
		  if(${dto.user_Grade} <= 100){
			  $("#progress_bar").css({
			    width: ${dto.user_Grade}+"%"
			  });
		  }else if(${dto.user_Grade} > 100){
			  $("#progress_bar").css({
				    width: 100+"%"
				  });
		  }
		  
		  if(${dto.user_Grade}>=0 && ${dto.user_Grade}<=29){
			  $('#progress_bar').css('background-image','linear-gradient(rgb(199 112 0) 0%, rgb(145 81 0) 100%)');
		  }else if(${dto.user_Grade}>=30 && ${dto.user_Grade}<=45){
			  $('#progress_bar').css('background-image','linear-gradient(rgb(241 241 241) 0%, rgb(161 161 161) 100%)');
		  }else if(${dto.user_Grade}>=46 && ${dto.user_Grade}<=60){
			  $('#progress_bar').css('background-image','linear-gradient(rgb(253 255 178) 0%, rgb(225 197 0) 100%)');
		  }else if(${dto.user_Grade}>=61 && ${dto.user_Grade}<=100){
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

	// 공인중개사 파일 업로드 구현 시작
	// Select Upload-Area
	const uploadArea = document.querySelector('#uploadArea')

	// Select Drop-Zoon Area
	const dropZoon = document.querySelector('#dropZoon');

	// Loading Text
	const loadingText = document.querySelector('#loadingText');

	// Slect File Input 
	const fileInput = document.querySelector('#fileInput');

	// Select Preview Image
	const previewImage = document.querySelector('#previewImage');

	// File-Details Area
	const fileDetails = document.querySelector('#fileDetails');

	// Uploaded File
	const uploadedFile = document.querySelector('#uploadedFile');

	// Uploaded File Info
	const uploadedFileInfo = document.querySelector('#uploadedFileInfo');

	// Uploaded File  Name
	const uploadedFileName = document.querySelector('.uploaded-file__name');

	// Uploaded File Icon
	const uploadedFileIconText = document.querySelector('.uploaded-file__icon-text');

	// Uploaded File Counter
	const uploadedFileCounter = document.querySelector('.uploaded-file__counter');

	// ToolTip Data
	const toolTipData = document.querySelector('.upload-area__tooltip-data');

	// Images Types
	const imagesTypes = [
	  "jpeg",
	  "png",
	  "svg",
	  "gif",
	  "jfif"
	];

	// Append Images Types Array Inisde Tooltip Data
	toolTipData.innerHTML = [...imagesTypes].join(', .');

	/*
	// When (drop-zoon) has (dragover) Event 
	dropZoon.addEventListener('dragover', function (event) {
	  // Prevent Default Behavior 
	  event.preventDefault();

	  // Add Class (drop-zoon--over) On (drop-zoon)
	  dropZoon.classList.add('drop-zoon--over');
	});

	// When (drop-zoon) has (dragleave) Event 
	dropZoon.addEventListener('dragleave', function (event) {
	  // Remove Class (drop-zoon--over) from (drop-zoon)
	  dropZoon.classList.remove('drop-zoon--over');
	});

	// When (drop-zoon) has (drop) Event 
	dropZoon.addEventListener('drop', function (event) {
	  // Prevent Default Behavior 
	  event.preventDefault();

	  // Remove Class (drop-zoon--over) from (drop-zoon)
	  dropZoon.classList.remove('drop-zoon--over');

	  // Select The Dropped File
	  const file = event.dataTransfer.files[0];

	  // Call Function uploadFile(), And Send To Her The Dropped File :)
	  uploadFile(file);
	});
	*/
	// When (drop-zoon) has (click) Event 
	dropZoon.addEventListener('click', function (event) {
	  // Click The (fileInput)
	  fileInput.click();
	});

	// When (fileInput) has (change) Event 
	fileInput.addEventListener('change', function (event) {
	  // Select The Chosen File
	  const file = event.target.files[0];

	  // Call Function uploadFile(), And Send To Her The Chosen File :)
	  uploadFile(file);
	});

	// Upload File Function
	function uploadFile(file) {
	  // FileReader()
	  const fileReader = new FileReader();
	  // File Type 
	  const fileType = file.type;
	  // File Size 
	  const fileSize = file.size;

	  // If File Is Passed from the (File Validation) Function
	  if (fileValidate(fileType, fileSize)) {
	    // Add Class (drop-zoon--Uploaded) on (drop-zoon)
	    dropZoon.classList.add('drop-zoon--Uploaded');

	    // Show Loading-text
	    loadingText.style.display = "block";
	    // Hide Preview Image
	    previewImage.style.display = 'none';

	    // Remove Class (uploaded-file--open) From (uploadedFile)
	    uploadedFile.classList.remove('uploaded-file--open');
	    // Remove Class (uploaded-file__info--active) from (uploadedFileInfo)
	    uploadedFileInfo.classList.remove('uploaded-file__info--active');

	    // After File Reader Loaded 
	    fileReader.addEventListener('load', function () {
	      // After Half Second 
	      setTimeout(function () {
	        // Add Class (upload-area--open) On (uploadArea)
	        uploadArea.classList.add('upload-area--open');

	        // Hide Loading-text (please-wait) Element
	        loadingText.style.display = "none";
	        // Show Preview Image
	        previewImage.style.display = 'block';

	        // Add Class (file-details--open) On (fileDetails)
	        fileDetails.classList.add('file-details--open');
	        // Add Class (uploaded-file--open) On (uploadedFile)
	        uploadedFile.classList.add('uploaded-file--open');
	        // Add Class (uploaded-file__info--active) On (uploadedFileInfo)
	        uploadedFileInfo.classList.add('uploaded-file__info--active');
	      }, 500); // 0.5s

	      // Add The (fileReader) Result Inside (previewImage) Source
	      previewImage.setAttribute('src', fileReader.result);

	      // Add File Name Inside Uploaded File Name
	      uploadedFileName.innerHTML = file.name;

	      // Call Function progressMove();
	      progressMove();
	    });

	    // Read (file) As Data Url 
	    fileReader.readAsDataURL(file);
	  } else { // Else

	    this; // (this) Represent The fileValidate(fileType, fileSize) Function

	  };
	};

	// Progress Counter Increase Function
	function progressMove() {
	  // Counter Start
	  let counter = 0;

	  // After 600ms 
	  setTimeout(() => {
	    // Every 100ms
	    let counterIncrease = setInterval(() => {
	      // If (counter) is equle 100 
	      if (counter === 100) {
	        // Stop (Counter Increase)
	        clearInterval(counterIncrease);
	      } else { // Else
	        // plus 10 on counter
	        counter = counter + 10;
	        // add (counter) vlaue inisde (uploadedFileCounter)
	        uploadedFileCounter.innerHTML = `${counter}%`
	      }
	    }, 100);
	  }, 600);
	};


	// Simple File Validate Function
	function fileValidate(fileType, fileSize) {
	  // File Type Validation
	  let isImage = imagesTypes.filter((type) => fileType.indexOf(`image/${type}`) !== -1);

	  // If The Uploaded File Type Is 'jpeg'
	  if (isImage[0] === 'jpeg') {
	    // Add Inisde (uploadedFileIconText) The (jpg) Value
	    uploadedFileIconText.innerHTML = 'jpg';
	  } else { // else
	    // Add Inisde (uploadedFileIconText) The Uploaded File Type 
	    uploadedFileIconText.innerHTML = isImage[0];
	  };

	  // If The Uploaded File Is An Image
	  if (isImage.length !== 0) {
	    // Check, If File Size Is 2MB or Less
	    if (fileSize <= 10000000) { // 2MB :)
	      return true;
	    } else { // Else File Size
	      return alert('Please Your File Should be 10 Megabytes or Less');
	    };
	  } else { // Else File Type 
	    return alert('Please make sure to upload An Image File Type');
	  };
	};
	// 공인중개사 파일 업로드 구현 끝
	
	
	//자기소개부분 함수 구현 시작
	$('#desc-edit').on("click", function(){
		$('.desc-intro').hide();
		$('#desc-edit').hide();
		$('#desc-edit-input').show();
		$('#desc-edit-finish').show();
		$('#desc-edit-cancel').show();
	})
	
	$('#desc-edit-cancel').on("click", function(){
		location.reload();
	})
	
	$(document).ready(function(){
		//등급제도 설명 나타나게하기
		$(".grade_tooltip-data").html("꿀 수확량 0-29 : Bronze <br>"
									  +"꿀 수확량 30-45 : Silver <br>"
									  +"꿀 수확량 46-60 : Gold <br>"
									  +"꿀 수확량 61-100 : Platinum <br>"
									  +"꿀 수확량 100 초과 : Diamond")
		$(".grade_tooltip").mouseover(function(){
			$(".grade_tooltip-data").fadeIn();
		}).mouseout(function(){
			$(".grade_tooltip-data").fadeOut();
		});
	});
</script>
<script>


</script>
</html>