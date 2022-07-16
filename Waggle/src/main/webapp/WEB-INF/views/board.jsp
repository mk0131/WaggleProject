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

<script type="text/javascript">

	$(function(){
		var listAll = new Array();

	    <c:forEach var="dto" items="${list}">
	    listAll.push("${dto}");
	    </c:forEach>
	    
		console.log(listAll);		
		console.log(listAll[0]);

		
// 		for(let i=0; i<listAll.length; i++) {
// 			$("#data-container").append("<li><div class='data-contents'>"+listAll[i]+"</div></li>");
// 		} 
		$("#data-container").append("<li><div class='data-contents'>"+listAll[0]+"</div></li>");
	});
	
	$(".pagination").click(function(){
		
		
	});
	
</script>

<style type="text/css">

.board {
  	width: 800px;
  	margin-left: auto;
  	margin-right: auto;
  	position: relative;
}

.data-contents{
	width: 700px; height: 150px; margin-bottom: 20px; border: 1px solid;
}

.left_box{
	float: left; height: 150px; width: 120px;
}

.left_box1{
	height: 120px; width: 120px; border:
}

.left_box2{
	height: 25px; width: 120px; border:
}

.right_box{
	float: right; height: 150px; width: 550px; position: relative;
}

.right_box1{
	height: 75px; width: 100px;
	position: absolute;
	top: 0px;
	left: 0px;
}

.right_box2{
	height: 75px; width: 100px;
	position: absolute;
	top: 75px;
	left: 0px;
}

.right_box3{
	height: 150px; width: 350px;
	position: absolute;
	top: 0px;
	left: 100px;
	text-align: center;
	line-height: 150px;
}

.right_box4{
	height: 50px; width: 100px;
	position: absolute;
	top: 0px;
	left: 450px;
}

.right_box5{
	height: 100px; width: 100px;
	position: absolute;
	top: 50px;
	left: 450px;
}

.page_box{
	height: 50px; width: 300px;
	margin-left: auto;
  	margin-right: auto;
  	position: absolute;
  	bottom: -40px; right: 0;
}

#pagination{
	margin-right: 20px;
}

#pagination li{
  list-style: none; display:inline; margin-left: 5px;
}

</style>

</head>
<body>
	<%@ include file="header.jsp"%>
	
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
   	
	<div class="middle">	
		<div class="board">
			<div>
				<a href='/board/requestform'>요청하기</a>
			</div>

				<c:forEach var="dto" items="${list}">
					<div class="data-contents">
						<div onclick="location.href='/board/detail?req_No=${dto.req_No}'">
							<div class="left_box">
								<div class="left_box1">
									<img src="${dto.req_Link }" alt="방사진">
								</div>
								<div class="left_box2">
									<span>${dto.req_Stat }</span>
								</div>
							</div>
							
							<div class="right_box">
								<div class="right_box1">기한: ${dto.req_EDate }</div>
								<div class="right_box2">위치</div>
								<div class="right_box3"><span>${dto.req_Title}</span></div>
								<div class="right_box4">예상거리</div>
								<div class="right_box5">${dto.req_Point }</div>
							</div>
						</div>
					</div>
				</c:forEach>

        	<div class="page_box">
	        	<ul id="pagination">
	        		<li><a>prev</a></li>
	        		<c:forEach var="i" begin="${start }" end="${end }">
	        			<li><c:out value="${i}" /></li>
	        		</c:forEach>
	        		<li><a>next</a></li>
	        	</ul>
        	</div>
		</div>
		
    </div>
	<%@ include file="footer.jsp" %>
</body>
</html>