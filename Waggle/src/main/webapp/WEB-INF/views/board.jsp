<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>꿀단지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/guideline.css">
<style type="text/css">

.board {
  	width: 800px;
  	margin-left: auto;
  	margin-right: auto;
  	position: relative;
}

#js-pagination li{
	list-style: none; display:inline; margin-left: 5px;
}

#js-pagination li a{
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	border-radius: 0.9em;
	transition: all ease-in-out 0.2s;
}

#js-pagination li a:hover {
  background-color: black;
  color: white;
}

.active {
  background-color: #FFFF99;
  color: black;
}

.req-btn {
	background: white;
	font-family: inherit;
	padding: 0.6em 1.3em;
	font-weight: 500;
	font-size: 14px;
	border: 3px solid black;
	border-radius: 0.4em;
	box-shadow: 0.1em 0.1em;
	font-style: italic;
}

.req-btn:hover {
	transform: translate(-0.05em, -0.05em);
	box-shadow: 0.15em 0.15em;
}

.req-btn:active {
	transform: translate(0.05em, 0.05em);
	box-shadow: 0.05em 0.05em;
}

</style>

</head>
<body>
	<%@ include file="header.jsp"%>
	
   	<div class="guideline">
   		<ul class="guideline-all">
			<li>
				<a href="javascript:void(0)">
					<i class="fa-solid fa-house"></i>
				</a>
				<p>HOME > 꿀단지</p>
			</li>
   		</ul>
   	</div>
   	
	<div class="middle">	
		<div class="board">
			<button class="req-btn" onclick="location.href='/board/requestform'">요청하기</button>
			<div id="data-contents"></div>
        	<div id="js-pagination"></div>
		</div>
		
    </div>
	<%@ include file="footer.jsp" %>
</body>

<script type="text/javascript">

	var list = ${List}
	var current_page = ${Current_page}
	var _totalCount = list.length

	function renderPagination(currentPage) {
		// 페이지에 들어갈 게시글 갯수와 한번에 볼수 있는 페이지 그룹 수
		var content_num = 2;
		var group_num = 3;
		
		var totalPage = Math.ceil(_totalCount / content_num);
		var pageGroup = Math.ceil(currentPage / group_num);
		
		var last = pageGroup * group_num;
		if (last > totalPage) last = totalPage;
		var first = last - (group_num - 1) <= 0 ? 1 : last - (group_num - 1);
		var next = last + 1;
		var prev = first - 1;
		
		// 현재 게시물의 전체 개수가 content_num개 이하면 pagination을 숨김
		if (_totalCount <= content_num) return; 

		const fragmentPage = document.createDocumentFragment();
		if (prev > 0) {
			var allpreli = document.createElement('li');
			allpreli.insertAdjacentHTML("beforeend", `<a href='#js-bottom' id='allprev'><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>`);
			
			var preli = document.createElement('li');
			preli.insertAdjacentHTML("beforeend", `<a href='#js-bottom' id='prev'><i class="fa fa-angle-left" aria-hidden="true"></i></a>`);
			
			fragmentPage.appendChild(allpreli);
			fragmentPage.appendChild(preli);
		}

		for (var i = first; i <= last; i++) {
			const li = document.createElement("li");
			li.insertAdjacentHTML("beforeend", "<a href='#js-bottom' id='page-"+i+"' data-num='"+i+"'>"+i+"</a>");
			fragmentPage.appendChild(li);
		}

		if (last < totalPage) {
			var allendli = document.createElement('li');
			allendli.insertAdjacentHTML("beforeend", `<a href='#js-bottom'  id='allnext'><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>`);
			
			var endli = document.createElement('li');
			endli.insertAdjacentHTML("beforeend", `<a  href='#js-bottom'  id='next'><i class="fa fa-angle-right" aria-hidden="true"></i></a>`);
			
			fragmentPage.appendChild(endli);
			fragmentPage.appendChild(allendli);
		}

		document.getElementById('js-pagination').appendChild(fragmentPage);
		
		$(`#js-pagination li a`).removeClass("active");
		$(`#js-pagination li a#page-${Current_page}`).addClass("active");
		
		$(function() {
			$("#js-pagination a").click(function (e) {
				e.preventDefault();
				var $item = $(this);
				var $id = $item.attr("id");
				var selectedPage = $item.text();
		
				if ($id == "next") selectedPage = next;
				if ($id == "prev") selectedPage = prev;
				if ($id == "allprev") selectedPage = 1;
				if ($id == "allnext") selectedPage = totalPage;
				
				location.href="/board/list?num="+selectedPage;
			});
		});
		
		$(function(){
			
			var start_page = (currentPage-1)*content_num;
			var end_page = currentPage*content_num-1;
			if (_totalCount-1 < end_page) {
				end_page = _totalCount-1;
			}
			
			var data_contents = document.getElementById('data-contents');

			for(i=start_page; i<=end_page; i++) {
				var dto = list[i]
				var tmp_node = document.createElement('div');
				tmp_node.insertAdjacentHTML("beforeend", `
						<div class="desc-content-finishlist" style="margin: 0 auto; width: 900px; height: 300px;">
						<div class="finish-top" style="float: right; width: 900px">
							<div style="float: right">예상거리: ??km</div>
						</div>
						<div class="finish-mid" style="width: 900px">
							<div class="finish-mid-left" onclick="location.href='/board/detail?req_No=`+dto.req_No+`'" style="display: inline-block; width: 200px; height: 200px; float: left; border:3px solid #80808075; border-radius: 10px">
								<div class="room-img">
									<img src="`+dto.fi_Nm+`" alt="🐝Waggle" height="200px" width="200px" style="border-radius: 10px;" />
								</div>
							</div>
							<div class="finish-mid-right"  onclick="location.href='/board/detail?req_No=`+dto.req_No+`'"  style="position: relative; display: inline-block; width: 670px; height: 200px; float: right; border:3px solid #80808075; border-radius: 10px">
								<div class="req-desc"
									style="display: inline-block; float: left; height: 200px">
									<p style="margin: 5px 10px; font-size: 16pt">기한 : `+dto.req_EDate+`</p>
									<p style="margin: 125px 10px; font-size: 16pt">`+dto.home_Addr+`</p>
								</div>
								<div class="req-title" style="position: absolute; left:250px; ">
									<p style="line-height: 150px; width: 300px; font-size: 20pt; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">`+dto.req_Title+`</p>
								</div>
								<div class="req-point"
									style="display: inline-block; float: right; height: 200px">
									<p style="font-size: 20pt; line-height: 200px; margin: 0 18px">`+dto.req_Point+`P</p>
								</div>
							</div>
						</div>
						<div class="finish-bot" style="width: 900px;">
							<div style="float: left; width: 80px; margin-top: 10px; margin-left: 55px; border-radius: 30px; border: 2px solid #092C4C; text-align: center;">
								<p style="margin: 5px">`+dto.req_Stat+`</p>
							</div>
						</div>
					</div>
						`);
				data_contents.appendChild(tmp_node);
			}
			
		});
	}
	
	
	renderPagination(current_page);

	
</script>

</html>