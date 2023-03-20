<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에러페이지</title>
		<link rel="stylesheet" href="../../../resources/css/error.css">
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<main>
			<div>
				<img alt="에러이미지" src="../../../resources/img/error-message.png">
			</div>
			<div>
				<h1>${message }</h1>
				<a href="/">메인페이지로 이동</a>
			</div>
		</main>
		
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>