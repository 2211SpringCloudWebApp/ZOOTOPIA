<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기 성공</title>
	</head>
	<body>
	
	    <h1>아이디 찾기</h1>
	    <c:if test="${member ne null }">
	    <h2>회원가입 시 사용한 아이디는${member.memberId}입니다.</h2>
	    </c:if>
	    <c:if test="${member eq null }">
	    <h2>등록된 정보가 없습니다.</h2>
	    </c:if>
	    <button type="button" onclick="location.href='/member/loginView.ztp'" >로그인 화면으로 돌아가기</button>
	</body>
</html>