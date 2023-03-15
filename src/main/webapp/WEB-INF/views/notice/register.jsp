<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 등록</title>
		<style>
			* {
			    margin: 0;
			    padding: 0;
			}
			main {
			    width: 100vw;
			    margin-top: 125px;
			}		
		</style>
	</head>
	<body>
		<form action="/notice/register.ztp" method="post" enctype="multipart/form-data">
			제목 <input type="text" name="noticeSubject"><br>
			내용 <textarea name="noticeContent" id="" rows="10" cols="30"></textarea><br>
			작성자 <input type="text" name="noticeWriter"><br>
			파일첨부 <input type="file" name="uploadFile"><br>
			<input type="submit" value="등록">
			<input type="reset" value="초기화">
		</form>
	</body>
</html>