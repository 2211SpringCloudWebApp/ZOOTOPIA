<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양 공고 등록</title>
	</head>
	<body>
	    <form action="/animal/register.ztp" method="post">
	        축종 <input type="text"><br>
	        성별 남<input type="radio" name="animalGender"> 여<input type="radio" name="animalGender"><br>
	        체중 <input type="text"><br>
	        나이 <input type="text"><br>
	        중성화여부 Y<input type="radio" name="neuterYn"> N<input type="radio" name="neuterYn"><br>
	        임시보호지역 <input type="text"><br>
	        성격 <input type="text"><br>
	        임시보호자 아이디 <input type="text"><br>
	        <input type="submit" value="등록">
	        <input type="reset" value="초기화">
	    </form>	
	</body>
</html>