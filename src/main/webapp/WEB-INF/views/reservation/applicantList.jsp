<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양 신청자 목록</title>
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
	</head>
	<body>
		<c:forEach items="${rList}" var="reservation" varStatus="status">

			<td onclick="location.href='#'">
				<div>${reservation.reservationNo }</div>
				<div>${reservation.animalNo }</div>
				<div>${reservation.fosterId }</div>
				<div>${reservation.adopterId }</div>
				<div>${reservation.adoptedYN }</div>
				<div>${reservation.reservationTime }</div>
			</td>

		</c:forEach>
	</body>
</html>