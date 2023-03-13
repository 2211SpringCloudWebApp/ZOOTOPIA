<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세 조회</title>
	</head>
	<body>
		<form action="/notice/modify.ztp" method="post">
			제목 <input type="text" name="noticeSubject" value="${notice.noticeSubject }"><br>
			작성자 <input type="text" name="noticeWriter" value="${notice.noticeWriter }"><br>
			내용 <textarea name="noticeContent" id=""  rows="10" cols="30">${notice.noticeContent }</textarea><br>
			파일첨부 <input type="file" name="noticeImageName" value="${notice.noticeImageName }"><br>
			<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
			<input type="submit" value="수정">
			<input type="reset" value="초기화">			
		</form>
		<c:url var="nDelete" value="/notice/remove.ztp">
			<c:param name="noticeNo" value="${notice.noticeNo }"/>
		</c:url>
		<a href="${nDelete }">삭제하기</a>
	</body>
</html>