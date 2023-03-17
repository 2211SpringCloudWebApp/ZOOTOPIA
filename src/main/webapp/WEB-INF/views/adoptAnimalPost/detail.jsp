<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양 공고</title>
		<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="stylesheet" href="../../../resources/css/adoptAnimalPost_detail.css">
	</head>
	<body>
		
		
		<jsp:include page="../common/header.jsp" />

        <main>
			<h1>입양 공고 디테일 페이지입니다</h1>
			<div>
				<div>동물등록번호 : ${aPost.animal.animalNo }</div>
				<div>축종 : ${aPost.animal.animalSpecies }</div>
				<div>성별 : ${aPost.animal.animalGender }</div>
				<div>체중 : ${aPost.animal.animalWeight }</div>
				<div>나이 : ${aPost.animal.animalAge }</div>
				<div>중성화여부 : ${aPost.animal.neuterYN }</div>
				<div>지역 : ${aPost.animal.animalAddr }</div>
				<div>ㅡㅡㅡㅡㅡㅡ</div>
				<div>작성자아이디 : ${aPost.adoptPost.adoptWriterId }</div>
				<div>작성일 : ${aPost.adoptPost.adoptCreateDate }</div>
				<div>게시글내용 : ${aPost.adoptPost.adoptContent }</div>
			</div>

			<div>
				<button type="button" class="like-button" data-board-id="${aPost.adoptPost.boardId }" data-post-no="${aPost.adoptPost.adoptPostNo }">관심</button>
				<span>112312</span>
				<input type="button" value="공유">
				
				<br>
				
				<!-- 로그인이 된 상태일 경우 -->
				<c:if test="${loginUser.memberId ne null}">
				
					<!-- 작성자라면 신청자List확인할 수 있는 btn + 수정삭제 -->
					<c:if test="${aPost.adoptPost.adoptWriterId eq loginUser.memberId }">
						<!-- 
							<input type="button" value="신청자 정보 확인" onclick="location.href='/reservation/applicantList.ztp?animalNo=${aPost.animal.animalNo }'">						
						 -->
						<input type="button" value="신청자 정보 확인" onclick="applicantList('${aPost.animal.animalNo }')">
						<a href="#">수정하기</a>
						<a href="#">삭제하기</a>
					</c:if>
					
					<!-- 작성자가 아니라면 예약신청 or 예약취소-->
					<c:if test="${aPost.adoptPost.adoptWriterId ne loginUser.memberId }">
						
						<c:forEach items="${rList}" var="reservation" varStatus="status">
							${reservation.adopterId }
							${loginUser.memberId }
							<c:if test="${reservation.adopterId eq loginUser.memberId }">
								입양자 있음!
							</c:if>
						</c:forEach>
						
						<!-- 예약신청버튼 : 신청자가 아닐 경우-->
						<c:if test="">
							<input type="button" value="예약하기" onclick="openReservation('${aPost.animal.animalNo}', '${aPost.animal.animalFosterId}')">
						</c:if>
						
						<!-- 예약취소버튼 : 신청자일 경우-->
						<c:if test="">
							<input type="button" value="예약취소" onclick="location.href='#'">
						</c:if>
					
					</c:if>
					
				</c:if>
				
				<!-- 로그인이 안 된 상태일 경우 -->
				<c:if test="${loginUser.memberId eq null}">
				
					<!-- 예약신청버튼 : 누르면 로그인 alert와 함께 로그인 페이지로 이동-->
					<input type="button" value="예약하기" onclick="checkLogin()">
					
				</c:if>
				
				
				
			</div>

			<div>
				댓글
			</div>
        
		</main>

		<jsp:include page="../common/footer.jsp" />
		
		<script>
			// 비로그인 상태에서 예약하기 버튼 눌렀을 경우 알림과 함께 로그인 페이지로 이동
			function checkLogin() {
				alert("로그인 시 이용 가능한 서비스입니다.");
				location.href = "/member/loginView.ztp";
			}

			// 새 창으로 데이터 전달하기
			function openReservation(animalNo, animalFosterId) {
				const url = '/reservation/registerView.ztp?animalNo=' + animalNo + '&animalFosterId=' + animalFosterId;
				window.open(url, 'pop', 'width=300, height=200');
			}
			function applicantList(animalNo) {
				const url = '/reservation/applicantList.ztp?animalNo=' + animalNo;
				window.open(url, 'pop', 'width=300, height=500');
			}


			// 좋아요
			$(document).ready(function() {
				$('.like-button').click(function() {
					var boardId = $(this).data('board-id');
					var postNo = $(this).data('post-no');
					$.ajax({
						url: "<c:url value ='/adoptAnimal/like.ztp' />",
						type: 'POST',
						data: { boardId: boardId, postNo: postNo },
						success: function(response) {
							// 좋아요 버튼의 텍스트를 업데이트합니다.
							$('.like-button').text('관심 ' + likeCount);
							// var likeCount = response.likeCount;
							// var buttonText = '관심' + likeCount;
							// $(this).text(buttonText);
						}
					});
				});
			});
			
		</script>
		
	</body>
</html>