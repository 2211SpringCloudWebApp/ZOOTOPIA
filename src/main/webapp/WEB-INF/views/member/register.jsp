<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
		<link rel="icon" href="./images/images2/favicon.png">
		<link rel="stylesheet" href="../../../resources/css/member/register.css">
		<script defer
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</head>
	<body>
		<header>
		<jsp:include page="../common/header.jsp" />
		</header>
		<main>
		<div style="height: 125px;margin-bottom: 100px;"></div>
		<form action="/member/register.ztp" method="post">
		<div class="member">
			<!-- 1. 로고 -->
			<div id="main_logo">
				<img class="logo" src="../../../resources/img/logo-img-white.png">
				<span id ="main_font">ZOOTOPIA</span>
			</div>
			<!-- 2. 필드 -->
			<div class="field">
				<b>아이디</b> <input type="text" name="memberId">
			</div>
			<div class="field">
				<b>비밀번호</b> <input class="userpw" type="password" name="memberPw">
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input class="userpw-confirm" type="password"
					name="memberPw-check">
			</div>
			<div class="field">
				<b>이름</b> <input type="text" name="memberName">
			</div>
	
			<!-- 3. 필드(생년월일) -->
			<div class="field birth">
				<b>생년월일</b>
				<div>
					<input type="text" name="year" placeholder="년(4자)">
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
				<b>성별</b> <select name="memberGender" id="">
					<option value="">성별</option>
					<option value="M">남자</option>
					<option value="F">여자</option>
				</select>
			</div>
	
			<!-- 5. 이메일_주소_전화번호 -->
			<div class="field">
				<b>본인 확인 이메일<small>(선택)</small></b> <input type="email"
					name="memberEmail" placeholder="선택입력">
			</div>
			<div class="field_address">
				<b>주소</b>
				<input type="text" id="sample4_roadAddress" name="memberAddr1"
					placeholder="도로명주소"> <span id="guide"
					style="color: #999; display: none"></span> <input type="text"
					id="sample4_detailAddress" name="memberAddr2" placeholder="상세주소">
				<input type="button" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기">
			</div>
			<div class="field tel-number">
				<b>휴대전화</b>
				<select>
					<option value="">대한민국 +82</option>
				</select>
				<div>
					<input type="tel" name="memberPhone" placeholder="전화번호 입력">
					<input type="button" value="인증번호 받기">
				</div>
				<input type="number" placeholder="인증번호를 입력하세요">
			</div>
	
			<!-- 6. 가입하기 버튼 -->
			<input type="submit" value="가입하기">
			</div>
			</form>
			<!-- 7. 푸터 -->
			<div class="member-footer">
				<div>
					<a href="#none">이용약관</a> <a href="#none">개인정보처리방침</a> <a
						href="#none">책임의 한계와 법적고지</a> <a href="#none">회원정보 고객센터</a>
				</div>
				<span><a href="#none">ZOOTOPIA.</a></span>
			</div>
			</main>
			<div style="height: 70px;margin-bottom: 100px;"></div>
			<footer>
				<jsp:include page="../common/footer.jsp" />
			</footer>
		<script>
	        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	        function sample4_execDaumPostcode() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                    var roadAddr = data.roadAddress; // 도로명 주소 변수
	                    var extraRoadAddr = ''; // 참고 항목 변수
	
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraRoadAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraRoadAddr !== ''){
	                        extraRoadAddr = ' (' + extraRoadAddr + ')';
	                    }
	
	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    
	                    document.getElementById("sample4_roadAddress").value = roadAddr;
	                    
	                    
	                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                    if(roadAddr !== ''){
	                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                    } else {
	                        document.getElementById("sample4_extraAddress").value = '';
	                    }
	
	                    var guideTextBox = document.getElementById("guide");
	                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                    if(data.autoRoadAddress) {
	                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                        guideTextBox.style.display = 'block';
	
	                    } else if(data.autoJibunAddress) {
	                        var expJibunAddr = data.autoJibunAddress;
	                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                        guideTextBox.style.display = 'block';
	                    } else {
	                        guideTextBox.innerHTML = '';
	                        guideTextBox.style.display = 'none';
	                    }
	                }
	            }).open();
	        }
	    </script>
	</body>
</html>