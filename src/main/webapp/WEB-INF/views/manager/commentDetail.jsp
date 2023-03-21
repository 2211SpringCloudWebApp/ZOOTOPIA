<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글디테일</title>
		<link rel="stylesheet" href="../../../resources/css/manager/memberDetail.css">
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<main>
			<div id="titleTag">
		    	<h1>댓글정보</h1>
		    </div>
			    <table>
		            <tr>
		                <td><span>게시판</span></td>
	                    <c:if test="${comment.boardId  eq 'A'}">
		                    <td>입양공고</td>
	                    </c:if>
	                    <c:if test="${comment.boardId  eq 'R'}">
		                    <td>입양후기</td>
	                    </c:if>
	                    <c:if test="${comment.boardId  eq 'N'}">
		                    <td>공지사항</td>
	                    </c:if>
		            </tr>
		            <tr>
		                <td><span>게시물번호</span></td>
		                <td>${comment.postNo }</td>
		            </tr>
		            <tr>
		                <td><span>댓글내용</span></td>
		                <td>${comment.commentContent }</td>		            
		            </tr>
		            <tr>
		                <td><span>댓글작성자ID</span></td>
		                <td>${comment.commentWriterId }</td>
		            </tr>
		            <tr>
		                <td><span>댓글작성시간</span></td>
		                <td>${comment.commentCreateDate }</td>
		            </tr>
			    </table>
			    <div id="buttonTag">
				    <button onclick="deleteBtn()">댓글삭제</button>
			    </div>
	    </main>
	    <jsp:include page="../common/footer.jsp" />
	    
	    <script>
			function deleteBtn(){
				var commentNo = "${comment.commentNo}";
				if(confirm("해당댓글을 삭제하시겠습니까?")){
					location.href="/manager/deleteComment.ztp?commentNo="+commentNo;					
				} 	
			}
	    </script>
	</body>
</html>