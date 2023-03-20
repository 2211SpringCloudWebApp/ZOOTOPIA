<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기 디테일 페이지</title>
    <link rel="stylesheet" href="../../../resources/css/review.css">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
	<main>
		<div class="review-wrapper">
	
	        <div class="review-detail">
	            로그인된 ID : ${sessionScope.loginUser.memberId}<br>
	            글작성자 ID : ${review.reviewWriterId}<br>
	            글 NO : ${review.reviewPostNo}<br>
	            <br>
	            <table>
	                <thead>
	                    <!-- 제목 및 좋아요/공유버튼 -->
	                    <tr>
	                        <td>제목 : ${review.reviewTitle}</td>
	                        <td rowspan="2">
	                            <!-- 좋아요 - 회원에게만 보여짐 -->
	                            <c:if test="${like == 1 && sessionScope.loginUser.memberId ne null}"><img class="detail-icons" src="../../../resources/img/button_like_on.png" alt="좋아요 on" onclick="like()"></c:if>
	                            <c:if test="${like == 0 && sessionScope.loginUser.memberId ne null}"><img class="detail-icons" src="../../../resources/img/button_like_off.png" alt="좋아요 off" onclick="like()"></c:if>
	                            <c:if test="${like == 0 && sessionScope.loginUser.memberId ne null}"></c:if>
	                            <!-- 공유 -->
	                            <img class="detail-icons" src="../../../resources/img/button_share.png" alt="공유">
	                            <img class="detail-icons" src="../../../resources/img/button_comment.png" alt="댓글">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>작성자 : ${review.reviewWriterId}</td>
	                    </tr>
	                </thead>
	            </table>
				<!-- 입양한 동물에 대한 내용 -->
                <ul>
                    <li>사진 : <img src="../../../resources/uploadFiles/review/${review.reviewImageName}"></li>
                    <li>종류 : ${Animal.animalSpecies}</li>
                    <li>성별 : ${Animal.animalGender}</li>
                    <li>나이 : ${Animal.animalAge}</li>
                    <li>성격 : ${Animal.animalCharacter}</li>
                    <li>분양자 : ${Animal.animalFosterId}</li>
                </ul>

	            <!-- 후기 내용 -->
	            <form role="form" action="/review/modify.ztp" method="post">
	                <div id="review-detail-content">
	                    ${review.reviewContent}
	                </div>
	            </form>
	            <!-- 수정, 삭제버튼 위치 -->
	            <div>
	                <c:if test="${review.reviewWriterId eq sessionScope.loginUser.memberId}">
	                <button type="submit">수정</button>
	                <button type="button" onclick="deleteReview()">삭제</button>
	                </c:if>
	            </div>
	            
	            <!-- 댓글 -->
	            <div class="comment">
	            	<div class="commentForm-wrapper">
		            	<div>
	                    	<span>댓글</span> <img src="../../../resources/img/icon-comment.png" style="width: 20px; height: 20px;">
	                    </div>
	            		<c:if test="${sessionScope.loginUser.memberId ne null}">
		            		<div class="commentInput-wrapper">
				                <form name="commentForm" action="/comment/insert.ztp" method="post">
			            			<div class="comment-form">
					                    <input type="hidden" name="commentWriterId" value="${sessionScope.loginUser.memberId}">
					                    <input type="hidden" name="boardId" value="${boardId}">
					                    <input type="hidden" name="postNo" value="${review.reviewPostNo}">
					                    <input type="hidden" name="url" value="/review/detail.ztp?reviewPostNo=">
					                    <textarea name="commentContent" placeholder="댓글을 입력해 주세요" class="comment-content"></textarea>
									</div>
									<div class="comment-button">
					                    <button type="submit" class="comment-submit-button">등록</button>
					                </div>
				                </form>
			                </div>
		                </c:if>
		                
		                <div class="comment-output">
			                <table>
			                    <c:forEach items="${commentList}" var="commentList">
			                        <tr>
			                            <td id="comment-td1">${commentList.commentWriterId}</td>
			                            <td id="comment-td2">${commentList.commentContent}</td>
			                            <td id="comment-td3"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${commentList.commentCreateDate}" /></td>
			                            <c:if test="${sessionScope.loginUser.memberId eq commentList.commentWriterId}">
			                            	<td id="comment-td4">
			                            		<button onclick="modifyComment(${commentList.commentNo}, 'R');">
			                            			<img src="../../../resources/img/icon-modify.png" style="width: 15px; height: auto;">
			                            		</button>
			                            	</td>
			                            </c:if>
			                            <c:if test="${sessionScope.loginUser.memberId eq review.reviewWriterId || sessionScope.loginUser.memberId eq commentList.commentWriterId || sessionScope.loginUser.mAdminYN eq 'Y'}">
			                            	<td id="comment-td5">
			                            		<button onclick="deleteComment(${commentList.commentNo}, 'R');">
			                            			<img src="../../../resources/img/icon-trash.png" style="width: 15px; height: auto;">
			                            		</button>
			                            	</td>
			                            </c:if>
			                        </tr>
			                    </c:forEach>
			                </table>
		                </div>
					</div>
				</div>
			</div>
		</div>
    </main>
    <jsp:include page="../common/footer.jsp" />

    <script>
    
    	var url = "/review/detail.ztp?reviewPostNo=";

        function deleteReview() {

            var reviewPostNo = "${review.reviewPostNo}";

            if(confirm("정말로 삭제하시겠습니까?")) {
                    location.href = "/review/delete.ztp?reviewPostNo=" + reviewPostNo;
            }

        }

		function modifyComment(commentNo, boardId) {

			window.open(
					"/comment/modifyView.ztp?boardId="+boardId+"&postNo="+${review.reviewPostNo}+"&commentNo="+commentNo+"&url="+url
					, "댓글 수정"
					, "directories=no, titlebar=no, toolbar=no, status=no, menubar=no, location=no,width=820, height=200, scrollbars=no");

		}
		
		function deleteComment(commentNo, boardId) {
			
			if(confirm("정말 삭제하시겠습니까?")) {

                var form = document.createElement("form");
                var object1 = document.createElement('input');
                object1.setAttribute('type', 'hidden');
                object1.setAttribute('name', 'boardId');
                object1.setAttribute('value', boardId);
                var object2 = document.createElement('input');
                object2.setAttribute('type', 'hidden');
                object2.setAttribute('name', 'postNo');
                object2.setAttribute('value', '${review.reviewPostNo}');
                var object3 = document.createElement('input');
                object3.setAttribute('type', 'hidden');
                object3.setAttribute('name', 'commentNo');
                object3.setAttribute('value', commentNo);
                var object4 = document.createElement('input');
                object4.setAttribute('type', 'hidden');
                object4.setAttribute('name', 'url');
                object4.setAttribute('value', url);
                form.appendChild(object1);
                form.appendChild(object2);
                form.appendChild(object3);
                form.appendChild(object4);
                form.setAttribute('method', 'post');
                form.setAttribute('action', '/comment/delete.ztp');
                document.body.appendChild(form);
                form.submit();

			}
		}

        function like() {

            var form = document.createElement('form');

            var object1 = document.createElement('input');
            object1.setAttribute('type', 'hidden');
            object1.setAttribute('name', 'postNo');
            object1.setAttribute('value', '${review.reviewPostNo}');
            var object2 = document.createElement('input');
            object2.setAttribute('type', 'hidden');
            object2.setAttribute('name', 'likeMemberId');
            object2.setAttribute('value', '${sessionScope.loginUser.memberId}');
            var object3 = document.createElement('input');
            object3.setAttribute('type', 'hidden');
            object3.setAttribute('name', 'boardId');
            object3.setAttribute('value', 'R');
            var object4 = document.createElement('input');
            object4.setAttribute('type', 'hidden');
            object4.setAttribute('name', 'url');
            object4.setAttribute('value', url);
            
            if ('${like}' == 1) {
                form.appendChild(object1);
                form.appendChild(object2);
                form.appendChild(object3);
                form.appendChild(object4);
                form.setAttribute('method', 'post');
                form.setAttribute('action', '/like/cancelLike.ztp');
                document.body.appendChild(form);
                form.submit();
            } else if ('${like}' == 0) {
                form.appendChild(object1);
                form.appendChild(object2);
                form.appendChild(object3);
                form.appendChild(object4);
                form.setAttribute('method', 'post');
                form.setAttribute('action', '/like/insertLike.ztp');
                document.body.appendChild(form);
                form.submit();
            }

        }
        
        function insertComment() {
        	
        	if(document.querySelector("[name=commentContent]").value == "") {
                alert("내용을 입력해주세요");
                return alert;
            } else {
                document.commentForm.submit();
                window.location.reload();
            }
        }

    </script>
</body>
</html>