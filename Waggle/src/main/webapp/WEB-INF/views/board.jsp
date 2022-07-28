<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀단지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/guideline.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
	font-size: 14px;
}

/* .board {
  	width: 800px;
  	margin-left: auto;
  	margin-right: auto;
  	position: relative;
}

#js-pagination li{
	list-style: none; display:inline; margin-left: 5px;
}

#js-pagination li a{
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 0.9em;
	transition: all ease-in-out 0.2s;
}

#js-pagination li a:hover {
  background-color: black;
  color: white;
}

.active {
  background-color: #FFFF99;
  color: black;
}

.req-btn {
	background: white;
	font-family: inherit;
	padding: 0.6em 1.3em;
	font-weight: 500;
	font-size: 14px;
	border: 3px solid black;
	border-radius: 0.4em;
	box-shadow: 0.1em 0.1em;
	font-style: italic;
}

.req-btn:hover {
	transform: translate(-0.05em, -0.05em);
	box-shadow: 0.15em 0.15em;
}

.req-btn:active {
	transform: translate(0.05em, 0.05em);
	box-shadow: 0.05em 0.05em;
} */



/* 여기가 찐!!!!!!!!!!!!!!  

.paging {
	text-align: center;
}

.paging li {
	list-style: none;
	display: inline-block;
}

.board-all {

}

#board-img {
	border-radius: 18px;
	position: relative;
}

.board-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    width: 60%;
    margin: 0 auto;
    
}

#content-all {
	padding: 20px;
	/* text-align: center;
}

img {
	width: 495px;
    height: 465px;
    border-radius: 6px;
    object-fit: cover;
}

#req-stat {
	background-color: #fff;
	border-radius: 18px;
	border-style: none;
	color: #222;
	font-size: 12px;
	padding: 4px 12px;
}

#req-stat {
	position: absolute;
    font-weight: bold;
    left: 20px;
    top: 17px;
}

.req-btn {
	border-radius: 8px;
    box-sizing: border-box;
    font-size: 13px;
    font-weight: 600;
    font-family: inherit;
    letter-spacing: .25px;
    line-height: normal;
    padding: 5px 5px;
    background-color: #fff;
    border: 1px solid #d3d3d3;
    color: #222222;
    padding: 10px;
    width: 120px;
}

.req-btn:disabled {
	 pointer-events: none;
}

.req-btn:hover {
	 color: #fff;
	 background-color: #1A1A1A;
	 box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
	 transform: translateY(-2px);
}

.req-btn:active {
	 box-shadow: none;
	 transform: translateY(0);
}

.board {
	display: flex;
    justify-content: flex-end;
    max-width: 80%;
    font-weight: bold;
}

#board-point {
	font-weight: bold;
}

 */
 
.paging {
	text-align: center;
}

.paging li {
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
}

#paging-a:visited {
	color: #878787;
}

img {
	width: 310px;
    height: 300px;
    object-fit: cover;
    border-radius: 10px;
    cursor: pointer;
}
 
#board-img {
	display: inline-block;
    vertical-align: top;
    align-self: center;
    padding: 0px 40px 0px 0px;
}
 
#board-text {
	display:inline-block;
	width: 550px;
    height: 300px;
    padding: 40px 0px 40px 40px;
    border-left: 1px solid #ebebeb;
}
 
#content-all {
	display: flex;
    justify-content: center;
}

#board-point {
	display: flex;
    justify-content: center;
    align-items: center;
    width: 550px;
    height: 60px;
    border: 1px solid #d3d3d3;
    border-radius: 10px;
    cursor: pointer;
}
 
#board-dl {
	display: flex;
    min-height: 20px;
    padding-top: 20px;
    padding-bottom: 20px;
} 

#board-dt {
	line-height: 14px;
    font-size: 14px;
    letter-spacing: -.06px;
    letter-spacing: -.33px;
    color: rgba(34,34,34,.5);
}

#board-dd {
	margin: 4px 0px 0px 0px;
    word-break: break-word;
    line-height: 17px;
    font-size: 14px;
    
}
 
#board-ltd-box {
	padding: 0 12px;
	flex: 1;
} 

.board-ltd-detail-box {
	border-left: 1px solid #ebebeb;
}

#board-dl-dt-dd {
	border-top: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb;
	cursor: pointer;
}

#board-ltd-title {
	line-height: 22px;
    padding: 21px 0 12px;
    font-size: 18px;
    letter-spacing: -.15px;
    margin: 0;
}
 
#board-stat {
	display: inline-block;
	padding-top: 1px;
    margin-bottom: 9px;
    font-size: 18px;
}
 
#req-stat {
	font-weight: 800;
    border-bottom: 2px solid #222;
}
 
#board-title {
	margin-bottom: 6px;
    font-size: 18px;
    letter-spacing: -.09px;
    font-weight: 400;
    cursor: pointer;
}

.middle-btn {
	display: flex;
    justify-content: flex-end;
    max-width: 1380px;
}

.req-btn {
	font-weight: 600;
    color: #fff;
    background-color: #222;
    padding: 0 18px;
    height: 42px;
    line-height: 40px;
    border-radius: 12px;
    font-size: 14px;
    letter-spacing: -.14px;
    cursor: pointer;
    
}
 
</style>

</head>
<body>
	<%@ include file="header.jsp"%>
   <div id="wrap">
   	<div class="guideline">
   		<ul class="guideline-all">
			<li>
				<a href="javascript:void(0)">
					<i class="fa-solid fa-house"></i>
				</a>
				<p>HOME > 꿀단지</p>
			</li>
   		</ul>
   	</div>
   	
	<div class="middle-btn">	
			<button type="button" class="req-btn" onclick="location.href='/board/requestform'">요청하기</button>
    </div>
    
   <div class="board-all">
   	 <div class="board-content">
          <c:choose>
             <c:when test="${empty list }">
                <tr>
                   <td colspan="4" class="board-content">문의 내용이 없습니다.</td>
                </tr>
             </c:when>
             <c:otherwise>
                <c:forEach items="${list }" var="dto">
                	<div class="board-content-all" id="content-all">

					 <div class="board-content-inner" id="board-img" onclick="location.href='/board/detail?req_No=${dto.req_No}'">
					  <img src=${dto.fi_Nm }>
					 </div>
					 
					  <div id="board-text">
					   <div class="board-content-inner" id="board-stat" onclick="location.href='/board/detail?req_No=${dto.req_No}'">
					    <label id="req-stat">${dto.req_Stat }</label>
					   </div>
					    <div class="board-content-inner" id="board-title" onclick="location.href='/board/detail?req_No=${dto.req_No}'">${dto.req_Title }</div>
					     <div class="board-content-inner" id="board-point" onclick="location.href='/board/detail?req_No=${dto.req_No}'">${dto.req_Point }&nbsp;<i class="fa-solid fa-p"></i></div>
						
						 <h4 class="board-content-inner" id="board-ltd-title" onclick="location.href='/board/detail?req_No=${dto.req_No}'">요청 정보</h4>
						  <div class="board-content-inner" id="board-dl-dt-dd" onclick="location.href='/board/detail?req_No=${dto.req_No}'">	
							<dl id="board-dl">
							  <div id="board-ltd-box">
								<dt id="board-dt">주소</dt>
								<dd id="board-dd">${dto.home_Addr }</dd>
							  </div>
							  <div id="board-ltd-box" class="board-ltd-detail-box">
								<dt id="board-dt">예상거리</dt>
								<dd id="board-dd">??km</dd>
							  </div>
							  <div id="board-ltd-box" class="board-ltd-detail-box">
								<dt id="board-dt">기한</dt>
								<dd id="board-dd">${dto.req_EDate }</dd>
							 </div>
							</dl>
						  </div>
						</div>
					   
					  </div>
					  
                </c:forEach>
             </c:otherwise>
          </c:choose>
   	 </div>
   </div>
	<ul class="paging">
			<c:if test="${paging.prev}">        
				<li id="paging">
					<a id="paging-a" href='<c:url value="/board/list?page=${paging.startPage-1}"/>'>이전</a>
				</li>    
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<li>
					<a class="${paging.cri.page == num ? 'nowpage' : null }" id="paging-a" href='<c:url value="/board/list?page=${num}"/>'>${num}</a>
				</li>    
			</c:forEach>
			<c:if test="${paging.next && paging.endPage > 0}">        
				<li>
					<a id="paging-a" href='<c:url value="/inquiry/list?page=${paging.endPage+1}"/>'>다음</a>
				</li>    
	 	 	</c:if>
		</ul>
 </div>
	
		
    
    
	<%@ include file="footer.jsp" %>
</body>

</html>