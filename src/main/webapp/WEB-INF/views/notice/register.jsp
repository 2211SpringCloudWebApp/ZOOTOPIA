<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 등록</title>
	</head>
	<body>
		<form action="/notice/register.ztp" method="post">
			제목 <input type="text" name="noticeSubject"><br>
			내용 <textarea name="noticeContent" id="" rows="10" cols="30"></textarea><br>
			작성자 <input type="text" name="noticeWriter"><br>
			파일첨부 <input type="file" name="noticeImageName"><br>
			<input type="submit" value="등록">
			<input type="reset" value="초기화">
		</form>
	</body>
</html>