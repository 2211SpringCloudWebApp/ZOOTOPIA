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
	<div></div>
	<main>
	    <h1>입양 후기 수정</h1>
	    <hr>
	    동물 : ${animalNo}<br>
	    <form action="/review/modify.ztp" method="POST" enctype="multipart/form-data">
	    <input type="hidden" name="animalNo" value="${animalNo}">
	        <table>
	            <tr>
	                <td>제목</td>
	                <td><input type="text" name="reviewTitle" value="${review.reviewTitle}" required></td>
	            </tr>
	            <tr>
	                <td>내용</td>
	                <td><textarea name="reviewContent" id="" cols="30" rows="10" value="${review.reviewTitle}" required></textarea></td>
	            </tr>
	            <tr>
	                <td>첨부파일 (사진)</td>
	                <td><img src="#" class="attachment_image" onclick="document.getElementById('file').click();"><input type="file" id="file" name="reviewImageName" style="display:none"></td>
	            </tr>
	            <tr>
	                <td>첨부파일 (영상)</td>
	                <td><img src="#" class="attachment_image" onclick="document.getElementById('file').click();"><input type="file" id="file" name="reviewVideoName" style="display:none"></td>
	            </tr>
	        </table>
	        <button type="submit">등록</button>
	        <button type="reset">취소</button>
	    </form>
	</main>
	<div id="footer-margin"></div>
	<jsp:include page="../common/footer.jsp" />
    <script>
        
    </script>
</body>
</html>