<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기 성공</title>
			<link rel="stylesheet" href="../../../resources/css/notice.css">
			<style type="text/css">
		main input[type=text]{
			background-color: #EEE5C6
		}
		
		</style>
	</head>
	<body style="background-image: url(../../../resources/img/cat-dog10.png); background-repeat: no-repeat;  background-size: cover; background-position: center center;">
		<header>
			<jsp:include page="../common/header.jsp" />
		</header>
		<main>
		<div id="background-img4">
		<div style="height: 150px;margin-bottom: 100px;"></div>
		<h1 style="margin-bottom: 10px; margin-top: 10px;" >비밀번호 찾기</h1>
		<c:if test="${member ne null }">
	    <h2 style="margin-bottom: 10px; margin-top: 10px;" >회원가입 시 사용한 비밀번호는${member.memberPw}입니다</h2>
	    </c:if>
	    <c:if test="${member eq null }">
	    <h2 style="margin-bottom: 10px; margin-top: 10px;" >등록된 정보가 없습니다.</h2>
	    </c:if>
	    <button type="button" onclick="location.href='/member/loginView.ztp'" style="height: 35px" style="margin-bottom: 10px; margin-top: 10px;" >로그인 화면으로 돌아가기</button>
	    </div>
		</main>
			<footer>
				<jsp:include page="../common/footer.jsp" />
			</footer>
	</body>
</html>