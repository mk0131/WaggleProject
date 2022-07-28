<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	font-size: 14px;
}

</style>
<body>
<%@ include file="./header.jsp" %>

<div id="wrap">
	  <div class="middle">
		<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 요청 상세페이지</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	   <div id="scroll" style="margin:1px; position: absolute; left: 500px; width: 800px; height: 700px; border: 1px solid; overflow: auto;  ">
	   
			<c:forEach items="${chat }" var="chat">
							
				<c:if test="${chat.chat_UCode == user_Code }">	
				<div style="width: 100%; text-align: right;"><p style=" display:inline-block;  border: 1px solid; border-radius: 8px;">${chat.chat_Content }</p>&nbsp;&nbsp;&nbsp;${chat.chat_UCode}</div>
				</c:if>
				<c:if test="${chat.chat_UCode != user_Code }">
				<div style="width: 100%;">${chat.chat_UCode} &nbsp;&nbsp;&nbsp;<p style="text-align: left: ;  display:inline-block;  border: 1px solid; border-radius: 8px;">${chat.chat_Content }</p></div>
				</c:if>
																						
			</c:forEach>
					
	 </div>
	 
	 <input type="text">
	 
	 </div>



<%@ include file="./footer.jsp" %>
<script type="text/javascript">

 $("#scroll").scrollTop($("#scroll")[0].scrollHeight); // 스크롤 맨밑으로
   
</script>
</body>
</html>