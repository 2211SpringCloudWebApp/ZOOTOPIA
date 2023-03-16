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
				
				<c:if test="${aPost.adoptPost.adoptWriterId eq loginUser.memberId }">
					<!-- 작성자라면 예약 신청자 정보 확인하기 신청자 목록 페이지 새 창(신청자 누르면 신청자 정보 Detail)-->
					<input type="button" value="신청자 정보 확인" onclick="location.href='/reservation/applicantList.ztp?animalNo=${aPost.animal.animalNo }'">
					<a href="#">수정하기</a>
					<a href="#">삭제하기</a>
				</c:if>
				<c:if test="${aPost.adoptPost.adoptWriterId ne loginUser.memberId }">
					<!-- 작성자가 아니라면 예약페이지-->
					<input type="button" value="예약하기" onclick="openReservation('${aPost.animal.animalNo}', '${aPost.animal.animalFosterId}')">
					
				</c:if>
			</div>

			<div>
				댓글
			</div>
        
		</main>

		<jsp:include page="../common/footer.jsp" />
		
		<script>

			// 새 창으로 데이터 전달하기
			function openReservation(animalNo, animalFosterId) {
				console.log(animalNo);
				console.log(animalFosterId);
				const url = '/reservation/registerView.ztp?animalNo=' + animalNo + '&animalFosterId=' + animalFosterId;
				window.open(url, 'pop', 'width=300, height=200');
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