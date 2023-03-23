<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
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
		<div style="height: 150px;margin-bottom: 100px; margin-top: 100px;"></div>
		<main>
		<div >
			<h1>아이디 찾기</h1>
		    <h2>아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</h2>
		    <form action="/member/findId.ztp">
			   <input type="text" name="memberName" placeholder="이름" style="margin-bottom: 10px; margin-top: 10px;"> <br>
			   <input type="text" name="memberEmail" placeholder="이메일" style="margin-bottom: 10px; margin-top: 10px;"  > <br>
		 	   <button type="submit" style="margin-bottom: 10px; margin-top: 10px;" >찾기</button>
		    </form>
	    </div>
		 </main>
	    <div style="margin-bottom: 200px;"></div>
		<footer>
				<jsp:include page="../common/footer.jsp" />
		</footer>
	</body>
</html>
