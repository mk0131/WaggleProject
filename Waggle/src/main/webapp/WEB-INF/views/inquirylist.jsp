<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	font-size: 14px;
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
	 	 			
	 	 			<div class="conbox con1">
	 	 			<div class="accordion-all">
	 	 				<div class="accordion js-accordion">
						  <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">[공지]  waggle 개인정보 처리방침 개정 안내</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						    안녕하세요.<br/>
	 	 					Probee waggle입니다.<br/>waggle을 이용해 주시는 고객님께 진심으로 감사드립니다.<br/>
	 	 					㈜Probee는 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스 관련 법규상의 개인정보 보호 규정을 준수하며, 관련 법령에 의거한 개인정보처리방침을 정하여 사용자의 권익 보호를 위해 노력하고 있습니다.<br/>
	 	 					아래와 같이 개인정보처리방침 개정될 예정임을 안내드리오니, 확인 후 이용에 참고하시기 바랍니다.<br/>
	 	 					<br/>(1) 개정일정 :<br/>
							<br/>공고일자 : 2022년 3월 29일<br/>
							<br/>시행일자 : 2022년 3월 30일<br/>
							<br/>(2) 주요 개정 내용 : 개인정보의 수집•이용 목적•항목•수집방법, 개인정보 처리 및 보유기간, 권익침해 구제방법 등
							<br/><br/>
						    </div>
						     
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						  <div class="accordion__item js-accordion-item active">
						    <div class="accordion-header js-accordion-header">[공지]  waggle 개인정보 처리방침 개정 안내</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						    안녕하세요.<br/>
	 	 					Probee waggle입니다.<br/>waggle을 이용해 주시는 고객님께 진심으로 감사드립니다.<br/>
	 	 					㈜Probee는 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스 관련 법규상의 개인정보 보호 규정을 준수하며, 관련 법령에 의거한 개인정보처리방침을 정하여 사용자의 권익 보호를 위해 노력하고 있습니다.<br/>
	 	 					아래와 같이 개인정보처리방침 개정될 예정임을 안내드리오니, 확인 후 이용에 참고하시기 바랍니다.<br/>
	 	 					<br/>(1) 개정일정 :<br/>
							<br/>공고일자 : 2022년 3월 29일<br/>
							<br/>시행일자 : 2022년 3월 30일<br/>
							<br/>(2) 주요 개정 내용 : 개인정보의 수집•이용 목적•항목•수집방법, 개인정보 처리 및 보유기간, 권익침해 구제방법 등
							<br/><br/>
						    </div>
						      
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						    <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">[공지]  waggle 개인정보 처리방침 개정 안내</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						    안녕하세요.<br/>
	 	 					Probee waggle입니다.<br/>waggle을 이용해 주시는 고객님께 진심으로 감사드립니다.<br/>
	 	 					㈜Probee는 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스 관련 법규상의 개인정보 보호 규정을 준수하며, 관련 법령에 의거한 개인정보처리방침을 정하여 사용자의 권익 보호를 위해 노력하고 있습니다.<br/>
	 	 					아래와 같이 개인정보처리방침 개정될 예정임을 안내드리오니, 확인 후 이용에 참고하시기 바랍니다.<br/>
	 	 					<br/>(1) 개정일정 :<br/>
							<br/>공고일자 : 2022년 3월 29일<br/>
							<br/>시행일자 : 2022년 3월 30일<br/>
							<br/>(2) 주요 개정 내용 : 개인정보의 수집•이용 목적•항목•수집방법, 개인정보 처리 및 보유기간, 권익침해 구제방법 등
							<br/><br/>
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						  
						     <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">[공지]  waggle 개인정보 처리방침 개정 안내</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						    안녕하세요.<br/>
	 	 					Probee waggle입니다.<br/>waggle을 이용해 주시는 고객님께 진심으로 감사드립니다.<br/>
	 	 					㈜Probee는 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스 관련 법규상의 개인정보 보호 규정을 준수하며, 관련 법령에 의거한 개인정보처리방침을 정하여 사용자의 권익 보호를 위해 노력하고 있습니다.<br/>
	 	 					아래와 같이 개인정보처리방침 개정될 예정임을 안내드리오니, 확인 후 이용에 참고하시기 바랍니다.<br/>
	 	 					<br/>(1) 개정일정 :<br/>
							<br/>공고일자 : 2022년 3월 29일<br/>
							<br/>시행일자 : 2022년 3월 30일<br/>
							<br/>(2) 주요 개정 내용 : 개인정보의 수집•이용 목적•항목•수집방법, 개인정보 처리 및 보유기간, 권익침해 구제방법 등
							<br/><br/>
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						  
						     <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">[공지]  waggle 개인정보 처리방침 개정 안내</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						    안녕하세요.<br/>
	 	 					Probee waggle입니다.<br/>waggle을 이용해 주시는 고객님께 진심으로 감사드립니다.<br/>
	 	 					㈜Probee는 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스 관련 법규상의 개인정보 보호 규정을 준수하며, 관련 법령에 의거한 개인정보처리방침을 정하여 사용자의 권익 보호를 위해 노력하고 있습니다.<br/>
	 	 					아래와 같이 개인정보처리방침 개정될 예정임을 안내드리오니, 확인 후 이용에 참고하시기 바랍니다.<br/>
	 	 					<br/>(1) 개정일정 :<br/>
							<br/>공고일자 : 2022년 3월 29일<br/>
							<br/>시행일자 : 2022년 3월 30일<br/>
							<br/>(2) 주요 개정 내용 : 개인정보의 수집•이용 목적•항목•수집방법, 개인정보 처리 및 보유기간, 권익침해 구제방법 등
							<br/><br/>
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
  
    
	 	 				</div>
	 	 			</div>
	 	 			</div>	
	 	 			
	 	 			<div class="conbox con2">
	 	 				<div class="accordion js-accordion">
						  <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">Q. waggle은 어떤 서비스인가요?</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						    이사를 위한 집에대한 이전 리뷰 기록을 조회할 수 있는 정보 열람 기능과<br/> 
							직접 탐색할 추가 정보를 요청할 수 있는 정보요청 서비스를 제공하는 플랫폼이에요!<br/><br/>
	 	 					부동산 플랫폼 상에서 직접 탐색하고 싶은 매물을 찾았을 때,<br/>
	 	 					해당 매물 주변에 거주하는 사람에게 요청함으로써 물리, 시간적 절약을 도모하여 효율성을 높였습니다!<br/>
							같은 사용자 입장으로 부터 정보를 얻도록 하여, 정보의 신뢰성을 높이고자 만들게 되었습니다.<br/>
							<br/><br/>
						    </div>
						     
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						  
						  <div class="accordion__item js-accordion-item active">
						    <div class="accordion-header js-accordion-header">Q. 회원가입을 하면 어떤 점이 좋나요?</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    안녕하세요.<br/>
	 	 					
						    </div>
						      
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						  
						  <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">Q. 등급은 어떻게 계산 되나요?</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						    등급은 내가 받은 평가, 거래 후기, 제재를 종합해서 계산합니다.<br/>
							좋은 평가, 긍정적인 거래 후기를 받으면 등급이 올라요.<br/>
							비매너 평가, 부정적인 거래 후기, 제재를 받으면 등급이 내려가요.<br/>
							이 모든 지표가 계산되어 등급에 반영되기까지 7~10일 정도 걸릴 수 있어요.<br/>
							최근 받은 평가와 긍정적인 거래 후기를 받았는데도 등급이 안 오른다면 조금만 더 기다려 주세요. :) <br/>
							<br/><br/>	 					
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						  
						    <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">Q. 거래에 문제가 생겼어요!</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						  	'waggle'은 개인 간의 매칭을 돕는 중개 플랫폼으로서, 심부름/서비스 진행 중 발생한 피해에 대해서는 당사자 간에 합의를 해야 해요.<br/>
						  	만약 의견 조율이 되지 않는다면,<br/>
						  	[고객센터 > 1:1 문의하기]를 통해 고객센터로 연락해 주세요.<br/>
						  	<br/><br/>
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						  
						     <div class="accordion__item js-accordion-item">
						    <div class="accordion-header js-accordion-header">Q. 환불 규정이 궁금해요.</div> 
						  <div class="accordion-body js-accordion-body">
						    <div class="accordion-body__contents">
						    <br/><br/>
						    'waggle'은 고객과 대행인 간의 매칭을 도와드리는 중개 플랫폼으로서, 기본적으로 당사자 간의 결정을 중시하고 있어요.<br/>
						    서로 합의된 내용을 기반하여 제공된 결과물에 대해서는 고객의 단순 변심으로 환불은 불가능해요.<br/>
						    만약 대행인이 기존에 합의된 서비스 요청 내용을 이행하지 않았을 경우 [고객센터 > 1:1 문의하기]를 통해 고객센터에 즉각 신고해 주세요.<br/>
						    경위 확인 후 서비스비는 전액 환불해 드리며, 해당 대행인은 즉시 활동 정지 조치되어요.<br/>
						    <br/><br/>
						    환불 시점은 결제사에 따라 차이가 있으며, 영업일 기준으로 1~3일 소요됩니다.<br/>
						    <br/><br/>				
						    </div>
						    </div><!-- end of accordion body -->
						  </div><!-- end of accordion item -->
						  
						     
  
    
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
			                              <td><a href="/inquiry/detail?in_Code=${dto.in_Code }">${dto.in_Title }</a></td>
			                              <td>${dto.in_Date }</td>
			                              <td>${dto.in_Stat }</td>
			                           </tr>
			                        </c:forEach>
			                     </c:otherwise>
			                  </c:choose>
			               </tbody>   
				          <tr>
				         <td class="btn1" colspan="2" align="right">
				         	<button type="button" value="문의" onclick="location.href='/inquiry/insertform'">문의 작성</button>      
				         </td>   
				           </tr>    
				          	</table>
				          
	 	 				
	 	 			
  				
  
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
	});
</script>
</html>