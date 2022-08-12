<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>로그인&회원가입</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
<style type="text/css">
.middle {
	margin: 0;
	padding: 0;
}

.guideline {
	margin: 0 auto;
	width: 1125px;
}

.guideline-all {
	margin-top: 16px !important;
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
	font-size: 16px;
}

.login-form {
	display: flex;
	justify-content: center;
}

.tabs {
	background-color: #ffffff;
	width: 550px;
	height: 1150px;
	margin: 0 auto;
}

/* 탭 스타일 */
.tab_item {
	width: 20%;
	height: 50px;
	border-bottom: 3px solid #151515;
	background-color: #f8f8f8;
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
	padding: 45px 10px 0px 10px;
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

.tab_content .field-wrap-submit {
	display: block;
	text-align: center;
	padding: 20px 10px 20px 10px;
}

.tab_content .field-wrap-submit button {
	width: 507px;
	height: 45px;
	border-radius: 8px;
	cursor: pointer;
	background-color: #151515;
	color: #ffffff;
}

.forgot-idpw .forgot {
	display: block;
	text-align: center;
	border-bottom: 1px solid;
	padding: 0px 10px 20px 10px;
}

.tab_content .api-login {
	display: block;
	text-align: center;
	padding: 20px 10px 20px 10px;
}

.tab_content .api-login button {
	width: 507px;
	height: 63px;
	border-radius: 8px;
	cursor: pointer;
	background-color: #151515;
	color: #ffffff;
	margin: 20px;
}

.tab_content .sign-up-button button {
	width: 507px;
	height: 63px;
	border-radius: 8px;
	cursor: pointer;
	background-color: #151515;
	color: #ffffff;
	margin: 20px;
}
	.find_input_re_1{
		color : green;
		display : none;
	}
	
	.find_input_re_2{
		color : red;
		display : none;
	}
	.find_input_re_3{
		color : red;
		display : none;
	}
	
	.find_form_check{
		color : red;
		display : none;
	}

	.id_input_re_1{
		color : green;
		display : none;
	}
	
	.id_input_re_2{
		color : red;
		display : none;
	}
	
	.id_input_re_3{
		color : red;
		display : none;
	}
	
	.id_form_check{
		color : red;
		display : none;
	}
	
	.pw_input_re_1{
		color : green;
		display : none;
	}
	
	.pw_input_re_2{
		color : red;
		display : none;
	}
	.pw_form_check{
		color : red;
		display : none;
	}
	.email_input_re_1{
		color : green;
		display : none;
	}
	
	.email_input_re_2{
		color : red;
		display : none;
	}
	.email_input_re_3{
		color : red;
		display : none;
	}
	.email_input_re_4{
		color : red;
		display : none;
	}
	.email_form_check{
		color : red;
		display : none;
	}
	.nm_input_re_1{
		color : green;
		display : none;
	}
	
	.nm_input_re_2{
		color : red;
		display : none;
	}
	
	.nm_input_re_3{
		color : red;
		display : none;
	}
	.nm_form_check{
		color : red;
		display : none;
	}
	.age_form_check{
		color : red;
		display : none;
	}
	.final_id_ck{
    display: none;
	}
	.final_pw_ck{
    display: none;
	}
	.final_pwck_ck{
    display: none;
	}
	.final_name_ck{
    display: none;
	}
	.final_mail_ck{
    display: none;
	}
	.final_find_ck{
    display: none;
	}
	.final_addr_ck{
    display: none;
	}
	.final_terms_ck{
	display: none;
	}
	.login_warn{
    margin-top: 30px;
    text-align: center;
    color : red;
}
	
.modal-dialog {
	padding-top: 150px;
}
 
.find:hover{
	cursor: pointer;
	color: #8b8b8b !important;
}

#naver_id_login img{
	width:350px !important;
	margin: 0 auto;
}

.regist-form{
	display:none;
}

.regist-button{
	border: 2px outset #898989;
	font-weight:bold;
	color:#343434;
}

.regist-button:hover{
	background-color:#cdcdcd;
	color:black;
}

.login-button{
	font-weight:bold;
}

</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df487b49cd90a64d7305e577e300f2e4&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">

	$(function(){
		$("#sign-up").on("click",function(){
			$("#title").html("회원가입");
			$("#sign-up-content").fadeIn();
			$("#regist").hide();
		})
		$("#login").on("click",function(){
			$("#title").html("로그인");
			$("#regist").hide();
			$(".login_warn").css("display","none");
			
		})
		$("#regist_in").on("click",function(){
			$("#sign-up-content").hide();
			$(".regist-form").hide();
			$("#regist").fadeIn();
			
			
			$('.id_input_re_1').css("display", "none");
			$('.id_input_re_2').css("display", "none");
			$('.id_input_re_3').css("display", "none");
			$('.final_id_ck').css("display","none");
			$('.id_form_check').css("display","none");
			$('#id_input2').val(null);
			
			$('.pw_input_re_1').css("display", "none");
			$('.pw_input_re_2').css("display", "none");
			$('.pw_form_check').css("display","none");
			$('.final_pw_ck').css("display","none");
			$('.final_pwck_ck').css("display","none");
			$('.pw_form_check').css("display","none");
			$('#pw_input').val(null);
			$('#pw_chk').val(null);
			
			$('.email_input_re_1').css("display", "none");
			$('.email_input_re_2').css("display", "none");
			$('.email_input_re_3').css("display","none");
			$('.email_input_re_4').css("display","none");
			$('.final_mail_ck').css("display","none");
			$('.email_form_check').css("display","none");
			$('#user_Email').val(null);
			
			$('.nm_input_re_1').css("display", "none");
			$('.nm_input_re_2').css("display", "none");
			$('.nm_input_re_3').css("display", "none");
			$('.final_name_ck').css("display","none");
			$('.nm_form_check').css("display","none");
			$('#chk_nm').val(null);
			$('#nm_input').val(null);
			
			$('.age_form_check').css("display","none");
			$('#age_input').val(null);
		
		
			$('#post').val(null);
			$('#addr').val(null);
			$('#daddr').val(null);
			$('.final_addr_ck').css("display","none");
			
			$("#terms").prop("checked",false);
			$('.final_terms_ck').css("display","none");
			
			
		})
		$("#modal").on("click",function(){
			$("#terms").prop("checked",true);
			$(".final_terms_ck").css("display","none");
		})
		/* 다음 주소 연동*/
		$("#address").on("click",function(){
			var width = 500; //팝업의 너비
			var height = 600; //팝업의 높이
			new daum.Postcode({
		        oncomplete: function(data) {
		        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                   addr += extraAddr;
	                
	                } else {
	                    addr += ' ';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $("#post").val(data.zonecode);
	                $("#addr").val(addr);
	                
	                //받은 주소값을 위도 경도로 바꿔서 input hidden 값에 value값으로 넣어주기
	                var geocoder = new kakao.maps.services.Geocoder();
	                var addr2 = data.jibunAddress;
	                geocoder.addressSearch(addr2, function(result, status) {
	                	
	        		    // 정상적으로 검색이 완료됐으면 
	        		     if (status === kakao.maps.services.Status.OK) {
	        				$("#ua_Lat").attr('value',result[0].y);
	        				$("#ua_Lng").attr('value',result[0].x);
	        				
	        		    } else {
	        		    	console.log("에러");
	        		    }
	        		});  
	                
	                // 커서를 상세주소 필드로 이동한다.
	                $("#daddr").attr("readonly",false);
	                $("#daddr").focus();
		        }
		    }).open({
		    	left: (window.screen.width / 2) - (width / 2),
	    	    top: (window.screen.height / 2) - (height / 2),
	    		popupName: 'AddrSearch'
		    });
		})
		
		
	})
</script>

</head>

<body>

	<%@ include file="header.jsp"%>
	<div id="wrap">
		<div class="middle">
			<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 로그인&회원가입</p>
        		</li>	
        	</ul>
		</div>
	</div>
		
		<br />
		<section>
			<div class="login-form">
			  <img src="/images/login/login-logo.png">
			</div>

			<br />
			<br />
			<div class="tabs">
				<input id="login" type="radio" name="tab_item" checked> 
				<label class="tab_item" for="login">로그인</label> 
				<input id="sign-up" type="radio" name="tab_item"> 
				<label class="tab_item" for="sign-up">회원가입</label>
				<div class="tab_content" id="login-content">
					<form action="/login/Normal" method="post">
						<div class="field-wrap1">
							<input type="text" name="user_Id" placeholder="아이디">
						</div>
						<div class="field-wrap2">
							<input type="password" name="user_Pw" placeholder="비밀번호">
						</div>
						<div class="field-wrap-submit">
							<button class="login-button" type="submit">로그인</button>
							<c:if test = "${result == 0 }">
								<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
							</c:if>
						</div>
					</form>
					<div class="forgot-idpw">
						<p class="forgot">
							<!-- Button trigger modal -->
					<a  class="find" data-toggle="modal" data-target="#staticBackdrop">
  					아이디 찾기
					</a>&nbsp;&nbsp;<a class="find" data-toggle="modal" data-target="#staticBackdrop2" style="margin-left:20px;">패스워드 찾기</a>
					<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      	<div class="modal-header">
        	<h5 class="modal-title" id="staticBackdropLabel">아이디 찾기</h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="allclose()">
          	<span aria-hidden="true">&times;</span>
        	</button>
      	</div>
     	 <div class="modal-body">
        	<b style="text-align: left;">이메일 인증</b> <br>
        			<form action="/regist/findId" method="get" id="getid"> 
						<input type="text" id="find_id" name="user_Email" placeholder="  이메일"
							style="width: 300px; margin-bottom:5px;"> 
						<input class="regist-button" type="button" id="find_id_chk" value="이메일 인증" style="width: 100px;">
						<input type="text" id="chk_find" placeholder="인증번호를 입력해 주세요" disabled="disabled" style="width: 300px;">
						<input type="submit" value="아이디 메일 받기" style="width: 150px;" disabled="disabled" id="id_submit"> 
						<br>
						<span class="find_input_re_1">인증번호가 일치합니다.</span>
						<span class="find_input_re_2">인증번호를 다시 확인해주세요.</span>
						<span class="find_input_re_3">등록이 되지않은 이메일 입니다.</span>
						<span class="final_find_ck">이메일을 입력해주세요.</span>
						<span class="find_form_check"></span>
						<br>
				</form>
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="allclose()">닫기</button>
      	</div>
    	</div>
  	</div>
	</div>
	<div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      	<div class="modal-header">
        	<h5 class="modal-title" id="staticBackdropLabel">패스워드 찾기</h5>
        	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="allclose()">
          	<span aria-hidden="true">&times;</span>
        	</button>
      	</div>
     	 <div class="modal-body">
     	 	<b style="text-align: left;">아이디</b> <br> 
						<input type="text" id="id_input" name="user_Id" placeholder="  아이디" style="width: 300px;">
						<input class="regist-button" type="button" id="find_pw" value="아이디 확인" style="width: 100px;">
						<br>
						<span class="id_input_re_1">가입된 아이디 입니다.</span>
						<span class="id_input_re_2">가입되지 않은 아이디 입니다.</span>
						<span class="id_form_check"></span> 
						<br>
        	<b style="text-align: left;">이메일 인증</b> <br> 
        					<form action="/regist/findPw" method="get" id="getpw">
						<input type="text" id="find_pw_input" name="user_Email" placeholder="  이메일"
							style="width: 300px; margin-bottom:5px;">
							<input class="regist-button" type="button" id="find_pw_chk" value="이메일 인증" style="width: 100px;">
						
						<input type="text" id="chk_find_pw" placeholder="인증번호를 입력해 주세요" disabled="disabled" style="width: 300px;">
						<input type="submit" value="비밀번호 메일 받기" style="width: 150px;" disabled="disabled" id="pw_submit"> 
						<br>
						<span class="find_input_re_1">인증번호가 일치합니다.</span>
						<span class="find_input_re_2">인증번호를 다시 확인해주세요.</span>
						<span class="find_input_re_3">등록이 되지않은 이메일 입니다.</span>
						<span class="final_find_ck">이메일을 입력해주세요.</span>
						<span class="find_form_check"></span>
						<br>
						</form>
      	</div>
      	<div class="modal-footer">
        	<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="allclose()">닫기</button>
      	</div>
    	</div>
  	</div>
	</div>
					</div>
					<script type="text/javascript">
					 var code = "";
					$("#find_id_chk").click(function(){
						let user_Email = $("#find_id").val();
						let checkBox = $("#chk_find");
						let warnMsg = $(".find_form_check");
						$('.final_find_ck').css('display', 'none');
						
						if(mailFormCheck(user_Email)){
					        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
					        warnMsg.css("color","green");
					        warnMsg.css("display", "inline-block");
					    } else {
					        warnMsg.html("올바르지 못한 이메일 형식입니다.");
					        warnMsg.css("color","red");
					        warnMsg.css("display", "inline-block");
					        $("#find_id").val(null);
					        return false;
					    } 
						$.ajax({
							type : "GET",
							url : "/regist/findEmail?user_Email=" + user_Email,
							success:function(data){
								
								if(data == 'naver'){
									warnMsg.html("네이버 아이디로 가입된 이메일 입니다. 네이버 간편 로그인 해주세요.");
								} else if(data == 'kakao'){
									warnMsg.html("카카오 아이디로 가입된 이메일 입니다. 카카오 간편 로그인 해주세요.");
								} else if(data == 'fail'){
									warnMsg.html("가입되지 않은 이메일 입니다.");
									 warnMsg.css("color","red");
									 $("#find_id").val(null);
									
								} else {
									checkBox.attr("disabled", false);
									code = data;
									$('.find_input_re_3').css("display","none");
								}
								
							}
							
						})
						
					})
					
					$("#chk_find").on("propertychange change keyup paste input",function(){ // 인증번호 입력할때 마다
					let inputcode = $("#chk_find").val(); // 입력한 인증번호
		
					if(inputcode == code){
					$('.find_input_re_1').css("display","inline-block");
					$('.find_input_re_2').css("display", "none");
					$(".find_form_check").css("display","none");
					$("#id_submit").attr("disabled",false);
					emailnumCheck = true;
						} else{
					$('.find_input_re_2').css("display","inline-block");
					$('.find_input_re_1').css("display", "none");
					$(".find_form_check").css("display","none");
					emailnumCheck = false;
			
					}
					})
					
					function mailFormCheck(email){
					var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
					return form.test(email);
					}
						
					function allclose(){
						$("#find_id").val(null);
						$("#chk_find").val(null);
						$(".find_inpur_re_1").css("display","none");
						$(".find_inpur_re_2").css("display","none");
						$(".find_inpur_re_3").css("display","none");
						$(".final_find_ck").css("display","none");
						$(".find_form_check").css("display","none");
						$("#id_input").val(null);
						$(".id_input_re_1").css("display","none");
						$(".id_input_re_2").css("display","none");
						$("#find_pw_input").val(null);
						
					}
					
					$('#find_pw').on("click", function(){ // 아이디 입력마다 값을 확인
						let user_Id = $('#id_input').val();
						let warnMsg = $(".id_form_check"); // 비밀번호 경고글
						 $('.final_id_ck').css('display', 'none');
						let data = {user_Id : user_Id}
						
						
						$.ajax({
							type : "post",
							url : "/regist/idChk",
							data : data,
							success : function(result){
								if(result != 'fail'){
									$('.id_input_re_2').css("display","inline-block");
									$('.id_input_re_1').css("display", "none");
									warnMsg.css("display", "none");
									$('#id_input').val(null);
									idckCheck = false;
								} else {
									
									$('.id_input_re_1').css("display","inline-block");
									$('.id_input_re_2').css("display", "none");
									warnMsg.css("display", "none");
									idckCheck = true;
								}
							}
						})

					});// function 종료
					$("#find_pw_chk").click(function(){
						let user_Email = $("#find_pw_input").val();
						let checkBox = $("#chk_find_pw");
						let warnMsg = $(".find_form_check");
						$('.final_find_ck').css('display', 'none');
						
						if(mailFormCheck(user_Email)){
					        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
					        warnMsg.css("color","green");
					        warnMsg.css("display", "inline-block");
					    } else {
					        warnMsg.html("올바르지 못한 이메일 형식입니다.");
					        warnMsg.css("color","red");
					        warnMsg.css("display", "inline-block");
					        $("#find_pw_input").val(null);
					        return false;
					    } 
						$.ajax({
							type : "GET",
							url : "/regist/findEmail?user_Email=" + user_Email,
							success:function(data){
								
								if(data == 'naver'){
									warnMsg.html("네이버 아이디로 가입된 이메일 입니다. 네이버 간편 로그인 해주세요.");
								} else if(data == 'kakao'){
									warnMsg.html("카카오 아이디로 가입된 이메일 입니다. 카카오 간편 로그인 해주세요.");
								} else if(data == 'fail'){
									warnMsg.html("가입되지 않은 이메일 입니다.");
									 warnMsg.css("color","red");
									 $("#find_pw_input").val(null);
									
								} else {
									checkBox.attr("disabled", false);
									code = data;
									$('.find_input_re_3').css("display","none");
								}
								
							}
							
						})
						
					})
					
					$("#chk_find_pw").on("propertychange change keyup paste input",function(){ // 인증번호 입력할때 마다
					let user_Email = $("#find_pw_input").val();
					let inputcode = $("#chk_find_pw").val(); // 입력한 인증번호
		
					if(inputcode == code){
					$('.find_input_re_1').css("display","inline-block");
					$('.find_input_re_2').css("display", "none");
					$(".find_form_check").css("display","none");
					if($("#id_input").val() != null){
						$("#pw_submit").attr("disabled",false);
						}
					} else{
					$('.find_input_re_2').css("display","inline-block");
					$('.find_input_re_1').css("display", "none");
					$(".find_form_check").css("display","none");
					emailnumCheck = false;
			
					}
					})
					
					</script>
					<h3 style="text-align: center;">SNS 간편 로그인</h3>
					<div class="api-login">
                	<div id="naver_id_login" style="display: none;"></div>
					<div class="naver-button" style="display:inline-block">
							<!-- 네이버 로그인 버튼 노출 영역 -->
	                	
	                	<a href="https://nid.naver.com/oauth2.0/authorize?response_type=token&amp;client_id=JGPtZuIPhsS22_zSl6eT&amp;redirect_uri=http%3A%2F%2Flocalhost%3A8787%2Fhome&amp;state=109291b6-428e-4335-8890-2c65ad0d44e4" id="naver_id_login_anchor">
	                	<img src="http://static.nid.naver.com/oauth/big_w.PNG" border="0" title="네이버 아이디로 로그인" width="250px" height="50px"></a>
							<!-- //네이버 로그인 버튼 노출 영역 -->
					</div>
					<script type="text/javascript">
						var naver_id_login = new naver_id_login("JGPtZuIPhsS22_zSl6eT", "http://localhost:8787/home");
						var state = naver_id_login.getUniqState();
						naver_id_login.setDomain("http://localhost:8787");
						naver_id_login.setButton("white", 3,60);
						naver_id_login.setState(state);
						naver_id_login.init_naver_id_login();
					</script>
					<div class="kakao-button" style="display:inline-block">
						<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=6271ae3b4283fa56e846863ed3a4f7be&redirect_uri=http://localhost:8787/home&response_type=code">
							<img src="/images/login/kakao_login_large_wide.png" style="width:250px; height:50px;">
							</a>
					</div>
					</div>
				</div>
				<div class="tab_content" id="sign-up-content">
					<div class="sign-up-button">
						<button type="button" id="regist_in">통합 회원 가입</button>
						<div class="forgot-idpw">
							<p class="forgot">
								이미회원이신가요?&nbsp;|&nbsp;<a href="/login">로그인</a>
							</p>
						</div>
						
					</div>
				</div>
				<div class="tab_content" id="sign-up-form-content"></div>
				<div id="regist" style="display: none; height: 100%;">
					<br>
					<br>
					<form id="regist_join" method="post">
					 
					<div style="text-align:center;">
					<br>
						<a href="#" data-toggle="modal" data-target="#myModal"><b>[필수] 이용약관 보기</b></a>
						<input type="checkbox" id="terms" style="width: 50px; height: 15px;" onclick="return false">
						<span class="final_terms_ck">이용약관에 동의해주세요.</span>
					</div>
					<div class="regist-form">
						<div style="margin-bottom:15px;">
							<br>
							<b style="text-align: left;">아이디</b> <br> 
							<input type="text" id="id_input2" name="user_Id" placeholder=" 5~20자의 영문,숫자,특수문자(._-)만 사용 가능합니다." style="width: 400px;">
							<input class="regist-button" type="button" id="id_chk" value="중복 확인" style="width: 80px;">
							<br>
							<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
							<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
							<span class="id_input_re_3">중복확인을 해주세요</span>
							<span class="final_id_ck">아이디를 입력해주세요.</span>
							<span class="id_form_check"></span> 
						</div>
						<div style="margin-bottom:15px;">
							<b style="text-align: left;">비밀번호</b> 
							<input type="password" id="pw_input" placeholder="  8~16자 영문,숫자,특수문자를 최소 한가지씩 사용하세요."> <br>
							<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
							<span class="pw_form_check"></span>
							<br> 
							<b style="text-align: left;">비밀번호 확인</b>
							<br> 
							<input type="password" id="pw_chk" name="user_Pw" placeholder="  비밀번호 확인">
								<br>
							<span class="pw_input_re_1">비밀번호가 같습니다.</span>
							<span class="pw_input_re_2">비밀번호가 다릅니다.</span>
							<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
						</div>
						<div style="margin-bottom:15px;">
							<b style="text-align: left;">이메일 인증</b> <br> 
							<input type="text" id="email_input" name="user_Email" placeholder="  이메일"
								style="width: 370px; margin-bottom:5px;"> 
							<input  class="regist-button" type="button" id="mail_chk" value="이메일 인증" style="width: 100px;">
							<input type="text" id="chk_nm" placeholder="인증번호를 입력해 주세요" disabled="disabled">
							<br>
							<span class="email_input_re_1">인증번호가 일치합니다.</span>
							<span class="email_input_re_2">인증번호를 다시 확인해주세요.</span>
							<span class="email_input_re_3">이미 등록된 이메일 입니다.</span>
							<span class="email_input_re_4">이메일 인증을 해주세요</span>
							<span class="final_mail_ck">이메일을 입력해주세요.</span>
							<span class="email_form_check"></span>
						</div>
						<div style="margin-bottom:15px;">
							<b style="text-align: left;">닉네임</b> <br> 
							<input type="text" id="nm_input" name="user_Nm" placeholder="  2~10자의 영어,숫자,한글만 사용 가능합니다." style="width: 400px;">
							<input class="regist-button" type="button" id="nm_chk" value="중복 확인" style="width: 80px;">
							<br>
							<span class="nm_input_re_1">사용 가능한 닉네임입니니다.</span>
							<span class="nm_input_re_2">닉네임이 이미 존재합니다.</span>
							<span class="nm_input_re_3">중복확인을 해주세요</span>
							<span class="final_name_ck">닉네임을 입력해주세요.</span>
							<span class="nm_form_check"></span>
						</div>
						<div style="margin-bottom: 15px;">
							<b style="text-align: left;">나이</b> <br> 
							<input type="text" id="age_input" name="user_Age" placeholder="  숫자만 입력해 주세요." style="width: 500px;">
							<br>
							<span class="age_form_check"></span>
						</div>
						<div>
							<b style="text-align: left;">주소</b> <br> 
							<input type="text" name="ua_Post" id="post" placeholder="  우편번호"
								style="width: 200px; margin-bottom:5px;" readonly="readonly">
								<input class="regist-button" type="button" id="address" value="주소찾기" style="width: 100px;">
							<input type="text" name="ua_Addr" id="addr" placeholder="  주소"
								style="width: 500px; margin-bottom:5px;" readonly="readonly"> 
								<input type="hidden" name="ua_Lat" id="ua_Lat">
								<input type="hidden" name="ua_Lng" id="ua_Lng">
								<input type="text" name="ua_DAddr" id="daddr" placeholder="  상세주소"
								style="width: 500px;" readonly="readonly">
								<br>
								<span class="final_addr_ck">주소를 입력해주세요.</span>
						</div>
						<div>
							<br> <b style="text-align: left;">성별</b> <br> 
							<input type="radio" name="user_Gender" value="M"
								style="width: 50px; height: 20px;" checked="checked">남자 
								<input type="radio" name="user_Gender" value="F" 
								style="width: 50px; height: 20px;">여자
							<br>
						</div>
					</div>
					<hr>
					<div class="text-center">
						<div class="modal fade" id="myModal" data-backdrop="static"
							data-keyboard="false">
							<div class="modal-dialog modal-xl modal-dialog-centered">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">이용약관</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<textarea rows="" cols="" style="width: 400px; height: 400px;">제1조(목적) 이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)

  ① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정) 

  ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

  ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

  ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

  ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 

  ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경) 

  ① “몰”은 다음과 같은 업무를 수행합니다.

    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
    2. 구매계약이 체결된 재화 또는 용역의 배송
    3. 기타 “몰”이 정하는 업무

  ② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.

  ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.

  ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단) 

  ① “몰”은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

  ② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

  ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.

제6조(회원가입) 

  ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.

  ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.

    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
    3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우

  ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.

  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등) 

  ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.

  ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.

    1. 가입 신청 시에 허위 내용을 등록한 경우
    2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
    3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
    4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

  ③ “몰”이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.

  ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(회원에 대한 통지)

  ① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.

  ② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

제9조(구매신청 및 개인정보 제공 동의 등) 

  ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 
      1. 재화 등의 검색 및 선택
      2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
      3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인
      4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시
         (예, 마우스 클릭)
      5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
      6. 결제방법의 선택

  ② “몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)


  ③ “몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.


제10조 (계약의 성립)

  ①  “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.

    1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
    2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
    3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우

  ② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.

  ③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.

제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가하여 징수할 수 없습니다.

    1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
    2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
    3. 온라인무통장입금
    4. 전자화폐에 의한 결제
    5. 수령 시 대금지급
    6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
    7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제  
    8. 기타 전자적 지급 방법에 의한 대금 지급 등

제12조(수신확인통지·구매신청 변경 및 취소)

  ① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.

  ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.

제13조(재화 등의 공급)

  ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.  이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.

  ② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.

제14조(환급) “몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.

제15조(청약철회 등)

  ① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. 

  ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.

    1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
    2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
    3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
    4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우

  ③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.

  ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제16조(청약철회 등의 효과)

  ① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.

  ② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.

  ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.

  ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을  누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.

제17조(개인정보보호)

  ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. 

  ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.

  ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 

  ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.

  ⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.

  ⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
 
  ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.

  ⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.

  ⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.

제18조(“몰“의 의무)

  ① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다.

  ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.

  ③ “몰”이 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.

  ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제19조(회원의 ID 및 비밀번호에 대한 의무)

  ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.

  ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.

  ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.

제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.

    1. 신청 또는 변경시 허위 내용의 등록
    2. 타인의 정보 도용
    3. “몰”에 게시된 정보의 변경
    4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
    5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
    6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
    7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위

제21조(연결“몰”과 피연결“몰” 간의 관계)

  ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.

  ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.

제22조(저작권의 귀속 및 이용제한)

  ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.

  ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.

  ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.

제23조(분쟁해결)

  ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.

  ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.

  ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제24조(재판권 및 준거법)

  ① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.

  ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
										</textarea>
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal" id="modal">약관 동의</button>
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
									</div>

								</div>
							</div>
						</div>
						<br><br><br><br>
						 <input class="regist-button" type="button" value="회원가입" id="regist_com" 
							style="width: 120px;"> 
							
					</div>
					</form>
				</div>
			</div>
		</section>

	</div>
	<!-- <div id="end"><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div> -->
	<%@ include file="footer.jsp"%>
	<script type="text/javascript">
	
	$(function(){
		 var code = "";
		 var idCheck = false;            // 아이디
		 var idckCheck = false;            // 아이디 중복 검사
		 var pwCheck = false;            // 비번
		 var pwckCheck = false;            // 비번 확인
		 var pwckcorCheck = false;        // 비번 확인 일치 확인
		 var nmCheck = false;            // 이름
		 var emailCheck = false;            // 이메일
		 var emailnumCheck = false;        // 이메일 인증번호 확인
		 var addrCheck = false;         // 주소
		 var termsCheck = false; 		// 이용약관
	
	//아이디 중복검사
	$('#id_chk').on("click", function(){ // 아이디 입력마다 값을 확인
		$('.id_input_re_3').css('display','none');
		let user_Id = $('#id_input2').val();
		console.log(user_Id);
		let warnMsg = $(".id_form_check"); 
		 $('.final_id_ck').css('display', 'none');
		let data = {user_Id : user_Id}
		
		if(idFormCheck(user_Id)){
	        
	    } else {
	        warnMsg.html("5 ~ 20자의 영문과 숫자와 일부 특수문자(._-)만 사용 가능합니다.");
	        warnMsg.css("color","red");
	        warnMsg.css("display", "inline-block");
	        $('.id_input_re_1').css("display", "none");
	        $('.id_input_re_2').css("display", "none");
	        $("#id_input2").val(null);
	        return false;
	    } 
		
		$.ajax({
			type : "post",
			url : "/regist/idChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");
					warnMsg.css("display", "none");
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");
					warnMsg.css("display", "none");
					$('#id_input2').val(null);
					idckCheck = false;
				}
			}
		})

	});// function 종료
	
	$('#pw_input').blur(function(){ // 비밀번호 유형 검사
		let warnMsg = $(".pw_form_check"); // 비밀번호 경고글
		let user_Pw = $("#pw_input").val();
		 $('.final_pw_ck').css('display', 'none');
		
		if(pwFormCheck(user_Pw)){
	        warnMsg.html("올바른 비밀번호 형식입니다.");
	        warnMsg.css("color","green");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html("8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 사용하세요");
	        warnMsg.css("color","red");
	        warnMsg.css("display", "inline-block");
	        $("#pw_input").val(null);
	        return false;
	    } 
	})
	
	// 비밀번호 확인
	$('#pw_chk').on("propertychange change keyup paste input", function(){ // 비밀번호 입력마다 값을 확인
		let pw_input = $('#pw_input').val();
		let pw_chk = $('#pw_chk').val();
		$('.final_pwck_ck').css('display', 'none');
		
		
		if(pw_input == pw_chk){
			$('.pw_input_re_1').css("display","inline-block");
			$('.pw_input_re_2').css("display", "none");
			pwckcorCheck = true;
		} else {
			$('.pw_input_re_2').css("display","inline-block");
			$('.pw_input_re_1').css("display", "none");
			pwckcorCheck = false;
			
		}
		

	});// function 종료
	
	// 인증번호 이메일 전송
	$("#mail_chk").click(function(){
		$('.email_input_re_4').css('display','none');
		let user_Email = $("#email_input").val(); // 입력한 이메일
		let checkBox = $("#chk_nm"); // 인증번호 입력란
		let warnMsg = $(".email_form_check"); // 이메일 경고글
		 $('.final_mail_ck').css('display', 'none');
		
		if(mailFormCheck(user_Email)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("color","green");
	        warnMsg.css("display", "inline-block");
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("color","red");
	        warnMsg.css("display", "inline-block");
	        $("#email_input").val(null);
	        return false;
	    } 
		
		$.ajax({
			type : "GET",
			url : "/regist/mailChk?user_Email=" + user_Email,
			success:function(data){
				
				if(data != 'fail'){
					checkBox.attr("disabled", false);
					code = data;
					$('.email_input_re_3').css("display","none");
				} else {
					$('.email_input_re_3').css("display","inline-block");
					warnMsg.css("display", "none");
				}
				
			}
			
		})
	})
	
	// 인증번호 비교
	$("#chk_nm").on("propertychange change keyup paste input",function(){ // 인증번호 입력후 다른곳 클릭하면
		let inputcode = $("#chk_nm").val(); // 입력한 인증번호
		
		if(inputcode == code){
			$('.email_input_re_1').css("display","inline-block");
			$('.email_input_re_2').css("display", "none");
			$(".email_form_check").css("display","none");
			$("#email_input").attr("readonly",true);
			$("#mail_chk").attr("disabled",true);
			emailnumCheck = true;
		} else{
			$('.email_input_re_2').css("display","inline-block");
			$('.email_input_re_1').css("display", "none");
			$(".email_form_check").css("display","none");
			emailnumCheck = false;
			
		}
	})
	//닉네임 중복검사
	$('#nm_chk').on("click", function(){ // 버튼클릭 시
		$('.nm_input_re_3').css('display','none');
		let user_Nm = $('#nm_input').val();
		let data = {user_Nm : user_Nm}
		let warnMsg = $(".nm_form_check"); // 닉네임 경고글
		$(".final_name_ck").css("display","none");
		
		if(nmFormCheck(user_Nm)){
	        
	    	} else {
	        	warnMsg.html("2 ~ 10자의 영어, 숫자, 한글만 사용 가능합니다.");
	        	warnMsg.css("color","red");
	        	warnMsg.css("display", "inline-block");
	        	$('.nm_input_re_1').css("display", "none");
	        	$('.nm_input_re_2').css("display", "none");
	        	$("#nm_input").val(null);
	        	return false;
	    	} 
		
		$.ajax({
			type : "post",
			url : "/regist/nmChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.nm_input_re_1').css("display","inline-block");
					$('.nm_input_re_2').css("display", "none");
					warnMsg.css("display", "none");
					nmCheck = true;
				} else {
					$('.nm_input_re_2').css("display","inline-block");
					$('.nm_input_re_1').css("display", "none");
					warnMsg.css("display", "none");
					$('#nm_input').val(null);
					nmCheck = false;
				}
			}
		})

	});// function 종료
	
	$('#age_input').blur(function(){ // 비밀번호 유형 검사
		let warnMsg = $(".age_form_check"); // 비밀번호 경고글
		let user_Age = $("#age_input").val();
		
		if(ageFormCheck(user_Age)){
	        warnMsg.css("display", "none");
	    } else {
	        warnMsg.html("숫자만 입력해 주세요");
	        warnMsg.css("color","red");
	        warnMsg.css("display", "inline-block");
	        $("#age_input").val(null);
	        return false;
	    } 
	})
	
	$('#regist_com').on("click" , function(){ // 회원가입 버튼
		var id = $('#id_input2').val();                 // id 입력란
        var pw = $('#pw_input').val();                // 비밀번호 입력란
        var pwck = $('#pw_chk').val();            // 비밀번호 확인 입력란
        var name = $('#nm_input').val();            // 이름 입력란
        var mail = $('#email_input').val();            // 이메일 입력란
        var addr = $('#addr').val();        // 상세 주소 입력란
        var age = $('#age_input').val();
        
        
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        if(idckCheck == false){
        	$('.id_input_re_3').css('display','block');
        }else{
        	$('.id_input_re_3').css('display','none');
        }
        
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nmCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nmCheck = true;
        }
        
        if(nmCheck == false){
        	$('.nm_input_re_3').css('display','block');
        }else{
        	$('.nm_input_re_3').css('display','none');
        }
        
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            emailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            emailCheck = true;
        }
        
        if(emailCheck == false){
        	$('.email_input_re_4').css('display','block');
        }else{
        	$('.email_input_re_4').css('display','none');
        }
        
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
        
        if($("#terms").prop("checked") != true){
        	$('.final_terms_ck').css('display','block');
        	termsCheck = false;
        } else {
        	$('.final_terms_ck').css('display', 'none');
        	termsCheck = true;
        }
        
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nmCheck&&emailCheck&&emailnumCheck&&addressCheck&&termsCheck ){
        	 $("#regist_join").attr("action","/regist/join");
        	 $("#regist_join").submit();
        	 
        }

        return false;
	})
	
	function mailFormCheck(email){
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email);
	}
	
	function pwFormCheck(pw){
		var form = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		return form.test(pw);
	}
	
	function idFormCheck(id){
		var form = /^(?=.*[a-zA-Z])[-a-zA-Z0-9_.]{5,20}$/;
		return form.test(id);
	}
	
	function nmFormCheck(nm){
		var form = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$/;
		return form.test(nm);
	}
	
	function ageFormCheck(age){
		var form = /^([0-9]){2,3}$/;
		return form.test(age);
	}
	
})

$("#modal").click(function(){
	$(".regist-form").fadeIn(1000);
});

	</script>
</body>
</html>