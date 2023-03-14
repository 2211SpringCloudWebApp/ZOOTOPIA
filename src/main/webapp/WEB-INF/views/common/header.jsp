<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/css/header.css">
</head>
<header>

	<div id="header-top">
		<div>
			<c:if test="${sessionScope.memberId eq null }">
				<!-- 로그인, 회원가입 페이지로 이동하는 링크 -->
				<div onclick="location.href='#'" class="main-header-btn">
					<img src="../../resources/img/login-icon.png" alt="" class="log-img">
					LOGIN
				</div>
				<div>|</div>
				<div onclick="location.href='#'" class="main-header-btn">
					<img src="../../resources/img/join-icon.png" alt="" class="log-img">
					JOIN
				</div>
			</c:if>
			<c:if test="${sessionScope.memberId ne null }">
				<!-- 로그아웃, 마이페이지로 이동하는 링크 -->
				<div onclick="location.href='#'" class="main-header-btn">
					<img src="../../resources/img/logout-icon.png" alt="" class="log-img">
					LOGOUT
				</div>
				<div>|</div>
				<div onclick="location.href='#'" class="main-header-btn">
					<img src="../../resources/img/mypage-icon.png" alt="" class="log-img">
					<span>이유정 </span>님 마이페이지
				</div>
			</c:if>
		</div>
	</div>

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

