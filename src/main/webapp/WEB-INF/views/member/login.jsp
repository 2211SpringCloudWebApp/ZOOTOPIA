<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
	</head>
	<body>
		<h1>LOG IN</h1>
	    <form action="/member/login.ztp" method="get"> 
	        <input type="text" placeholder="UserId"> <br>
	        <input type="password">
	        <a href="/member/findIdPage.ztp">아이디 찾기</a> |
	        <a href="/member/findPwPage.ztp">비밀번호 찾기</a> <br>
	        <input type="submit" value="LOGIN"> <br>
	        <a href="#">JOIN</a>
	    </form>
		
	</body>
</html>