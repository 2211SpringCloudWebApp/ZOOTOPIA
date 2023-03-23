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


		<div id="adoptPost-area">

			<div id="writer-and-date">
				<div>작성자 ${aPost.adoptPost.adoptWriterId }</div>
				<c:set var="adoptCreateTimeStamp" value="${aPost.adoptPost.adoptCreateDate }" />
				<c:set var="aTime" value="${fn:substring(adoptCreateTimeStamp, 0, 16)}" />	
				<div>${aTime }</div>
			</div>

			<div id="modify-remove-btn-area">
				<!-- 로그인 상태일 경우 -->
				<c:if test="${loginUser.memberId ne null}">
					<!-- 로그인 아이디가 작성자라면 수정삭제 btn -->
					<c:if test="${aPost.adoptPost.adoptWriterId eq loginUser.memberId }">
						<button onclick="(
							function() { 
								var bool = confirm('정말로 삭제하시겠습니까?');
								if (bool) {
									location.href = '/adoptAnimal/delete.ztp?animalNo=${aPost.animal.animalNo }';
								}
								return bool
							}
							)();">삭 제</button>
						<button onclick="location.href='/adoptAnimal/modifyView.ztp?animalNo=${aPost.animal.animalNo }'">수 정</button>
					</c:if>
				</c:if>
			</div>

			<div id="ivory-area">
				<!-- 이미지 -->
				<div id="ivory-image-area">

					<c:if test="${aPost.adoptPost.adoptImageName eq null}">
						<div>이미지 없음</div>
					</c:if>

					<c:if test="${aPost.adoptPost.adoptImageName ne null}">

						<c:set var="imageNames" value="${aPost.adoptPost.adoptImageName}" />
						<c:set var="imageNameArr" value="${fn:split(imageNames, ';')}" />

						<table>
							<c:forEach var="imageName" items="${imageNameArr}" varStatus="status">
								<c:if test="${status.index % 2 == 0}">
									<tr>
								</c:if>
										<td>
											<img src="../../../resources/uploadFiles/${imageName }" alt="" class="modal-trigger" data-modal-target="#modal-${imageName }">
											<div id="modal-${imageName }" class="modal">
												<div class="modal-content">
													<img src="" alt="모달 이미지" />
													<span class="close">&times;</span>
												</div>
											</div>
										</td>
								<c:if test="${status.index % 2 == 1 || status.last}">
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:if>
					<!-- 이미지가 있는 경우 if문 끝 -->
				</div>

				<div id="ivory-info-area">
					<div>
						<div>축종 : ${aPost.animal.animalSpecies }</div>
						<div>지역 : ${aPost.animal.animalAddr }</div>
	
						<!-- 성별 -->
						<c:if test="${aPost.animal.animalGender eq null}">	
							<div>성별 : 알 수 없음</div>
						</c:if>
						<c:if test="${aPost.animal.animalGender ne null}">
							<div>성별 : ${aPost.animal.animalGender }</div>				
						</c:if>
	
						<!-- 체중 -->
						<c:if test="${aPost.animal.animalWeight eq 0}">
							<div>체중 : 알 수 없음</div>
						</c:if>
						<c:if test="${aPost.animal.animalWeight ne 0}">
							<div>체중 : ${aPost.animal.animalWeight }</div>
						</c:if>
	
						<!-- 나이 -->
						<c:if test="${aPost.animal.animalAge eq 0}">
							<div>나이 : 알 수 없음</div>
						</c:if>
						<c:if test="${aPost.animal.animalAge ne 0}">
							<div>나이 : ${aPost.animal.animalAge }</div>
						</c:if>
	
						<!-- 중성화 여부 -->
						<c:if test="${aPost.animal.neuterYN eq null}">	
							<div>중성화 여부 : 알 수 없음</div>
						</c:if>
						<c:if test="${aPost.animal.neuterYN ne null}">
							<div>중성화 여부 : ${aPost.animal.neuterYN }</div>				
						</c:if>
						
						<div>게시글내용 : ${aPost.adoptPost.adoptContent }</div>
					</div>
				</div>
			</div>	
			
			<div id="grey-area">
				<div>
					<img src="../../../resources/img/icon-comment.png" alt="">
					<div>&nbsp;댓글</div>
				</div>
				<div id="comment-area">
					<div id="comment-n-replyComment-area">
		
						<!-- 댓글 등록하는 폼태그 시작 -->
						<form action="/adoptAnimal/addComment.ztp" method="post" id="commentForm">
							<input type="hidden" name="boardId" value="${aPost.adoptPost.boardId }">
							<input type="hidden" name="postNo" value="${aPost.adoptPost.adoptPostNo }">
							<input type="hidden" name="parentCommentNo" value="0">
							<input type="hidden" name="commentWriterId" value="${loginUser.memberId }">
							<!-- animalNo에 해당하는 aPost를 다시 가져오기 위함 -->
							<input type="hidden" name="animalNo" value="${aPost.animal.animalNo }">
							<input type="text" name="commentContent" placeholder="&nbsp;&nbsp;&nbsp;댓글을 입력해주세요!">
		
							<!-- 로그인이 된 상태일 경우 -->
							<c:if test="${loginUser.memberId ne null}">
								<button type="submit" id="comment-btn">등록</button>
							</c:if>
							<!-- 로그인이 안 된 상태일 경우 -->
							<c:if test="${loginUser.memberId eq null}">
								<button type="submit" onclick="return checkLogin()">댓글 등록(로그인 ㄴㄴ)</button>
							</c:if>
						</form>
						<!-- 댓글 등록하는 폼태그 종료 -->
		
						<!-- 여기부터 댓글 리스트 출력 -->
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
										<input type="text" name="commentContent" value="${comment.commentContent }">
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
								<input type="text" name="commentContent" placeholder="댓글을 입력해주세요!">
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
			</div>
			
		</div>

		<!-- 관심, 공유, 예약, 신청자정보 버튼 공간 시작 -->
		<div>
			<button type="button" class="like-button" data-board-id="${aPost.adoptPost.boardId }"
				data-post-no="${aPost.adoptPost.adoptPostNo }">관심</button>
			<input type="button" value="공유">

			<br>

			<!-- 로그인이 안 된 상태일 경우 -->
			<c:if test="${loginUser.memberId eq null}">
				<!-- 예약신청버튼 : 누르면 로그인 alert와 함께 로그인 페이지로 이동-->
				<input type="button" value="예약하기" onclick="checkLogin()">
			</c:if>

			<!-- 로그인이 된 상태일 경우 -->
			<c:if test="${loginUser.memberId ne null}">
				<!-- 작성자라면 신청자List확인할 수 있는 btn -->
				<c:if test="${aPost.adoptPost.adoptWriterId eq loginUser.memberId }">
					<input type="button" value="신청자 정보 확인" onclick="applicantList('${aPost.animal.animalNo }')">
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
		</div>
		<!-- 관심, 공유, 예약, 신청자정보 버튼 공간 끝 -->

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

		// 페이지 스크롤에 따라 상단 베이지 배경 높이 조절
        // 처음 페이지가 열렸을 때
		window.addEventListener('load', function() {
		document.getElementById('section1').style.height = '250px';
		});

		// 스크롤 할 때 
		window.addEventListener('scroll', function() {
		// 스크롤 위치 계산
		var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
		// 스크롤을 내린 경우
		if (scrollTop > 0 && scrollTop < 250) {
			document.getElementById('section1').style.height = (250 - scrollTop) + 'px';
		}
		// 스크롤을 올린 경우
		else if (scrollTop <= 0) {
			document.getElementById('section1').style.height = '250px';
		}
		// 스크롤을 더 내린 경우
		else {
			document.getElementById('section1').style.height = '0';
		}
		});

	</script>

</body>

</html>