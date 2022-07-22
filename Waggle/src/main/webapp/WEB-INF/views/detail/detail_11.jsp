<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>datail_11</title>
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
	font-size: 14px;
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
        		<p>HOME > 요청 상세페이지</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	  
	   <div class="ongoing21-all">
	    <h3 id="ongoing-detail">요청 상세 페이지(${req_dto.req_Stat })</h3>
	     <p id="w-date">${req_dto.req_WDate }</p>
	    <div class="ongoing21-user-name">
	     <p id="username">작성자</p>&nbsp;
	      <p id="userrealname">${user_dto.user_Nm}</p>
	       </div>
	    <div class="ongoing21-all">
	   <input type="hidden" name="req_dto.req_No" value="${req_dto.req_No }">
	    <table class="ongoing21-content">
	     <tbody style="border-bottom: 1px solid;">
	      <tr>
	       <th>제목</th>
	       <td>${req_dto.req_Title }</td>
	      </tr>
	      <tr>
	       <th>내가 본 집 링크 첨부</th>
	       <td><a style="color: #f48c06;" id="link" href="" target="_blank">${req_dto.req_Link }</a></td>

	      </tr>
	      <tr>
	       <th>방문기한</th>
	       <td id="yellow">${req_dto.req_EDate }</td>
	      </tr>
	      <tr>
	       <th>내가 본 집 주소</th>
	       <td id="yellow">${req_dto.home_Addr }</td>
	      </tr>
	      <tr>
	       <th>상세주소</th>
	       <td>${req_dto.home_DAddr }</td>
	      </tr>
	      <tr id="phone-number">
	       <th>공인중개사 연락처</th>	
	       <td>${req_dto.req_Phone }</td>
	      </tr>
	      </tbody>
	     </table>
	     <div class="ongoing21-content-bottom" style="width: 900px; margin: 0 auto;">
	       <h4>디테일 요구사항</h4>
	      
	       <textarea id="incontent" rows="14" cols="80" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea>
	       <br/><br/><br/>
	       <hr>
	       <h4>지원자</h4>
	       	<table style="border-spacing:20px">
			<thead>
				<tr>
					<th scope="col" style="width: 200px; "></th>
					<th scope="col" style="width: 600px; "></th>
					<th id="order_tr" scope="col" style="width: 200px;"></th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty vol }">
						<td colspan="4">-------------지원자가 없습니다.-------------</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${vol }" var="dto">
							<form>
							<input type="hidden" value="${dto.user_Code }">
								<tr >
									
									<td><b>${dto.user_Pro }</b></td>
									<td style="text-align: left; border-radius: 8px; border: 1px solid;"><P>닉네임 : ${dto.user_Nm }</P> 
									<P>평점 : ${dto.user_Grade }</P> <P>자기소개 : ${dto.user_Intro }</P></td>
									<td><button onclick="location.href='/board/accept?req_UCode=${user_Code}&res_UCode=${dto.user_Code }&req_No=${req_dto.req_No }'" type="button" style="width: 100px; height: 100px;">수락하기</button></td>
									
								</tr>
							</form>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
	       	<br><br><br>
	        <div style="text-align: right; width: 750px; font-size: 16pt;"><b>심부름 비용: ${req_dto.req_Point }원</b> </div>
	        <br><br>
	        
	     <div class="btn2" id="btn2">

	      <button type="button" value="요청취소" onclick="location.href='/board/cancel?req_No=${req_dto.req_No}'" style="width: 200px; margin-right: 100px;" >요청 취소하기(24시간 이내)</button>

	     <button type="button" value="수정하기" onclick="location.href='/board/updateform?req_No=${req_dto.req_No }'" style="width: 200px; margin-right: 100px;" >수정하기</button>

	      <button type="button" value="목록" onclick="location.href='/board/list'" style="width: 200px;">목록으로 돌아가기</button>
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
		
	</script>
</body>
</html>