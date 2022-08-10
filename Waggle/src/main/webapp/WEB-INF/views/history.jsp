<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 이용내역</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
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
	padding-bottom: 100px;
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

.history-img {
	width: 310px;
    height: 300px;
    object-fit: cover;
    cursor: pointer;
}
 
#my-req-list-img {
	display: inline-block;
    vertical-align: top;
    align-self: center;
    padding: 0px 40px 0px 0px;
}
 
#my-req-list-text {
	display:inline-block;
	width: 550px;
    height: 300px;
    padding: 40px 0px 40px 40px;
    border-left: 1px solid #ebebeb;
}
 
#my-req-list-content-all {
	display: flex;
    justify-content: center;
}

#my-req-list-point {
	display: flex;
    justify-content: center;
    align-items: center;
    width: 550px;
    height: 60px;
    border: 1px solid #d3d3d3;
    border-radius: 10px;
}
 
#my-req-list-dl {
	display: flex;
    min-height: 20px;
    padding-top: 20px;
    padding-bottom: 20px;
} 

#my-req-list-dt {
	line-height: 14px;
    font-size: 15px;
    letter-spacing: -.06px;
    letter-spacing: -.33px;
    color: rgba(34,34,34,.5);
}

#my-req-list-dd {
	margin: 4px 0px 0px 0px;
    word-break: break-word;
    line-height: 17px;
    font-size: 15px;
    
}
 
#my-req-list-ltd-box {
	padding: 0 12px;
/* 	padding-left: 0;
	padding-right: 0; */
	flex: 1;
} 

.my-req-list-ltd-detail-box {
	border-left: 1px solid #ebebeb;
}

#my-req-list-dl-dt-dd {
	border-top: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb;
}

#my-req-list-ltd-title {
	line-height: 22px;
    padding: 21px 0 12px;
    font-size: 18px;
    letter-spacing: -.15px;
    margin: 0;
}
 
#my-req-list-stat {
	display: inline-block;
	padding-top: 1px;
    margin-bottom: 9px;
    font-size: 18px;
}
 
#req-stat {
	font-weight: 800;
    border-bottom: 2px solid #222;
}
 
#my-req-list-title {
	margin-bottom: 6px;
    font-size: 18px;
    letter-spacing: -.09px;
    font-weight: 400;
}

/* 요청페이지 */

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
 
#my-res-list-content-all {
	display: flex;
    justify-content: center;
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


/* 탭 css 끝 */


.paging1 {
	text-align: center;
}

.paging2 {
	text-align: center;
}

.paging1 li {
	list-style: none;
	display: inline-block;
}

.paging2 li {
	list-style: none;
	display: inline-block;
}

.nowpage {
	font-weight: bold;
	color: #000000 !important;
}
 
#paging-a {
	text-decoration: none;
	padding: 8px;
	color: #878787;
}

#paging-a:visited {
	color: #878787;
}

.paging-a {
	text-decoration: none;
	padding: 8px;
	color: #878787;
}

.paging-a:visited {
	color: #878787;
}



.my-req-list-content-all:hover{
	box-shadow: inset 0 0 0 15em #f7f9fa;
}

.my-req-list-content-all{
	width:1020px;
	margin:0 auto;
	border-radius:30px;
	transition: 1s;
}

.my-res-list-content-all:hover{
	box-shadow: inset 0 0 0 15em #f7f9fa;
}

.my-res-list-content-all{
	width:1020px;
	margin:0 auto;
	border-radius:30px;
	transition: 1s;
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
					<p>HOME > 이용내역</p>
				</ul>
			</div>
			<br/>
			<div class="tabs">
				<input id="login" type="radio" name="tab_item" checked onclick="showMyReq();"> 
				<label class="tab_item" for="login">내가 요청한 목록</label> 
				<input id="sign-up" type="radio" name="tab_item" onclick="showMyPerform();"> 
				<label class="tab_item" for="sign-up">내가 수행한 목록</label>
			</div>
			<div class="myReqList" style="display:none">
				<c:forEach var="Req" items="${Request }">
				<div class="my-req-list-content-all" id="my-req-list-content-all">
					<div class="my-req-list-content-inner" id="my-req-list-img"
						onclick="location.href='/board/detail?req_No=${Req.req_No}'">
						<c:if test="${Req.fi_Nm != null }">
						 <img class="history-img" src=${Req.fi_Nm }>
						 </c:if>
						 <c:if test="${Req.fi_Nm == null }">
						 <img class="history-img" src="/images/importToJsp/homeimg.png">
						 </c:if>
					</div>
					<div id="my-req-list-text">
						<div class="my-req-list-content-inner" id="my-req-list-stat"
							onclick="location.href='/board/detail?req_No=${Req.req_No}'">
							<label id="req-stat"> ${Req.req_Stat} </label>
						</div>
						<div class="my-req-list-content-inner" id="my-req-list-title"
							onclick="location.href='/board/detail?req_No=${Req.req_No}'">
							${Req.req_Title}</div>
						<div class="my-req-list-content-inner" id="my-req-list-point"
							onclick="location.href='/board/detail?req_No=${Req.req_No}'">
							${Req.req_Point}&nbsp; <i class="fa-solid fa-p"> </i>
						</div>
						<h4 class="my-req-list-content-inner" id="my-req-list-ltd-title"
							onclick="location.href='/board/detail?req_No=${Req.req_No}'">
							요청 정보</h4>
						<div class="my-req-list-content-inner" id="my-req-list-dl-dt-dd"
							onclick="location.href='/board/detail?req_No=${Req.req_No}'">
							<dl id="my-req-list-dl">
								<div id="my-req-list-ltd-box">
									<dt id="my-req-list-dt">매물주소</dt>
									<dd id="my-req-list-dd">${Req.home_Addr}</dd>
								</div>
								<div id="my-req-list-ltd-box" class="my-req-list-ltd-detail-box">
									<dt id="my-req-list-dt">방문기한</dt>
									<dd id="my-req-list-dd">${Req.req_EDate}</dd>
								</div>
							</dl>
						</div>
					</div>
				</div>
				</c:forEach>
					<ul class="paging1">
					 <c:if test="${paging1.prev}">       
					   <li class="paging">
						 <a class="paging-a" href='<c:url value="/mypage/history?page=${paging1.startPage-1}&sub_page=${paging2.cri.page}"/>'>이전</a>
					   </li>  
					 </c:if>
					  <c:forEach begin="${paging1.startPage}" end="${paging1.endPage}" var="num">
						<li>
						 <a id="paging-a" class="${paging1.cri.page == num ? 'nowpage' : null }" href='<c:url value="/mypage/history?page=${num}&sub_page=${paging2.cri.page}"/>'>${num}</a>
						</li>  
					  </c:forEach>
					   <c:if test="${paging1.next && paging1.endPage > 0}">
						<li>
						 <a class="paging-a" href='<c:url value="/mypage/history?page=${paging1.endPage+1}&sub_page=${paging2.cri.page}"/>'>다음</a>
						</li>
						</c:if>
					 </ul>
			</div>
			
			<div class="myReqListPaging"></div>
			
			<div class="myPerform" style="display:none">
				<c:forEach var="per" items="${Perform }">
				<div class="my-res-list-content-all" id="my-res-list-content-all">
					<div class="my-res-list-content-inner" id="my-res-list-img"
						onclick="location.href='/board/detail?req_No=${per.req_No}'">
						<c:if test="${per.fi_Nm != null }">
						 <img class="history-img" src=${per.fi_Nm }>
						 </c:if>
						 <c:if test="${per.fi_Nm == null }">
						 <img class="history-img" src="/images/importToJsp/homeimg.png">
						 </c:if>
					</div>
					<div id="my-res-list-text">
						<div class="my-res-list-content-inner" id="my-res-list-stat"
							onclick="location.href='/board/detail?req_No=${per.req_No}'">
							<label id="res-stat">${per.res_Stat }</label>
						</div>
						<div class="my-res-list-content-inner" id="my-res-list-title"
							onclick="location.href='/board/detail?req_No=${per.req_No}'">
							${per.req_Title }</div>
						<div class="my-res-list-content-inner" id="my-res-list-point"
							onclick="location.href='/board/detail?req_No=${per.req_No}'">
							${per.req_Point}&nbsp; <i class="fa-solid fa-p"> </i>
						</div>
						<h4 class="my-res-list-content-inner" id="my-res-list-ltd-title"
							onclick="location.href='/board/detail?req_No=${per.req_No}'">
							요청 정보</h4>
						<div class="my-res-list-content-inner" id="my-res-list-dl-dt-dd"
							onclick="location.href='/board/detail?req_No=${per.req_No}'">
							<dl id="my-res-list-dl">
								<div id="my-res-list-ltd-box">
									<dt id="my-res-list-dt">매물주소</dt>
									<dd id="my-res-list-dd">${per.home_Addr }</dd>
								</div>
								<div id="my-res-list-ltd-box" class="my-res-list-ltd-detail-box">
									<dt id="my-res-list-dt">방문기한</dt>
									<dd id="my-res-list-dd">${per.req_EDate }</dd>
								</div>
							</dl>
						</div>
					</div>
				</div>
				</c:forEach>
				<ul class="paging2">
					 <c:if test="${paging2.prev}">       
					   <li class="paging">
						 <a class="paging-a" href='<c:url value="/mypage/history?page=${paging1.cri.page}&sub_page=${paging2.startPage-1}"/>'>이전</a>
					   </li>  
					 </c:if>
					  <c:forEach begin="${paging2.startPage}" end="${paging2.endPage}" var="num">
						<li>
						 <a id="paging-a" class="${paging2.cri.page == num ? 'nowpage' : null }" href='<c:url value="/mypage/history?page=${paging1.cri.page}&sub_page=${num}"/>'>${num}</a>
						</li>  
					  </c:forEach>
					   <c:if test="${paging2.next && paging2.endPage > 0}">
						<li>
						 <a class="paging-a" href='<c:url value="/mypage/history?page=${paging1.cri.page}&sub_page=${paging2.endPage+1}"/>'>다음</a>
						</li>
						</c:if>
					 </ul>
			</div>
		</div>
		
		
		
	</div>
	<%@ include file="footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

//요청내역 리스트 보여줌
$(document).ready(function(){
	$(".myReqList").show();
});

function showMyReq() {
	$(".myReqList").show();
	$(".myPerform").hide();
}

//나의 수행 내역 보여주기
function showMyPerform(){
	$(".myReqList").hide();
	$(".myPerform").show();
	
}
</script>
</html>