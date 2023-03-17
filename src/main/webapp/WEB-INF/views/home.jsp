<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<html>

		<head>
			<title>ZOOTOPIA❤️</title>
			<link rel="stylesheet" href="../../resources/css/home.css">
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<link rel="icon" href="../../resources/img/favicon.png"/>
			<link rel="apple-touch-icon" href="../../resources/img/favicon.png"/>	
		</head>

		<body>
			<jsp:include page="./common/header.jsp" />
			<main>
				<!-- 버튼 nav -->
				<nav>
					<ul>
						<li><a href="#" data-target="#section1">Main</a></li>
						<li><a href="#" data-target="#section2">Adopt</a></li>
						<li><a href="#" data-target="#section3">Review</a></li>
						<li><a href="#" data-target="#section4">Matching</a></li>
						<!-- <li><a href="#" data-target="#section5">Notice</a></li> -->
					</ul>
				</nav>

				<!-- 메인 -->
				<div>
					<!-- Main Section  -->
					<section id="section1">
						<!-- 위에 헤더를 위한 공간 빼둘 div -->
						<div></div>
						<div id="background-img">
							<div>DON'T BUY, PLEASE ADOPT</div>
							<div><span>ZOO</span><span>TOPIA</span></div>
							<div>주토피아에서 어쩌구를 저쩌구 해보세요!</div>
						</div>
					</section>

					<!-- AdoptPost Section -->
					<section id="section2">
						<!-- 위에 헤더를 위한 공간 빼둘 div -->
						<div></div>
						<!-- 입양 공고 관련 내용이 들어갈 자리 -->
						<div>
							<h1 onclick="location.href='/adoptAnimal/registerView.ztp'">입양 공고 등록하기</h1>
							<h1 onclick="location.href='/adoptAnimal/list.ztp'">입양 공고 확인하기</h1>
						</div>
					</section>

					<!-- Review Section -->
					<section id="section3">
						<!-- 위에 헤더를 위한 공간 빼둘 div -->
						<div></div>
						<!-- 입양 후기 관련 내용이 들어갈 자리 -->
						<!--
					후기는 본인만 쓸 수 있으니까 후기 등록 버튼 누르면
					내 입양 동물 목록으로 이동
					비로그인 상태라면 로그인해야 이용할 수 있다고 팝업 띄우고
					로그인 페이지로 이동
				-->
						<div>
							<c:if test="${sessionScope.loginUser ne null }">
								<!-- 로그인 상태라면 내 입양 동물 목록으로 -->
								<h1 onclick="location.href='#'">입양 후기 등록하기 - 로그인 상태</h1>
							</c:if>
							<c:if test="${sessionScope.loginUser eq null }">
								<!-- 비로그인 상태라면 로그인해야 이용 가능하단 팝업
							띄우고 로그인 페이지로 이동 -->
								<h1 onclick="location.href='#'">입양 후기 등록하기 - 비로그인상태</h1>
							</c:if>

							<h1 onclick="location.href='#'">입양 후기 확인하기</h1>
						</div>
					</section>

					<!-- Matching Section -->
					<section id="section4">
						<!-- 위에 헤더를 위한 공간 빼둘 div -->
						<div></div>
						<!-- 매칭 관련 내용이 들어갈 자리 -->
						<div>
							<h1 onclick="location.href='#'">매칭 페이지로 이동하기</h1>
						</div>
					</section>

					<!-- Notice Section -->
					<!-- <section id="section5"> -->
						<!-- 위에 헤더를 위한 공간 빼둘 div -->
						<!-- <div></div> -->
						<!-- 공지 관련 내용이 들어갈 자리 -->
						<!-- <div> -->
							<!-- <h1 onclick="location.href='#'">공지 페이지로 이동하기</h1> -->
						<!-- </div> -->
					<!-- </section> -->

					<!-- Footer Section -->
					<section id="footer">
						<!-- footer JSP include 들어갈 자리 -->
						<jsp:include page="./common/footer.jsp" />
					</section>

				</div>
			</main>




			<script>
				// 현재 위치 섹션 판별 함수
				function setCurrentButton() {
					$('nav a').removeClass('active transparent');
					var currentSection;
					$('section').each(function () {
						if (($(this).offset().top - $(window).scrollTop()) <= 0) {
							currentSection = $(this).attr('id');
						}
					});

					if (currentSection === 'footer' || ($(window).scrollTop() + $(window).height()) >= $(document).height()) {
						$('nav a').addClass('transparent');
					} else {
						$('nav a[data-target="#' + currentSection + '"]').addClass('active');
					}
				}

				$(document).ready(function () {
					// 초기 활성 버튼 설정
					setCurrentButton();

					// 스크롤, 버튼 클릭 이벤트 발생 시 함수 호출
					$(window).on('scroll', function () {
						setCurrentButton();
					});

					// 마우스 휠 이벤트 처리
					$(window).on('wheel', function (event) {
						// 마우스 휠을 아래로 스크롤할 때
						if (event.originalEvent.deltaY > 0) {
							// 다음 섹션으로 이동
							$('html, body').stop().animate({
								scrollTop: $(event.target).closest('section').next().offset().top
							}, 500);
						}
						// 마우스 휠을 위로 스크롤할 때
						else {
							// 이전 섹션으로 이동
							if ($(event.target).closest('section').attr('id') === 'footer') {
								// 푸터에서 section4로 이동
								$('html, body').stop().animate({
									scrollTop: $('#section4').offset().top
								}, 500);
							} else {
								// 그 외의 경우에는 이전 섹션으로 이동
								$('html, body').stop().animate({
									scrollTop: $(event.target).closest('section').prev().offset().top
								}, 500);
							}
						}
					});

					// 버튼 클릭 이벤트 처리
					$('nav a').on('click', function (event) {
						event.preventDefault();
						// 클릭한 버튼이 이동할 위치를 data-target 속성에서 가져옴
						var target = $(this).data('target');
						// 해당 위치로 이동
						$('html, body').stop().animate({
							scrollTop: $(target).offset().top
						}, 500);
					});
				});

			</script>
		</body>

		</html>