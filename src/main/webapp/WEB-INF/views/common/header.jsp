<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/header.css">
</head>
<header>
	<div id="navigation-bar">
		<ul>

			<li>
				<!-- 로고 누르면 메인페이지로 이동하게 할 거임! -->
				<div id="mainLogo-area" onclick="location.href='#">
					<div id="mainLogo-img">
						<img src="../../../resources/img/logo-img-white.png" alt="">
					</div>
					<div id="mainLogo-txt">
						<div>ZOOTOPIA</div>
					</div>
				</div>
			</li>

			<li>
				<div class="menu-list">
					<div>ADOPT</div>
					<div class="menu-list-bar"></div>
					<div class="drop-down">
						<div onclick="location.href='#'">입양공고 등록</div>
						<div onclick="location.href='#'">입양공고 확인</div>
					</div>
				</div>
			</li>

			<li>
				<div class="menu-list">
					<div>REVIEW</div>
					<div class="menu-list-bar"></div>
					<div class="drop-down">
						<!--
							후기는 본인만 쓸 수 있으니까 후기 등록 버튼 누르면
							내 입양 동물 목록으로 이동
							비로그인 상태라면 로그인해야 이용할 수 있다고 팝업 띄우고
							로그인 페이지로 이동
						-->
						<div onclick="location.href='#'">입양후기 등록</div>
						<div onclick="location.href='#'">입양후기 확인</div>
					</div>
				</div>
			</li>

			<li>
				<div class="menu-list">
					<div>MATCHING</div>
					<div class="menu-list-bar"></div>
					<div class="drop-down">
						<div onclick="location.href='#'">매칭서비스</div>
					</div>
				</div>
			</li>

			<li>
				<div class="menu-list">
					<div>NOTICE</div>
					<div class="menu-list-bar"></div>
					<div class="drop-down">
						<div onclick="location.href='#'">공지사항</div>
					</div>
				</div>
			</li>

		</ul>
	</div>

</header>

<aside id="right-aside">

	<!-- 로그인 상태일 경우 로그아웃 버튼 -->
	<button onclick="location.href='#'" id="log-btn">
		<div>
			LOG<br>IN
		</div>
	</button>

	<!-- 얘는 아예 로그인 상태일 경우에만 노출 -->
	<button onclick="location.href='#'" id="mypage-btn">
		<div>
			<img src="../../../resources/img/myPage-brown.png" alt="마이페이지">
		</div>
	</button>
</aside>

