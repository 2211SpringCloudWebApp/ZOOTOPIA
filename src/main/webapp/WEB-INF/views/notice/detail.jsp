<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세 조회</title>
<!-- 		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">		 -->
		<link rel="stylesheet" href="../../../resources/css/notice.css">
		<style>
		</style>
	</head>
	<body>
		<header>
			<jsp:include page="../common/header.jsp" />
		</header>
		<main>
			<div></div>
<!-- 			<h1>공지사항</h1> -->
<!--         	<hr> -->
				<c:if test="${sessionScope.loginUser.memberId eq 'admin' }">
					<div class="removeArea">
						<c:url var="nList" value="/notice/list.ztp">
							<c:param name="noticeNo" value="${notice.noticeNo }"/>
						</c:url>
							<a href="javascript:void(0);" onclick="removeCheck(${notice.noticeNo });">삭제</a>
							<a href="${nList }">목록</a>
					</div>			
				<form action="/notice/modify.ztp" method="post" enctype="multipart/form-data">
					<div id="detailInput">
						<input type="text" class="detailInput" name="noticeSubject" value="${notice.noticeSubject }">
						<input type="text" class="detailInput" name="noticeWriter" value="${notice.noticeWriter }"><br>
					</div>
					<textarea name="noticeContent" id=""  rows="15" cols="70">${notice.noticeContent }</textarea><br>
					<label class="fileBtn" for="inputFile">
						<img src="../../../resources/img/notice-file.png" alt="" >
					</label>
					<input type="file" id="inputFile" name="reloadFile" value="" style="display:none">${notice.noticeImageName }
					<br>
					<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
					<input type="hidden" name="noticeImageName" value="${notice.noticeImageName }">
					<input type="hidden" name="noticeImagePath" value="${notice.noticeImagePath }">
					<input type="submit" class="" value="수정">
					<input type="reset" class="" value="취소"> 
				</form>
<%-- 					<c:url var="nDelete" value="/notice/remove.ztp">			 --%>
<%-- 						<c:param name="noticeNo" value="${notice.noticeNo }"/>   --%>
<%-- 					</c:url>													 --%>
			</c:if>
			<c:if test="${sessionScope.loginUser.memberId ne 'admin' }">
				<div class="removeArea">
					<c:url var="nList" value="/notice/list.ztp">
						<c:param name="noticeNo" value="${notice.noticeNo }"/>
					</c:url>
					<a href="${nList }">목록</a><br>
				</div>
				<form action="/notice/modify.ztp" method="post" enctype="multipart/form-data">
					<div id="detailInput">
						<input type="text" class="subjectInput" name="noticeSubject" value="${notice.noticeSubject }" readonly>
						<input type="text" class = "writerInput" name="noticeWriter" value="${notice.noticeWriter }" readonly><br>
					</div>
					<textarea name="noticeContent" id=""  rows="15" cols="70" readonly>${notice.noticeContent }</textarea><br>
					<div class="uploadArea">
						<label class="fileBtn" for="inputFile">
							<img src="../../../resources/img/notice-file.png" alt="" >
						</label>
					</div>
					<input type="file" id="inputFile" name="reloadFile" value="" style="display:none">${notice.noticeImageName }<br>
					<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
					<input type="hidden" name="noticeImageName" value="${notice.noticeImageName }">
					<input type="hidden" name="noticeImagePath" value="${notice.noticeImagePath }">
				</form>
			</c:if>
			
			<!-- 댓글 -->
			<div class="comment">
				<c:if test="${sessionScope.loginUser.memberId ne null}">
				<form name="commentForm" action="/comment/insert.ztp" method="post">
					<input type="hidden" name="commentWriterId" value="${sessionScope.loginUser.memberId}">
					<input type="hidden" name="boardId" value="N">
					<input type="hidden" name="postNo" value="${notice.noticeNo}">
					<input type="hidden" name="url" value="/notice/detail.ztp?noticeNo=">
					<input type="text" name="commentContent" placeholder="댓글을 입력해 주세요">
					<button type="submit" class="">등록</button>
				</form>
				</c:if>
				<table>
					<c:forEach items="${commentList}" var="commentList">
						<tr>
							<td>${commentList.commentWriterId}</td>
							<td>${commentList.commentContent}</td>
<%-- 							<td><c:if test="${sessionScope.loginUser.memberId ne null}"><button onclick="reComment()" class="">대댓글</button></c:if> --%>
							<td><c:if test="${sessionScope.loginUser.memberId eq 'admin' || sessionScope.loginUser.memberId eq commentList.commentWriterId}"><button onclick="deleteComment(${commentList.commentNo});" class="">삭제</button></c:if></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</main>
		<footer>
			<jsp:include page="../common/footer.jsp" />
		</footer>
		<script>
		 	<!-- 공지사항 삭제 -->
			function removeCheck(noticeNo) {
		 		if(confirm("삭제하겠습니까?")) {
		 			location.href="/notice/remove.ztp?noticeNo="+noticeNo; 			
		 		}
		 	}
		 	
			<!-- 공지사항 댓글 삭제 -->
		 	var url = "/notice/detail.ztp?noticeNo=";
		 	
		 	function deleteComment(commentNo) {
				
				if(confirm("삭제하시겠습니까?")) {
					
	                var form = document.createElement("form");
	                var object1 = document.createElement('input');
	                object1.setAttribute('type', 'hidden');
	                object1.setAttribute('name', 'boardId');
	                object1.setAttribute('value', 'N');
	                var object2 = document.createElement('input');
	                object2.setAttribute('type', 'hidden');
	                object2.setAttribute('name', 'postNo');
	                object2.setAttribute('value', '${notice.noticeNo}');
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
		</script>		
	</body>
</html>