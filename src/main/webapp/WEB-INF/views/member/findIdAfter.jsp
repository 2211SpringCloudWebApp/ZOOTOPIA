<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기 성공</title>
		<link rel="stylesheet" href="../../../resources/css/notice.css">
		<style type="text/css">
		main input[type=text]{
			background-color: #EEE5C6
		}
		
		</style>
	</head>
	<body style="background-image: url(../../../resources/img/cat-dog5.png); background-repeat: no-repeat;  background-size: cover; background-position: center center;">
		<header>
			<jsp:include page="../common/header.jsp" />
		</header>
		<main>
		<div style="height: 150px;margin-bottom: 100px;"></div>
	    <h1 style="margin-bottom: 10px; margin-top: 10px;" >아이디 찾기</h1>
	    <c:if test="${member ne null }">
	    <h1 style="margin-bottom: 10px; margin-top: 10px;" >회원가입 시 사용한 아이디는${member.memberId}입니다.</h1>
	    </c:if>
	    <c:if test="${member eq null }">
	    <h1 style="margin-bottom: 10px; margin-top: 10px;" >등록된 정보가 없습니다.</h1>
	    </c:if>
	    <button type="button" style="margin-bottom: 10px; margin-top: 10px;"  onclick="location.href='/member/loginView.ztp'" >로그인 화면으로 돌아가기</button>
		</main>
		<footer>
			<jsp:include page="../common/footer.jsp" />
		</footer>
	</body>
</html>