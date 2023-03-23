<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<div>❤️입양 신청 정보❤️</div>
				<div>동물등록번호 :${rList[0].animalNo }</div>
			</div>
			<div id="applicantList">
				<c:forEach items="${rList}" var="reservation" varStatus="status">
					<div class="oneApplicant">
						<div class="reservationNo">예약번호 : ${reservation.reservationNo }</div>
						<div class="adopterId">신청자ID : ${reservation.adopterId }</div>
						<c:set var="reservationTimeStamp" value="${reservation.reservationTime }" />
						<c:set var="rDate" value="${fn:split(reservationTimeStamp, ' ')[0]}" />
						<c:set var="reservationTime" value="${fn:split(reservationTimeStamp, ' ')[1]}" />
						<c:set var="rTime" value="${fn:substring(reservationTime, 0, 5)}" />						
						<div class="reservationTimeStamp">상담예정 : ${rDate } ${rTime}시</div>
					</div>
				</c:forEach>

				<div id="notice">
					<div>상담 이후</div>
					<div>입양자가 결정되면</div>
					<div>고객센터로 연락주시기 바랍니다!</div>
					<div>1588 - 0618</div>
				</div>

		</main>
	</body>
</html>