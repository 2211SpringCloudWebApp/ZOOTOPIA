<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기 디테일 페이지</title>
</head>
<body>

    <form role="form" action="/review/modify.ztp" method="post">
        <table>
            <thead>
                <!-- 제목 및 좋아요/공유/댓글버튼 -->
                <tr>
                    <td>제목 : ${review.reviewTitle}</td>
                    <td rowspan="2">
                        <c:if test="${like == 1}"><button>좋아요 취소</button></c:if>
                        <c:if test="${like == 0}"><button>좋아요</button></c:if>
                        <button>공유</button>
                        <button>댓글</button>
                    </td>
                </tr>
                <tr>
                	<td>작성자 : ${review.reviewWriterId}</td>
                </tr>
            </thead>
        </table>

        <!-- 후기 내용 -->
        <div id="review-detail-content">
            ${review.reviewContent}
        </div>
        <div>
            <img src="#" alt="첨부파일1">
            <img src="#" alt="첨부파일2">
        </div>
    </form>
    <!-- 수정, 삭제버튼 위치 -->
    <div>
        <button type="submit">수정</button>
        <button type="button" onclick="deleteReview()">삭제</button>
    </div>
    
    <!-- 댓글 -->
    <div>
        <div>
            <!-- 댓글 입력부분, 회원에게만 보여짐 -->
            <c:if test="${sessionScope.memberId ne null}">
                <input type="text" placeholder="댓글을 입력해 주세요">
                <button type="submit">등록</button>
            </c:if>
        </div>
        <div>
            <!-- 댓글 출력부분 -->
            <c:if test="${commentList ne null}">
                <table>
                    <c:forEach var="comment" items="${commentList}">
                        <tr>
                            <td>${comment.commentWriterId}</td>
                            <td>${comment.commentContent}</td>
                            <td>${comment.commentWriteDate}</td>
                            <td><c:if test="${sessionScope.memberId eq comment.commentWriterId}">삭제</c:if></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>test-작성자2</td>
                        <td>test-내용2</td>
                        <td>test-작성일2</td>
                        <td>삭제</td>
                    </tr>
                    <tr>
                        <td>test-작성자3</td>
                        <td>test-내용3</td>
                        <td>test-작성일3</td>
                        <td>삭제</td>
                    </tr>
                </table>
            </c:if>
        </div>
        
    </div>

    <script>

        function deleteReview() {

            var reviewPostNo = "${review.reviewPostNo}";

            if(confirm("정말로 삭제하시겠습니까?")) {

                    location.href = "/review/delete.ztp?reviewPostNo=" + reviewPostNo;

            }

        }
    </script>
</body>
</html>