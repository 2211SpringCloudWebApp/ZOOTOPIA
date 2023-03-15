<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>ZOOTOPIA</title>
		<link rel="stylesheet" href="../../resources/css/home.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<div id="container">

			<div id="header-top">
				<div>
					<c:if test="${sessionScope.loginUser eq null }">
						<!-- 로그인, 회원가입 페이지로 이동하는 링크 -->
						
						<div onclick="location.href='/member/loginView.ztp'" class="main-header-btn">
							<img src="../../resources/img/login-icon.png" alt="" class="log-img">
							LOGIN
						</div>
						<div>|</div>
						<div onclick="location.href='/member/registerView.ztp'" class="main-header-btn">
							<img src="../../resources/img/join-icon.png" alt="" class="log-img">
							JOIN
						</div>
					</c:if>
					<c:if test="${sessionScope.loginUser ne null }">
						<!-- 로그아웃, 마이페이지로 이동하는 링크 -->
						<div onclick="location.href='/member/logout.ztp'" class="main-header-btn">
							<img src="../../resources/img/logout-icon.png" alt="" class="log-img">
							LOGOUT
						</div>
						<div>|</div>
						
						<!-- 관리자가 아니라면 마이페이지 -->
						<c:if test="${loginUser.mAdminYN eq 'N' }">
							<div onclick="location.href='/member/mypage.ztp'" class="main-header-btn">
								<img src="../../resources/img/mypage-icon.png" alt="" class="log-img">
								<span>${loginUser.memberName } </span>님 마이페이지
							</div>
						</c:if>
						
						<!-- 관리자가 맞다면 관리자페이지 -->
						<c:if test="${loginUser.mAdminYN ne 'N' }">
							<div onclick="location.href='#'" class="main-header-btn">
								<img src="../../resources/img/mypage-icon.png" alt="" class="log-img">
								<span>관리자 </span>페이지
							</div>
						</c:if>
						
					</c:if>
					
				</div>
			</div>
			
			<main>
				<aside id="left-aside">
	                <button>MAIN</button>
	                <button>ADOPT</button>
	                <button>REVIEW</button>
	                <button>MATCHING</button>
	                <button>NOTICE</button>
            	</aside>
				<section>
					<div id="content-1">
						<div id="background-img"></div>
					</div>

					<div id="content-2">
						<div>
							<!-- 입양 공고 관련 -->
							<h1>테스트입니다</h1>
							<h1 onclick="location.href='/adoptAnimal/registerView.ztp'">입양 공고 등록하기</h1>
							<h1 onclick="location.href='/adoptAnimal/list.ztp'">입양 공고 확인하기</h1>
						</div>
					</div>

					<div id="content-3">
						<div>
							<!-- 입양 후기 관련 -->
							<!--
								후기는 본인만 쓸 수 있으니까 후기 등록 버튼 누르면
								내 입양 동물 목록으로 이동
								비로그인 상태라면 로그인해야 이용할 수 있다고 팝업 띄우고
								로그인 페이지로 이동
							-->
							<h1>테스트입니다</h1>
							
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
					</div>

					<div id="content-4">
						<div>
							<!-- 매칭 관련 -->
							<h1>테스트입니다</h1>
							<h1 onclick="location.href='#'">매칭 페이지로 이동하기</h1>
						</div>
					</div>
					
					<div id="content-5">
						<div>
							<!-- 공지 관련 -->
							<h1>테스트입니다</h1>
							<h1 onclick="location.href='#'">공지 페이지로 이동하기</h1>
						</div>
					</div>

				</section>
			</main>

			<jsp:include page="./common/footer.jsp" />
			
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
