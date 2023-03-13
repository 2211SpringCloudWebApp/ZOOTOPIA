<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
	</head>
	<body>
		<h1>JOIN</h1>
		<hr>
		<form action="/member/register.ztp" method="post">
			<div class="member">
				<!-- 1. 로고 -->
				<img class="logo" src="">
	
				<!-- 2. 필드 -->
				<div class="field">
					<b>아이디</b> <br> 
					<input type="text" name="memberId">
				</div>
				<div class="field">
					<b>비밀번호</b> <br>
					<input class="userpw" type="password" name="memberPw">
				</div>
				<div class="field">
					<b>비밀번호 재확인</b> <br>
					<input class="userpw-confirm" type="password" name="memberPw-check">
				</div>
				<div class="field">
					<b>이름</b> <br>
					<input type="text" name="memberName">
				</div>
	
				<!-- 3. 필드(생년월일) -->
				<div class="field birth">
					<b>생년월일</b> <br>
					<div>
						<input type="number" name="year" placeholder="년(4자)">
						<select name="month">
							<option value="">월</option>
							<option value="1">1월</option>
							<option value="2">2월</option>
							<option value="3">3월</option>
							<option value="4">4월</option>
							<option value="5">5월</option>
							<option value="6">6월</option>
							<option value="7">7월</option>
							<option value="8">8월</option>
							<option value="9">9월</option>
							<option value="10">10월</option>
							<option value="11">11월</option>
							<option value="12">12월</option>
						</select> 
						<input type="number" name="day" placeholder="일">
					</div>
				</div>
	
				<!-- 4. 필드(성별) -->
				<div class="field gender">
					<b>성별</b> <br>
					<div>
						<label><input type="radio" name="memberGender" value ="M">남자</label> 
						<label><input type="radio" name="memberGender" value ="F">여자</label>
					</div>
				</div>
	
				<!-- 5. 이메일_전화번호 -->
				<div class="field">
					<b>본인 확인 이메일<small>(선택)</small></b> <br> 
					<input type="email" name="memberEmail" placeholder="선택입력">
				</div>
	
				<div class="field tel-number">
					<b>휴대전화</b> <br> 
					<select>
						<option value="">대한민국 +82</option>
					</select>
					<div>                                                
						<input type="tel" name="memberPhone" placeholder="전화번호 입력"> 
						<input type="button" value="인증번호 받기">
					</div>
					<input type="number" placeholder="인증번호를 입력하세요">
				</div>
				<div class="field">
					<b>주소</b> <br>
					<input type="text" name="memberAddr1">
					<input type="text" name="memberAddr2">
				</div>
				<!-- 6. 가입하기 버튼 -->
				<input type="submit" value="가입하기">
	
				<!-- 7. 푸터 -->
				<div class="member-footer">
					<div></div>
				</div>
			</div>
		</form>
	</body>
</html>