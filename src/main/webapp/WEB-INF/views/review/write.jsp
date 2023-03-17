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
	    <h1>입양 후기 등록 폼</h1>
	    <hr>
	    동물 : ${animalNo}<br>
	    <form action="/review/write.ztp" method="POST" enctype="multipart/form-data">
	    <input type="hidden" name="animalNo" value="${animalNo}">
	        <table>
	            <tr>
	                <td>제목</td>
	                <td><input type="text" name="reviewTitle" placeholder="제목을 입력해 주세요" required></td>
	            </tr>
	            <tr>
	                <td>내용</td>
	                <td><textarea name="reviewContent" id="" cols="30" rows="10" placeholder="내용을 입력해 주세요" required></textarea></td>
	            </tr>
	            <tr>
	                <td>첨부파일 (사진)</td>
	                <td><img src="../../../resources/img/notice-file.png" class="attachment_image" style="width: 15px;" onclick="document.getElementById('file').click();"><input type="file" id="file" name="reviewImageName" style="display:none"></td>
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
	<jsp:include page="../common/footer.jsp" />
    <script>
        
    </script>
</body>
</html>