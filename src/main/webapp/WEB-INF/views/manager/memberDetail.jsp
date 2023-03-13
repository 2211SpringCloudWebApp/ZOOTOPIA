<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>멤버디테일</title>
	    <style>
	        table{
	            border: 1px solid black;
	            border-collapse: collapse;
	        }
	        tr, th, td{ border: 1px solid black;}
	    </style>
	</head>
	<body>
	    <h1>회원정보</h1>
	    <table>
	        <thead>
	            <tr>
	                <th>아이디</th>
	                <th>비밀번호</th>
	                <th>이름</th>
	                <th>생년월일</th>
	                <th>성별</th>
	                <th>이메일</th>
	                <th>전화번호</th>
	                <th>주소1</th>
	                <th>주소2</th>
	                <th>관리자여부</th>
	                <th>가입일</th>
	                <th>정보수정일</th>
	                <th>탈퇴여부</th>
	                <th>탈퇴일</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>${mOne.memberId }</td>
	                <td>${mOne.memberPw }</td>
	                <td>${mOne.memberName }</td>
	                <td>${mOne.memberBirthday }</td>
	                <td>${mOne.memberGender }</td>
	                <td>${mOne.memberEmail }</td>
	                <td>${mOne.memberPhone }</td>
	                <td>${mOne.memberAddr1 }</td>
	                <td>${mOne.memberAddr2 }</td>
	                <td>${mOne.mAdminYN }</td>
	                <td>${mOne.mEnrollDate }</td>
	                <td>${mOne.mUpdateDate }</td>
	                <td>${mOne.mWithdrawalYN }</td>
	                <td>${mOne.mWithdrawalDate }</td>
	            </tr>	        
	        </tbody>
	    </table>
	    <button onclick="deleteBtn('${mOne.memberId}')">회원삭제</button>
	    <script>
			function deleteBtn(memberId){
				if(confirm("회원을 삭제하시겠습니까?")){
					location.href="/member/delete.ztp?memberId="+memberId;					
				} 	
			}
	    </script>
	</body>
</html>