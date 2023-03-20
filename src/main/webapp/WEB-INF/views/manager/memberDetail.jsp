<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>멤버디테일</title>
		<link rel="stylesheet" href="../../../resources/css/manager/memberDetail.css">
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<main>
			<div id="titleTag">
		    	<h1>회원정보</h1>
		    </div>
			    <table>
		            <tr>
		                <td><span>아이디</span></td>
		                <td>${mOne.memberId }</td>
		            </tr>
		            <tr>
		                <td><span>비밀번호</span></td>
		                <td>${mOne.memberPw }</td>
		            </tr>
		            <tr>
		                <td><span>이름</span></td>
		                <td>${mOne.memberName }</td>		            
		            </tr>
		            <tr>
		                <td><span>생년월일</span></td>
		                <td>${mOne.memberBirthday }</td>
		            </tr>
		            <tr>
		                <td><span>성별</span></td>
		                <td>${mOne.memberGender }</td>
		            </tr>
		            <tr>
		                <td><span>이메일</span></td>
		                <td>${mOne.memberEmail }</td>
		            </tr>
		            <tr>
		                <td><span>전화번호</span></td>
		                <td>${mOne.memberPhone }</td>
		            </tr>
		            <tr>
		                <td><span>주소1</span></td>
		                <td>${mOne.memberAddr1 }</td>
		            </tr>
		            <tr>
		                <td><span>주소2</span></td>
		                <td>${mOne.memberAddr2 }</td>
		            </tr>
		            <tr>
		                <td><span>관리자여부</span></td>
		                <td>${mOne.mAdminYN }</td>
		            </tr>
		            <tr>
		                <td><span>가입일</span></td>
		                <td>${mOne.mEnrollDate }</td>
		            </tr>
		            <tr>
		                <td><span>정보수정일</span></td>
		                <td>${mOne.mUpdateDate }</td>
		            </tr>
		            <tr>
		                <td><span>탈퇴여부</span></td>
		                <td>${mOne.mWithdrawalYN }</td>
		            </tr>
		            <tr>
		                <td><span>탈퇴일</span></td>
		                <td>${mOne.mWithdrawalDate }</td>
		            </tr>		            
			    </table>
			    <button onclick="deleteBtn()">회원삭제</button>
	    </main>
	    <jsp:include page="../common/footer.jsp" />
	    
	    <script>
			function deleteBtn(){
				var memberId = "${mOne.memberId}";
				if(confirm("회원을 삭제하시겠습니까?")){
					location.href="/member/delete.ztp?memberId="+memberId;					
				} 	
			}
	    </script>
	</body>
</html>