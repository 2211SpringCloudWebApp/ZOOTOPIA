<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기 작성</title>
    <link rel="stylesheet" href="../../../resources/css/review.css">
    <style>

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
	<main>
	<div></div>
	<div>
		<div class="review-page-title" style="width: 600px;">
	    	<h1>입양 후기 수정</h1>
	    </div>
	    <hr>
	    <form action="/review/modify.ztp" method="POST" enctype="multipart/form-data">
	    <input type="hidden" name="animalNo" value="${animal.animalNo}">
	        <table class="review-write-form">
	        	<tr>
	        		<td class="review-write-name">종류</td>
	        		<td class="review-write-info">${animal.animalSpecies}</td>
	        	</tr>
	        	<tr>
	        		<td class="review-write-name">성별</td>
	        		<td class="review-write-info"><c:if test="${animal.animalGender eq 'M'}">남</c:if><c:if test="${animal.animalGender eq 'F'}">여</c:if></td>
	        	</tr>
	        	<tr>
	        		<td class="review-write-name">나이</td>
	        		<td class="review-write-info">${animal.animalAge}세</td>
	        	</tr>
	            <tr>
	                <td class="review-write-name">제목</td>
	                <td><input type="text" name="reviewTitle" class="review-write-title" placeholder="제목을 입력해 주세요" required></td>
	            </tr>
	            <tr>
	                <td class="review-write-name">내용</td>
	                <td><textarea name="reviewContent" class="review-write-content" cols="30" rows="10" placeholder="내용을 입력해 주세요" required></textarea></td>
	            </tr>
	            <tr>
	                <td class="review-write-name">사진첨부</td>
	                <td>
	                	<div style="float: left; width: 30px; text-align: center;">
			                <img src="../../../resources/img/notice-file.png" class="attachment_image" style="width: 15px;  cursor: pointer;" onclick="document.getElementById('file').click();">
			                <input type="file" id="file" name="reviewImageName" accept="image/*" style="display:none">
	                	</div>
	                	<div id="upload-file">사진 파일을 업로드해 주세요</div>
	                </td>
	            </tr>
	            <tr>
	            	<td colspan="2" style="text-align: center;">
	            		<button type="submit">등록</button>
	            		<button type="reset">취소</button>
	            	</td>
	        </table>
	    </form>
    </div>
	<div></div>
	</main>
	<jsp:include page="../common/footer.jsp" />
    <script>
    
	    window.onload = function() {
	    	
	        target = document.getElementById('file');
	        target.addEventListener('change', function() {
	        	
	            fileList = "";
	            for(i = 0; i < target.files.length; i++) {
	                
	            	fileList += target.files[i].name + '<br>';
	                
	            }
	            
	            target2 = document.getElementById('upload-file');
	            target2.innerHTML = fileList;
	        	
	        });
	        
	    };
	        
    </script>
</body>
</html>