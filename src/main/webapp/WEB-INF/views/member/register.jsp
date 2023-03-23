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
		<form action="/member/register.ztp" method="post" name="join_form">
		<div class="member">
			<!-- 1. 로고 -->
			<div id="main_logo">
				<img class="logo" src="../../../resources/img/logo-img-white.png">
				<span id ="main_font">ZOOTOPIA</span>
			</div>
			<!-- 2. 필드 -->
			<div class="field">
				<label><b>아이디</b> <input type="text" name="memberId" id="memberId"></label>
			</div>
			<div class="field">
				<label><b>비밀번호</b> <input class="userpw" type="password" name="memberPw" id="memberPw" placeholder="영문자+숫자+특수문자 조합"></label>
			</div>
			<div class="field">
				<label><b>비밀번호 재확인</b> <input class="userpw-confirm" type="password" name="memberPw-check" id="memberPw-check"></label>
			</div>
			<div class="field">
				<label><b>이름</b> <input type="text" name="memberName" id="memberName"></label>
			</div>
			<!-- 3. 필드(생년월일) -->
			<div class="field birth">
					<b>생년월일</b>
					<div>
					<input type="text" name="year" id="year" placeholder="년(4자)" maxlength="4">
					<select name="month" id="month">
						<option value="">월</option>
						<option value="01">1월</option>
						<option value="02">2월</option>
						<option value="03">3월</option>
						<option value="04">4월</option>
						<option value="05">5월</option>
						<option value="06">6월</option>
						<option value="07">7월</option>
						<option value="08">8월</option>
						<option value="09">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select> 
					<input type="text" name="day" id="day" placeholder="일" maxlength="2">
					</div>
			</div>
			<!-- 4. 필드(성별) -->
			<div class="field gender">
				<b>성별</b> <select name="memberGender" id="memberGender">
					<option value="">성별</option>
					<option value="M">남자</option>
					<option value="F">여자</option>
				</select>
			</div>
			<!-- 5. 전화번호 -->
			<div class="field tel-number">
				<label> <b>전화번호</b> <input type="tel" name="memberPhone" id="memberPhone" placeholder="전화번호 입력"></label>
			</div>
			<!-- 6. 이메일 -->
			<div class="field">
				<label><b>본인 확인 이메일<small>(선택)</small></b> <input type="text" name="memberEmail" id="memberEmail" placeholder="선택입력"></label>
			</div>
			<!-- 7. 주소 -->
			<div class="field_address">
				<b>주소</b>
				<input type="text" id="sample4_roadAddress" name="memberAddr1" placeholder="도로명주소">
				<span id="guide" style="color: #999; display: none"></span>
				<input type="text" id="sample4_detailAddress" name="memberAddr2" placeholder="상세주소">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
			</div>
			
			<!-- 8. 가입하기 버튼 -->
			<div class="join_btn">
				<button type="button" style="width: 460px" onclick="joinform_check();">가입하기</button>
			</div>
			</div>
			</form>
			
			<!-- 9. 푸터 -->
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
		//joinform_check 함수로 유효성 검사
		function joinform_check() {
		  //변수에 담아주기
		  var uid = document.getElementById("memberId");
		  var pwd = document.getElementById("memberPw");
		  var repwd = document.getElementById("memberPw-check");
		  var uname = document.getElementById("memberName");
		  var year = document.getElementsByName("year")[0].value;
		  var month = document.getElementsByName("month")[0].value;
		  var day = document.getElementsByName("day")[0].value;
		  var gender = document.getElementById("memberGender");
		  var mobile = document.getElementById("memberPhone");
		  var email_id = document.getElementById("memberEmail");
			
		  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		  
		  if (uid.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
		    alert("아이디를 입력하세요.");
		    uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
		  };

		  if (pwd.value == "") {
		    alert("비밀번호를 입력하세요.");
		    pwd.focus();
		    return false;
		  };

		  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
		  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

		  if (!pwdCheck.test(pwd.value)) {
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		    pwd.focus();
		    return false;
		  };

		  if (repwd.value !== pwd.value) {
		    alert("비밀번호가 일치하지 않습니다..");
		    repwd.focus();
		    return false;
		  };

		  if (uname.value == "") {
		    alert("이름을 입력하세요.");
		    uname.focus();
		    return false;
		  };


		  
		  var currentYear = new Date().getFullYear();

		  // 년도 유효성 검사
		  if (year.length !== 4 || year > currentYear) {
		    alert("올바른 년도를 입력해주세요.");
		    year.focus();
		    return false;
		  }

		  // 월 유효성 검사
		  if (month < 1 || month > 12) {
		    alert("올바른 월을 입력해주세요.");
		    month.focus();
		    return false;
		  }

		  // 일 유효성 검사
		  var maxDay = new Date(year, month, 0).getDate();
		  if (day < 1 || day > maxDay) {
		    alert("올바른 일을 입력해주세요.");
		    day.focus();
		    return false;
		  }

		  if (gender.value == "") { //둘다 미체크시
		    alert("성별을 선택해 주세요.");
		    female.focus();
		    return false;
		  }
		  
		  if (mobile.value == ""){
			  alert("전화번호를 입력하세요.");
			  mobile.focus();
			   return false;
		  }
		  
		  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

		  if (!reg.test(mobile.value)) {
		    alert("전화번호는 숫자만 입력할 수 있습니다.");
		    mobile.focus();
		    return false;
		  }
		
		  
		  if (email_id.value == "") {
		    alert("이메일 주소를 입력하세요.");
		    email_id.focus();
		    return false;
		  }
		  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		  
		  if (!regExp.test(email_id.value)) {
			    alert("이메일 주소를 다시 확인해주세요.");
			    pwd.focus();
			    return false;
			  };
		
		  document.join_form.submit(); //유효성 검사의 포인트   
		}

		//아이디 중복체크 팝업창(현재 공백문서)
		function id_check() {
		  //window.open("팝업될 문서 경로", "팝업될 문서 이름", "옵션");
		  window.open("", "", "width=600, height=200, left=200, top=100");
		}


		//우편번호 검색 팝업창(현재 공백문서)
		function search_address() {
		  window.open("", "b", "width=600, height=300, left=200, top=100");
		}
		</script>
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