<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양 신청 정보❤️</title>
		<link rel="stylesheet" href="../../../resources/css/reservation/applicantList.css">
		<link rel="icon" href="../../../resources/img/favicon.png" />
		<link rel="apple-touch-icon" href="../../../resources/img/favicon.png" />
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
	</head>
	<body>
		<main>
			<div id="title">
				입양 신청 정보
			</div>
			<c:forEach items="${rList}" var="reservation" varStatus="status">
					<div>${reservation.reservationNo }</div>
					<div>${reservation.animalNo }</div>
					<div>${reservation.fosterId }</div>
					<div>${reservation.adopterId }</div>
					<div>${reservation.adoptedYN }</div>
					<div>${reservation.reservationTime }</div>
			</c:forEach>

		</main>
	</body>
</html>