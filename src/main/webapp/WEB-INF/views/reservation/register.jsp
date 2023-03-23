<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양 상담 신청❤️</title>
		<link rel="stylesheet" href="../../../resources/css/reservation/register.css">
		<link rel="icon" href="../../../resources/img/favicon.png" />
		<link rel="apple-touch-icon" href="../../../resources/img/favicon.png" />
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
	</head>
	<body>
		<main>
			<!-- <div id="title">입양 상담 예약</div> -->
			<div id="content">
				<div>희망 날짜와 시간을</div>
				<div>선택해주세요!</div>
			</div>
			<form action="/reservation/register.ztp" method="post">
				<input type="hidden" name="animalNo" value="${animalNo }">
				<input type="hidden" name="fosterId" value="${animalFosterId }">
				<input type="hidden" name="adopterId" value="${loginUser.memberId }">
				<ul>
					<li>
						<!-- <input type="datetime-local" name="reservationTime"> -->
						<input type="date" name="rDate">
					</li>
					<li>
						<select name="rTime">
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
						</select>

					</li>
					<li>
						<button type="submit">예약하기</button>
					</li>
				</ul>
			</form>
		</main>
	</body>
</html>