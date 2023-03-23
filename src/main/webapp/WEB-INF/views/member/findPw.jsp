<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<link rel="stylesheet" href="../../../resources/css/member/find.css">
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
		<div style="height: 125px;margin-bottom: 100px; margin-top: 100px;"></div>
		<div id="wrap">
		<h1>비밀번호 찾기</h1>
		<h2>비밀번호는 이름,가입한 아이디,이메일을 통해 찾으실 수 있습니다.</h2>
		<form action="/member/findPw.ztp" method="post">
			<input type="text" name="memberName" placeholder="이름" style="margin-bottom: 10px; margin-top: 10px;" > <br>
			<input type="text" name="memberId" placeholder="아이디" style="margin-bottom: 10px; margin-top: 50px;"> <br>
			<input type="text" name="memberEmail" placeholder="이메일" style="margin-bottom: 10px; margin-top: 10px;"> <br>
			<button type="submit">비밀번호 찾기</button>
		</form>
		</div>
		<div></div>
		</main>
		<footer>
			<jsp:include page="../common/footer.jsp" />
		</footer>
	</body>
</html>