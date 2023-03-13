<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 정보</title>
	</head>
	<body>
		<form action="/member/modify.ztp" method="post">
			아이디 <br>	
			<input type="text"		name="memberId"	    value="${member.memberId  }" readonly> <br>
			비밀번호 <br> 	
			<input type="password" 	name="memberPw"		value="${member.memberPw  }"> <br>
			비밀번호 확인 <br> 
			<input type="password"  name="memberPw"		value="${member.memberPw  }"> <br>
			이름 <br>
			<input type="text" 		name="memberName"   value="${member.memberName  }" readonly> <br>
			이메일 <br>		
			<input type="text" 		name="memberEmail"	value="${member.memberEmail  }"> <br>
			휴대전화 <br>
			<input type="text" 		name="memberPhone"	value="${member.memberPhone  }"> <br>
			주소 <br>		
			<input type="text"  	name="memberAddr1"  value="${member.memberAddr1  }"> 
			<input type="text"		name="memberAddr2"  value="${member.memberAddr2  }">
			<input type="text" 		name="memberAddr3"  value="${member.memberAddr3  }">
			<input type="submit" name = "modify" value="수정하기">
			<input type="submit" name = "remove" value="탈퇴하기">
		</form>
	</body>
</html>