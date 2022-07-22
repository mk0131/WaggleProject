<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청상세페이지(진행중)</title>
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
#v-date {
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

</style>

</head>
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
	     <p id="username">작성자 </p>&nbsp;
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
	     <input type="hidden" id="v_Date" value="${res_dto2.res_WDate }">
	     <div class="ongoing21-content-bottom">
	       <h4>디테일 요구사항</h4>
	       <textarea id="incontent" rows="14" cols="80" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea>
	       <br/><br/><br/>
	    <c:if test="${who eq '제3자'}">
	     <div class="btn1" id="btn1">
	      <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
	     </div>
	    </c:if>
	    <c:if test="${who eq '작성자'}">
	     <div class="btn2" id="btn2">
	      <button type="button" id="cancel" value="요청취소" onclick="location.href='/board/revoke?req_No=${req_dto.req_No}'">요청 취소(24시간 이내)</button>
	      <button type="button" id="cancel2" value="요청취소" onclick="location.href=''">요청 취소</button>
	      <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
	     </div>
	    </c:if>
	    <c:if test="${who eq '수행자'}">
	     <div class="btn3" id="btn3">
	      <button type="button" id="vol1" onclick="location.href='/vol/undo?vo_UCode=${user_Code}&vo_No=${req_dto.req_No }'">수행취소(24시간 이내)</button>
	      <button type="button" id="vol2" onclick="location.href=''">수행취소</button>
	      <button type="button"  onclick="location.href=''">심부름 완료하기</button>
	      <button type="button" value="목록" onclick="location.href='/board/list'">목록으로 돌아가기</button>
	     </div>
	    </c:if>
	     </div>
	    </div>
	   </div>
	   
	   
	   
	 </div>
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript">
		$(function(){
			let link = $("#link").text();
			$("#link").attr('href',"https://"+link);
			
			var start = new Date($("#w-date").html());
			var end = new Date();
			var diffTime = (end.getTime() - start.getTime()) / (1000*60*60*24);
			
			if(diffTime >= 1 ){
				
				$("#cancel").hide();
				$("#cancel2").show();
				
			}else {
				$("#cancel").show();
				$("#cancel2").hide();
			}
			
			var start2 = new Date($("#v_Date").val());
			var end2 = new Date();
			var diffTime2 = (end2.getTime() - start2.getTime()) / (1000*60*60*24);
			if(diffTime2 >= 1 ){
				
				$("#vol1").hide();
				$("#vol2").show();
				
			}else {
				$("#vol1").show();
				$("#vol2").hide();
			}
			
		})
	</script>
</body>
</html>