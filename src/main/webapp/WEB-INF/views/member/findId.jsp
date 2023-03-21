<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<link rel="stylesheet" href="../../../resources/css/member/findId.css">
	</head>
	<body>
		<h1>아이디 찾기</h1>
	    <h2>아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</h2>
	    <form action="/member/findId.ztp">
		   <input type="text" name="memberName" placeholder="이름" > <br>
		   <input type="text" name="memberEmail" placeholder="이메일" > <br>
	 	   <button type="submit">찾기</button>
	    </form>
	</body>
</html>