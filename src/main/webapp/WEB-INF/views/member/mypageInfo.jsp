<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="../../../resources/css/member/login.css">
		<!-- Font Awesome -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
		<!-- MDB -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../../../resources/css/member/sidebar.css">
		<link rel="stylesheet" href="../../../resources/css/notice.css">
	</head>
	<body>
		<!--Main Navigation-->
		<header>
		<jsp:include page="../common/header.jsp" />
		</header>
		<main>
		<div></div>
		<div id="hd">
			<!-- Sidebar -->
			<nav id="sidebarMenu"
				class="collapse d-lg-block sidebar collapse bg-white">
				<div class="position-sticky">
					<div class="list-group list-group-flush mx-3 mt-4">
						<a href="/member/mypage.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" >
							<i class="fas fa-user-circle fa-fw me-3"></i><span>나의 정보</span>
						</a>	
						<a href="/member/animalList.ztp?category=animalList" class="list-group-item list-group-item-action py-2 ripple" id="animalList">
							<i class="fas fa-paw fa-fw me-3"></i><span>입양한 동물 리스트</span>
						</a>
						<a href="/member/mypageAdoptPost.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" >
							<i class="fas fa-list fa-fw me-3"></i><span>입양공고 게시글</span>
						</a> 
						<a href="/member/mypageAdoptPostComment.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" >
							<i class="fas fa-comment fa-fw me-3"></i><span>입양공고 댓글</span>
						</a> 
						<a href="/member/mypageAdoptPostLike.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" >
							<i class="fas fa-heart fa-fw me-3"></i><span>입양공고 좋아요 누른 글</span>
						</a> 
						<a href="/member/mypageReview.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" >
							<i class="fas fa-list fa-fw me-3"></i><span>입양후기 게시글</span>
						</a>
						<a href="/member/mypageReviewComment.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" >
							<i class="fas fa-comment fa-fw me-3"></i><span>입양후기 댓글</span>
						</a> 
						<a href="/member/mypageReviewLike.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" >
							<i class="fas fa-heart fa-fw me-3"></i><span>입양후기 좋아요 누른 글</span>
						</a> 
					</div>
				</div>
			</nav>
			<!-- Sidebar -->
			<!-- Navbar -->
			<nav id="main-navbar"
				class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
				<!-- Container wrapper -->
				<div class="container-fluid">
					<!-- Toggle button -->
					<button class="navbar-toggler" type="button"
						data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu"
						aria-controls="sidebarMenu" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-bars"></i>
					</button>
				</div>
				<!-- Container wrapper -->
			</nav>
			<!-- Navbar -->
		</div>
		<h1>MY INFO</h1>
        <hr>
       
		<form action="/member/modify.ztp" method="post">
			아이디 <br>	
			<input type="text"		name="memberId"	    value="${member.memberId  }" readonly> <br>
			비밀번호 <br> 	
			<input type="password" 	name="memberPw"		value="" required> <br>
			비밀번호 확인 <br> 
			<input type="password"  name=""		value=""> <br>
			이름 <br>
			<input type="text" 		name="memberName"   value="${member.memberName  }" readonly> <br>
			이메일 <br>		
			<input type="text" 		name="memberEmail"	value="${member.memberEmail  }"> <br>
			휴대전화 <br>
			<input type="text" 		name="memberPhone"	value="${member.memberPhone  }"> <br>
			주소 <br>		
			<input type="text"  	name="memberAddr1"  value="${member.memberAddr1  }"> <br>
			상세주소 <br>
			<input type="text"		name="memberAddr2"  value="${member.memberAddr2  }"> <br>
			<input type="submit" name = "modify" value="수정하기">
			<button><a href="/member/removeView.ztp?memberId=${member.memberId }">탈퇴하기</a></button>
		</form>
			</main>
			<footer>
			<jsp:include page="../common/footer.jsp" />
			</footer>
			<script>
			// 클릭 이벤트 핸들러
			  function updateSidebar() {
			    // 현재 URL 가져오기
			    let currentUrl = window.location.href;

			    // 매개 변수 추가 또는 업데이트
			    if (currentUrl.indexOf('?') === -1) {
			      currentUrl += '?aria-current=true';
			    } else {
			      currentUrl += '&aria-current=true';
			    }

			    // URL 업데이트
			    window.location.href = currentUrl;
			  }

			  
				  const elements = document.querySelectorAll('.list-group-item');
				  elements.forEach(element => {
				    element.addEventListener('click', () => {
				      // Remove the "selected" class from all elements
				      elements.forEach(el => {
				        el.classList.remove('active');
				      });
				      // Add the "selected" class to the clicked element
				      element.classList.add('active');
				    });
				  });
			</script>
	</body>
</html>