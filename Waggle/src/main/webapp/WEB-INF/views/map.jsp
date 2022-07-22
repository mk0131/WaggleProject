<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAP</title>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet" />
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function kakaopost(){

    new daum.Postcode({
        	oncomplete: function(data) {
        		var a = data.address;
        		var p = data.zonecode;
        		document.querySelector("#var1").value = p.toString();
        		document.querySelector(".searchbar").value = a;
        		document.getElementById('submit').click();
   				searchLngLat();
        	}
    	}).open();
    
	};
	
	

</script>
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
}

.searchbar {
	font-size: 1rem;
	width: 60rem;
	height: 1rem;
	border: 1px solid #d4d7e1;
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
	background: #c7c7c7;
	transform: rotate(90deg) translateX(200px);
	transform-origin: right top;
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

.detail_img, .detail_video{
	width: 100%;
	height: 100%;
	object-fit: fill;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<div class="middle">
        <div class="guideline">
         	<ul class="guideline-all">
            	  <li><a href="javascript:void(0)">
             	 <i class="fa-solid fa-house"></i>
              	</a>
              	</li>
             	 <p>HOME > 지도</p>
           </ul>
     	</div>
			
		<div class="container" >
			<input type="text" maxlength="12" placeholder="주소 검색하기"
				class="searchbar" onclick="kakaopost()"> 
				<img
				src="https://images-na.ssl-images-amazon.com/images/I/41gYkruZM2L.png"
				alt="Magnifying Glass" class="button" onclick="kakaopost()">
		</div>
		
		<form id="addr_filter" method="post">
		<input type="button" style="display:none" id="submit">
		<input id="var1" type="hidden" name="search_post" value="" >
		</form>
		
		<div class="blank">
		</div>
		
		<div class="table-container">
			<div class="detail-container" data-behaviour="search-on-list">
				<input type="text" class="input-query" data-search-on-list="search"
					placeholder="상세주소를 입력하세요." /> <span class="counter"
					data-search-on-list="counter"></span>
				<div class="list-wrap">
					<ul class="list" data-search-on-list="list">
					</ul>
				</div>
			</div>
			
			<div class="horizontal-scroll-wrapper squares">
			<!-- 
			<c:forEach var="media" items="${list}">
				<div>
				<c:set var="type" value="${media.getFi_Nm()}" />
				<c:if test="${fn:contains(type,'jpg')}">
				<a href=""><img class="detail_img" alt="${media.getFi_Nm()}" src="${media.getFi_Nm()}"></a>
				</c:if>
				<c:if test="${fn:contains(type,'mp4')}">
				<a href=""><video class="detail_video" controls ><source src="${media.getFi_Nm()}">비디오</video></a>
				</c:if>
				</div>
			</c:forEach>
			-->
			</div>
			
			<div class="blank">
			</div>
			
		</div>
		
		
		<div id="map">
			
		</div>
		
	</div>

	<%@ include file="footer.jsp"%>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=df487b49cd90a64d7305e577e300f2e4&libraries=services,clusterer,drawing"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.5012767241426, 127.039600248343), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	for(let i=0; i<4; i++){
		
	}
	// 모든 회원들 지도에 뿌려주기
	$(function(){
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var userAddr = new Array();
		var userimg = new Array();
		var userCode = new Array();
		<c:forEach var="list" items="${uaddr}">
		userAddr.push("${list.getUa_Addr()}");
		userimg.push("${list.getFi_Nm()}");
		userCode.push("${list.getUser_Code()}");
		</c:forEach>
	
		for(var i=0; i<=3; i++) {
			window['imageSrc'+i] = "hello" +i;
			console.log(window['imageSrc'+i]);
		}
		
		for(let i=0; i<userAddr.length; i++){
			
			if(userimg[i] != ""){
				window['imageSrc'+i] = userimg[i]; // 마커이미지의 주소입니다    
			}else {
				window['imageSrc'+i] = '/images/profile/profile_default.jpg';
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
			        map.setCenter(coords);
			        
					//마커 클릭시 해당 꿀벌의 마이페이지로 이동하도록
				    kakao.maps.event.addListener(marker, 'click', function(){
				    	window.open("/mypage/other?ucode="+userCode[i],"a",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
				    });
			    } else {
			    	console.log("에러");
			    }
			});  
		    
		 
		}
		
		  
		
	});
		
	

	function searchLngLat(){
		var gap = document.querySelector(".searchbar").value;

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
		    } else {
		    	console.log("에러");
		    }
		});    
	}
	
 	
	//주소창에 검색시 상세주소와 해당 영상들 나오게 하기
	$('#submit').on("click", function(){ // #submit버튼은 kakaopost() 함수에서 click되도록 구성
		let search_post = $('#var1').val();
		let data = {search_post : search_post}
		
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
						
						let unique_DAddr = Array.from(new Set(DAddr));
						//중복제거한 상세주소 페이지에 뿌리기
						for(let i=0; i<unique_DAddr.length; i++){
							$(".list").append('<li class="list-item" data-search-on-list="list-item"><a href="" class="list-item-link">'+unique_DAddr[i]+'<span class="item-list-subtext">우편번호: '+result[i].home_Post+'</span></a></li>');
						}
					
						//검색 주소에 해당하는 영상들 페이지에 뿌려주기
						for(let i=0; i<result.length; i++){
							if(result[i].fi_Nm.includes('jpg')){
								$(".horizontal-scroll-wrapper").append('<div><a href=""><img class="detail_img" src='+result[i].fi_Nm+'></a></div>');
							}else if(result[i].fi_Nm.includes('mp4')){
								$(".horizontal-scroll-wrapper").append('<div><a href=""><video class="detail_video" controls ><source src='+result[i].fi_Nm+'></video></a></div>');
							}
						}
					}
					
			},
			error : function(){
				console.log("ajax 에러");
			}
		})

	});// function 종료
	</script>
</body>
<script>
	(function() {
		// TODO: be more elegant here
		function format(text) {
			return text.replace(/ /g, '').replace(/(<([^>]+)>)/ig, '')
					.toLowerCase();
		}

		var SearchOnList = {
			$LIST : '[data-search-on-list=list]',
			$SEARCH : '[data-search-on-list=search]',
			$LIST_ITEM : '[data-search-on-list=list-item]',
			$COUNTER : '[data-search-on-list=counter]',
			TEMPLATE_EMTPY : '<li class="list-item list-item--disable">No results found</li>',

			init : function($element) {
				this.items = [];
				this.itemsMatched = [];

				this.$element = $element;
				this.$list = this.$element.find(this.$LIST);
				this.$search = this.$element.find(this.$SEARCH);
				this.$counter = this.$element.find(this.$COUNTER);

				this.items = this._getAllItems();
				this.itemsMatched = this.items;

				this._updateCounter();
				this._handleResults();
				this._setEventListeners();
			},

			_setEventListeners : function() {
				this.$search.on('keyup', $.proxy(this._onKeyup, this)).on(
						'query:changed',
						$.proxy(this._handleQueryChanged, this)).on(
						'query:results:some',
						$.proxy(this._handleResults, this)).on(
						'query:results:none',
						$.proxy(this._handleNoResults, this))
			},

			_onKeyup : function() {
				var query = this.$search.val(), previousQuery = this.$search
						.data('previousQuery', query);

				// TODO: Decide when query actually changed
				if (this._queryChanged()) {
					this.$search.trigger('query:changed', {
						query : query,
						previousQuery : previousQuery
					});
				}
			},

			_queryChanged : function() {
				var query = this.$search.val();
				if ($.trim(query).length === 0
						&& this.$search.data('previousQuery') === undefined) {
					return false;
				}
				return true;
			},

			_handleQueryChanged : function(e, data) {
				this.itemsMatched = this.items.map(function(item) {
					if (format(item.name).match(format(data.query))) {
						return {
							name : item.name,
							visible : true
						}
					}
					return {
						name : item.name,
						visible : false
					}
				});

				this._render();
				this._updateCounter();
			},

			_handleNoResults : function() {
				this.$list.html(this.TEMPLATE_EMTPY);
			},

			_handleResults : function() {
				this.$list.empty().append(this._renderItemsVisible())
			},

			_someItemsVisible : function() {
				return this.itemsMatched.some(function(item) {
					return item.visible;
				});
			},

			_render : function() {
				(this._someItemsVisible()) ? this.$search
						.trigger('query:results:some') : this.$search
						.trigger('query:results:none');
			},

			_updateCounter : function() {
				(this._someItemsVisible()) ? this.$counter.text(this
						._renderItemsVisible().length) : this.$counter.text('');
			},

			_getAllItems : function() {
				var $items = this.$list.find(this.$LIST_ITEM);

				return $items.map(function() {
					var $item = $(this);

					return {
						name : $item.html(),
						visible : true
					};
				}).toArray();
			},

			_renderItemsVisible : function() {
				var itemInTemplate;
				return this.itemsMatched
						.sort(function(a, b) {
							if (a.name < b.name)
								return -1
							if (a.name > b.name)
								return 1;
							return 0;
						})
						.reduce(
								function(items, item) {
									itemInTemplate = '<li class="list-item" data-search-on-list="list-item">'
											+ item.name + '</li>';
									if (item.visible) {
										items.push(itemInTemplate);
									}
									return items;
								}, []);
			}
		};

		window.SearchOnList = SearchOnList;
	})();

	SearchOnList.init($('[data-behaviour=search-on-list]'));
</script>


</html>

