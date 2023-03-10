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
        <!-- 제목 및 좋아요/공유/댓글버튼 -->
        <div>
            <div id="review-detail-header-left">${reviewTitle}</div>
            <div id="review-detail-header-right">
                <c:if test="${like == 1}"><img scr="#" alt="좋아요 활성" onclick=""></c:if>
                <c:if test="${like == 0}"><img scr="#" alt="좋아요 비활성" onclick=""></c:if>
                <img src="#" alt="공유" onclick="shareReview()">
                <img src="#" alt="댓글" onclick="commentReview()">
            </div>
        </div>

        <!-- 후기 내용 -->
        <div id="review-detail-content">
            <!-- ${reviewContent} -->
            테스트
            테스트
            테스트
            테스트
            테스트
            테스트
            테스트
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

            var reviewNo = "${review.reviewNo}";

            if(confirm("정말로 삭제하시겠습니까?")) {

                    location.href = "/review/delete.ztp?reviewNo=" + reviewNo;

            }

        }
    </script>
</body>
</html>