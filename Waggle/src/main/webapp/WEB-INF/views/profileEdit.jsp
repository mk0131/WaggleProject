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

/*성별 라디오 끝 */
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
					<p>HOME > 마이페이지 > 회원정보 수정하기</p>
				</ul>
			</div>
			<div class="edit-Title" style="margin:0 auto; width:1000px; text-align:center; font-size:22pt">
			회원정보 수정하기
			</div>
			<div class="edit-profile-img" style="margin:0 auto; width:1000px; text-align:center">
				<div class="profile" style="background-image:url(/images/importToJsp/profile_default.jpg)">
				  <label class="edit">
				    <span>&#10002;</span>
				    <input type="file" />
				  </label>
				  <div class="delete" onclick="removePhoto()">&times;</div>
				</div>
			</div>
			<div class="edit-profile-info" style="margin:0 auto; width:500px">
				<p style="margin:0; margin-bottom:5px; margin-top: 30px; margin-left:5px">아이디</p>
				<div style="width:500px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px">ID 수정 불가</div>
				<p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">비밀번호</p>
				<div style="width:500px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px">ID 수정 불가</div>
				<p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">비밀번호 확인</p>
				<div style="width:500px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px">ID 수정 불가</div>
				<p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">이메일</p>
				<div style="width:500px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px">ID 수정 불가</div>
				<p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">닉네임</p>
				<div style="width:500px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px">ID 수정 불가</div>
				<p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">나이</p>
				<div style="width:500px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px">ID 수정 불가</div>
				<p style="margin:0; margin-bottom:5px; margin-top: 10px; margin-left:5px">주소</p>
				<div style="width:150px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px; display:inline-block">ID 수정 불가</div>
				<div style="width: 95px; border:1px solid #898989; border-radius:13px;line-height: 2.4;font-size: 11pt; display:inline-block;text-align: center;color: #898989;">우편번호 찾기</div>
				<div style="width:500px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px; margin-top:5px;">ID 수정 불가</div>
				<div style="width:500px; height:50px; border:1px solid; border-radius:15px; line-height:3; padding-left:15px; margin-top:5px">ID 수정 불가</div>
				<p style="margin:0; margin-bottom:5px; margin-top: 20px; margin-left:5px">성별</p>
				<div class="select">
					<input type="radio" id="select" name="gender" value="남자"><label for="select">남자</label>
					<input type="radio" id="select2" name="gender" value="여자"><label for="select2">여자</label>
				</div>
				
				<div style="width:500px; margin-top:100px; border-bottom:2px solid #898989; height:10px"></div>
				
				<div style="margin-top:30px; text-align:center">
					<div style="width:150px; height:35px; border:3px solid; border-radius:15px; line-height:35px; display:inline-block; text-align:center; font-weight:bold; margin-right:50px">정보수정하기</div>
					<div style="width:150px; height:35px; border:3px solid; border-radius:15px; line-height:35px; display:inline-block; text-align:center; font-weight:bold; margin-left:50px">돌아가기</div>
				</div>
			</div>
			<div class="edit-button">
			
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
<script>
//프로필 사진 수정 시작
var input = document.querySelector('input');
var image = document.querySelector('.profile');

input.addEventListener('change', function(event){
  var reader = new FileReader();
  reader.onload = function(e){
    setImageUrl(e.target.result);
  };
  reader.readAsDataURL(event.target.files[0]);
});

function setImageUrl(url){
  image.style.backgroundImage = 'url('+url+')';
}

function removePhoto() {
  setImageUrl('http://gravatar.com/avatar/84dbfd9ab3f7ae68cdeaf705e8816938?s=200&d=mm');
}
//프로필 사진 수정 끝
</script>
</html>