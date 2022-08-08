<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 요청글(모집중)</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">

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
	font-size: 15px;
}

.ongoing21-user-name {
	display: flex;
    justify-content: flex-end;
    max-width: 1280px;
}


 #ongoing-detail {
	text-align: center;
}


.ongoing21-content {
	display:flex;
  	align-items: center;
  	justify-content: center;
    padding: 25px;
    border-spacing: 50px;
    font-size: 16px;
}

.ongoing21-content-bottom {
	text-align: center;
}

.ongoing21-content td {
	width: 380px;
}

#yellow {
	color: #f48c06;
}

#incontent {
	outline: none;
    resize: none;
    border-radius: 5px;
	box-shadow: rgba(67, 71, 85, 0.27) 0px 0px 0.25em, rgba(90, 125, 188, 0.05) 0px 0.25em 1em;
}

#userrealname {
	font-weight: bold;
}

#w-date {
	display: flex;
    justify-content: flex-end;
    max-width: 1280px;
    font-weight: bold;
}

button {
 background-color: #151515;
 border-radius: 8px;
 border-style: none;
 box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
 box-sizing: border-box;
 color: #fff;
 font-size: 12px;
 font-weight: 500;
 font-family: inherit;
 letter-spacing: .25px;
 line-height: normal;
 padding: 11px 11px;
 transition: background box-shadow 280ms ease;
}

button:hover {
 background: #fff;
 color: #151515;
}

button:active {
 box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
 outline: none;
 border: 1px solid #ffffff;
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

.bubble {
  width: 450px;
  padding: .5em 1em;
  line-height: 1.4em;
  padding: 20px;
  background-color: #ecf0f1;
  position: relative;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;
  -ms-border-radius: 8px;
  -o-border-radius: 8px;
  border-radius: 8px;
  text-align: left;
  display: inline-block; 
}

.bubble:hover > .over-bubble {
    opacity: 1; 
}

.over-bubble {
	line-height: 1.4em;
	background-color: rgba(236, 240, 241, 0.8);
	position: relative;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	-ms-border-radius: 8px;
	-o-border-radius: 8px;
	border-radius: 8px;
	text-align: center;
	display: flex;
	position: absolute !important;
	justify-content: center;
	align-items: center;
	height: 100%;
	width: 100%;
	opacity: 0;
	top: 0;
	left: 0;
	z-index: 999;
	-webkit-transition-property: all;
	-moz-transition-property: all;
	-o-transition-property: all;
	transition-property: all;
	-webkit-transition-duration: 0.3s;
	-moz-transition-duration: 0.3s;
	-o-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-timing-function: ease-in;
	-moz-transition-timing-function: ease-in;
	-o-transition-timing-function: ease-in;
	transition-timing-function: ease-in;
	font-size: 16px;
	text-shadow: white 1px 1px 0;
	cursor: pointer;
}

#accept-btn {
	cursor: pointer;
}

.ongoing21-top {
	display: flex;
    justify-content: center;
    align-items: center;
    padding: 35px 0px 50px 0px;
}

#ongoing21-img img {
	width: 400px;
    height: 400px;
	object-fit: cover;
	border-radius: 8px;
}

.imp {
	border: 1px solid rgb(221, 221, 221);
    border-radius: 12px;
    padding: 24px;
    box-shadow: rgb(0 0 0 / 12%) 0px 6px 16px;
    width: 325px;
    height: 315px;
    /* margin: 0px 30px 0px 30px; */
   	position: relative;
   	top: 40px;
}

.imp-line {
	border: 1px solid rgb(221, 221, 221);
    border-radius: 8px;
}

.imp-box {
	display: flex;
}

#title1 {
	flex: 1 1 0%;
	font-size: 13px;
	padding: 15px;
	border-right: 1px solid rgb(221, 221, 221);	
}

#title2  {
	flex: 1 1 0%;
	font-size: 13px;
	padding: 15px;
}

.imp-title {
	font-size: 13px;
}

.imp-title-content {
	font-size: 15px;
}

#imp-text-center1 {
	text-align: center;
	border-top: 1px solid rgb(221, 221, 221);
	border-bottom: 1px solid rgb(221, 221, 221);
	padding: 15px;
}

#imp-text-center2 {
	text-align: center;
	padding: 15px;
}

.b-line {
	border-top-width: 1px;
    border-top-style: solid;
    border-top-color: rgb(221, 221, 221);
}

.ongoing21-middle {
	max-width: 1120px;
    text-align: center;
    display: flex;
    flex-direction: column;
    /* align-items: center; */
    margin: 0 auto;
    
    -webkit-box-flex: 1;
    flex-grow: 1;
    padding-top: 40px;
}

.imp-flex {
	flex: 0 0 auto;
    width: 380px;
    position: relative;
}

.ongoing21-flex {
    padding: 0px 50px 0px 50px;
}

#flex-please {
	height: auto;
}

#flex-please {
	width: 1200px;
    height: 100%;
    margin: 0px auto;
    padding: 0px 10px;
    display: flex;
}


.fix {
	position:fixed;
	z-index:100;
}

#user-profile-reply {
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.ongoing21-middle-bottom {
	
}

</style>
<body>
	
	<%@ include file="../header.jsp" %>
	 <div id="wrap">
	  <div class="middle">
		<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 꿀단지목록 > 요청글</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	  
	   <div class="ongoing21-all">
	    <h2 id="ongoing-detail">${req_dto.req_Title }(${req_dto.req_Stat })</h2>
	     <p id="w-date">작성일 ${req_dto.req_WDate }</p>
<%-- 	    <div class="ongoing21-user-name">
	     <p id="username">작성자</p>&nbsp;
	      <p id="userrealname">${user_dto.user_Nm}</p>
	       </div> --%>
	      <div class="ongoing21-middle-bottom">
	      <div class="ongoing21-top">
		   <input type="hidden" name="req_dto.req_No" value="${req_dto.req_No }">
		   
		    <div class="ongoing21-content">
		     <div id="ongoing21-img">
		      <img src=${req_dto.fi_Nm }>
		     </div>
		   </div>
		  </div>
		  
		  <div id="flex-please">
		  <div class="ongoing21-flex">
		    <div class="ongoing21-middle">
		    <div class="b-line"></div>
		     <h4>${user_dto.user_Nm}님이 요청하신 내용입니다.</h4>
		     <div class="middle-content"><div>내가 본 집 링크 첨부 (ex.직방, 다방 등등..)</div> <a id="link" href="" target="_blank">${req_dto.req_Link }</a></div>
		    
		     <div class="b-line"></div>
		     <div class="middle-content"><div>방문기한은</div> <div>${req_dto.req_EDate }까지 입니다.</div></div>
		     <div class="middle-content"><div>내가 본 집 주소</div> <div></div></div>
		     <div class="middle-content"><div>상세주소</div> <div></div></div>
		     <div class="middle-content"><div>공인중개사 연락처</div> <div></div></div>
		     <div class="middle-content"><div>자세하게 봐야 될 부분</div> <div></div></div>
	
		  	 <div><h4>자세하게 봐야 될 부분</h4></div>
	      
	      
	      
	       	 <textarea id="incontent" rows="14" cols="80" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea>
		 
		     
		    </div>
	     
	     
	     
	     
	     <div class="ongoing21-content-bottom">
	      <%--  <h4>자세하게 봐야 될 부분</h4>
	      
	       <textarea id="incontent" rows="14" cols="80" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea> --%>
	       <br/><br/><br/>
	       <hr>
	       <h4>지원자</h4>
	       
	       
				<c:choose>
					<c:when test="${empty vol }">
						<td colspan="4">-------------지원자가 없습니다.-------------</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${vol }" var="dto">
							<form id="user-profile-reply">
							<input type="hidden" value="${dto.user_Code }">
									
										<c:choose>
											<c:when test="${not empty dto.fi_Nm }">
												<img style="width: 100px; height: 100px; border-radius: 75px;" alt="프로필사진o" src="${dto.fi_Nm }">
											</c:when>
											<c:otherwise>
												<img style="width: 100px; height: 100px; border-radius: 75px;" alt="프로필사진x" src="/images/importToJsp/profile_default.jpg">
											</c:otherwise>
										</c:choose>
									
									<div class="bubble" onclick="window.open('/mypage/other?ucode=${dto.user_Code}')"><h4>${dto.user_Nm } 님</h4> 
									<P>평점은 ${dto.user_Grade } 입니다.</P> <P><br/>${dto.user_Intro }</P>
										<div class="over-bubble">클릭 시 지원자의 프로필 창이 켜집니다.</div>
									</div>
									
									<div><button id="accept-btn" onclick="location.href='/board/accept?req_UCode=${user_Code}&res_UCode=${dto.user_Code }&req_No=${req_dto.req_No }'" type="button">수락하기</button></div>
									
									
							</form>
						</c:forEach>
					</c:otherwise>
				</c:choose>

	       	<br><br><br>
	        <div style="text-align: right; width: 750px; font-size: 16pt;"><b>포인트 비용 : ${req_dto.req_Point }P</b> </div>
	        <br><br>
	        
	     <div class="btn2" id="btn2">

	      <button type="button" value="요청취소" onclick="location.href='/board/cancel?req_No=${req_dto.req_No}'" style="width: 200px; margin-right: 100px;" >요청 취소하기</button>

	     <button type="button" value="수정하기" onclick="location.href='/board/updateform?req_No=${req_dto.req_No }'" style="width: 200px; margin-right: 100px;" >수정하기</button>

	      <button type="button" value="목록" onclick="location.href='/board/list'" style="width: 200px;">목록으로 돌아가기</button>
	     </div>
	     
	     </div>
	     
	    </div>
	    
	   <div class="imp-flex"> 
	   <div class="imp-all" style="position: static;">
	    <div class="imp">
	    	<h4>요약 정보</h4>
	     <div class="imp-line">
	    	 <div class="imp-box">
	    	  <div class="imp-title" id="title1"><div>방문기한</div><div class="imp-title-content">${req_dto.req_EDate }</div></div>
	    	  <div class="imp-title" id="title2">요청 매물과 나와의 거리</div>
	    	  </div>
	    	  
	    	  
	    	 <div class="imp-title" id="imp-text-center1"><div>포인트 비용</div><div class="imp-title-content" id="imp-content-other1">${req_dto.req_Point }P</div></div>
	    	
	    	<div class="imp-title" id="imp-text-center2"><div>자세하게 봐야 될 부분</div><div class="imp-title-content" id="imp-content-other2">${req_dto.req_Detail }</div></div>
	      </div>
	     </div>
	    </div> 
	   </div>
	    
	    
	   </div>
	   </div>
	 </div>
	</div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript">
		// 내가본 집 링크 연결
		let link = $("#link").text();
		if (link.includes("https://")) {
			$("#link").attr('href',link);
		} else {
			$("#link").attr('href',"https://"+link);			
		}
		
		 /* $(document).ready(function() {
			// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
			var floatPosition = parseInt($(".imp").css('top'));
			// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

			$(window).scroll(function() {
				// 현재 스크롤 위치를 가져온다.
				var scrollTop = $(window).scrollTop();
				var newPosition = scrollTop + floatPosition + "px";

				 $(".imp").css('top', newPosition);
				 


			}).scroll();

		}); */
		
			/* onscroll = function() {
			  var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
			  if(nVScroll > 1000) $(".imp").css("position", "fixed"); 
			  else $(".imp").css("position", "relative");
			}; */
		 
			  $(window).scroll(  function() {
				 var nVScroll = document.documentElement.scrollTop || document.body.scrollTop;
				 var currentPosition = parseInt($(".imp").css("top")); 
				 
				 if(nVScroll > 750) {
					 $(".imp").css("position", "fixed").css("top", "135" + "px")
				} 
				else {
					$(".imp").css("position", "relative").css("top", "40" + "px")
				}
			});  
			
			
			/* $(document).ready(function(){ 
				var currentPosition = parseInt($(".imp").css("top")); 
				$(window).scroll(function() {
				var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
				$(".imp").stop().animate({"top":position+currentPosition+"px"},1000);
				});
				}); */
			
			
		 
		/*  $(window).scroll(  
				    function(){  
				        //스크롤의 위치가 상단에서 450보다 크면  
				         if(window.pageYOffset >= $('.imp').offset().top){ 
				            $('.imp').addClass("fix");  
				            //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
				        }else{  
				            $('.imp').removeClass("fix");  
				            //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
				        }  
				    }  
				);  */
		
	</script>
</body>
</html>