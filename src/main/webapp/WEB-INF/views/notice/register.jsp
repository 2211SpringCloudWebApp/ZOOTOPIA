<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 등록</title>
		<link rel="stylesheet" href="../../../resources/css/notice.css">
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
	</head>
	<body>
		<header>
			<jsp:include page="../common/header.jsp" />
		</header>
		<main>
			<div></div>
			<form action="/notice/register.ztp" method="post" id="registerForm" enctype="multipart/form-data">
				<label>제목</label>
				<input type="text" class="registerInput" name="noticeSubject" placeholder=""><br>
				<label>작성자</label>
				<input type="text" class="registerInput" name="noticeWriter" placeholder=""><br>
				<textarea name="noticeContent" id="" rows="20" cols="70" placeholder="내용을 입력하세요"></textarea><br>
<!-- 				<div class="uploadArea"> -->
<!-- 					<label class="fileBtn" for="inputFile"> -->
<!-- 						<img src="../../../resources/img/notice-file.png" alt="" >&nbsp;파일 업로드 -->
<!-- 					</label> -->
<!-- 				</div> -->
				<div class="uploadArea">
					<div>
						<img src="../../../resources/img/notice-file.png" alt="" style="width: 15px; cursor: pointer;" onclick="document.getElementById('inputFile').click();">
						<input type="file" id="inputFile" name="uploadFile" style="display:none">
					</div>
					<div id="upload-file" style="font-size: 20px;">파일 업로드</div>
				</div>
				<input type="submit" value="등록">
				<input type="reset" value="초기화">
			</form>
		</main>
		<footer>
			<jsp:include page="../common/footer.jsp" />
		</footer>
		<script>
    
	    window.onload = function() {
	    	
	        target = document.getElementById('inputFile');
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