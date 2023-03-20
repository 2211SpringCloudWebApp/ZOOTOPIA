<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>댓글 수정</title>
    <link rel="stylesheet" href="../../../resources/css/review.css">
</head>
<body>
    <div class="comment">
        <div class="commentForm-wrapper" style="width: 800px; height: 180px;">
            <div>
                <span>댓글 수정</span> <img src="../../../resources/img/icon-comment.png" style="width: 20px; height: 20px;">
            </div>
            <c:if test="${sessionScope.loginUser.memberId ne null}">
                <div class="commentInput-wrapper">
                    <form name="commentForm" action="/comment/modify.ztp" method="post">
                        <div class="comment-form" style="width: 600px;">
                            <input type="hidden" name="commentWriterId" value="${sessionScope.loginUser.memberId}">
                            <input type="hidden" name="boardId" value="${comment.boardId}">
                            <input type="hidden" name="postNo" value="${comment.postNo}">
                            <input type="hidden" name="url" value="${url}">
                            <textarea name="commentContent" placeholder="댓글을 입력해 주세요" class="comment-content">${comment.commentContent}</textarea>
                        </div>
                        <div class="comment-button">
                            <button type="submit" onclick="window.close();" class="comment-submit-button">수정</button>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>