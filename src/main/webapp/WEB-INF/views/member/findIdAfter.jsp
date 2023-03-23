<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기 성공</title>
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
			fpm
		</style>
		<link rel="stylesheet" href="../../../resources/css/notice.css">
	</head>
	<body>
		<header>
			<jsp:include page="../common/header.jsp" />
		</header>
		<main>
		<div style="height: 150px;margin-bottom: 100px;"></div>
	    <h1>아이디 찾기</h1>
	    <c:if test="${member ne null }">
	    <h1>회원가입 시 사용한 아이디는${member.memberId}입니다.</h1>
	    </c:if>
	    <c:if test="${member eq null }">
	    <h1>등록된 정보가 없습니다.</h1>
	    </c:if>
	    <button type="button" onclick="location.href='/member/loginView.ztp'" >로그인 화면으로 돌아가기</button>
		</main>
		<footer>
			<jsp:include page="../common/footer.jsp" />
		</footer>
	</body>
</html>