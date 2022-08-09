<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 문의글 목록</title>
<link rel="icon" href="/images/importToJsp/favicon.png">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">

/* body {
	font-family: 'Noto Sans KR', 'Helvetica Neue', Helvetica, Arial, sans-serif;
} */

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

.notice h1 {
	text-align: center;
}

input[type="radio"] {
	display: none;
}

input[type="radio"] + label {
	display: inline-block;
	padding: 20px;
	background:#fff;
	color:#151515;
	font-size: 14px;
	cursor: pointer;
	width: 123px;
    height: 10px;
}

input[type="radio"]:checked + label {
	background: #fff;
	color:#151515;
	border-bottom: 3px solid;
}

.conbox {
	width: auto;
	height: auto;
	margin: 0 auto;
	display: none;
}

.tab_content {
	text-align:center;
}

input[id="tab01"]:checked ~ .con1 {
	display: block;
}

input[id="tab02"]:checked ~ .con2 {
	display: block;
}

input[id="tab03"]:checked ~ .con3 {
	display: block;
}

.accordion {
  font-size: 1rem;
  width: 50vw;
  margin: 0 auto;
  border-radius: 5px;
}

.accordion-all {

}


.accordion-header,
.accordion-body {
  background: white;
}

.accordion-header {
  padding: 2.5em 2.5em;
  background: #fff;
  color: #151515;
  cursor: pointer;
  font-size: .8em;
  letter-spacing: .1em;
  transition: all .3s;
  text-transform: uppercase;
}

.accordion__item {
    border-bottom: 1px solid #151515;
}

.accordion__item .accordion__item {
  border-bottom: 1px solid rgba(0, 0, 0, 0.08);
}

.accordion-header:hover {
  background: #fff;
  position: relative;
  z-index: 5;
}

.accordion-body {
  background: #fcfcfc;
  color: #353535;
  display: none;
}

.accordion-body__contents {
  padding: 2.8em 2.8em;
  font-size: .8em;
  border-top: 1px solid;
}

.accordion__item.active:last-child .accordion-header {
  border-radius: none;
}

.accordion:first-child > .accordion__item > .accordion-header {
  border-bottom: 1px solid transparent;
}

.accordion__item > .accordion-header:after {
  content: "";
  font-family: IonIcons;
  font-size: 1.2em;
  float: right;
  position: relative;
  top: -2px;
  transition: .3s all;
  transform: rotate(0deg);
}

.accordion__item.active > .accordion-header:after {
  transform: rotate(-180deg);
}

.accordion__item.active .accordion-header {
  background: #fff;
}

.accordion__item .accordion__item .accordion-header {
  background: #f1f1f1;
  color: #353535;
}

/* @media screen and (max-width: 1000px) {
  body {
    padding: 1em;
  }
  
  .accordion {
    width: 100%;
  }
} */

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

.Inquiry-category {
    display: inline-table;
    width: 70vw;
    height: 45px;
    border-spacing: 25px;
	
}

.Inquiry-category th {
    font-size: 14px;
    padding: 15px;
}

.Inquiry-category td {
    font-size: 14px;
    padding: 15px;
}

/* .Inquiry-content {
	display: inline-table;
    width: 50vw;
    padding: 50px;
} */

.btn1 {
	position: absolute;
    right: 19%;
}

#Inquiry-title {
	text-decoration: none;
	color: #878787;
}

#Inquiry-title:visited {
	color: #878787;
}

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

</style>
</head>
<body>
  <%@ include file="header.jsp" %>
	<div id="wrap">
		<div class="middle">
			<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 공지사항</p>
        		</li>	
        	</ul>
		</div>
	</div>
		
		<br/>
	
	<div class="notice-container">
		<div class="notice-tab">
				<div class="tab_content">
    				<input type="radio" name="tabmenu" id="tab01" checked>
	 	 			<label for="tab01">공지사항</label>
	 	 			<input type="radio" name="tabmenu" id="tab02">
	 	 			<label for="tab02">자주 묻는 질문</label>
	 	 			<input type="radio" name="tabmenu" id="tab03">
	 	 			<label for="tab03">1:1 문의</label>
	 	 			
	 	 			<br/><br/><br/>
	 	 			<c:if test="${user_Code == 1 }">
	 	 			<input type="button" value="작성" onclick="location.href='/notice/insertform'">
	 	 			</c:if>
	 	 			<div class="conbox con1">
	 	 			
	 	 			<div class="accordion-all"> <!-- 여기서 부터 -->
	 	 				<div class="accordion js-accordion" id="list">
	 	 				
						 
						  <c:forEach items="${list2 }" var="dto">
						  <c:if test="${dto.no_Type == '공지' }">
			                <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">[공지] ${dto.no_Title } </div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						   	${dto.no_Content }
	 	 					<br/>(1) 개정일정 <br/>
							<br/>공고일자 : ${dto.no_Date }<br/>
							<br/>시행일자 : ${dto.no_Date }<br/>
							<br/><br/>
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						 	</c:if>
			               </c:forEach>
						  
	 	 				</div>
	 	 			</div> <!-- 여기 까지 -->
	 	 			</div>	
	 	 			
	 	 			<div class="conbox con2">
	 	 				<div class="accordion js-accordion">
	 	 			
						  <c:forEach items="${list2 }" var="dto">
						  <c:if test="${dto.no_Type == '질문' }">
			                <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">Q. ${dto.no_Title } </div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						   	${dto.no_Content }
							<br/><br/>
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						 	</c:if>
			               </c:forEach>

	 	 				</div>
	 	 			</div>
	 	 			<br/>
	 	 			<div class="conbox con3">
	 	 				<table class="Inquiry-category">
							<thead>
			                  <tr class="Inquiry-text">
			                     <th>문의유형</th>
			                     <th>제목</th>
			                     <th>작성일</th>
			                     <th>답변상태</th>
			                  </tr>
			               </thead>
				            <tbody>
				            
			                   <c:if test="${user_Nm ne 'admin' }">
			                  <c:choose>
			                     <c:when test="${empty list }">
			                        <tr>
			                           <td colspan="4" class="Inquiry-content">문의 내용이 없습니다.</td>
			                        </tr>
			                     </c:when>
			                     <c:otherwise>
			                        <c:forEach items="${list }" var="dto">
			                           <tr class="Inquiry-content">
			                              <td>${dto.in_Type }</td>
			                              <td><a id="Inquiry-title" href="/inquiry/detail?in_Code=${dto.in_Code }">${dto.in_Title }</a></td>
			                              <td>${dto.in_Date }</td>
			                              <td>${dto.in_Stat }</td>
			                           </tr>
			                        </c:forEach>
			                     </c:otherwise>
			                  </c:choose>
			                  </c:if>
			                  
			                  <c:if test="${user_Nm eq 'admin' }">
			                    <c:choose>
			                     <c:when test="${empty alist }">
			                        <tr>
			                           <td colspan="4" class="Inquiry-content">문의 내용이 없습니다.</td>
			                        </tr>
			                     </c:when>
			                     <c:otherwise>
			                        <c:forEach items="${alist }" var="dto">
			                           <tr class="Inquiry-content">
			                              <td>${dto.in_Type }</td>
			                              <td><a id="Inquiry-title" href="/inquiry/detail?in_Code=${dto.in_Code }">${dto.in_Title }</a></td>
			                              <td>${dto.in_Date }</td>
			                              <td>${dto.in_Stat }</td>
			                           </tr>
			                        </c:forEach>
			                     </c:otherwise>
			                  </c:choose>
			                  </c:if>
			                  
			               </tbody>   
				          <tr>
				         <td class="btn1" colspan="2" align="right">
				         	<button type="button" value="문의" onclick="location.href='/inquiry/insertform'">문의 작성</button>      
				         </td>   
				           </tr>    
				          	</table>
				          	
				          	<c:if test="${user_Nm ne 'admin' }">
				          	<ul class="paging">
	 	 						<c:if test="${paging1.prev}">        
	 	 							<li class="paging">
	 	 								<a class="paging-a" href='<c:url value="/inquiry/list?user_Code=${user_Code }&page=${paging1.startPage-1}"/>'>이전</a>
	 	 							</li>    
	 	 						</c:if>
	 	 						<c:forEach begin="${paging1.startPage}" end="${paging1.endPage}" var="num">
	 	 							<li>
	 	 								<a id="paging-a" class="${paging1.cri.page == num ? 'nowpage' : null }" href='<c:url value="/inquiry/list?user_Code=${user_Code }&page=${num}"/>'>${num}</a>
	 	 							</li>    
	 	 						</c:forEach>
	 	 						<c:if test="${paging1.next && paging1.endPage > 0}">        
	 	 							<li>
	 	 								<a class="paging-a" href='<c:url value="/inquiry/list?user_Code=${user_Code }&page=${paging1.endPage+1}"/>'>다음</a>
	 	 							</li>    
	 	 						</c:if>
	 	 					</ul>
				          	</c:if>
				          	
				          	<c:if test="${user_Nm eq 'admin' }">
				          	<ul class="paging">
	 	 						<c:if test="${paging2.prev}">        
	 	 							<li class="paging">
	 	 								<a class="paging-a" href='<c:url value="/inquiry/list?user_Code=${user_Code }&page=${paging2.startPage-1}"/>'>이전</a>
	 	 							</li>    
	 	 						</c:if>
	 	 						<c:forEach begin="${paging2.startPage}" end="${paging2.endPage}" var="num">
	 	 							<li>
	 	 								<a id="paging-a" class="${paging1.cri.page == num ? 'nowpage' : null }" href='<c:url value="/inquiry/list?user_Code=${user_Code }&page=${num}"/>'>${num}</a>
	 	 							</li>    
	 	 						</c:forEach>
	 	 						<c:if test="${paging2.next && paging2.endPage > 0}">        
	 	 							<li>
	 	 								<a class="paging-a" href='<c:url value="/inquiry/list?user_Code=${user_Code }&page=${paging2.endPage+1}"/>'>다음</a>
	 	 							</li>    
	 	 						</c:if>
	 	 					</ul>
				          	</c:if>
		 </div>
 	</div>
 	</div>
 </div>
 </div>
  <%@ include file="footer.jsp" %>
</body>
<script>
	  var accordion = (function(){
	  
	  var $accordion = $('.js-accordion');
	  var $accordion_header = $accordion.find('.js-accordion-header');
	  var $accordion_item = $('.js-accordion-item');
	 
	  // default settings 
	  var settings = {
	    // animation speed
	    speed: 400,
	    
	    // close all other accordion items if true
	    oneOpen: false
	  };
	    
	  return {
	    // pass configurable object literal
	    init: function($settings) {
	      $accordion_header.on('click', function() {
	        accordion.toggle($(this));
	      });
	      
	      $.extend(settings, $settings); 
	      
	      // ensure only one accordion is active if oneOpen is true
	      if(settings.oneOpen && $('.js-accordion-item.active').length > 1) {
	        $('.js-accordion-item.active:not(:first)').removeClass('active');
	      }
	      
	      // reveal the active accordion bodies
	      $('.js-accordion-item.active').find;
	    },
	    toggle: function($this) {
	            
	      if(settings.oneOpen && $this[0] != $this.closest('.js-accordion').find('> .js-accordion-item.active > .js-accordion-header')[0]) {
	        $this.closest('.js-accordion')
	               .find('> .js-accordion-item') 
	               .removeClass('active')
	               .find('.js-accordion-body')
	               .slideUp()
	      }
	      
	      // show/hide the clicked accordion item
	      $this.closest('.js-accordion-item').toggleClass('active');
	      $this.next().stop().slideToggle(settings.speed);
	    }
	  }
	})();

	$(document).ready(function(){
	  accordion.init({ speed: 300, oneOpen: true });
	  d
	  
	});
</script>
</html>