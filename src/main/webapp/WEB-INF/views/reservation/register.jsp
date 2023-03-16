<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양 상담 신청</title>
		<style>
			body {
				width: 100vw;
				overflow: hidden;
			}
			ul li {
				list-style: none;
				margin-block: 10px;
			}
		</style>
	</head>
	<body>
		<main>
			<h1>입양 상담 예약하기</h1>
			<form action="/reservation/register.ztp" method="post">
				<input type="hidden" name="animalNo" value="${animalNo }">
				<input type="hidden" name="fosterId" value="${animalFosterId }">
				<input type="hidden" name="adopterId" value=" ${loginUser.memberId }">
				<ul>
					<li>
						<input type="datetime-local" name="reservationTime">
					</li>
					<li>
						<input type="submit" value="예약하기">
					</li>
				</ul>
			</form>
		</main>
	</body>
</html>