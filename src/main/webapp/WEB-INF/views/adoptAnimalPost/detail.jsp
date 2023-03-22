<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>입양 공고 - 동물등록번호 : ${aPost.animal.animalNo }❤️</title>
	<link rel="stylesheet" href="../../../resources/css/adoptAnimalPost/adoptAnimalPost_detail.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="icon" href="../../../resources/img/favicon.png" />
	<link rel="apple-touch-icon" href="../../../resources/img/favicon.png" />
	<style type="text/css">
		body{ cursor:url("../../../resources/img/cursor.png"), auto;}
	</style>
</head>

<body>


	<jsp:include page="../common/header.jsp" />

	<main>
		<!-- 헤더 부분 피하기 위한 div -->
		<div></div>


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
			<div>ㅇㅣ미지 출력 : ${aPost.adoptPost.adoptImageName }</div>
			<c:set var="imageNames" value="${aPost.adoptPost.adoptImageName}" />
			<c:set var="imageNameArr" value="${fn:split(imageNames, ';')}" />
			<c:forEach var="imageName" items="${imageNameArr}">
				<img src="../../../resources/uploadFiles/${imageName }" alt="" class="modal-trigger" data-modal-target="#modal-${imageName }">
				<div id="modal-${imageName }" class="modal">
					<div class="modal-content">
						<img src="" alt="모달 이미지" />
						<span class="close">&times;</span>
					</div>
				</div>
			</c:forEach>
			
		</div>

		<div>
			<button type="button" class="like-button" data-board-id="${aPost.adoptPost.boardId }"
				data-post-no="${aPost.adoptPost.adoptPostNo }">관심</button>
			<input type="button" value="공유">

			<br>

			<!-- 로그인이 된 상태일 경우 -->
			<c:if test="${loginUser.memberId ne null}">

				<!-- 작성자라면 신청자List확인할 수 있는 btn + 수정삭제 -->
				<c:if test="${aPost.adoptPost.adoptWriterId eq loginUser.memberId }">
					<input type="button" value="신청자 정보 확인" onclick="applicantList('${aPost.animal.animalNo }')">

					<!-- 모달창으로 바꿀 신청자 리스트, 내용 알아서 수정해 -->
					<c:forEach items="${rList}" var="reservation" varStatus="status">
						<div>예약번호 : ${reservation.reservationNo } / 예약자Id : ${reservation.adopterId }</div>
					</c:forEach>
					<div>예약자 선정은 고객센터로 연락주시면 처리해드림</div>

					<button onclick="location.href='/adoptAnimal/modifyView.ztp?animalNo=${aPost.animal.animalNo }'">수정하기</button>
					<button onclick="(
						function() { 
							var bool = confirm('정말로 삭제하시겠습니까?');
							if (bool) {
								location.href = '/adoptAnimal/delete.ztp?animalNo=${aPost.animal.animalNo }';
							}
							return bool
						}
					)();">삭제하기</button>
				</c:if>

				<!-- 작성자가 아니라면 예약신청 or 예약취소-->
				<c:if test="${aPost.adoptPost.adoptWriterId ne loginUser.memberId }">

					<!-- 신청자가 없다면 바로 예약 하기 버튼 -->
					<c:if test="${empty rList }">
						<input type="button" value="예약하기" onclick="openReservation('${aPost.animal.animalNo}', '${aPost.animal.animalFosterId}')">
					</c:if>

					<!-- 신청자가 있다면 신청자 중에 로그인한 본인이 있는지 확인 후 있다면 취소 없다면 예약버튼 -->
					<c:if test="${not empty rList }">

						<!-- 로그인 회원이 예약자라면 true = 취소버튼 -->
						<c:set var="flag" value="false" />
						<c:set var="reservationNo" value="" />
						<c:forEach items="${rList}" var="reservation" varStatus="status">
							<c:if test="${reservation.adopterId eq loginUser.memberId }">
								<c:set var="flag" value="true" />
								<c:set var="reservationNo" value="${reservation.reservationNo}" />
								<!-- break;와 같은 역할을 함 -->
								<c:set var="status" value="${status.last}" />
							</c:if>
						</c:forEach>
						<c:if test="${flag}">
							<!-- flag가 true일 때 수행할 코드 -->
							<input type="button" value="예약취소" onclick="(
								function() { 
									var bool = confirm('정말로 취소하시겠습니까?');
									if (bool) {
										location.href = '/reservation/delete.ztp?reservationNo=${reservationNo }&animalNo=${aPost.animal.animalNo }';
									}
									return bool
								}
							)();">
						</c:if>
						<c:if test="${not flag}">
							<!-- flag가 false일 때 수행할 코드 -->
							<input type="button" value="예약하기" onclick="openReservation('${aPost.animal.animalNo}', '${aPost.animal.animalFosterId}')">
						</c:if>

					</c:if> <!-- 신청자가 있다면 끝 -->

				</c:if>  <!-- 작성자가 아니라면 끝 -->

			</c:if>  <!-- 로그인 상태일 경우 끝 -->

			<!-- 로그인이 안 된 상태일 경우 -->
			<c:if test="${loginUser.memberId eq null}">

				<!-- 예약신청버튼 : 누르면 로그인 alert와 함께 로그인 페이지로 이동-->
				<input type="button" value="예약하기" onclick="checkLogin()">

			</c:if>



		</div>

		<div>
			댓글

			<h1>댓글 등록 부분</h1>
			<h3>boardId : ${aPost.adoptPost.boardId }</h3>
			<h3>postNo : ${aPost.adoptPost.adoptPostNo }</h3>
			<h3>commentWriterId : ${loginUser.memberId }</h3>

			<div id="comment-n-replyComment-area">

				<!-- 댓글 등록하는 폼태그 시작 -->
				<form action="/adoptAnimal/addComment.ztp" method="post" id="commentForm">
					<input type="hidden" name="boardId" value="${aPost.adoptPost.boardId }">
					<input type="hidden" name="postNo" value="${aPost.adoptPost.adoptPostNo }">
					<input type="hidden" name="parentCommentNo" value="0">
					<input type="hidden" name="commentWriterId" value="${loginUser.memberId }">
					<!-- animalNo에 해당하는 aPost를 다시 가져오기 위함 -->
					<input type="hidden" name="animalNo" value="${aPost.animal.animalNo }">
					<textarea name="commentContent" rows="3"></textarea>
					<br>

					<!-- 로그인이 된 상태일 경우 -->
					<c:if test="${loginUser.memberId ne null}">
						<input type="submit" value="댓글 등록">
					</c:if>
					<!-- 로그인이 안 된 상태일 경우 -->
					<c:if test="${loginUser.memberId eq null}">
						<button type="submit" onclick="return checkLogin()">댓글 등록(로그인 ㄴㄴ)</button>
					</c:if>
				</form>
				<!-- 댓글 등록하는 폼태그 종료 -->

				<h1>댓글 리스트 출력</h1>
				<!-- parentCommentNo = 0인 댓글만 가져와서 출력함 -->
				<c:forEach var="comment" items="${commentList }">
					<!-- 부모댓글번호가 0인 댓글 = 대댓글이 아닌 댓글만!  -->
					<c:if test="${comment.parentCommentNo == 0}">
						<div class="comment">
							<div>작성자 : ${comment.commentWriterId }
								<button class="replyCommentBtn" data-comment-no="${comment.commentNo }">답글작성</button>
								<c:if test="${comment.commentWriterId eq loginUser.memberId}">
									<button class="updateCommentBtn" data-comment-no="${comment.commentNo }" id="updateCommentBtn-${comment.commentNo }">수정</button>
									<button onclick="(
										function() { 
											var bool = confirm('정말로 삭제하시겠습니까?');
											if (bool) {
												location.href = '/adoptAnimal/deleteComment.ztp?commentNo=${comment.commentNo }&boardId=${comment.boardId }&postNo=${comment.postNo }&animalNo=${aPost.animal.animalNo }';
											}
											return bool
										}
									)();">삭제</button>
								</c:if>
							</div>
							<div id="commentContent-${comment.commentNo }">${comment.commentContent }</div>
							<form action="/adoptAnimal/updateComment.ztp" method="post" id="commentContentUpadteArea-${comment.commentNo }">

								<!-- 다시 해당 디테일로 돌아오기 위해 animalNo 전달 -->
								<input type="hidden" name="animalNo" value="${aPost.animal.animalNo }">

								<!-- 쿼리문에 이용할 것들 -->
								<input type="hidden" name="boardId" value="${comment.boardId }">
								<input type="hidden" name="postNo" value="${comment.postNo }">
								<input type="hidden" name="commentNo" value="${comment.commentNo }">
								<textarea name="commentContent" cols="30" rows="10">${comment.commentContent }</textarea>

								<button type="submit">수정하기</button>
							</form>
							<br>
						</div>
					</c:if>

					<!-- 대댓글 등록하는 폼태그 시작 -->
					<form action="/adoptAnimal/addComment.ztp" method="post" class="commentReplyForm"
						id="commentReplyForm-${comment.commentNo}">
						<input type="hidden" name="boardId" value="${aPost.adoptPost.boardId }">
						<input type="hidden" name="postNo" value="${aPost.adoptPost.adoptPostNo }">
						<input type="hidden" name="parentCommentNo" value="${comment.commentNo }">
						<input type="hidden" name="commentWriterId" value="${loginUser.memberId }">
						<!-- animalNo에 해당하는 aPost를 다시 가져오기 위함 -->
						<input type="hidden" name="animalNo" value="${aPost.animal.animalNo }">
						<textarea name="commentContent" rows="3"></textarea>
						<br>

						<!-- 로그인이 된 상태일 경우 -->
						<c:if test="${loginUser.memberId ne null}">
							<input type="submit" value="댓글 등록">
						</c:if>
						<!-- 로그인이 안 된 상태일 경우 -->
						<c:if test="${loginUser.memberId eq null}">
							<button type="submit" onclick="return checkLogin()">댓글 등록(로그인 ㄴㄴ)</button>
						</c:if>
					</form>
					<!-- 대댓글 등록하는 폼태그 종료 -->

					<!-- 대댓글 리스트 출력 -->
					<c:forEach var="replyComment" items="${commentList }">
						<c:if test="${replyComment.parentCommentNo eq comment.commentNo}">
							<div class="replyComment">
								<div>작성자 : ${replyComment.commentWriterId }
									<c:if test="${replyComment.commentWriterId eq loginUser.memberId}">
										<button class="updateCommentBtn" data-comment-no="${replyComment.commentNo }" id="updateCommentBtn-${replyComment.commentNo }">수정</button>
										<button onclick="(
											function() { 
												var bool = confirm('정말로 삭제하시겠습니까?');
												if (bool) {
													location.href = '/adoptAnimal/deleteComment.ztp?commentNo=${replyComment.commentNo }&boardId=${replyComment.boardId }&postNo=${replyComment.postNo }&animalNo=${aPost.animal.animalNo }';
												}
												return bool
											}
										)();">삭제</button>
									</c:if>
								</div>
								<div id="commentContent-${replyComment.commentNo }">${replyComment.commentContent }</div>
								<form action="/adoptAnimal/updateComment.ztp" method="post" id="commentContentUpadteArea-${replyComment.commentNo }">
									<!-- 다시 해당 디테일로 돌아오기 위해 animalNo 전달 -->
									<input type="hidden" name="animalNo" value="${aPost.animal.animalNo }">

									<!-- 쿼리문에 이용할 것들 -->
									<input type="hidden" name="boardId" value="${replyComment.boardId }">
									<input type="hidden" name="postNo" value="${replyComment.postNo }">
									<input type="hidden" name="commentNo" value="${replyComment.commentNo }">
									<textarea name="commentContent" cols="30" rows="10">${replyComment.commentContent }</textarea>

									<button type="submit">수정하기</button>
								</form>
								<br>
							</div>
						</c:if>
					</c:forEach>

				</c:forEach>

			</div>


		</div>

	</main>

	<jsp:include page="../common/footer.jsp" />

	<script>
		// 모달 창 열기
		var modal = document.querySelector(".modal");
		var img = document.querySelectorAll(".modal-trigger");
		var modalImg = document.querySelector(".modal-content img");
		var span = document.querySelector(".close");

		img.forEach(function (el) {
			el.onclick = function () {
				modal.style.display = "block";
				modalImg.src = this.src;
				$('body').style.overflow = 'hidden';
			};
		});

		// 모달 창 닫기
		span.onclick = function () {
			modal.style.display = "none";
			$('body').style.overflow = 'auto';
		};


		// 댓글 수정 버튼 누르면 해당 댓글 comentContent div, 수정버튼이  숨겨지고 textArea 창, 수정하기(submit) 버튼이 뜨도록 하기
		$(document).on('click', '.updateCommentBtn', function () {

			var commentNo = $(this).data('comment-no');

			$('#commentContent-' + commentNo).hide();
			$('#updateCommentBtn-' + commentNo).hide();
			
			$('#commentContentUpadteArea-' + commentNo).show();

		});



		// 답글 작성 버튼 누르면 해당 댓글의 답글 작성 창이 뜨도록 하기
		$(document).on('click', '.replyCommentBtn', function () {
			var commentNo = $(this).data('comment-no');
			$('#commentReplyForm-' + commentNo).show();
		});

		// 대댓글 리스트 ajax로 출력하기
		$(document).ready(function () {
			$(".commentReplyForm").submit(function (e) {
				e.preventDefault();

				var formData = $(this).serialize();
				$.ajax({
					url: $(this).attr("action"),
					type: "POST",
					data: formData,
					dataType: "html",
					success: function (result) {
						// 가져온 데이터에서 댓글 영역 추출
						var commentAndReply = $(result).find("#comment-n-replyComment-area").html();
						// var main = $(result).find("main").html();

						// 댓글 목록 정보를 업데이트
						$("#comment-n-replyComment-area").html(commentAndReply);
						// $("main").html(main);

						// 아마 이것만 쓰면 헤더푸터 또 2개댈듯???
						// $("#commentList").html(result);

						// 입력 폼에 입력했던 댓글 내용 지우기
						$("#commentReplyForm textarea").val("");
					}

				});
			});
		});

		// 댓글 리스트 ajax로 출력하기
		$(document).ready(function () {
			$("#commentForm").submit(function (e) {
				e.preventDefault();
				var formData = $(this).serialize();
				$.ajax({
					url: $(this).attr("action"),
					type: "POST",
					data: formData,
					dataType: "html",
					success: function (result) {
						// 가져온 데이터에서 대댓글 영역 추출
						var commentAndReply = $(result).find("#comment-n-replyComment-area").html();
						// var main = $(result).find("main").html();

						// 댓글 목록 정보를 업데이트
						$("#comment-n-replyComment-area").html(commentAndReply);
						// $("main").html(main);

						// 아마 이것만 쓰면 헤더푸터 또 2개댈듯???
						// $("#commentList").html(result);

						// 입력 폼에 입력했던 댓글 내용 지우기
						$("#commentForm textarea").val("");
					}
				});
			});
		});



		// 비로그인 상태에서 예약하기 버튼 눌렀을 경우 알림과 함께 로그인 페이지로 이동
		function checkLogin() {
			alert("로그인 시 이용 가능한 서비스입니다.");
			location.href = "/member/loginView.ztp";
			return false;
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
		$(document).ready(function () {
			$('.like-button').click(function () {
				var boardId = $(this).data('board-id');
				var postNo = $(this).data('post-no');
				$.ajax({
					url: "<c:url value ='/adoptAnimal/like.ztp' />",
					type: 'POST',
					data: { boardId: boardId, postNo: postNo },
					success: function (response) {
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