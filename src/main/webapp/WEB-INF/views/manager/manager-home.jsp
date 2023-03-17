<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자페이지</title>
		<link rel="stylesheet" href="../../../resources/css/manager/manager-home.css">
	</head>
	<body>
		<div id=contatiner>
		
		<jsp:include page="../common/header.jsp" />
			
			<main>
				<div class="menuTap">
<!-- 					<img alt="" src="../../../resources/img/manager-icon.png"> -->
				    <h1 onclick="location.href='/member/list.ztp'">회원관리</h1>
				    <div class="barTap"></div>
				</div>
				<div class="menuTap">
			    	<h1 onclick="location.href='/manager/selectAdopt.ztp'">입양공고관리</h1>
			    	<div class="barTap"></div>
				</div>
				<div class="menuTap">
				    <h1 onclick="location.href='/manager/viewReservation.ztp'">예약관리</h1>
				    <div class="barTap"></div>				
				</div>
			</main>
			
		<jsp:include page="../common/footer.jsp" />
		
		</div>
	
	</body>
</html>