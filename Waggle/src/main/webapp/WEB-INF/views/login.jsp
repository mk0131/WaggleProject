<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.guideline-all {
	margin: 10px;
}

.guideline-all ul {
	list-style-type: none;
}

.guideline-all i {
	color: #151515;
}

.guideline-all li {
	display: inline-block;
}

.guideline-all p {
	display: inline-block;
}

.login-form h1 {
	text-align: center;
}

.tabs {
    background-color: #ffffff;
    width: 560px;
    height: 700px;
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
#login:checked ~ #login-content,
#sign-up:checked ~ #sign-up-content,
#sign-up-form:checked ~ #sign-up-form-content {
  display: block;
}

/* 선택된 탭 스타일 */
.tabs input:checked + .tab_item {
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

</style>
</head>
<body>
  <%@ include file="header.jsp" %>
	<div id="wrap">
		<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		</li>
        		<p>HOME > 로그인</p>
        	</ul>
		</div>
		<br/>
		<section>
		<div class="login-form">
			<h1>로그인</h1>
		</div>
		<br/><br/>
		 <div class="tabs">
    			<input id="login" type="radio" name="tab_item" checked>
    			<label class="tab_item" for="login">로그인</label>
    			<input id="sign-up" type="radio" name="tab_item">
    			<label class="tab_item" for="sign-up">회원가입</label>
    		<div class="tab_content" id="login-content">
        		<div class="field-wrap1">
              		<input type="text" placeholder="아이디">
            	</div>
            	<div class="field-wrap2">
              		<input type="text" placeholder="비밀번호">
            	</div>
            	<div class="field-wrap-submit">
              		<button type="button" value="login" onclick="location.href=''">로그인</button>
            	</div>
               <div class="forgot-idpw">
            	<p class="forgot"><a href="#">아이디 찾기</a>&nbsp;|&nbsp;<a href="#">패스워드 찾기</a></p>
               </div>
               <div class="api-login">
               		<button type="button" value="naver">네이버 로그인</button>
               		<button type="button" value="kakao">카카오 로그인</button>
               		<button type="button" value="google">구글 로그인</button>
               </div>
    		</div>
    		<div class="tab_content" id="sign-up-content">
    			<div class="sign-up-button">
        		<button type="button" onclick="location.href=''">통합회원 로그인</button>
        		</div>
			</div>
			<div class="tab_content" id="sign-up-form-content">
      			
		 </div>
		</div>
		</section>
			
	</div>
		
  <%@ include file="footer.jsp" %>
</body>
</html>