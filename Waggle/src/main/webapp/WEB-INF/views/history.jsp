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

/* 탭 css */

.tabs {
	background-color: #ffffff;
	width: 1000px;
	margin: 0 auto;
}

/* 탭 스타일 */
.tab_item {
	width: 50%;
	height: 50px;
	border-bottom: 2px solid #151515;
	background-color: #ffffff;
	line-height: 50px;
	font-size: 16px;
	color: #151515;
	display: block;
	float: left;
	text-align: center;
	font-weight: bold;
	transition: all 0.2s ease;
}

.tab_item:hover {
	opacity: 0.75;
}

/* 라디오 버튼 UI삭제*/
input[name="tab_item"] {
	display: none;
}

/* 탭 컨텐츠 스타일 */
.tab_content {
	display: none;
	padding: 0px;
	clear: both;
	overflow: hidden;
}

/* 선택 된 탭 콘텐츠를 표시 */
#login:checked ~ #login-content, #sign-up:checked ~ #sign-up-content,
	#sign-up-form:checked ~ #sign-up-form-content {
	display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked+.tab_item {
	background-color: #151515;
	color: #fff;
}

.tab_content .field-wrap1 {
	display: block;
	text-align: center;
	padding: 45px 10px 20px 10px;
}

.tab_content .field-wrap2 {
	display: block;
	text-align: center;
	padding: 20px 10px 20px 10px;
}

input {
	width: 500px;
	height: 40px;
	border-radius: 8px;
	font-size: 14px;
}

/* 탭 css 끝 */

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
					<p>HOME > 이용내역</p>
				</ul>
			</div>
			<br/>
			<div class="tabs">
				<input id="login" type="radio" name="tab_item" checked onclick="showMyReq();"> 
				<label class="tab_item" for="login">나의 요청</label> 
				<input id="sign-up" type="radio" name="tab_item" onclick="showMyPerform();"> 
				<label class="tab_item" for="sign-up">나의 수행</label>
			</div>
			<div class="myReqList" style="width:900px; margin:0 auto; text-align: center">
			</div>
			<div class="myPerform" style="width:900px; margin:0 auto; text-align: center">
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//요청내역 리스트 보여줌
$(document).ready(function(){
	let ucode = ${user_Code};
	let data = {ucode : ucode};
	
	$.ajax({
		type: "post",
		url: "mypage/reqhistory",
		data : data,
		success : function(result){
			let unique = result.filter(function(item1, idx1){
				return result.findIndex(function(item2, idx2){
					return item1.req_No == item2.req_No
				}) == idx1;
			}) ;
			
			$(".myPerform").empty();
			for(let i=0; i<unique.length; i++){
				$(".myReqList").append('<a href="/board/detail?req_No='+unique[i].req_No+'">'
											+'<div class="finish-top" style="float: right; width: 900px; height:20px">'
											+'<div style="float: right"></div></div>'
											+'<div class="finish-mid" style="width: 900px">'
											+'<div class="finish-mid-left" style="display: inline-block; width: 200px; height: 200px; float: left; border:3px solid #80808075; border-radius: 10px">'
											+'<div class="room-img"><img style="width:203px; height:203px; border-radius:10px" src='+unique[i].fi_Nm+'></div></div>'
											+'<div class="finish-mid-right" style="display: inline-block; width: 670px; height: 200px; float: right; border:3px solid #80808075; border-radius: 10px">'
											+'<div class="req-desc" style="display: inline-block; float: left; height: 200px">'
											+'<p style="margin: 5px 10px; font-size: 16pt; text-align:left">기한 :'+unique[i].req_EDate+'</p>'
											+'<p style="margin: 135px 10px 0 10px; font-size: 12pt">'+unique[i].home_Addr+'</p>'
											+'</div>'
											+'<div class="req-title" style="display: inline-block">'
											+'<p style="line-height: 150px; font-size: 20pt">'+unique[i].req_Title+'</p>'
											+'</div>'
											+'<div class="req-point" style="display: inline-block; float: right; height: 200px">'
											+'<p style="font-size: 20pt; line-height: 200px; margin: 0 18px">'+unique[i].req_Point+'P</p>'
											+'</div></div></div>'
											+'<div class="finish-bot" style="width: 900px;">'
											+'<div class="button" style="float: left; width: 80px; margin-top: 10px; margin-left: 55px; border-radius: 30px; border:2px solid">'
											+unique[i].req_Stat
											+'</div></div></a>');
			}
		},
		error: function(){
			console.log("요청내역 ajax 에러");
		}
})
});

function showMyReq() {
	let ucode = ${user_Code};
	let data = {ucode : ucode};
	
	$.ajax({
		type: "post",
		url: "mypage/reqhistory",
		data : data,
		success : function(result){
			let unique = result.filter(function(item1, idx1){
				return result.findIndex(function(item2, idx2){
					return item1.req_No == item2.req_No
				}) == idx1;
			}) ;
			
			$(".myPerform").empty();
			for(let i=0; i<unique.length; i++){
				$(".myReqList").append('<a href="/board/detail?req_No='+unique[i].req_No+'">'
											+'<div class="finish-top" style="float: right; width: 900px; height:20px">'
											+'<div style="float: right"></div></div>'
											+'<div class="finish-mid" style="width: 900px">'
											+'<div class="finish-mid-left" style="display: inline-block; width: 200px; height: 200px; float: left; border:3px solid #80808075; border-radius: 10px">'
											+'<div class="room-img"><img style="width:203px; height:203px; border-radius:10px" src='+unique[i].fi_Nm+'></div></div>'
											+'<div class="finish-mid-right" style="display: inline-block; width: 670px; height: 200px; float: right; border:3px solid #80808075; border-radius: 10px">'
											+'<div class="req-desc" style="display: inline-block; float: left; height: 200px">'
											+'<p style="margin: 5px 10px; font-size: 16pt; text-align:left">기한 :'+unique[i].req_EDate+'</p>'
											+'<p style="margin: 135px 10px 0 10px; font-size: 12pt">'+unique[i].home_Addr+'</p>'
											+'</div>'
											+'<div class="req-title" style="display: inline-block">'
											+'<p style="line-height: 150px; font-size: 20pt">'+unique[i].req_Title+'</p>'
											+'</div>'
											+'<div class="req-point" style="display: inline-block; float: right; height: 200px">'
											+'<p style="font-size: 20pt; line-height: 200px; margin: 0 18px">'+unique[i].req_Point+'P</p>'
											+'</div></div></div>'
											+'<div class="finish-bot" style="width: 900px;">'
											+'<div class="button" style="float: left; width: 80px; margin-top: 10px; margin-left: 55px; border-radius: 30px; border:2px solid">'
											+unique[i].req_Stat
											+'</div></div></a>');
			}
		},
		error: function(){
			console.log("요청내역 ajax 에러");
		}
})
}

//나의 수행 내역 보여주기
function showMyPerform(){
	let ucode = ${user_Code};
	let data = {ucode : ucode};
	
	$.ajax({
		type: "post",
		url: "mypage/performhistory",
		data : data,
		success : function(result){
			$(".myReqList").empty();
			$(".myPerform").empty();
			for(let i=0; i<result.length; i++){
				$(".myReqList").append('<a href="/board/detail?req_No='+result[i].req_No+'">'
											+'<div class="finish-top" style="float: right; width: 900px; height:20px">'
											+'<div style="float: right"></div></div>'
											+'<div class="finish-mid" style="width: 900px">'
											+'<div class="finish-mid-left" style="display: inline-block; width: 200px; height: 200px; float: left; border:3px solid #80808075; border-radius: 10px">'
											+'<div class="room-img"><img style="width:203px; height:203px; border-radius:10px" src='+result[i].fi_Nm+'></div></div>'
											+'<div class="finish-mid-right" style="display: inline-block; width: 670px; height: 200px; float: right; border:3px solid #80808075; border-radius: 10px">'
											+'<div class="req-desc" style="display: inline-block; float: left; height: 200px">'
											+'<p style="margin: 5px 10px; font-size: 16pt; text-align:left">기한 :'+result[i].req_EDate+'</p>'
											+'<p style="margin: 135px 10px 0 10px; font-size: 12pt">'+result[i].home_Addr+'</p>'
											+'</div>'
											+'<div class="req-title" style="display: inline-block">'
											+'<p style="line-height: 150px; font-size: 20pt">'+result[i].req_Title+'</p>'
											+'</div>'
											+'<div class="req-point" style="display: inline-block; float: right; height: 200px">'
											+'<p style="font-size: 20pt; line-height: 200px; margin: 0 18px">'+result[i].req_Point+'P</p>'
											+'</div></div></div>'
											+'<div class="finish-bot" style="width: 900px;">'
											+'<div class="button" style="float: left; width: 80px; margin-top: 10px; margin-left: 55px; border-radius: 30px; border:2px solid">'
											+result[i].req_Stat
											+'</div></div></a>');
			}
		},
		error: function(){
			console.log("완료리스트 ajax 에러");
		}
	})
}
</script>
</html>