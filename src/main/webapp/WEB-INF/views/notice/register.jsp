<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 등록</title>
		<link rel="stylesheet" href="../../../resources/css/notice.css">
		<style>
		</style>
	</head>
	<body>
		<header>
			<jsp:include page="../common/header.jsp" />
		</header>
		<main>
			<div></div>
			<form action="/notice/register.ztp" method="post" enctype="multipart/form-data">
				제목 <input type="text" name="noticeSubject" placeholder="제목"><br>
				작성자 <input type="text" name="noticeWriter" placeholder="작성자"><br>
				<textarea name="noticeContent" id="" rows="15" cols="70" placeholder="내용을 입력하세요"></textarea><br>
				<div class="uploadArea">
					<label class="fileBtn" for="inputFile">
						<img src="../../../resources/img/notice-file.png" alt="" >&nbsp;파일 업로드
					</label>
				</div>
				<input type="file" id="inputFile" name="uploadFile" style="display:none"><br>
				<input type="submit" value="등록">
				<input type="reset" value="초기화">
			</form>
		</main>
		<footer>
			<jsp:include page="../common/footer.jsp" />
		</footer>			
	</body>
</html>