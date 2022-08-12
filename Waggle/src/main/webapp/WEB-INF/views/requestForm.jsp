<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 요청글 작성</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/guideline.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df487b49cd90a64d7305e577e300f2e4&libraries=services,clusterer,drawing"></script>
<script>
	function kakaopost(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#home_Addr").val(data.address);
	        	$("#home_Post").val(data.zonecode);
	        	$("#ji_Addr").val(data.jibunAddress);
	        	$("#road_Addr").val(data.roadAddress);
	        	
	        	
	        	 //받은 주소값을 위도 경도로 바꿔서 input hidden 값에 value값으로 넣어주기
                var geocoder = new kakao.maps.services.Geocoder();
                var addr = $('#ji_Addr').val();
                geocoder.addressSearch(addr, function(result, status) {
        		    // 정상적으로 검색이 완료됐으면 
        		     if (status === kakao.maps.services.Status.OK) {
        				$("#home_Lat").attr('value',result[0].y);
        				$("#home_Lng").attr('value',result[0].x);
        		    } else {
        		    	console.log("주소 가져오기 에러");
        		    }
        		});  
                
	        }
	    }).open({
	    	popupName: 'AddrSearch'
	    });		
	}
</script>
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
	font-size: 16px;
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
    border-spacing: 44px;
    font-size: 16px;
    text-align:right;
}

.ongoing21-content-bottom {
	text-align: center;
}

.ongoing21-content td {
	width: 380px;
	text-align:left;
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
	font-size: 20px;
	font-weight: 500;
	font-family: inherit;
	letter-spacing: .25px;
	line-height: normal;
	padding: 11px 11px;
	transition: background box-shadow 280ms ease;
	margin-right: 30px;
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

input[type="text"] {
	font-size:15px;
	padding:5px 5px 5px 0px;
	display:block;
	width:300px;
	border:none;
	border-bottom:1px solid #757575;
}

input[type="date"] {
	font-size:15px;
	padding:5px 5px 5px 0px;
	display:block;
	width:150px;
	border:none;
	border-bottom:1px solid #757575;
}

.required:after {
	content:" *";
	color: red;
}

#incontent{
	font-size:15px;
	line-height: 150%;
	padding: 10px;
}

.link-guide {
	color: #FF1493;
}

.link-guide:hover {
	color: #C71585;
	text-decoration: underline;
	cursor: pointer;
}
/* loading spinner */
.spinner {
	animation: rotator 1.4s linear infinite;
}
@keyframes rotator {
	0% {
		transform: rotate(0deg);
	}
	100% {
		transform: rotate(270deg);
	}
}
.path {
	stroke-dasharray: 187;
	stroke-dashoffset: 0;
	transform-origin: center;
	animation: dash 1.4s ease-in-out infinite, colors 5.6s ease-in-out infinite;
}
@keyframes colors {
	0% {
		stroke: #4285f4;
	}
	25% {
		stroke: #de3e35;
	}
	50% {
		stroke: #f7c223;
	}
	75% {
		stroke: #1b9a59;
	}
	100% {
		stroke: #4285f4;
	}
}
@keyframes dash {
	0% {
		stroke-dashoffset: 187;
	}
	50% {
		stroke-dashoffset: 46.75;
		transform: rotate(135deg);
	}
	100% {
		stroke-dashoffset: 187;
		transform: rotate(450deg);
	}
}
.loading-wrapper {
  display: none;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}

</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="loadingdo" class="loading-wrapper">
		<div class="loading-box">
			<svg class="spinner" width="65px" height="65px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
			   <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
			</svg>
		</div>
	</div>
	 <div id="wrap">
	  <div class="middle">
		<div class="guideline">
			<ul class="guideline-all">
        		<li><a href="javascript:void(0)">
        		<i class="fa-solid fa-house"></i>
        		</a>
        		<p>HOME > 꿀단지목록 > 요청글 작성</p>
        		</li>	
        	</ul>
		</div>
	  </div>
   	
	<div class="ongoing21-all">
		<h3 id="ongoing-detail">요청페이지</h3>
		<div class="ongoing21-all">
			<form onsubmit="return loading()" action="/board/request" method="post">
			<input type="hidden" value="${user_Code }" name="req_UCode">
			<input type="hidden" name="home_Post" id="home_Post">
				<table class="ongoing21-content">
					<tbody style="border-bottom: 1px solid;">
						<tr>
							<th><label class="required">제목</label></th>
							<td><input type="text" placeholder="Title" name="req_Title" required="required"></td>
						</tr>
						<tr>
							<th>
								내가 본 집 링크 첨부<br/>
								(ex.직방, 다방 등등..)
							</th>
							<td>
								<input type="text" placeholder="LInk" name="req_Link">
								<a class="link-guide" onclick="window.open('/images/importToJsp/링크첨부방법.gif', 'window_name', 'width=1000, height=600, location=no, status=no, scrollbars=yes')">링크 첨부방법 확인</a>
							</td>
						</tr>
						<tr>
							<th><label class="required">방문기한</label></th>
							<td><input type="date" name="req_EDate" required="required"></td>
						</tr>
						<tr>
							<th><label class="required">내가 찾아본 집의 주소</label><br><br><br></th>
							<td>
								<input type="text" placeholder="클릭해서 주소 입력" name="home_Addr" id="home_Addr" readonly="readonly" onclick="kakaopost()" required="required">
								<input type="hidden" name="home_Lat" id="home_Lat">
								<input type="hidden" name="home_Lng" id="home_Lng">
								<input type="hidden" name="ji_Addr" id="ji_Addr">
								<input type="hidden" name="road_Addr" id="road_Addr">
								<br><input type="text" placeholder="상세주소(선택)" name="home_DAddr">
							</td>
						</tr>
						<tr>
							<th><label class="required">요청 포인트</label></th>
							<td><input type="text" placeholder="Point(숫자만 입력하세요)" name="req_Point" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /></td>
						</tr>
						<tr>
							<th>공인중개사 연락처</th>
							<td><input type="text" placeholder="010-0000-0000(선택사항)" name="req_Phone" maxlength='13' oninput="this.value = this.value.replace(/[^0-9-]/g, '');"></td>
						</tr>
					</tbody>
		    	</table>
				<div class="ongoing21-content-bottom">
					<h4>자세하게 봐야 될 부분</h4>
					<textarea id="incontent" rows="12" cols="70"  placeholder="요구사항을 입력해주세요&nbsp;ex.수압이나 바깥전망, 소음 등 원하는 사진이나 동영상이 필요한 부분을 적어주세요" name="req_Detail"></textarea>
					<br><br>
					<div class="btn1" id="btn1">
						<button id="submit-do" type="submit" value="작성">작성 완료</button>
						<button type="button" value="취소" onclick="location.href='/board/list'">취소</button>	    	
					</div>
					<br/><br/><br/>
				</div>
		    </form>
	    </div>
	</div>
	
	</div>
	<%@ include file="footer.jsp" %>
<script type="text/javascript">
	function loading() {
		var addVal = $("#home_Addr").val();
		
		if(addVal == null || addVal == '') {
			alert("주소를 입력하세요!");
			return false;
		} else {
			$("#loadingdo").attr("style","display:flex;");
			$("#wrap").attr("style","display:none;");		
			return true;
		}
		
	}
</script>
</body>
</html>