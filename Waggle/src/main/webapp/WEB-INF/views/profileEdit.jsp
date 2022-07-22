<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle</title>
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

.inputbutton {
	background-color: #f2f2f2;
	border: none;
	border-radius: 8px;
	box-sizing: border-box;
	color: #000000;
	font-size: 13px;
	font-weight: 500;
	font-family: inherit;
	letter-spacing: .25px;
	line-height: normal;
	padding: 5px 5px;
}

.inputbutton:hover {
	background: #E6E6E6;
	color: #000000;
}

.inputbutton:active {
	outline: none;
	border: 1px solid #ffffff;
}


/* 프로필 사진 수정 시작 */
.profile {
    background-size: cover;
    background-position: center;
    width: 200px;
    height: 200px;
    border-radius: 50%;
    overflow: hidden;
    margin: 0 auto;
    padding: 0;
    position: relative;
    margin-top:40px;
}
 .profile:hover .edit, .profile:hover .delete {
    opacity: 0.5;
}
 .profile .edit, .profile .delete {
    cursor: pointer;
    overflow: hidden;
    width: 200px;
    height: 50%;
    position: absolute;
    margin: 0;
    padding: 0;
    color: white;
    font-size: 3em;
    text-align: center;
    line-height: 100px;
    left: 0;
    opacity: 0;
}
 .profile .edit:hover, .profile .delete:hover {
    opacity: 1;
}
 .profile .edit {
    top: 0;
    background-color: rgba(200,200,200,0.8);
}
 .profile .edit span {
    transform: rotate(45deg);
    display: block;
}
 .profile .edit input {
    opacity: 0;
    height: 0;
    width: 0;
}
 .profile .delete {
    bottom: 0;
    background-color: rgba(250,150,175,0.8);
}
/* 프로필 사진 수정 끝 */

/*성별 라디오*/
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 35px;
    width: 120px;
    border: 1px solid #333;
    border-radius:10px;
    line-height: 35px;
    text-align: center;
    font-weight:bold;
    font-size:16px;
}

.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
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
.final_pwck_ck{
    display: none;
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
	.nm_form_check{
		color : red;
		display : none;
	}
.age_form_check{
		color : red;
		display : none;
	}
/*성별 라디오 끝 */
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
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
               <p>HOME > 마이페이지 > 회원정보 수정하기</p>
            </ul>
         </div>
        </div>
         <div class="edit-Title" style="margin:0 auto; width:1000px; text-align:center; font-size:16pt">
         회원정보 수정하기
         </div>
         <div class="edit-profile-img" style="margin:0 auto; width:1000px; text-align:center">
         	<form action="/mypage/imageEdit" method="post"> 
            <div class="profile" style="background-image:url(/images/importToJsp/profile_default.jpg)">
              <label class="edit">
                <span>&#10002;</span>
                <input type="file" id="imginput"/>
              </label>
              <div class="delete" onclick="removeimg()">&times;</div>
            </div>
            <input type="hidden" id="imgUrl" name="imgUrl" value="">
            <input type="submit" id="img-input" value="프로필사진 수정하기" style="margin-top:20px">
            </form>
         </div>
         <div class="edit-profile-info" style="margin:0 auto; width:500px">
			<form action="/mypage/pwchange" method="post">
            <div>
            <p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">비밀번호</p>
            <input type="password" id="pw_input" style="width:500px; height:30px; border:1px solid; border-radius:6px; line-height:3; padding-left:15px">
            <br>
            <span class="pw_form_check"></span> 
            </div>
            <div>
            <p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">비밀번호 확인</p>
            <input type="password" id="pw_chk" name="user_Pw" style="width:300px; height:30px; border:1px solid; border-radius:6px; line-height:3; padding-left:15px">
           
            <input type="hidden" name="user_Code" value="${user_Code }">
            <input type="submit" id="change_pw" value="비밀번호 수정" disabled="disabled" class="inputbutton">
            
            <br>
            <span class="pw_input_re_1">비밀번호가 같습니다.</span>
			<span class="pw_input_re_2">비밀번호가 다릅니다.</span>
            </div>
            </form>
            <form action="/mypage/emailchange" method="post">
            <div>
            <p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">이메일</p>
            <input type="text" id="email_input" name="user_Email" value="${user_Email }" style="width:500px; height:30px; border:1px solid; border-radius:6px; line-height:3; padding-left:15px">
            <input type="button" id="mail_chk" value="이메일 인증" style="width: 100px;" class="inputbutton">
						<input type="text" id="chk_nm" placeholder="인증번호를 입력해 주세요" disabled="disabled">
						<input type="hidden" name="user_Code" value="${user_Code }">
						<input type="submit" id="change_email" value="이메일 수정" disabled="disabled" class="inputbutton">
						<br>
						<span class="email_input_re_1">인증번호가 일치합니다.</span>
						<span class="email_input_re_2">인증번호를 다시 확인해주세요.</span>
						<span class="email_input_re_3">이미 등록된 이메일 입니다.</span>
						<span class="email_form_check"></span>
            </div>
            </form>
            <form action="/mypage/nmchange" method="post">
            <div>
            <p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">닉네임</p>
            <input type="text" id="nm_input" name="user_Nm" value="${user_Nm }" style="width:500px; height:30px; border:1px solid; border-radius:6px; line-height:3; padding-left:15px">
            <input type="button" id="nm_chk" value="중복 확인" style="width: 80px;" class="inputbutton">
            <input type="hidden" name="user_Code" value="${user_Code }">
            <input type="submit" id="change_nm" value="닉네임 수정" disabled="disabled" class="inputbutton">
						<br>
						<span class="nm_input_re_1">사용 가능한 닉네임입니니다.</span>
						<span class="nm_input_re_2">닉네임이 이미 존재합니다.</span>
						<span class="nm_form_check"></span>
            </div>
            </form>
            <form action="/mypage/agechange" method="post">
            <div>
            <p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">나이</p>
            <input type="text" id="age_input" name="user_Age" value="${user_Age }" style="width:500px; height:30px; border:1px solid; border-radius:6px; line-height:3; padding-left:15px">
            <input type="hidden" name="user_Code" value="${user_Code }">
            <input type="submit" id="change_age" value="나이 수정" disabled="disabled" class="inputbutton">
            <br>
            <span class="age_form_check"></span>
            </div>
            </form>
            <form action="/mypage/addrchange" method="get">
            <div>
            <p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">주소</p>
            <c:if test="${user_Code == param.ua_UCode}">
            <input type="text" id="post" name="ua_Post" value="${dto.ua_Post }" readonly="readonly" style="width:150px; height:30px; border:1px solid; border-radius:6px; line-height:3; padding-left:15px; display:inline-block">
            <input type="button" id="address" value="우편번호 찾기" style="width: 95px;" class="inputbutton">
            <input type="text" id="addr" name="ua_Addr" value="${dto.ua_Addr }" readonly="readonly" style="width:500px; height:30px; border:1px solid; border-radius:6px; line-height:3; padding-left:15px; margin-top:5px;">
            <input type="text" id="daddr" name="ua_DAddr" value="${dto.ua_DAddr }" style="width:500px; height:30px; border:1px solid; border-radius:6px; line-height:3; padding-left:15px; margin-top:5px" placeholder="상세주소">
            <input type="hidden" name="ua_UCode" value="${user_Code }">
            <input type="submit" id="change_addr" value="주소 수정" disabled="disabled" class="inputbutton">
            </c:if>
            </div>
            </form>
            <form action="/mypage/genderchange" method="post">
            <div>
            <input type="hidden" name="user_Code" value="${user_Code }">
            <p style="margin:0; margin-bottom:5px; margin-top: 20px; margin-left:5px">성별</p>
            </div>
            <c:if test="${user_Gender == 'M'}">
            <div class="select">
				
               <input type="radio" id="select" name="user_Gender" value="M" checked="checked"><label for="select" >남자</label>

               <input type="radio" id="select2" name="user_Gender" value="F"><label for="select2">여자</label>
               
            </div>
            </c:if>
            <c:if test="${user_Gender == 'F' }">
            <div class="select">
				
               <input type="radio" id="select" name="user_Gender" value="M"><label for="select" >남자</label>

               <input type="radio" id="select2" name="user_Gender" value="F" checked="checked"><label for="select2">여자</label>
              
            </div>
            </c:if>
            <c:if test="${user_Gender == null }">
            <div class="select">
				
               <input type="radio" id="select" name="user_Gender" value="M"><label for="select" >남자</label>

               <input type="radio" id="select2" name="user_Gender" value="F" ><label for="select2">여자</label>
               
            </div>
            
            </c:if>
            <input type="submit" id="change_gender" value="성별 수정" class="inputbutton">
            </form>
            <div style="width:500px; margin-top:100px; border-bottom:2px solid #898989; height:10px"></div>
            
            <div style="margin-top:30px; text-align:center">
               <div onclick="location.href='/mypage_me'" style="width:150px; height:35px; border:3px solid; border-radius:15px; line-height:35px; display:inline-block; text-align:center; font-weight:bold; margin-left:50px">돌아가기</div>
            </div>
         <div class="edit-button">
         
         </div>
      </div>
     </div>
   
   <%@ include file="footer.jsp"%>
</body>
<script>
function removeimg() {
	  $(".profile").attr("style","background-image:url(/images/importToJsp/profile_default.jpg)");
	};
	
	
$(function(){

//프로필 사진 수정 시작
var input = document.getElementById("imginput");
var image = document.querySelector('.profile');

input.addEventListener('change', function(event){
  var reader = new FileReader();
  reader.onload = function(e){
    setImageUrl(e.target.result);
    $("#imgUrl").attr("value",e.target.result);
    console.log($("#imgUrl").val());
  };
  reader.readAsDataURL(event.target.files[0]);
});

function setImageUrl(url){
  image.style.backgroundImage = 'url('+url+')';
};

//프로필 사진 수정 끝

$('#pw_input').blur(function(){ // 비밀번호 유형 검사
   let warnMsg = $(".pw_form_check"); // 비밀번호 경고글
   let user_Pw = $("#pw_input").val();
   
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

  

   
   
   if(pw_input == pw_chk){
      $('.pw_input_re_1').css("display","inline-block");
      $('.pw_input_re_2').css("display", "none");
      $("#change_pw").attr("disabled",false);
   } else {
      $('.pw_input_re_2').css("display","inline-block");
      $('.pw_input_re_1').css("display", "none");
      $("#change_pw").attr("disabled",true);
     
      
   }
   

});// function 종료

$("#mail_chk").click(function(){
	let user_Email = $("#email_input").val(); // 입력한 이메일
	let checkBox = $("#chk_nm"); // 인증번호 입력란
	let warnMsg = $(".email_form_check"); // 이메일 경고글
	 
	
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
		$("#change_email").attr("disabled",false);
		
	} else{
		$('.email_input_re_2').css("display","inline-block");
		$('.email_input_re_1').css("display", "none");
		$(".email_form_check").css("display","none");
		$("#change_email").attr("disabled",true);
		
		
	}
})
$('#nm_input').on("propertychange change keyup paste input",function(){
	$("#change_nm").attr("disabled",true);
})

//닉네임 중복검사
$('#nm_chk').on("click", function(){ // 버튼클릭 시
	let user_Nm = $('#nm_input').val();
	let data = {user_Nm : user_Nm}
	let warnMsg = $(".nm_form_check"); // 닉네임 경고글
	
	
	if(nmFormCheck(user_Nm)){
        
    	} else {
        	warnMsg.html("2 ~ 16자의 영어, 숫자, 한글만 사용 가능합니다.");
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
				$("#change_nm").attr("disabled",false);
				
			} else {
				$('.nm_input_re_2').css("display","inline-block");
				$('.nm_input_re_1').css("display", "none");
				warnMsg.css("display", "none");
				$('#nm_input').val(null);
				$("#change_nm").attr("disabled",true);
				
			}
		}
	})

});// function 종료

$('#age_input').on("propertychange change keyup paste input",function(){ // 나이 유형 검사
	let warnMsg = $(".age_form_check"); // 비밀번호 경고글
	let user_Age = $("#age_input").val();
	
	if(ageFormCheck(user_Age)){
        warnMsg.css("display", "none");
        $("#change_age").attr("disabled",false);
    } else {
        warnMsg.html("정확한 나이를 입력해 주세요");
        warnMsg.css("color","red");
        warnMsg.css("display", "inline-block");
        $("#age_input").val(null);
        $("#change_age").attr("disabled",true);
        return false;
    } 
})

$("#address").on("click",function(){
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
	                // 커서를 상세주소 필드로 이동한다.
	                $("#daddr").attr("readonly",false);
	                $("#daddr").focus();
	                $("#change_addr").attr("disabled",false);
		        }
		    }).open();
		})


function mailFormCheck(email){
   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   return form.test(email);
}

function pwFormCheck(pw){
   var form = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
   return form.test(pw);
}

function nmFormCheck(nm){
   var form = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
   return form.test(nm);
}

function ageFormCheck(age){
   var form = /^([0-9]){1,2}$/;
   return form.test(age);
}
})
//프로필 사진 수정 끝
</script>
</html>