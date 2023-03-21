<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../../../resources/css/header.css">
	
	<!-- 정훈님이 추가해달라고 하신 거 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
	
	<!-- 정훈님이 추가해달라고 하신 거 -->

<header>

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
					<div onclick="location.href='/manager/viewManager.ztp'" class="main-header-btn">
						<img src="../../resources/img/mypage-icon.png" alt="" class="log-img">
						<span>관리자 </span>페이지
					</div>
				</c:if>

			</c:if>
		</div>
	</div>

	<div id="navigation-bar">
		<ul>

			<li>
				<!-- 로고 누르면 메인페이지로 이동하게 할 거임! -->
				<div id="mainLogo-area" onclick="location.href='/'">
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
						<c:if test="${sessionScope.loginUser ne null }">
							<!-- 로그인 상태라면 입양 공고 등록 폼으로 -->
							<div onclick="location.href='/adoptAnimal/registerView.ztp'">입양공고 등록</div>
						</c:if>
						<c:if test="${sessionScope.loginUser eq null }">
							<!-- 
								비로그인 상태라면 로그인해야 이용 가능하단 팝업
								띄우고 로그인 페이지로 이동
							-->
							<div onclick="(
									function() { 
										// alert('로그인 시 이용 가능한 서비스입니다.');
										// location.href = '/member/loginView.ztp';
										swal('로그인 필요', '로그인이 필요한 서비스입니다', 'warning').then(function(){location.href='/member/loginView.ztp';});
										
									}
								)();">입양공고 등록</div>
						</c:if>
						<div onclick="location.href='/adoptAnimal/list.ztp'">입양공고 확인</div>
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

						<c:if test="${sessionScope.loginUser ne null }">
							<!-- 로그인 상태라면 내 입양 동물 목록으로 -->
							<div onclick="location.href='/member/animalList.ztp'">입양후기 등록</div>
						</c:if>
						<c:if test="${sessionScope.loginUser eq null }">
							<!-- 
								비로그인 상태라면 로그인해야 이용 가능하단 팝업
								띄우고 로그인 페이지로 이동
							-->
							<div onclick="(
									function() { 
										// alert('로그인 시 이용 가능한 서비스입니다.');
										// location.href = '/member/loginView.ztp';
										swal('로그인 필요', '로그인이 필요한 서비스입니다', 'warning').then(function(){location.href='/member/loginView.ztp';});
									}
								)();">입양후기 등록</div>
						</c:if>
						<div onclick="location.href='/review/list.ztp'">입양후기 확인</div>
					</div>
				</div>
			</li>

			<li>
				<div class="menu-list">
					<div>MATCHING</div>
					<div class="menu-list-bar"></div>
					<div class="drop-down">
						<div onclick="location.href='/matching/mainView.ztp'">매칭서비스</div>
					</div>
				</div>
			</li>

			<li>
				<div class="menu-list">
					<div>NOTICE</div>
					<div class="menu-list-bar"></div>
					<div class="drop-down">
						<div onclick="location.href='/notice/list.ztp'">공지사항</div>
					</div>
				</div>
			</li>

		</ul>
	</div>
	
</header>

