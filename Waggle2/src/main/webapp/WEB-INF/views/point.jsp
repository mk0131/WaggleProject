<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//brick.a.ssl.fastly.net/Roboto:400"/>
<meta charset="UTF-8">
<title>Waggle 포인트 충전</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>
.middle {
	margin: 0;
	padding: 0;
}
.middle-top{
	margin: 0;
	padding: 1px;
	background-color: #ECECEC;
}
.middle-bottom{
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

.money{
	margin: 0;
	padding: 0;
}
.money-container {
	font-family: 'Roboto';
	width: 600px;
	margin: auto;
	display: block;
	background: #ECECEC;
	padding: 10px 50px 30px;
}

.money-title {
	text-align: center;
	font-size: 40px;
	margin-bottom: 40px;
}

.group {
	position: relative;
	margin-bottom: 45px;
}

input {
	font-size: 18px;
	padding: 10px 10px 10px 5px;
	display: inline-block;
	width: 500px;
	border: none;
	border-bottom: 1px solid #151515;
}

input:focus {
	outline: none;
	border-bottom:0px;
}

.img-x{
	display: inline-block;
	position : relative;
	margin: auto 0;
}
/* BOTTOM BARS ================================= */
.bar {
	position: relative;
	display: block;
	width: 515px;
}

.bar:before, .bar:after {
	content: '';
	height: 2px;
	width: 0;
	bottom: 1px;
	position: absolute;
	background: #ffb000;
	transition: 0.2s ease all;
	-moz-transition: 0.2s ease all;
	-webkit-transition: 0.2s ease all;
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
	width: 100%;
	
}

.money-buttons{
	margin: 0 auto;
	width: 600px;
}
.charge-button{
	margin: 0 auto;
	width: 600px;
}
.button {
  background: transparent;
  width: 110px;
  border-radius: 10px;
  border: 2px solid;
  display: inline-block;
  margin: 0 10px 15px 10px;
  height: 35px;
}

.button:hover{
	background-color: #c5c5c5;
}

.button p {
  font-family: "Roboto";
  text-align: center;
  text-transform: uppercase;
  color: #2e2e2e;
  user-select: none;
  line-height:0.6;
  font-size: 15px;
  font-weight: bold;
}

.button:hover {
  cursor: pointer;
}

.blank{
	margin:0 auto;
	width: 50px;
	height: 50px;
}

.point-history{
	margin: 0 auto;
	width: 1125px;
}

.history-title p{
	padding-left:40px;
	font-size: 30px;
}

.img-x:hover {
	cursor: pointer;
}

.point-amount {
	font-size: 1.5em;
}


/* 페이징 */
.paging {
	text-align: center;
	padding-top: 35px;
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
	color: #878787;
}

#paging-a:visited {
	color: #878787;
}
/* 페이징 끝 */


</style>
</head>
<body>
	<%@ include file="header.jsp"%>
   <div id="wrap">
	<div class="middle">
		<div class="middle-top">
			<div class="guideline">
				<ul class="guideline-all">
					<li><a href="javascript:void(0)"> <i
							class="fa-solid fa-house"></i>
					</a></li>
					<p>HOME > 포인트 충전</p>
				</ul>
			</div>
	
			<div class="money-container">
				<div class="money-title"><p>포인트 충전</p></div>
				<form>
					<div class="money">
						<div class="img-x">
						<input id="price" class="point-amount" type="text" style="background-color:transparent;" required placeholder="아래 버튼을 눌러 금액을 입력해주세요" readonly="readonly"><span class="bar"></span>
						</div>
						<div class="img-x" onclick="priceReset()">
						<svg width="45" height="45" viewBox="0 0 42 42" fill="none"
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink">
							<rect width="42" height="42" fill="url(#pattern0)" fill-opacity="0.7" />
							<defs>
							<pattern id="pattern0" patternContentUnits="objectBoundingBox" width="1"
							height="1">
							<use xlink:href="#image0_79_2524" transform="scale(0.0104167)" />
							</pattern>
							<image id="image0_79_2524" width="96" height="96"
								xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAABmJLR0QA/wD/AP+gvaeTAAAFMklEQVR4nO2d3Y9eQxzHP9ZFd/ch9fJYN+iLBGkTSZPGlQRrcWNDCcKFay8laRr8FZW00gghwqU7b2kIdddgN0qQ6tIqum1Rdp9qSy/scTHnSR+rPWfmzG/md3Z2Psk3e7M58z3fOZkzz7wdyGQymUwmk8lkMsuNC7QN1DAGbACuH9AY0AEuLf8CnALmyr+/ADPAt8B+4Avg16iuHWhbBXSAO4HbSq3H32MBfAPsBj4GPgBOe14zKYaAm4GXgBOYwELqNPAmMAlcGOH+WssIsBk4RPjQz6cfgCdLL8uGDvAscAy94BfrKPAMZ98pyTKJ7hNfp8PAo8HuXpG1wC70A7bVe8CaIEkocB+mi6gdqqtOAA8HyCMaw8B29IP01RvAqHA2wbkCmEI/PCl9CnRFEwrIKsyvUO3QpPU9cK1gTkFYD8yiH1YoHQbWiaUlzNXAT+iHFFqzwGqhzMTokmazcz59B1wpkpwAI6T1wrXVJ5ienjovox+GlnYK5OfFg+iHoK1HvFNsyFriDB+3XfMoDVu828BsqtrlmaUz9wsZT0n3eCXqQAfZ/v4cMEHcntRUWabkIOEhIo0ZPSdoeh64qbzuSsyYS+jwPwcuK8vcAPwueO2tjRJ1YBg4ImR2MPw+oSthMPw+kpVwlMDTm08JGT1X+H1CVcK5wu8jWQmPV+TnxRAy04lzwMaasi5B9p0wVV6zio3IvBMOllmJc7uAuQLz8rNBqhJswu8zIXSPt1qW58TrQuaqmoLF+DZHMcsa1KuWZVrTQfZXb4xgtMIvgB7CXdJNgub6cmkaXJujkNe21aRl+VbsCGAw1FOq+eQP6nlLD1Z8HcikdGBtCb/ArMoWYQxYCGi0QKbJaEOzM6gFhFZS3BXYqMTT26Ynf1C2Xe5Kno5ktmmQbQ2/wKy89mZnRMMF7k1Jm5qdxXrB0lslH0Y27VoJNmiEX2B243jzlYLxArempYrYzc6gvhTwr7qe37cSNMMvMANz3khOWMSsBO3wC+C3Br7/xxnlm2hSCW0IvwD+rjMaZNw6I0tugpSboPwSbi6Rl3DuhjZXbTfU5h1wzOYuhZkGxoE/BK7Vw4xnTQtcy5Xa7GwqYL+AERemgTswKyfqsB2KmC+vGbsSarOzqYAZASO27MU8rTbhrwTexxzCYdNUzWNGJz9r7M4dkYc3D0c3l8hwdJ6QaaZ/ENzaGrInlOqU5F5LH1aE2vGe8qT8NksPVtwbwGDqy1LutizfilHywiwX9QiwSvo1IXPLYWniK5ZlOjEuZG45LM69xbI8J4YwZ6z5mkt9efoBAg7zbxYwWJD2Bo3HKvLzJm9RqlbwLUpgTjyUCiS1TXpbGiXqSAf4UdB0KttUDxLx/NEQ+wWWukT3A9jwjpDxFPSWZ5aNWIP5xad989qaw5yTp8IDFgZTl/rZoi+iH4KWdgjk580w+utvNLQHWCGQnwhdYB/6ocTSDGamsFVchezvg7ZqFsWXbh3rMIebaocUSq0+uLXPKtJsjvYB1wjmFJQu5lxN7dCktAe4XDShCKwgnePrl/Q3ZjZh1nhqB+mqHvBQgDxUWM3SGjt6mxb3dHyYRGZaM5R+xgyvJM0o5nRBqZk1Cc1iJlOW3KdKfBgGnsBMZGgFfwBzyF5rhhQ06H/KcDtwnPCh9zA9mwlasEmxbR/zHMEEM475mOeN+HtcwCwu3l3qI+Avz2uK0bYKWEwXM3F+HXADZz9nezFmnc9F5f+dxEzw/8l/P2c7g1mlfDyq60wmk8lkMplMJpOp4F8DOMbRbjuvWwAAAABJRU5ErkJggg==" />
							</defs>
						</svg>
						</div>
					</div>
				</form>
			</div>
			<div class="money-buttons">
				<div class="button" onclick="pointAdd(1000)">
	 				<p>+1천원</p>
				</div>
				<div class="button" onclick="pointAdd(5000)">
	 				<p>+5천원</p>
				</div>
				<div class="button" onclick="pointAdd(10000)">
	 				<p>+1만원</p>
				</div>
				<div class="button" onclick="pointAdd(50000)">
	 				<p>+5만원</p>
				</div>
			</div>
			<div class="charge-button">
				<div class="button" style="width:530px; background-color: #7300e9;" onclick="requestPay()">
					<p style="color: white;">포인트 충전하기</p>
				</div>
				<div class="button" style="width:530px; background-color: #F7E600;" onclick="requestPayK()">
					<p>포인트 충전하기(카카오페이)</p>
				</div>
			</div>
			<div class="blank"></div>
		</div>
		
		<div class="middle-bottom">
			<div class="point-history">
			
				<div class="history-title"><p>포인트 이용 내역</p>
				</div>
				
				<div class="history-main" style="margin:0 auto; width:1000px">
					<div class="pointcharge">
					</div>
						<c:choose>
							<c:when test="${fn:length(list) eq 0}">
								<h3>포인트 이용내역이 없습니다.</h3>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${list}">
									<div class="pointuse" style="border-bottom: 1px solid #898989; width:1000px; height:130px; margin-top:18px">
										<div class="use-left"  style="width:110px; height:110px; display:inline-block">
											<c:if test="${dto.type == '사용'}">
											<div style="width:100px; height:100px; border:5px solid #e37b7b; border-radius:150px; color:#e37b7b; font-size:20pt; text-align:center; line-height:100px; float:left">
											${dto.type}
											</div>
											</c:if>
											<c:if test="${dto.type == '충전' or dto.type=='획득'}">
											<div style="width:100px; height:100px; border:5px solid #3a6589bf; border-radius:150px; color:#3a6589bf; font-size:20pt; text-align:center; line-height:100px; float:left">
											${dto.type}
											</div>
											</c:if>
										</div>
										<div class="use-middle" style="width:650px; height:110px; padding-left:35px; display:inline-block">
											<fmt:parseDate value="${dto.date }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
											<div><fmt:formatDate value="${parsedDateTime }" pattern="yyyy-MM-dd"/></div>
											<div style="font-size:20pt">포인트 ${dto.type}</div>
											<div style="padding-top:30px">잔여 포인트: &nbsp;${dto.price_Sum}&nbsp;P</div>
										</div>
										<div class="use-right" style="width:200px; height:110px; display:inline-block; text-align:center; float:right">
											<c:choose>
												<c:when test="${dto.type eq '사용'}">
													<div style="font-size:30pt; margin-top:25px; color:#e37b7b;">-${dto.price} P</div>
												</c:when>
												<c:otherwise>
													<div style="font-size:30pt; margin-top:25px; color:#3a6589bf;">+${dto.price} P</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
				</div>
				<div>
					<ul class="paging">
						<c:if test="${paging.prev}">        
							<li id="paging">
								<a id="paging-a" href='<c:url value="/point/use?page=${paging.startPage-1}"/>'>이전</a>
							</li>    
						</c:if>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
							<li>
								<a class="${paging.cri.page == num ? 'nowpage' : null }"  id="paging-a" href='<c:url value="/point/use?page=${num}"/>'>${num}</a>
							</li>    
						</c:forEach>
						<c:if test="${paging.next && paging.endPage > 0}">        
							<li>
								<a id="paging-a" href='<c:url value="/point/use?page=${paging.endPage+1}"/>'>다음</a>
							</li>    
						</c:if>
					</ul>
				</div>
			
		
			</div>
		</div>
		
	</div>
   </div>
   <input type="hidden" value="${user_Email}" id="useremail">
   <input type="hidden" value="${user_Code}" id="usercode">
	<%@ include file="footer.jsp"%>

<script type="text/javascript" src="/js/payment.js"></script>
<script>
</script>
</body>

</html>