<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>주토피아 메인 페이지</title>
		<link rel="stylesheet" href="../../resources/css/home.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<div id="container">
			<header>
	
					<div id="mainLogo-area" onclick="location.href='#">
						<!-- 로고 누르면 메인페이지로 이동하게 할 거임! -->
						<div id="mainLogo-img">
							<img src="../../resources/img/logo-img-white.png" alt="">
						</div>
						<div id="mainLogo-txt">
							<div>ZOOTOPIA</div>
						</div>
					</div>
	
					<div id="navigation-bar">
						<ul>
							<li>
								<div class="menu-list">
									<div>ADOPT</div>
									<div class="drop-down">
										<div>입양글 등록</div>
										<div>입양글 확인</div>
									</div>
								</div>
							</li>
							<li>
								<div class="menu-list">
									<div>REVIEW</div>
								</div>
							</li>
							<li>
								<div class="menu-list">
									<div>MATCHING</div>
								</div>
							</li>
						</ul>
					</div>
	
			</header>
			<main>
				<aside id="left-aside">
					<button>MAIN</button>
					<button>ADOPT</button>
					<button>REVIEW</button>
					<button>MATCHING</button>
					<button>dddd</button>
				</aside>
				<section>
					<div id="content-1">

						<div>
							<c:if test="${sessionScope.memberId eq null }">
								<input type="button" onclick="location.href='/member/registerView.ztp'" value="회원가입">
								<input type="button" onclick="location.href='/member/loginView.ztp'" value="로그인" >
							</c:if>
							<c:if test="${sessionScope.memberId ne null }">
								<div>${memberName }님 환영합니다!</div>
							</c:if>

						</div>

					</div>

					<div id="content-2">
						<!-- 입양 공고 관련 -->
						<div id="main-container">
							<div class="main-image image1"><img src="../resources/images/고8.jpg"></div>
							<div class="main-image image2"><img src="../resources/images/강8.jpg"></div>
							<div class="main-button btn1"><button class="button" onclick="location.href='';">입양 글 등록하기 ></button></div>
							<div class="main-button btn2"><button class="button" onclick="location.href='';">등록 동물 확인하기 ></button></div>
						</div>
					</div>

					<div id="content-3">
						<!-- 입양 후기 관련 -->
					</div>

					<div id="content-4">
						<!-- 매칭 관련 -->
					</div>
					
					<div id="content-5"></div>
				</section>
				<aside id="right-aside">
					<button onclick="#">
						<div class="right-aside-line2">로그인 / <br>회원가입</div>
					</button>
					<button>
						<div class="right-aside-line1">어쩌구</div>
						<div class="right-aside-line2">1588-<br>0000</div>
					</button>
					<button>
						<div class="right-aside-line1">고객센터</div>
						<div class="right-aside-line2">1588-<br>0000</div>
					</button>
					<button>
						<div class="right-aside-line1">gdgdg</div>
						<div class="right-aside-line2">저쩌구<br>어쩌구</div>
					</button>
				</aside>
			</main>
			<footer>
				<div id="content-6">
					<div id="footer-yellow">
						<div id="footer-yellow-list">
							<ul>
								<li>
									<a href="#">이용약관</a>
								</li>
								<li>
									<a href="#">개인정보취급방침</a>
								</li>
							</ul>
						</div>
					</div>
					<div id="footer-black">
						<section id="footer-black-section1">
							<div id="footer-logo-n-sns">
								<div id="footer-logo">
									<img src="" alt="">
								</div>
								<div id="footer-sns">
	
									<div class="footer-sns-list">
										<div class="footer-sns-btn-circle">
											<img src="" alt="">
										</div>
									</div>
	
									<div class="footer-sns-list">
										<div class="footer-sns-btn-circle">
											<img src="" alt="">
										</div>
									</div>
	
									<div class="footer-sns-list">
										<div class="footer-sns-btn-circle">
											<img src="" alt="">
										</div>
									</div>
								
								</div>
							</div>
							<div id="footer-text">
								<div id="footer-text-line1">
									<span>주식회사 앤하우스</span>
									<span>대표자 이유정</span>
									<span>본사대표번호 02-335-0656</span>
									<span>FAX 02-325-5199</span>
								</div>
								<div id="footer-text-line2">
									<span>사업자등록번호 105-87-51467</span>
									<span>서울특별시 강남구 강남대로 518 11층, 13층 (주)앤하우스</span>
								</div>
								<div id="footer-text-line3">
									<span>개인정보보호 관리책임자 이호민</span>
								</div>
							</div>
						</section>
						<section id="footer-black-section2">
							footer section2
						</section>
					</div>
				</div>
			</footer>
		</div>
	
		<script>
			// MAIN, ADOPT, REVIEW, MATCHING, ddd 버튼 만들기
			const content = document.querySelectorAll("[id|=content]");
			const naviBtn = document.querySelectorAll("#left-aside button");
			const normalColor = "#1c1c1b3a";
			const selectedColor = "#1C1C1B";
	
			for (let i = 0; i < naviBtn.length; i++) {
				naviBtn[i].addEventListener("click", () => {
					for (let j = 0; j < naviBtn.length; j++) {
						naviBtn[j].style.color = normalColor;
					}
					content[i].scrollIntoView({ behavior:"smooth"});
					naviBtn[i].style.color = selectedColor;
				});
			}
	
			// 기본 이벤트 제거하기
			window.addEventListener("wheel", function(e){
				e.preventDefault;
			}, {passive: false});
			
	
			// 페이지 선언
			var $html = $("html");
			var page = 1;
			var lastPage = $("[id|=content]").length;
	
			$html.animate({scrollTop:0},700);
	
			// 마우스 휠 굴렸을 때 이벤트 넣기
			$(window).on("wheel", function(e){
				
				if($html.is(":animated")) return;
				
				if(e.originalEvent.deltaY > 0){
					if(page == lastPage) return;
					page++;
					for (let j = 0; j < naviBtn.length; j++) {
						naviBtn[j].style.color = normalColor;
					}
					if (page-1 != 5) {
						naviBtn[page-1].style.color = selectedColor;
					}
				} else if (e.originalEvent.deltaY < 0) {
					if(page == 1) return;
					page--;
					for (let j = 0; j < naviBtn.length; j++) {
						naviBtn[j].style.color = normalColor;
					}
					naviBtn[page-1].style.color = selectedColor;
				}
				var posTop = (page-1) * $(window).height();
				
				$html.animate({scrollTop : posTop});
				
			});
			//  MAIN, ADOPT, REVIEW, MATCHING, ddd 버튼 끝!
			
		</script>
	</body>
</html>
