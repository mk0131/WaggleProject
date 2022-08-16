<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waggle 매물검색</title>
<link rel="icon" href="/images/importToJsp/favicon.png">
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet" />
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@import url("https://fonts.googleapis.com/css?family=Sarabun");
.blank {
	height: 25px;
}

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
}

.container {
	margin: 0 auto;
	position: relative;
	width:1000px;
}


.searchbar {
	font-size: 1rem;
	width: 60rem;
	height: 1rem;
	border: 2px solid #d4d7e1;
	outline: none;
	border-radius: 1rem;
	padding: 1rem;
	transition: all .2s;
	transition-delay: .1s;
	padding: 1rem;
}

.searchbar:hover {
	width: 60rem;
	height: 2rem;
	background-color:#f7f9fa;
}

.button {
	height: 1.5rem;
	position: absolute;
	top: 0.75rem;
	right: 2rem;
	transition: all .2s;
	transition-delay: .1s;
}

.button:hover {
	cursor: pointer;
}

.searchbar:hover+.button {
	height: 2rem;
	top: 1rem;
	right: 1.8rem;
}

.searchbar::placeholder {
	opacity: .5;
}



.table-container {
	margin: 0 auto;
	width: 1000px;
	display: none;
}

.detail-container {
	width: 300px;
	height: 300px;
	display: inline-block; background : #ffffff;
	padding: 1em;
	border: 1px solid #d4d7e1;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), 0 5px 10px
		rgba(0, 0, 0, 0.05);
	border-radius: 3px;
	overflow: hidden;
	background: #ffffff;
}

.input-query {
	width: 95%;
	padding: 0.5em;
	border: 1px solid #d4d7e1;
	border-radius: 3px;
	font-size: 1em;
}

.input-query:hover{
	background-color:#f7f9fa;
}

.input-query:focus ~ .counter {
	opacity: 0.1;
	transition: opacity 1s ease-in;
}

.list-wrap {
	margin-top: 0.4em;
	overflow-y: auto;
	overflow-x: hidden;
}

.list {
	max-height: 220px;
	padding: 0;
}

.list-item {
	font-size: 0.9em;
	padding: 0.5em 0.8em;
	border-bottom: 1px solid #d4d7e1;
	border-top: 1px solid white;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	max-width: 100%;
}

.list-item:first-child {
	border-top: none;
}

.list-item:last-child {
	border-bottom: none;
}

.list-item-link {
	color: #444;
	text-decoration: none;
}

.item-list-subtext {
	font-size: 85%;
	color: grey;
}

.item-list-subtext:before {
	content: ' (';
}

.item-list-subtext:after {
	content: ')';
}

.list-item--disable {
	text-align: center;
	border-bottom: none;
	animation: shake 0.6s;
	color: #9da1b1;
}

.counter {
	position: absolute;
	bottom: -15px;
	right: 10px;
	z-index: 0;
	font-size: 3.5em;
	color: black;
	transform: translateY(0);
	opacity: 0;
}

div {
	box-sizing: border-box;
}

#img-detail{
	border:2px outset #bfbfbf;
	border-radius:5px;
	color:#424242;
	font-size:16pt;
	text-align:center;
	padding-bottom:3px;
	margin-top:7px;
}
.horizontal-scroll-wrapper {
	position: absolute;
	display: inline-block;
	max-height: 680px;
	border: 1px solid #d4d7e1;
	background: #ffffff;
	overflow-y: auto;
	overflow-x: hidden;
	transform: rotate(-90deg) translateY(-290px);
	transform-origin: right top;
	border-radius: 3px;
}

.horizontal-scroll-wrapper>div {
	display: block;
	background: #ffffff;
	transform: rotate(90deg) translateX(200px);
	transform-origin: right top;
	text-align:center;
}

.squares {
	padding: 60px 0 0 0;
}

.squares>div {
	width: 260px;
	height: 260px;
	margin: 10px;
}

#map {
	margin: 0 auto;
	width: 994.2px;
	height: 500px;
}

#map img[src*=profile]{
	border-radius:1000px;
}

#map img[src*=http://t1.daumcdn.net/mapjsapi/images/transparent.gif]{
	z-index:99;
}
.detail_img, .detail_video{
	width: 100%;
	height: 83%;
	object-fit: fill;
}

.detail_img:hover, .detail_video:hover{
	border:5px solid #f2f0e8;
	height: 79%;
	width: 97%;
}
//이미지에 모달창 띄우기
.modal {
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;

  background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 200px;
  height: 65px;
  z-index:100;
  
  padding: 5px;
  font-weight:bold;
  text-align: center;

  background-color: rgb(255, 255, 255,85%);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
  color:#0000ff;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<div id="wrap">
	<div class="middle">
        <div class="guideline">
         	<ul class="guideline-all">
            	  <li>
             	 <i class="fa-solid fa-house"></i>
              	</li>
             	 <p>HOME > 매물검색</p>
           </ul>
     	</div>
			
		<div class="container" >
			<input type="text" maxlength="12" placeholder="주소 검색하기"
				class="searchbar" onclick="kakaopost()" readonly /> 
				<img
				src="https://images-na.ssl-images-amazon.com/images/I/41gYkruZM2L.png"
				alt="Magnifying Glass" class="button" onclick="kakaopost()">
			<input type="text" maxlength="12" class="searchbar2" style="display:none"> 
		</div>
		
		<form id="addr_filter" method="post">
		<input type="button" style="display:none" id="submit">
		<input id="var1" type="hidden" name="search_post" value="" >
		</form>
		
		<div class="blank">
		</div>
		
		<div class="table-container">
			<div class="detail-container" >
				<input type="text" id="search" class="input-query" onkeyup="filter()" placeholder="상세주소를 입력하세요." /> 
				<span class="counter"></span>
				<div class="list-wrap">
					<ul class="list" >
					</ul>
				</div>
			</div>
			
			<div class="horizontal-scroll-wrapper squares">
			</div>
			
			<div class="blank">
			</div>
			
		</div>
		<div id="wdate" style="display:none"></div>
		
		<div id="map">
		</div>
	</div>
  </div>
	<%@ include file="footer.jsp"%>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df487b49cd90a64d7305e577e300f2e4&libraries=services,clusterer,drawing"></script>
	<script>
	function kakaopost(){
		hideMarkers();
		var width = 500; //팝업의 너비
		var height = 600; //팝업의 높이
	    new daum.Postcode({
	        	oncomplete: function(data) {
	        		var a = data.jibunAddress;
	        		var b = data.roadAddress;
	        		var p = data.zonecode;
	        		document.querySelector("#var1").value = a;
	        		document.querySelector(".searchbar2").value = b;
	        		document.getElementById('submit').click();
	   				searchLngLat();
	        	}
	    	}).open({
	    		left: (window.screen.width / 2) - (width / 2),
	    	    top: (window.screen.height / 2) - (height / 2),
	    		popupName: 'AddrSearch'
	    	});
    
	};

	function filter() {
        let search = document.getElementById("search").value.toLowerCase();
        let listInner = document.getElementsByClassName("list-item");

        for (let i = 0; i < listInner.length; i++) {
          city = listInner[i].getElementsByClassName("list-item-link");
          if (city[0].innerHTML.toLowerCase().indexOf(search) != -1) {
            listInner[i].style.display = "flex"
          } else {
            listInner[i].style.display = "none"
          }
        }
      }
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.5012767241426, 127.039600248343), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	// 모든 회원들 지도에 뿌려주기
	$(function(){
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		var markers2 = [];
		
		var userAddr = new Array();
		var userimg = new Array();
		var userCode = new Array();
		<c:forEach var="list" items="${uaddr}">
		userAddr.push("${list.getUa_Addr()}");
		userimg.push("${list.getFi_Nm()}");
		userCode.push("${list.getUser_Code()}");
		</c:forEach>
	
		for(let i=0; i<userAddr.length; i++){
			
			if(userimg[i] != ""){
				window['imageSrc'+i] = userimg[i]; // 마커이미지의 주소입니다    
			}else {
				window['imageSrc'+i] = '/images/importToJsp/profile_default.jpg';
			}
			
		    var imageSize = new kakao.maps.Size(64, 69); // 마커이미지의 크기입니다
		    var imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		    
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(userAddr[i], function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        marker = new kakao.maps.Marker({
			            position: coords,
			            image: new kakao.maps.MarkerImage(window['imageSrc'+i], imageSize, imageOption),
			            clickable: true
			        });
			        marker.setMap(map);
			        markers2.push(marker);
			        
					//마커 클릭시 해당 꿀벌의 마이페이지로 이동하도록
				    kakao.maps.event.addListener(marker, 'click', function(){
				    	window.open("/mypage/other?ucode="+userCode[i],"a",'height=' + 1300 + ',width=' + 1200 + 'fullscreen=yes');
				    });
					
			    } else {
			    	console.log("에러");
			    }
			});  
		 
		}
		
		//zoom out시에 꿀벌 사라지게
	    kakao.maps.event.addListener(map, 'zoom_changed', function() {        
		    var level = map.getLevel();
		    
		    if(level > 3){
		    	for(var i=0; i<markers2.length; i++){
		    		markers2[i].setMap(null);
		    	}
		    }else{
		    	for(var i=0; i<markers2.length; i++){
		    		markers2[i].setMap(map);
		    	}
		    }
		});
		
	});
		
	
	//검색된 마커 담는 리스트
	var markers = [];
	//검색한 주소 지도에 핀 설정
	function searchLngLat(){
		var gap = document.querySelector("#var1").value;

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(gap, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
				
		        // 지도 레벨 더 확대
		        map.setLevel(1);
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        markers.push(marker);
		        
		      //zoom out시에 꿀벌 사라지게
			    kakao.maps.event.addListener(map, 'zoom_changed', function() {        
				    var level = map.getLevel();
				    
				    if(level > 3){
				    	for(var i=0; i<markers.length; i++){
				    		markers[i].setMap(null);
				    	}
				    }else{
				    	for(var i=0; i<markers.length; i++){
				    		markers[i].setMap(map);
				    	}
				    }
				});
		    } else {
		    	console.log("에러");
		    }
		});    
	}
	
	//주소 검색 창 클릭시 지도에 검색되었던 마커들 안보이게 하는 함수
	function hideMarkers() {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(null);
	    }            
	};
	
	//주소창에 검색시 상세주소와 해당 영상들 나오게 하기
	$('#submit').on("click", function(){ // #submit버튼은 kakaopost() 함수에서 click되도록 구성
		let searchbar1 = $('#var1').val();
		let searchbar2 = $('.searchbar2').val();
		let data = {jibunAddr : searchbar1, roadAddr : searchbar2};
		let now = new Date();
		
		$.ajax({
			type : "post",
			url : "/map/search",
			data : data,
			success : function(result){
					$('.table-container').show();
					if(result.length == 0){
						$(".horizontal-scroll-wrapper").empty();
						$(".list").empty();
						$(".horizontal-scroll-wrapper").append('<div>해당 매물에 대한 정보가 없습니다.</div>');
						$(".horizontal-scroll-wrapper").append('<div>해당 매물에 대한 정보가 없습니다.</div>');
						$(".horizontal-scroll-wrapper").append('<div>해당 매물에 대한 정보가 없습니다.</div>');
					}else{
						//중복되는 상세주소 없앤 새로운 배열 만들기
						$(".horizontal-scroll-wrapper").empty();
						$(".list").empty();
						let DAddr = new Array();
						for(let i=0; i<result.length; i++){
							DAddr.push(result[i].home_DAddr);
						}
						
						let unique_DAddr = Array.from(new Set(DAddr.sort()));
						//중복제거한 상세주소 페이지에 뿌리기
						for(let i=0; i<unique_DAddr.length; i++){
							$(".list").append('<li class="list-item" onclick="clickDAddr(\''+unique_DAddr[i]+'\');" data-search-on-list="list-item"><a href="#" class="list-item-link">'+unique_DAddr[i]+'<span class="item-list-subtext">'+result[i].home_Addr+'</span></a></li>');
						}
						
						//영상 뿌리기 시작
						var test = false;
						//json 객체중에 포인트를 사용했던 객체가 있나 테스트.
						for(let i=0; i<result.length; i++){
							if(result[i].po_UCode == ${user_Code}){
								test = true;
							}
						}
						
						console.log(test);
						//포인트를 사용한 객체가 없다면, fi_Nm의 중복 요소들 제거한 이후에 뿌려줌.
						if(test == false){
							let unique = result.filter(function(item1, idx1){
								return result.findIndex(function(item2, idx2){
									return item1.fi_Nm == item2.fi_Nm
								}) == idx1;
							}) ;
							
							//검색 주소에 해당하는 영상들 페이지에 뿌려주기
							for(let i=0; i<unique.length; i++){
								var res = new Date(unique[i].res_WDate);
								$('#wdate').html(res.getTime());
								if(unique[i].fi_Nm.includes('jpg') || unique[i].fi_Nm.includes('png') || unique[i].fi_Nm.includes('jpeg') || unique[i].fi_Nm.includes('tiff') || unique[i].fi_Nm.includes('jfif')){
									//글이 24시가 넘었을 경우 블러 해제
									if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
											$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><img class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
									}else{ // 글이 24시가 넘지 않았을 경우 블러처리
										//로그인한 회원이 글 작성자인경우 다 보여줌
										if(${user_Code}==unique[i].res_UCode){
											$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><img class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
										}else if(${user_Code}==1){//관리자 보여줌
											$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><img class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
										}else{//로그인한 회원이 글 작성자가 아닐 경우
											$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><img style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
										}
									}
								}else if(unique[i].fi_Nm.includes('mp4') || unique[i].fi_Nm.includes('avi')){
									if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><video class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
									}else{
										//로그인한 회원이 글 작성자인경우 다 보여줌
										if(${user_Code}==unique[i].res_UCode){
											$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><video class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
										}else if(${user_Code}==1){
											$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><video class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
										}else{//로그인한 회원이 글 작성자가 아닐 경우
											$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><video style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
										}
									}
								}
							}
							
							if(unique.length < 3){
								$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
								$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
							}
							
						}else{//json객체 중에 포인트를 사용한 파일이 있다면
							var req_No = 0; //포인트 사용한 요청글 번호 구하기 위한 변수
							var fi_num = 0; //포인트 사용한 요청글의 파일들 갯수 구하기 위한 변수
							for(let i=0; i<result.length; i++){
								if(result[i].po_UCode == ${user_Code}){
									req_No = result[i].req_No;
									fi_num += 1;
								}
							}
							
							console.log(req_No);
							console.log(fi_num);
							for(let i=0; i<result.length; i++){
								//포인트 사용한 요청글과 관련없는 요청글들은 그냥 뿌려줌
								if(result[i].req_No != req_No){
									var res = new Date(result[i].res_WDate);
									$('#wdate').html(res.getTime());
									if(result[i].fi_Nm.includes('jpg') || result[i].fi_Nm.includes('png') || result[i].fi_Nm.includes('jpeg') || result[i].fi_Nm.includes('tiff') || result[i].fi_Nm.includes('jfif')){
										//글이 24시가 넘었을 경우 블러 해제
										if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
												$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
										}else{ // 글이 24시가 넘지 않았을 경우 블러처리
											//로그인한 회원이 글 작성자인경우 다 보여줌
											if(${user_Code}==result[i].res_UCode){
												$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
											}else if(${user_Code}==1){//관리자 보여줌
												$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
											}else{//로그인한 회원이 글 작성자가 아닐 경우
												$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><img style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_img" src='+result[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
											}
										}
									}else if(result[i].fi_Nm.includes('mp4') || result[i].fi_Nm.includes('avi')){
										if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
											$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
										}else{
											//로그인한 회원이 글 작성자인경우 다 보여줌
											if(${user_Code}==result[i].res_UCode){
												$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
											}else if(${user_Code}==1){
												$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
											}else{//로그인한 회원이 글 작성자가 아닐 경우
												$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><video style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_video" controls ><source src='+result[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
											}
										}
									}
								}
							}
							
							//포인트 사용한 요청글과 관련한 글들이라면
							//블러 처리를 할 필요가 없고, 중복 가능하니까 중복처리 해서 뿌려줌
							//글 작성자는 포인트를 사용할 리가 없으니까 글 작성자 고려요소도 제거 가능
							//돈 낸거니까 시간도 고려안해도 됨.
							let unique = result.filter(function(item1, idx1){
								return result.findIndex(function(item2, idx2){
									return item1.fi_Nm == item2.fi_Nm
								}) == idx1;
							}) ;
							
							for(let i=0; i<unique.length; i++){
								if(unique[i].req_No == req_No){
									if(unique[i].fi_Nm.includes('jpg') || unique[i].fi_Nm.includes('png') || unique[i].fi_Nm.includes('jpeg') || unique[i].fi_Nm.includes('tiff') || unique[i].fi_Nm.includes('jfif')){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><img class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
									}else if(unique[i].fi_Nm.includes('mp4') || unique[i].fi_Nm.includes('avi')){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><video class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
									}
								}
							}
							
							if(unique.length < 3){
								$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
								$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
							}
								
						}
						
						/*
						//검색 주소에 해당하는 영상들 페이지에 뿌려주기
						for(let i=0; i<result.length; i++){
							var res = new Date(result[i].res_WDate);
							if(result[i].fi_Nm.includes('jpg') || result[i].fi_Nm.includes('png') || result[i].fi_Nm.includes('jpeg') || result[i].fi_Nm.includes('tiff')){
								//글이 24시가 넘었을 경우 블러 해제
								if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'></a></div>');
								}else{ // 글이 24시가 넘지 않았을 경우 블러처리
									//로그인한 회원이 글 작성자인경우 다 보여줌
									if(${user_Code}==result[i].res_UCode){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'></a></div>');
									}else if(${user_Code}==1){//관리자 보여줌
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'></a></div>');
									}else{//로그인한 회원이 글 작성자가 아닐 경우
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><img style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_img" src='+result[i].fi_Nm+'></a></div>');
									}
								}
							}else if(result[i].fi_Nm.includes('mp4') || result[i].fi_Nm.includes('avi')){
								if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
								}else{
									//로그인한 회원이 글 작성자인경우 다 보여줌
									if(${user_Code}==result[i].res_UCode){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
									}else if(${user_Code}==1){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
									}else{//로그인한 회원이 글 작성자가 아닐 경우
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><video style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
									}
								}
							}
						}
						
						if(result.length < 3){
							$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
							$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
						}
						*/
					}
					
			},
			error : function(){
				console.log("ajax 에러");
			}
		})

	});// function 종료
	
	//상세주소 리스트에서 특정 호수 클릭시 해당하는 호수의 결과파일들만 나오도록 하는 함수
	function clickDAddr(DAddr) {
		let searchbar1 = $('#var1').val();
		let searchbar2 = $('.searchbar2').val();
		let now = new Date();
		let data = {jibunAddr : searchbar1, roadAddr : searchbar2, DAddr : DAddr};
		$(".horizontal-scroll-wrapper").empty();
		$.ajax({
			type : "post",
			url : "/map/clickDAddr",
			data : data,
			success : function(result){
				//영상 뿌리기 시작
				var test = false;
				//json 객체중에 포인트를 사용했던 객체가 있나 테스트.
				for(let i=0; i<result.length; i++){
					if(result[i].po_UCode == ${user_Code}){
						test = true;
					}
				}
				
				console.log(test);
				//포인트를 사용한 객체가 없다면, fi_Nm의 중복 요소들 제거한 이후에 뿌려줌.
				if(test == false){
					let unique = result.filter(function(item1, idx1){
						return result.findIndex(function(item2, idx2){
							return item1.fi_Nm == item2.fi_Nm
						}) == idx1;
					}) ;
					
					//검색 주소에 해당하는 영상들 페이지에 뿌려주기
					for(let i=0; i<unique.length; i++){
						var res = new Date(unique[i].res_WDate);
						if(unique[i].fi_Nm.includes('jpg') || unique[i].fi_Nm.includes('png') || unique[i].fi_Nm.includes('jpeg') || unique[i].fi_Nm.includes('tiff') || unique[i].fi_Nm.includes('jfif')){
							//글이 24시가 넘었을 경우 블러 해제
							if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><img class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
							}else{ // 글이 24시가 넘지 않았을 경우 블러처리
								//로그인한 회원이 글 작성자인경우 다 보여줌
								if(${user_Code}==unique[i].res_UCode){
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><img class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
								}else if(${user_Code}==1){//관리자 보여줌
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><img class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
								}else{//로그인한 회원이 글 작성자가 아닐 경우
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><img style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
								}
							}
						}else if(unique[i].fi_Nm.includes('mp4') || unique[i].fi_Nm.includes('avi')){
							if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
								$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><video class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
							}else{
								//로그인한 회원이 글 작성자인경우 다 보여줌
								if(${user_Code}==unique[i].res_UCode){
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><video class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
								}else if(${user_Code}==1){
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><video class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
								}else{//로그인한 회원이 글 작성자가 아닐 경우
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><video style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
								}
							}
						}
					}
					
					if(unique.length < 3){
						$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
						$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
					}
					
				}else{//json객체 중에 포인트를 사용한 파일이 있다면
					var req_No = 0; //포인트 사용한 요청글 번호 구하기 위한 변수
					var fi_num = 0; //포인트 사용한 요청글의 파일들 갯수 구하기 위한 변수
					for(let i=0; i<result.length; i++){
						if(result[i].po_UCode == ${user_Code}){
							req_No = result[i].req_No;
							fi_num += 1;
						}
					}
					
					console.log(req_No);
					console.log(fi_num);
					for(let i=0; i<result.length; i++){
						//포인트 사용한 요청글과 관련없는 요청글들은 그냥 뿌려줌
						if(result[i].req_No != req_No){
							var res = new Date(result[i].res_WDate);
							if(result[i].fi_Nm.includes('jpg') || result[i].fi_Nm.includes('png') || result[i].fi_Nm.includes('jpeg') || result[i].fi_Nm.includes('tiff') || result[i].fi_Nm.includes('jfif')){
								//글이 24시가 넘었을 경우 블러 해제
								if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
								}else{ // 글이 24시가 넘지 않았을 경우 블러처리
									//로그인한 회원이 글 작성자인경우 다 보여줌
									if(${user_Code}==result[i].res_UCode){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
									}else if(${user_Code}==1){//관리자 보여줌
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
									}else{//로그인한 회원이 글 작성자가 아닐 경우
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><img style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_img" src='+result[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
									}
								}
							}else if(result[i].fi_Nm.includes('mp4') || result[i].fi_Nm.includes('avi')){
								if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
								}else{
									//로그인한 회원이 글 작성자인경우 다 보여줌
									if(${user_Code}==result[i].res_UCode){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
									}else if(${user_Code}==1){
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
									}else{//로그인한 회원이 글 작성자가 아닐 경우
										$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><video style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_video" controls ><source src='+result[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+result[i].res_WDate.substr(0,10)+'</div></a></div>');
									}
								}
							}
						}
					}
					
					//포인트 사용한 요청글과 관련한 글들이라면
					//블러 처리를 할 필요가 없고, 중복 가능하니까 중복처리 해서 뿌려줌
					//글 작성자는 포인트를 사용할 리가 없으니까 글 작성자 고려요소도 제거 가능
					//돈 낸거니까 시간도 고려안해도 됨.
					let unique = result.filter(function(item1, idx1){
						return result.findIndex(function(item2, idx2){
							return item1.fi_Nm == item2.fi_Nm
						}) == idx1;
					}) ;
					
					for(let i=0; i<unique.length; i++){
						if(unique[i].req_No == req_No){
							if(unique[i].fi_Nm.includes('jpg') || unique[i].fi_Nm.includes('png') || unique[i].fi_Nm.includes('jpeg') || unique[i].fi_Nm.includes('tiff') || unique[i].fi_Nm.includes('jfif')){
								$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><img class="detail_img" src='+unique[i].fi_Nm+'><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
							}else if(unique[i].fi_Nm.includes('mp4') || unique[i].fi_Nm.includes('avi')){
								$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+unique[i].req_No+'"><video class="detail_video" controls ><source src='+unique[i].fi_Nm+'></video><div id="img-detail">업로드 날짜: '+unique[i].res_WDate.substr(0,10)+'</div></a></div>');
							}
						}
					}
					
					if(unique.length < 3){
						$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
						$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
					}
						
				}
				
				/*
					//검색 주소에 해당하는 영상들 페이지에 뿌려주기
					for(let i=0; i<result.length; i++){
						var res = new Date(result[i].res_WDate)
						if(result[i].fi_Nm.includes('jpg') || result[i].fi_Nm.includes('png') || result[i].fi_Nm.includes('jpeg') || result[i].fi_Nm.includes('tiff')){
							//글이 24시가 넘었을 경우 블러 해제
							if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
								$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'></a></div>');
							}else{ // 글이 24시가 넘지 않았을 경우 블러처리
								//로그인한 회원이 글 작성자인경우 다 보여줌
								if(${user_Code}==result[i].res_UCode){
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'></a></div>');
								}else if(${user_Code}==1){//관리자 보여줌
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><img class="detail_img" src='+result[i].fi_Nm+'></a></div>');
								}else{//로그인한 회원이 글 작성자가 아닐 경우
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><img style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_img" src='+result[i].fi_Nm+'></a></div>');
								}
							}
						}else if(result[i].fi_Nm.includes('mp4') || result[i].fi_Nm.includes('avi')){
							if((now.getTime()-res.getTime())/(1000*60*60*24) >= 1){
								$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
							}else if(${user_Code}==1){
								$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
							}else{
								//로그인한 회원이 글 작성자인경우 다 보여줌
								if(${user_Code}==result[i].res_UCode){
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
								}else{//로그인한 회원이 글 작성자가 아닐 경우
									$(".horizontal-scroll-wrapper").append('<div><a href="/board/detail?req_No='+result[i].req_No+'"><div class="modal"><div class="modal_body">1000 P</div></div><video style="filter:blur(7px); -webkit-filter:blur(7px)" class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
								}
							}
						}
					}
					
					if(result.length < 3){
						$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
						$(".horizontal-scroll-wrapper").append('<div>추가 정보가 없습니다.</div>');
					}
					*/
				},
			error : function(){
				console.log("ajax 에러");
			}
		})
	};
	
	//블러 처리 남은 시간 구하는 함수
	function remaindTime() {
	    var now = new Date(); //현재시간을 구한다. 
	    var et = $('#wdate').text(); //파일이 업로드 된 시간.

	    var nt = now.getTime(); // 현재의 시간만 가져온다
	  
	     sec = 24*60*60*1000 - parseInt(nt-et)/1000;
	     day  = parseInt(sec/60/60/24);
	     sec = (sec - (day * 60 * 60 * 24));
	     hour = parseInt(sec/60/60);
	     sec = (sec - (hour*60*60));
	     min = parseInt(sec/60);
	     sec = parseInt(sec-(min*60));
	     if(hour<10){hour="0"+hour;}
	     if(min<10){min="0"+min;}
	     if(sec<10){sec="0"+sec;}
	      $('.modal_body').html("<div style='font-size:15pt'>1000P</div>블러 해제: "+hour+"시"+min+"분"+sec+"초");
	};
	
	setInterval(remaindTime,1000);
	
	
	</script>
</body>

</html>

