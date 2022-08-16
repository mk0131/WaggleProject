<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 문의글 목록</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" 
	rel="stylesheet"/>
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
  width: 60vw;
  margin: 0 auto;
}

.accordion-all {

}


.accordion-header,
.accordion-body {
  background: white;
}

.accordion-header {
  padding: 1em 2em;
  background: #fff;
  color: #151515;
  cursor: pointer;
  font-size: 16px;
  letter-spacing: .1em;
  transition: all .3s;
  text-transform: uppercase;
  text-align:left;
}

.accordion__item {
    border-bottom: 1px solid #dfdfdf;
}

.accordion__item .accordion__item {
  border-bottom: 1px solid #dfdfdf;
}

.accordion-header:hover {
  background: #fff;
  position: relative;
  z-index: 5;
}

.accordion-body {
  background: #fafafa;
  color: #353535;
  display: none;
}

.accordion-body__contents {
  padding: 1em 2.3em;
  font-size: 15px;
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
 font-weight: 600;
 color: #fff;
 background-color: #222;
 border-radius: 12px;
 border: none;
 font-size: 13px;
 font-family: inherit;
 letter-spacing: .14px;
 line-height: normal;
 padding: 11px 11px;
 cursor: pointer;
}

button:active {
 outline: none;
 border: none;
 background-color: #353535;
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
	color: #222;
	letter-spacing: .55px;
	font-size: 15px;
}

#Inquiry-title:visited {
	color: #222;
	letter-spacing: 1px;
	font-size: 15px;
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

#create{
	position: absolute;
    right: 400px;
}

.question-q {
	color: rgb(52, 106, 255);
	display:inline-block;
}

.question-a{
	zoom:1.2 !important;
	float:left !important;
	color:rgb(125, 157, 239);
}

.question-content{
	display:inline-block;
	margin-left:65px;
}

.question-q-title {
    display: inline-block;
    margin-left:50px;
    margin-bottom:10px;
    margin-top:10px;
}

.question-icon1 {
	display: inline-block;
	transform: rotate(90deg);
	float:right;
	line-height:2em;
	zoom:1.5;
	color:#888888;
}

.question-icon2 {
	display: inline-block;
	transform: rotate(270deg);
}

.notice-title {
	display: inline-block;
}

.notice-ymd {
	font-size:13px;
	color:#888888;
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
        		<p>HOME > 고객센터</p>
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
	 	 			
	 	 			<div class="conbox con1">
	 	 			<div class="accordion-all"> <!-- 여기서 부터 -->
	 	 				<div class="accordion js-accordion" id="list">
	 	 				
						 
						  <c:forEach items="${list2 }" var="dto">
						  <c:if test="${dto.no_Type == '공지' }">
			                <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">
						    <div class="notice-title">
						    [공지] ${dto.no_Title } 
						    </div>
						    <div class="question-icon1"><i class="fa-solid fa-angle-right"></i></div> 
						    <div class="notice-ymd"><fmt:formatDate value="${dto.no_Date}" pattern="yyyy-MM-dd"/></div></div>
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						   	${dto.no_Content }
						   	<br>
							<br/>공고일자 : <fmt:formatDate value="${dto.no_Date}" pattern="yyyy년 MM월 dd일"/><br/>
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
						    <div class="accordion-header js-accordion-header">
						    
						     <div class="question-q">Q</div>
						     <div class="question-q-title">${dto.no_Title }</div>
						      <div class="question-icon1"><i class="fa-solid fa-angle-right"></i></div>
						      
						      </div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents" style="text-align:left;">
						    <br/><br/>
						    <div class="question-q question-a" >A</div>
						    <div class="question-content">
						   	${dto.no_Content }
						   	</div>
							<br/><br/>
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						 	</c:if>
			               </c:forEach>

	 	 				</div>
	 	 			</div>
	 	 			<c:if test="${user_Code == 1 }">
	 	 			<br>
	 	 			<div style="width: 1135px;">
	 	 			<button  id="create" onclick="location.href='/notice/insertform'">공지 작성</button>
	 	 			</div>
	 	 			</c:if>
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
			                              <td id="stat-btn">${dto.in_Stat }</td>
			                           </tr>
			                        </c:forEach>
			                     </c:otherwise>
			                  </c:choose>
			                  </c:if>
			                  
			               </tbody>   
				          <tr>
				         <td class="btn1" colspan="2" align="right">
				         	<c:if test="${user_Nm ne 'admin'}">
						    <div class="btn-admin" id="btn-admin">
						     <button type="button" value="문의" onclick="location.href='/inquiry/insertform'">문의 작성</button>
						    </div>
	    					</c:if>   
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
	  
	  
	  $(function(){
		  
		  $("#tab03").on("click",function(){
			  $("#create").css("display", "none");
		  });
		  $("#tab01").on("click",function(){
			  $("#create").show();
		  });
		  $("#tab02").on("click",function(){
			  $("#create").show();
		  });
	  })
	  
	  
	});
	
	
	
</script>
</html>