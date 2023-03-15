<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 정보</title>
	</head>
	<body>
		<h1>MY INFO</h1>
        <hr>
        <b><a href="/member/mypage.ztp">내 정보</a></b> <br>
        <b><a href="/member/mypageAdoptPost.ztp">입양공고 게시글</a></b> <br>
        <b><a href="/member/mypageReview.ztp">입양후기 게시글</a></b>
        <b><a href="/member/mypageComment.ztp">작성한 댓글</a></b> <br>
        <b><a href="/member/mypageLike.ztp">좋아요 누른 글</a></b> <br>
		<form action="/member/modify.ztp" method="post">
			아이디 <br>	
			<input type="text"		name="memberId"	    value="${member.memberId  }" readonly> <br>
			비밀번호 <br> 	
			<input type="password" 	name="memberPw"		value=""> <br>
			비밀번호 확인 <br> 
			<input type="password"  name=""		value=""> <br>
			이름 <br>
			<input type="text" 		name="memberName"   value="${member.memberName  }" readonly> <br>
			이메일 <br>		
			<input type="text" 		name="memberEmail"	value="${member.memberEmail  }"> <br>
			휴대전화 <br>
			<input type="text" 		name="memberPhone"	value="${member.memberPhone  }"> <br>
			주소 <br>		
			<input type="text"  	name="memberAddr1"  value="${member.memberAddr1  }"> 
			<input type="text"		name="memberAddr2"  value="${member.memberAddr2  }"> <br>
			<input type="submit" name = "modify" value="수정하기">
		</form>
			<a href="/member/removeView.ztp?memberId=${member.memberId }">탈퇴하기</a>
	</body>
</html>