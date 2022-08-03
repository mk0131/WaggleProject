<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

header {
	width: 100%;
	position: fixed;
	background-color: #fff;
	top: 0;
	left: 0;
	right: 0;
	z-index: 99999;
}

.nav-top {
	height: 38px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 0 50px;
	border-bottom: 1px solid #ebebeb;
	
}

.nav-top-text {
	color: rgba(34,34,34,.8);
	text-decoration: none;
	font-size: 14px;
	padding: 10px;
}

#user-nm {
	color: rgba(34,34,34,.8);
	font-size: 14px;
	padding: 10px;
	margin: 0px;
}

.nav-bottom {
	border-bottom: 1px solid #ebebeb;
	height: 67px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 50px;
}

.nav-menu-all {
	display: flex;
}

.nav-menu {
	padding: 10px;
}


.nav-top a {
	text-decoration: none;
}

.nav-top a:hover {
	text-decoration: none;
	color: rgba(34,34,34,.8);
}

.nav-top a:visited {
	text-decoration: none;
	color: rgba(34,34,34,.8);
}

.nav-toggleBtn {
	display: none;
}

.nav-logo {
	display: flex;
}

#nav-logo-text {
	color: #222;
	text-decoration: none;
	font-size: 32px;
	font-weight: bold;
}


#nav-logo-text:visited {
	color: #222;
	text-decoration: none;
}

.nav-logo-img1 {
	width: 48px;
	height: 48px;
}

.nav-menu-all a {
	text-decoration: none;
	color: #222;
}

.nav-menu-all a:visited {
	text-decoration: none;
	color: #222;
}

@media (max-width:900px) {

	.nav-bottom {
    border-bottom: 1px solid #ebebeb;
    height: 67px;
    padding: 0 35px;
	}

	.nav-all {
		flex-direction: row;
		align-items: flex-start;
	}
	
	.nav-menu-all {
		display: none;
		flex-direction: row;
		align-items: center;;
		width: 100%;
	}
	
	.nav-toggleBtn {
		display: block;
		text-decoration: none;
		color: #222;
	}
	
	.nav-toggleBtn:visited {
		color: #222;
	}
	
	.nav-menu div {
		width: 100%;
	}
	
	.nav-menu-all.active {
		display: flex;
	}
	
}

</style>

<body>

	<header>
	 <nav class="nav-all">
	  <div class="nav-top">
	  
	  	<c:if test="${user_Code != null }">
	      <h5 id="user-nm">${user_Nm } 님</h5>
		  <input type="hidden" name="in_Code" value="${user_Code }">
		</c:if>
		
		<c:if test="${user_Code == null }">
				<a href="/login" class="nav-top-text">마이페이지</a>
		</c:if>
		<c:if test="${user_Code != null }">
				<a href="/mypage/me" class="nav-top-text">마이페이지</a>
		</c:if>
	    
	    <c:if test="${user_Code == null }">
			<a href="/login" class="nav-top-text">로그인</a>
	    </c:if>
	    <c:if test="${user_Code != null }">
			 <a href="/login/logout" class="nav-top-text">로그아웃</a>
			 <input type="hidden" name="in_Code" value="${user_Code }">
		</c:if>
	  </div>
	  <div class="nav-bottom">
	   <div class="nav-logo">
	   <span class="nav-logo-img1">
	    <a href="/home">
	     <svg width="45" height="45" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
		  <path fill="url(#a)" d="M0 0h48v48H0z" />
			<defs>
		  <pattern id="a" patternContentUnits="objectBoundingBox" width="1" height="1">
			 <use xlink:href="#b" transform="scale(.02083)" /></pattern>
				<image id="b" width="45" height="45" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAADa0lEQVRoge3YSYgdVRTG8V9rQjq0Q2LUlYJICOIQh3RU2gGSjQE1KoIBBRWzckIX6sIB3AgJZCMOICIoKMGoLSS61bhQ1I1KosZExUBspygS2ylDt4tTj65U6laq3+tXr4X3hwv1qu699Z13zz331KFPnz6zgZWY12sR7TKA3diG4R5raYtLMJm1A1jnf7YaG4T47TiUXXe8GkO4HW9jB8bxF/bgQzyNm7Ggk5eYcp9JXICR7H2t1XhCG6txDnaaWtaqth9v4apMzHQZyebZmbs3iPU4mD1bPd1Jt9YUX2yfYVWN+Y/BWoxiLBv7KZYV+i0XKzBtfmrTgFYbxSmJuQfwcmLcBB5qR3CRLwoTL83uD2EJbsMm7Ksw4ntcWDL3jRVjWu2aTg14rjDha4l+g7gerySM2WfK+BajNQzY1qkBw2I585OuE76b4nix/D8Uxv2Mb0QE26F61fLt4rpijy25N4bTcVHu3uW4TsTpP/AP5uI0nIVLRRhcivm5cUNYmPU9Wf2QuAsf1DWijBPwsc42c6eBoGMW4t0eGZA/FzpiAHfjx2m8/FDu+m9cJlxpOZ4qPE+132fKgBZzxIn4gvDNvSK9+Db7/VJm6GIRRVpCyvz4VkcGib1iw/8mTveJmTagLsfh/Zyw3cqj17MON+D5pgQWWYSHheh/lbvDDSXjFhf6fNWE2DwDuEe40dH8eQxnl4zPG/xrI6pznCpS7bob+0+RmA2Lc2Kk8Py7ZuVPsVps5E7D5qamheeZj8dFyGzXgCuaEDoXd4iQWsaZ2JwQmGoTeLSrqnPclL10O1ZU9LsaX0uLPohfsOUo88w4LxaEvCqSvjIG8ZjIQosG3N91pQk+LxEzLs6BVJZ5Bt4sjNnQdaUJNkq7xS7VX1KrTBUK1ndXZjUrxR5IGbJFnLJlzBOrtbb7MquZg/tExlhmxH48Kb7SZjWLhNBUerxHZJ7t1IsaZZlIm1NutRXn9UxdjruwJvGsVaxK1ZQO4MEGNFayRoh5D+cn+iwQFYyy1PraBjRWssThp+kzOCnR91y8k+u/uQmBdch/Lk6KT8E7lZdniPTjI+lSY+Pcq9zHP8GVPdRVmxPFv57KLDeKYtes5hbVKfI4HuiZupo84sjSSN6dikXdWckKvC5y/y/xhqifpjZ0nz59usB/rqP1v6Iiv6UAAAAASUVORK5CYII=" />
			</defs>
		</svg></a>
		</span>
		<a href="/home" id="nav-logo-text">WAGGLE</a>
		
		</div>
	   
	   
	    <div class="nav-menu-all">
	    
	    <div class="nav-menu" id="n-menu1"><a href="/map/user">매물검색</a></div>
	    
	    <div class="nav-menu" id="n-menu2"><a href="/board/list">꿀단지목록</a></div>
	    
	    <div class="nav-menu" id="n-menu3">
	    <c:if test="${user_Code == null }">
	    <a href="/login">요청글 작성하기</a>
	    </c:if>
	    <c:if test="${user_Code != null }">
	    <a href="/board/requestform">요청글 작성하기</a>
	    </c:if>
	    </div>
	    
	    <div class="nav-menu" id="n-menu4">
	    <c:if test="${user_Code == null }">
	    <a href="/login">이용내역</a>
	    </c:if>
	    <c:if test="${user_Code != null }">
	    <a href="/mypage/history">이용내역</a>
	    </c:if>
	    </div>
	    
	    <div class="nav-menu" id="n-menu5">
	    <c:if test="${user_Code == null }">
	    <a href="/login">포인트 충전</a>
	    </c:if>
	    <c:if test="${user_Code != null }">
	    <a href="/point/use">포인트 충전</a>
	    </c:if>
	    </div>
	    
	    <div class="nav-menu" id="n-menu6">
	    <c:if test="${user_Code == null }">
	    <a href="/login">채팅</a>
	    </c:if>
	    
	    <c:if test="${user_Code != null }">
	    <a href="/chat/list?room_UCode1=${user_Code}">채팅</a>
	    </c:if>
	    </div>
	    
	    <div class="nav-menu" id="n-menu7">
	    <c:if test="${user_Code == 1}">
	    <a href="/license/list">인증센터</a>
	    </c:if>
	    </div>
	    
	    </div>
	    
	    <a href="#" class="nav-toggleBtn"><i class="fa-solid fa-bars"></i></a>
	    
	  </div>
	 </nav>
	</header>

</body>
<script>

	const toggleBtn = document.querySelector('.nav-toggleBtn');
	const menu = document.querySelector('.nav-menu-all');
	
	toggleBtn.addEventListener('click', () => {
		menu.classList.toggle('active');
	})

</script>
</html>