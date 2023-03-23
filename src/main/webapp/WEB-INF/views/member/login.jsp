<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
		<link rel="stylesheet" href="../../../resources/css/member/login.css">
		<!-- Font Awesome -->
    	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    	<!-- Google Fonts -->
    	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
		<!-- MDB -->
    	<link  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet"/>
    	<title>Document</title>
	</head>
	<body>
	<header>
	<jsp:include page="../common/header.jsp" />
	</header>
	<main>
		<div></div>
		<section class="vh-100">
			<div class="container py-5 h-100">
				<div class="row d-flex align-items-center justify-content-center h-100">
					<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
						<h1>LOG IN</h1>
						<form action="/member/login.ztp" method="post">
							<!-- Email input -->
							<div class="form-outline mb-4">
								<input type="text" id="form1Example13"  name="memberId" class="form-control form-control-lg" />
								<label class="form-label" for="form1Example13">아이디</label>
							</div>

							<!-- Password input -->
							<div class="form-outline mb-4">
								<input type="password" id="form1Example23" name="memberPw" class="form-control form-control-lg" />
								<label class="form-label" for="form1Example23">비밀번호</label>
							</div>

							<div class="d-flex justify-content-around align-items-center mb-4">
								<!-- a태크 -->
								<a href="/member/findIdPage.ztp" id ="tagA1">아이디 찾기</a>|
								<a href="/member/findPwPage.ztp" id ="tagA2">비밀번호 찾기</a>|
								<a href="/member/registerView.ztp" id ="tagA3">회원가입</a>
							</div>

							<!-- Submit button -->
							<button type="submit" class="btn btn-primary btn-lg btn-block" id="login_btn">로그인</button>
							<div class="divider d-flex align-items-center my-4">
								<p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
							</div>
							<a class="btn btn-primary btn-lg btn-block"
								style="background-color: #3b5998" href="#!" role="button"> <i
								class="fab fa-facebook-f me-2"></i>Continue with Facebook
							</a> <a class="btn btn-primary btn-lg btn-block"
								style="background-color: #55acee" href="#!" role="button"> <i
								class="fab fa-twitter me-2"></i>Continue with Twitter
							</a>
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- MDB -->
	</main>
	<footer>
	<jsp:include page="../common/footer.jsp" />
	</footer>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	</body>
</html>