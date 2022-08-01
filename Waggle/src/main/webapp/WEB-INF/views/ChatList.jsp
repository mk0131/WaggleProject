<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
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
    font-size: 14px;
    text-align: center;
}

.ongoing21-content-bottom {
	text-align: center;
}

.ongoing21-content td {
	width: 150px;
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
        		<p>HOME > 채팅방 목록</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	   <div class="ongoing21-all">
	   
	  	<div class="ongoing21-content">
	  	
	  	
	  	<table style="border-spacing:20px">
			<thead>
				<tr>
					<th scope="col" style="width: 200px; "></th>
					
				</tr>
			</thead>
			<tbody>
			<c:if test="${user_Code == param.room_UCode1 }">
				<c:choose>
					<c:when test="${empty dto }">
						<td colspan="4">-------------채팅이 없습니다.-------------</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${dto }" var="dto">
							<form>
								<tr >
									
									<td onclick="location.href='/chat/chat?room_No=${dto.room_No}&chat_UCode=${user_Code }'" style="text-align: left; border-radius: 8px; border: 1px solid;" ><P> 방번호 : ${dto.room_No }</P> 
									<c:if test="${dto.room_UCode1  == user_Code}"><p >상대방 코드 : ${dto.room_UCode2 }</p></c:if>
									<c:if test="${dto.room_UCode1  != user_Code}"><p >상대방 코드 : ${dto.room_UCode1 }</p></c:if>
									</td>
									
								</tr>
							</form>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</c:if>
			</tbody>
		</table>
		
	  	
	   </div>
	 </div>
	 </div>
	<%@ include file="./footer.jsp" %>
	<script type="text/javascript">
	  
	</script>
</body>
</html>