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
	<main>
    <div class="comment">
        <div class="commentForm-wrapper" style="width: 800px; height: 180px;">
            <div>
                <span>댓글 수정</span> <img src="../../../resources/img/icon-comment.png" style="width: 20px; height: 20px;">
            </div>
            <c:if test="${sessionScope.loginUser.memberId ne null}">
                <div class="commentInput-wrapper">
                	<div class="comment-form" style="width: 600px;">
                        <%-- <input type="hidden" name="commentWriterId" value="${sessionScope.loginUser.memberId}">
                        <input type="hidden" name="boardId" value="${comment.boardId}">
                        <input type="hidden" name="postNo" value="${comment.postNo}">
                        <input type="hidden" name="url" value="${url}"> --%>
                        <textarea class="comment-content">${comment.commentContent}</textarea>
                    </div>
                    <div class="comment-button">
                        <button class="comment-submit-button" type="button" onclick="modifyComment('${sessionScope.loginUser.memberId}', '${comment.boardId}', ${comment.postNo});" class="comment-submit-button">수정</button>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    </main>
    <script>
    
    	function modifyComment(commentWriterId, boardId, postNo) {
    		
    		var url = '${url}';
    		var commentContent = document.querySelector('textarea').value;
    		var commentNo = ${comment.commentNo};
    		
    		var form = document.createElement("form");
            var object1 = document.createElement('input');
            object1.setAttribute('type', 'hidden');
            object1.setAttribute('name', 'boardId');
            object1.setAttribute('value', boardId);
            form.appendChild(object1);
            var object2 = document.createElement('input');
            object2.setAttribute('type', 'hidden');
            object2.setAttribute('name', 'postNo');
            object2.setAttribute('value', postNo);
            form.appendChild(object2);
            var object3 = document.createElement('input');
            object3.setAttribute('type', 'hidden');
            object3.setAttribute('name', 'commentNo');
            object3.setAttribute('value', commentNo);
            form.appendChild(object3);
            var object4 = document.createElement('input');
            object4.setAttribute('type', 'hidden');
            object4.setAttribute('name', 'url');
            object4.setAttribute('value', url);
            form.appendChild(object4);
            var object5 = document.createElement('input');
            object5.setAttribute('type', 'hidden');
            object5.setAttribute('name', 'commentContent');
            object5.setAttribute('value', commentContent);
            form.appendChild(object5);
            var object6 = document.createElement('input');
            object6.setAttribute('type', 'hidden');
            object6.setAttribute('name', 'commentWriterId');
            object6.setAttribute('value', commentWriterId);
            form.appendChild(object6);
            form.setAttribute('method', 'post');
            form.setAttribute('action', '/comment/modify.ztp');
            window.opener.document.body.appendChild(form);
            form.submit();
            
        	window.close();
    		
    	}
    	
    </script>
</body>
</html>