<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAP</title>
<link href="https://fonts.googleapis.com/css?family=Inter&display=swap"
	rel="stylesheet" />
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function searchTable(){
	$('.table-container').show();
	
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
	width: 1000px;
}
.home-img, .guide-text {
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
	padding: 5px;
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

.map {
	margin: 0 auto;
	width: 994.2px;
	height: 500px;
	background-color: #cbcbcb;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<div class="middle">
		<div class="guideline">
			<div class="home-img">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
					xmlns="http://www.w3.org/2000/svg">
				<path d="M10 20V14H14V20H19V12H22L12 3L2 12H5V20H10Z" fill="black" />
				</svg>
			</div>
			<div class="guide-text">
				<p>HOME > 지도</p>
			</div>
		</div>
		
		<div class="container" >
			<input type="text" maxlength="12" placeholder="주소 검색하기"
				class="searchbar"> <img
				src="https://images-na.ssl-images-amazon.com/images/I/41gYkruZM2L.png"
				alt="Magnifying Glass" class="button" onclick="searchTable()">
		</div>
		
		<div class="blank">
		</div>
		
		<div class="table-container">
			<div class="detail-container" data-behaviour="search-on-list">
				<input type="text" class="input-query" data-search-on-list="search"
					placeholder="상세주소를 입력하세요." /> <span class="counter"
					data-search-on-list="counter"></span>
				<div class="list-wrap">
					<ul class="list" data-search-on-list="list">
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Ali <span
								class="item-list-subtext">Smith</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Alia <span
								class="item-list-subtext">Johnson</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Amira<span
								class="item-list-subtext">Johnson</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Omar<span
								class="item-list-subtext">Davis</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Emily<span
								class="item-list-subtext">García</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">John<span
								class="item-list-subtext">Robinson</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Emily<span
								class="item-list-subtext">Clark</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Aurora<span
								class="item-list-subtext">Lewis</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Adeline<span
								class="item-list-subtext">Robinson</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">John<span
								class="item-list-subtext">García</span></a></li>
						<li class="list-item" data-search-on-list="list-item"><a
							href="" class="list-item-link">Isla<span
								class="item-list-subtext">Lewis</span></a></li>
					</ul>
				</div>
			</div>
			
			<div class="horizontal-scroll-wrapper squares">
				<div>item 1</div>
				<div>item 2</div>
				<div>item 3</div>
				<div>item 4</div>
				<div>item 5</div>
				<div>item 6</div>
				<div>item 7</div>
				<div>item 8</div>
			</div>
			
			<div class="blank">
			</div>
			
		</div>
		
		
		<div class="map">
			
		</div>
	</div>

	<%@ include file="footer.jsp"%>
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

