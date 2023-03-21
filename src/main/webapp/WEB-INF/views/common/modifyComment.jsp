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
                            <%-- <input type="hidden" name="commentWriterId" value="${sessionScope.loginUser.memberId}">
                            <input type="hidden" name="boardId" value="${comment.boardId}">
                            <input type="hidden" name="postNo" value="${comment.postNo}">
                            <input type="hidden" name="url" value="${url}"> --%>
                            <textarea name="commentContent" placeholder="댓글을 입력해 주세요" class="comment-content">${comment.commentContent}</textarea>
                        </div>
                        <div class="comment-button">
                            <button type="button" onclick="modifyComment(${sessionScope.loginUser.memberId}, ${comment.boardId}, ${comment.postNo});" class="comment-submit-button">수정</button>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
    
    <script>
    
    	function modifyComment(commentWriterId, boardId, postNo) {
    		
    		var url = '${url}';
    		var commentContent = document.querySeletor(textarea).innerHTML;
    		console.log(commentWriterId);
    		console.log(boardId);
    		console.log(postNo);
    		console.log(url);
    		console.log(commentContent);
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
            var object5 = document.createElement('textarea');
            object4.setAttribute('display', 'none');
            object4.setAttribute('name', 'commentContent');
            object4.setAttribute('value', commentContent);
            form.appendChild(object1);
            form.appendChild(object2);
            form.appendChild(object3);
            form.appendChild(object4);
            form.appendChild(object5);
            form.setAttribute('method', 'post');
            form.setAttribute('action', '/comment/modify.ztp');
            document.body.appendChild(form);
            form.submit();
            
    		<!--    	document.querySelector('#form').submit();
			window.opener.location.reload();    //부모창 reload
    		window.close();    //현재 팝업창 Close -->
    		
    	}
    	
    </script>
</body>
</html>