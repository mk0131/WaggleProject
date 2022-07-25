<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

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

#ongoing-detail {
	text-align: center;
}


.ongoing21-content {
	display:flex;
  	align-items: center;
  	justify-content: center;
    padding: 5px;
    border-spacing: 30px;
    font-size: 14px;
}

.ongoing21-content2 {
    display: inline-table;
    border-spacing: 10px;
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

#revcontent {
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

#choice-name {
	text-align: center;
}

#choice-option {
	text-align: center;
}

#choice-option-all {
	display: flex;
}

#choice-option-all div {
	width: 200px;
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

.my-hr {
	width: 700px;
	height: 1px;
	background: #ccc;
	color: #eee;
	border: 0 none;
}


div#detail_container {
	display:inline-flex;
  	align-items: center;
  	justify-content: center;
    padding: 5px;
    border-spacing: 30px;
    font-size: 14px;
    width: 800px;
    margin-top: 20px;
    
}

div#file_container {
	float: left;
	width: 400px;
}

div#review_containser{
	width: 400px;
	float: right;
}

#revcontent {
	margin-top: 10px;
 	font-size:15px;
	line-height: 150%;
	padding: 10px;
}


/* 파일 업로드 */

.upload-area {
  width: 70%;
  max-width: 25rem;
  background-color: var(--clr-white);
  box-shadow: 0 0 15px #898989;
  border: 2px solid #898989;
  border-radius: 24px;
  padding: 2rem 1.875rem 5rem 1.875rem;
  margin: 0 auto;
  text-align: center;
}

.upload-area--open { /* Slid Down Animation */
  animation: slidDown 500ms ease-in-out;
}

@keyframes slidDown {
  from {
    height: 28.125rem; /* 450px */
  }

  to {
    height: 35rem; /* 560px */
  }
}

/* Header */

.upload-area__title {
  font-size: 1.8rem;
  font-weight: 500;
  margin-bottom: 0.3125rem;
}

.upload-area__paragraph {
  font-size: 0.9375rem;
  color: var(--clr-light-gray);
  margin-top: 0;
}

.upload-area__tooltip {
  position: relative;
  color: var(--clr-light-blue);
  cursor: pointer;
  transition: color 300ms ease-in-out;
}

.upload-area__tooltip:hover {
  color: var(--clr-blue);
}

.upload-area__tooltip-data {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -125%);
  min-width: max-content;
  background-color: var(--clr-white);
  color: var(--clr-blue);
  border: 1px solid var(--clr-light-blue);
  padding: 0.625rem 1.25rem;
  font-weight: 500;
  opacity: 0;
  visibility: hidden;
  transition: none 300ms ease-in-out;
  transition-property: opacity, visibility;
}

.upload-area__tooltip:hover .upload-area__tooltip-data {
  opacity: 1;
  visibility: visible;
}

/* Drop Zoon */
.upload-area__drop-zoon {
  position: relative;
  height: 11.25rem; /* 180px */
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  border: 2px dashed #898989;
  border-radius: 15px;
  margin-top: 2.1875rem;
  cursor: pointer;
  transition: border-color 300ms ease-in-out;
}

.upload-area__drop-zoon:hover {
  border-color: #000000;
}

.drop-zoon__icon {
  display: flex;
  font-size: 3.75rem;
  color: var(--clr-blue);
  transition: opacity 300ms ease-in-out;
}

.drop-zoon__paragraph {
  font-size: 0.9375rem;
  color: var(--clr-light-gray);
  margin: 0;
  margin-top: 0.625rem;
  transition: opacity 300ms ease-in-out;
}

.drop-zoon:hover .drop-zoon__icon,
.drop-zoon:hover .drop-zoon__paragraph {
  opacity: 0.7;
}

.drop-zoon__loading-text {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: none;
  color: #000000;
  z-index: 10;
}

.drop-zoon__preview-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: contain;
  border-radius: 10px;
  display: none;
  z-index: 1000;
  transition: opacity 300ms ease-in-out;
}

.drop-zoon:hover .drop-zoon__preview-image {
  opacity: 0.8;
}

.drop-zoon__file-input {
  display: none;
}

/* (drop-zoon--over) Modifier Class */
.drop-zoon--over {
  border-color: #000000;
}

.drop-zoon--over .drop-zoon__icon,
.drop-zoon--over .drop-zoon__paragraph {
  opacity: 0.7;
}

/* (drop-zoon--over) Modifier Class */
.drop-zoon--Uploaded {
  
}

.drop-zoon--Uploaded .drop-zoon__icon,
.drop-zoon--Uploaded .drop-zoon__paragraph {
  display: none;
}

/* File Details Area */
.upload-area__file-details {
  height: 0;
  visibility: hidden;
  opacity: 0;
  text-align: left;
  transition: none 500ms ease-in-out;
  transition-property: opacity, visibility;
  transition-delay: 500ms;
}

/* (duploaded-file--open) Modifier Class */
.file-details--open {
  height: auto;
  visibility: visible;
  opacity: 1;
}

.file-details__title {
  font-size: 1.125rem;
  font-weight: 500;
  color: var(--clr-light-gray);
}

/* Uploaded File */
.uploaded-file {
  display: flex;
  align-items: center;
  padding: 0.625rem 0;
  visibility: hidden;
  opacity: 0;
  transition: none 500ms ease-in-out;
  transition-property: visibility, opacity;
}

/* (duploaded-file--open) Modifier Class */
.uploaded-file--open {
  visibility: visible;
  opacity: 1;
}

.uploaded-file__icon-container {
  position: relative;
  margin-right: 0.3125rem;
}

.uploaded-file__icon {
  font-size: 3.4375rem;
  color: var(--clr-blue);
}

.uploaded-file__icon-text {
  position: absolute;
  top: 1.5625rem;
  left: 50%;
  transform: translateX(-50%);
  font-size: 0.9375rem;
  font-weight: 500;
  color: var(--clr-white);
}

.uploaded-file__info {
  position: relative;
  top: -0.3125rem;
  width: 100%;
  display: flex;
  justify-content: space-between;
}

.uploaded-file__info::before,
.uploaded-file__info::after {
  content: '';
  position: absolute;
  bottom: -0.9375rem;
  width: 0;
  height: 0.5rem;
  background-color: #ffffff;
  border-radius: 0.625rem;
}

.uploaded-file__info::before {
  width: 100%;
}

.uploaded-file__info::after {
  width: 100%;
  background-color: #ffb202;
}

/* Progress Animation */
.uploaded-file__info--active::after {
  animation: progressMove 800ms ease-in-out;
  animation-delay: 300ms;
}

@keyframes progressMove {
  from {
    width: 0%;
    background-color: transparent;
  }

  to {
    width: 100%;
    background-color: #ffb202;
  }
}

.uploaded-file__name {
  width: 100%;
  max-width: 6.25rem; /* 100px */
  display: inline-block;
  font-size: 1rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.uploaded-file__counter {
  font-size: 1rem;
  color: var(--clr-light-gray);
}

/* 별 */
.rating-group {
  display: inline-flex;
}

/* make hover effect work properly in IE */
.rating__icon {
  pointer-events: none;
}

/* hide radio inputs */
.rating__input {
 position: absolute !important;
 left: -9999px !important;
}

/* hide 'none' input from screenreaders */
.rating__input--none {
  display: none
}

/* set icon padding and size */
.rating__label {
  cursor: pointer;
  padding: 0 0.1em;
  font-size: 2rem;
}

/* set default star color */
.rating__icon--star {
  color: orange;
}

/* if any input is checked, make its following siblings grey */
.rating__input:checked ~ .rating__label .rating__icon--star {
  color: #ddd;
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
        		<p>HOME > 요청 완료 페이지</p>
        		</li>	
        	</ul>
		</div>
	  </div>
	  
	   <div class="ongoing21-all">
	    <h3 id="ongoing-detail">${userName}님이 요청한 리스트 상세</h3>
	     <p id="w-date">요청날짜 : ${req_dto.req_WDate }</p>
	    <div class="ongoing21-all">
	   <input type="hidden" name="req_dto.req_No" value="${req_dto.req_No }">
	    <table class="ongoing21-content">
	     <tbody>
	      <tr>
	       <th>제목</th>
	       <td>${req_dto.req_Title }</td>
	      </tr>
	      <tr>
	       <th>방문기한</th>
	       <td id="yellow">${req_dto.req_EDate }</td>
	      </tr>
	      <tr>
	       <th>주소</th>
	       <td id="yellow">${req_dto.home_Addr }</td>
	      </tr>
	      <tr>
	       <th>상세주소</th>
	       <td>${req_dto.home_DAddr }</td>
	      </tr>
	      <tr>
	       <th colspan="2">디테일 요구사항</th>
	      </tr>
	      </tbody>
	     </table>
	     <div class="ongoing21-content-bottom">
	       <textarea id="incontent" rows="12" cols="70" name="content" placeholder="요구사항을 입력해주세요" readonly="readonly">${req_dto.req_Detail }</textarea>
	       <br/><br/><hr class="my-hr">
	       		      
		   <br>
		   
		   <h4>기본 선택사항</h4>
		   <table class="ongoing21-content2">
	       <tbody>
	        <tr id="choice-name">
	       	 <th>
	       	 	일조량
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	  <div id="choice-option-all">
				<div>
					<input type="radio" id="res_Attr1_1" name="res_Attr1">
					<label for="res_Attr1_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr1_2" name="res_Attr1">
					<label for="res_Attr1_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr1_3" name="res_Attr1">
					<label for="res_Attr1_3">별로에요</label>
				</div>
			   </div>
	       	 <td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	수압
	       	 </th>
	       	</tr>
	        <tr id="choice-option">
	       	 <td>
	       	  <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr2_1" name="res_Attr2">
					<label for="res_Attr2_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr2_2" name="res_Attr2">
					<label for="res_Attr2_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr2_3" name="res_Attr2">
					<label for="res_Attr2_3">별로에요</label>
				</div>
			   </div>
	       	 <td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	외부소음
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	   <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr3_1" name="res_Attr3">
					<label for="res_Attr3_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr3_2" name="res_Attr3">
					<label for="res_Attr3_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr3_3" name="res_Attr3">
					<label for="res_Attr3_3">별로에요</label>
				</div>
			   </div>
	       	 <td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	냄새
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	   <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr4_1" name="res_Attr4">
					<label for="res_Attr4_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr4_2" name="res_Attr4">
					<label for="res_Attr4_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr4_3" name="res_Attr4">
					<label for="res_Attr4_3">별로에요</label>
				</div>
			  </div>
	       	 <td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	곰팡이
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	  <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr5_1" name="res_Attr5">
					<label for="res_Attr5_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr5_2" name="res_Attr5">
					<label for="res_Attr5_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr5_3" name="res_Attr5">
					<label for="res_Attr5_3">별로에요</label>
				</div>
			  </div>
	       	 <td>
	       	</tr>
	       	<tr id="choice-name">
	       	 <th>
	       	 	벌레
	       	 </th>
	       	</tr>
	       	<tr id="choice-option">
	       	 <td>
	       	  <div id="choice-option-all">
	       	  	<div>
					<input type="radio" id="res_Attr6_1" name="res_Attr6">
					<label for="res_Attr6_1">좋아요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr6_2" name="res_Attr6">
					<label for="res_Attr6_2">보통이에요</label>
				</div>
				<div>
					<input type="radio" id="res_Attr6_3" name="res_Attr6">
					<label for="res_Attr6_3">별로에요</label>
				</div>
			  </div>
	       	 <td>
	       	</tr>
	       	</tbody>
	       </table>
	       
	       <br/>
		   <br/><br/><hr class="my-hr">
		   
		   <br><h4>디테일 요청사항</h4>
		   <div id="detail_container">
		    <div id="file_container">
		   <!-- Upload Area -->
			<div id="uploadArea" class="upload-area"">
			  <div class="upload-area__header">
			    <h1 class="upload-area__title">Upload your file</h1>
			    <p class="upload-area__paragraph">
			      File should be an image
			      <strong class="upload-area__tooltip">
			        Like
			        <span class="upload-area__tooltip-data"></span> <!-- Data Will be Comes From Js -->
			      </strong>
			    </p>
			  </div>
			  <!-- Drop Zoon -->
			  <div id="dropZoon" class="upload-area__drop-zoon drop-zoon">
			    <span class="drop-zoon__icon">
			      <i class='bx bxs-file-image'></i>
			    </span>
			    <p class="drop-zoon__paragraph">Drop your file here or Click to browse</p>
			    <span id="loadingText" class="drop-zoon__loading-text">Please Wait</span>
			    <img src="" alt="Preview Image" id="previewImage" class="drop-zoon__preview-image" draggable="false">
			    <input type="file" id="fileInput" class="drop-zoon__file-input" accept="image/*, video/*" multiple="multiple">
			  </div>
			  <!-- End Drop Zoon -->
			
			  <!-- File Details -->
			  <div id="fileDetails" class="upload-area__file-details file-details">
			    <h3 class="file-details__title">Uploaded File</h3>
			
			    <div id="uploadedFile" class="uploaded-file">
			      <div class="uploaded-file__icon-container">
			        <i class='bx bxs-file-blank uploaded-file__icon'></i>
			        <span class="uploaded-file__icon-text"></span> <!-- Data Will be Comes From Js -->
			      </div>
			
			      <div id="uploadedFileInfo" class="uploaded-file__info">
			        <span class="uploaded-file__name">Project 1</span>
			        <span class="uploaded-file__counter">0%</span>
			      </div>
			    </div>
			  </div>
			  <!-- End File Details -->
			</div>
			<!-- End Upload Area -->
		    </div>
		    <div id="review_containser">
		     <span style="font-size: 12pt;">간단한 집 평가</span>
		     <textarea id="revcontent" rows="18" cols="40"  placeholder="디테일 리뷰가 없습니다."></textarea>
		    </div>
		   </div>
		    <br/><br/>
		    <br/><br/><hr class="my-hr">
		   
		    <br><h4>집이 어땠나요?</h4>
			<div id="full-stars-example-two">
			    <div class="rating-group">
			        <input disabled checked class="rating__input rating__input--none" name="rating3" id="rating3-none" value="0" type="radio">
			        <label aria-label="1 star" class="rating__label" for="rating3-1"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-1" value="1" type="radio">
			        <label aria-label="2 stars" class="rating__label" for="rating3-2"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-2" value="2" type="radio">
			        <label aria-label="3 stars" class="rating__label" for="rating3-3"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-3" value="3" type="radio">
			        <label aria-label="4 stars" class="rating__label" for="rating3-4"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-4" value="4" type="radio">
			        <label aria-label="5 stars" class="rating__label" for="rating3-5"><i class="rating__icon rating__icon--star fa fa-star"></i></label>
			        <input class="rating__input" name="rating3" id="rating3-5" value="5" type="radio">
			    </div>
			</div>
		   <br/><br/>
		   <br/><br/>
		     <div class="btn2" id="btn2">
			   <button type="button" value="완료하기" onclick="location.href='">완료하기</button>
		      <button type="button" value="취소" onclick="location.href='/board/list'">취소</button>
		     </div>
	     </div>
	    </div>
	   </div>
	   
	   
	 </div>
	<%@ include file="../footer.jsp" %>

</body>
<script type="text/javascript">

		// 파일 업로드 구현 시작
		// Select Upload-Area
		const uploadArea = document.querySelector('#uploadArea')
		
		// Select Drop-Zoon Area
		const dropZoon = document.querySelector('#dropZoon');
		
		// Loading Text
		const loadingText = document.querySelector('#loadingText');
		
		// Slect File Input 
		const fileInput = document.querySelector('#fileInput');
		
		// Select Preview Image
		const previewImage = document.querySelector('#previewImage');
		
		// File-Details Area
		const fileDetails = document.querySelector('#fileDetails');
		
		// Uploaded File
		const uploadedFile = document.querySelector('#uploadedFile');
		
		// Uploaded File Info
		const uploadedFileInfo = document.querySelector('#uploadedFileInfo');
		
		// Uploaded File  Name
		const uploadedFileName = document.querySelector('.uploaded-file__name');
		
		// Uploaded File Icon
		const uploadedFileIconText = document.querySelector('.uploaded-file__icon-text');
		
		// Uploaded File Counter
		const uploadedFileCounter = document.querySelector('.uploaded-file__counter');
		
		// ToolTip Data
		const toolTipData = document.querySelector('.upload-area__tooltip-data');
		
		// Images Types
		const imagesTypes = [
		  "jpeg",
		  "png",
		  "svg",
		  "gif"
		];
		
		// Append Images Types Array Inisde Tooltip Data
		toolTipData.innerHTML = [...imagesTypes].join(', .');
		
		// When (drop-zoon) has (dragover) Event 
		dropZoon.addEventListener('dragover', function (event) {
		  // Prevent Default Behavior 
		  event.preventDefault();
		
		  // Add Class (drop-zoon--over) On (drop-zoon)
		  dropZoon.classList.add('drop-zoon--over');
		});
		
		// When (drop-zoon) has (dragleave) Event 
		dropZoon.addEventListener('dragleave', function (event) {
		  // Remove Class (drop-zoon--over) from (drop-zoon)
		  dropZoon.classList.remove('drop-zoon--over');
		});
		
		// When (drop-zoon) has (drop) Event 
		dropZoon.addEventListener('drop', function (event) {
		  // Prevent Default Behavior 
		  event.preventDefault();
		
		  // Remove Class (drop-zoon--over) from (drop-zoon)
		  dropZoon.classList.remove('drop-zoon--over');
		
		  // Select The Dropped File
		  const file = event.dataTransfer.files[0];
		
		  // Call Function uploadFile(), And Send To Her The Dropped File :)
		  uploadFile(file);
		});
		
		// When (drop-zoon) has (click) Event 
		dropZoon.addEventListener('click', function (event) {
		  // Click The (fileInput)
		  fileInput.click();
		});
		
		// When (fileInput) has (change) Event 
		fileInput.addEventListener('change', function (event) {
		  // Select The Chosen File
		  const file = event.target.files[0];
		
		  // Call Function uploadFile(), And Send To Her The Chosen File :)
		  uploadFile(file);
		});
		
		// Upload File Function
		function uploadFile(file) {
		  // FileReader()
		  const fileReader = new FileReader();
		  // File Type 
		  const fileType = file.type;
		  // File Size 
		  const fileSize = file.size;
		
		  // If File Is Passed from the (File Validation) Function
		  if (fileValidate(fileType, fileSize)) {
		    // Add Class (drop-zoon--Uploaded) on (drop-zoon)
		    dropZoon.classList.add('drop-zoon--Uploaded');
		
		    // Show Loading-text
		    loadingText.style.display = "block";
		    // Hide Preview Image
		    previewImage.style.display = 'none';
		
		    // Remove Class (uploaded-file--open) From (uploadedFile)
		    uploadedFile.classList.remove('uploaded-file--open');
		    // Remove Class (uploaded-file__info--active) from (uploadedFileInfo)
		    uploadedFileInfo.classList.remove('uploaded-file__info--active');
		
		    // After File Reader Loaded 
		    fileReader.addEventListener('load', function () {
		      // After Half Second 
		      setTimeout(function () {
		        // Add Class (upload-area--open) On (uploadArea)
		        uploadArea.classList.add('upload-area--open');
		
		        // Hide Loading-text (please-wait) Element
		        loadingText.style.display = "none";
		        // Show Preview Image
		        previewImage.style.display = 'block';
		
		        // Add Class (file-details--open) On (fileDetails)
		        fileDetails.classList.add('file-details--open');
		        // Add Class (uploaded-file--open) On (uploadedFile)
		        uploadedFile.classList.add('uploaded-file--open');
		        // Add Class (uploaded-file__info--active) On (uploadedFileInfo)
		        uploadedFileInfo.classList.add('uploaded-file__info--active');
		      }, 500); // 0.5s
		
		      // Add The (fileReader) Result Inside (previewImage) Source
		      previewImage.setAttribute('src', fileReader.result);
		
		      // Add File Name Inside Uploaded File Name
		      uploadedFileName.innerHTML = file.name;
		
		      // Call Function progressMove();
		      progressMove();
		    });
		
		    // Read (file) As Data Url 
		    fileReader.readAsDataURL(file);
		  } else { // Else
		
		    this; // (this) Represent The fileValidate(fileType, fileSize) Function
		
		  };
		};
		
		// Progress Counter Increase Function
		function progressMove() {
		  // Counter Start
		  let counter = 0;
		
		  // After 600ms 
		  setTimeout(() => {
		    // Every 100ms
		    let counterIncrease = setInterval(() => {
		      // If (counter) is equle 100 
		      if (counter === 100) {
		        // Stop (Counter Increase)
		        clearInterval(counterIncrease);
		      } else { // Else
		        // plus 10 on counter
		        counter = counter + 10;
		        // add (counter) vlaue inisde (uploadedFileCounter)
		        uploadedFileCounter.innerHTML = `${counter}%`
		      }
		    }, 100);
		  }, 600);
		};
		
		
		// Simple File Validate Function
		function fileValidate(fileType, fileSize) {
		  // File Type Validation
		  let isImage = imagesTypes.filter((type) => fileType.indexOf(`image/${type}`) !== -1);
		
		  // If The Uploaded File Type Is 'jpeg'
		  if (isImage[0] === 'jpeg') {
		    // Add Inisde (uploadedFileIconText) The (jpg) Value
		    uploadedFileIconText.innerHTML = 'jpg';
		  } else { // else
		    // Add Inisde (uploadedFileIconText) The Uploaded File Type 
		    uploadedFileIconText.innerHTML = isImage[0];
		  };
		
		  // If The Uploaded File Is An Image
		  if (isImage.length !== 0) {
		    // Check, If File Size Is 2MB or Less
		    if (fileSize <= 2000000) { // 2MB :)
		      return true;
		    } else { // Else File Size
		      return alert('Please Your File Should be 2 Megabytes or Less');
		    };
		  } else { // Else File Type 
		    return alert('Please make sure to upload An Image File Type');
		  };
		};
		// 파일 업로드 구현 끝

		// 집평가 별점 값 넣기
		var num = res_content.res_Rate;
		$(".rating__input[value='"+num+"']").prop('checked', true);


</script>
</html>