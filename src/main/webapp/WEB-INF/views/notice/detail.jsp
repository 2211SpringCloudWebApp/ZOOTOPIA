<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세 조회</title>
<!-- 		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">		 -->
		<link rel="stylesheet" href="../../../resources/css/notice.css">
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
	</head>
	<body>
		<header>
			<jsp:include page="../common/header.jsp" />
		</header>
		<main>
			<div></div>
			<h1>공지사항</h1>
				<c:if test="${sessionScope.loginUser.mAdminYN eq 'Y' }">
					<div class="removeArea">
						<c:url var="nList" value="/notice/list.ztp">
							<c:param name="noticeNo" value="${notice.noticeNo }"/>
						</c:url>
							<a href="javascript:void(0);" onclick="removeCheck(${notice.noticeNo });">삭제</a>
							<a href="${nList }">목록</a>
					</div>			
				<form action="/notice/modify.ztp" method="post" enctype="multipart/form-data">
					<div id="detailInput">
						<div id="detailS">
							<input type="text" class="detailInput" name="noticeSubject" value="${notice.noticeSubject }">
						</div>
						<div id="detailW">
							<input type="text" class="detailInput" name="noticeWriter" value="${notice.noticeWriter }">
						</div>
						<div id="detailC">
<%-- 							<input type="text" class="detailInput" name="noticeCreateDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeCreateDate }"/>"> --%>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeCreateDate }"/>
						</div>
					</div>
					<hr>
					<textarea name="noticeContent" id=""  rows="35" cols="85">${notice.noticeContent }</textarea><br>
					<c:if test="${!empty notice.noticeImageName}">
						<div class="uploadArea">
							<div>
								<label class="fileBtn" for="inputFile">
									<img src="../../../resources/img/notice-file.png" alt="" style="cursor: pointer;">
									<input type="file" id="inputFile" name="reloadFile" value="" style="display:none;" onclick="document.getElementById('inputFile').click();">
								</label>
							</div>
							<div id="upload-file">${notice.noticeImageName }</div>
						</div>
					</c:if>
					<c:if test="${empty notice.noticeImageName}">
						<div class="uploadArea">
							<div>
								<label class="fileBtn" for="inputFile">
									<img src="../../../resources/img/notice-file.png" alt="" style="cursor: pointer;">
									<input type="file" id="inputFile" name="reloadFile" value="" style="display:none;" onclick="document.getElementById('inputFile').click();">
								</label>
							</div>
							<div id="upload-file">파일 업로드</div>
						</div>
					</c:if>
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
			<c:if test="${sessionScope.loginUser.mAdminYN eq 'N' || sessionScope.loginUser.memberId eq null }">
				<div class="removeArea">
					<c:url var="nList" value="/notice/list.ztp">
						<c:param name="noticeNo" value="${notice.noticeNo }"/>
					</c:url>
					<a href="${nList }">목록</a><br>
				</div>
				<form action="/notice/modify.ztp" method="post" enctype="multipart/form-data">
					<div id="detailInput">
						<div id="detailS">
							<input type="text" class="subjectInput" name="noticeSubject" value="${notice.noticeSubject }" readonly>
						</div>
						<div id="detailW">
							<input type="text" class = "writerInput" name="noticeWriter" value="${notice.noticeWriter }" readonly><br>
						</div>
						<div id="detailC">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeCreateDate }"/>
						</div>
					</div>
					<hr>
					<textarea name="noticeContent" id=""  rows="35" cols="85" readonly>${notice.noticeContent }</textarea><br>
					<c:if test="${!empty notice.noticeImageName}">
						<div class="uploadArea">
							<div>
								<label class="fileBtn" for="inputFile">
									<img src="../../../resources/img/notice-file.png" alt="" style="cursor: pointer;">
									<input type="file" id="inputFile" name="reloadFile" value="" style="display:none;" onclick="document.getElementById('inputFile').click();">
								</label>
							</div>
							<div id="upload-file">${notice.noticeImageName }</div>
						</div>
					</c:if>
					<c:if test="${empty notice.noticeImageName}">
						<div class="uploadArea">
							<div>
								<label class="fileBtn" for="inputFile">
									<img src="../../../resources/img/notice-file.png" alt="" style="cursor: pointer;">
									<input type="file" id="inputFile" name="reloadFile" value="" style="display:none;" onclick="document.getElementById('inputFile').click();">
								</label>
							</div>
							<div id="upload-file">첨부된 파일이 없습니다</div>
						</div>
					</c:if>
					<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
					<input type="hidden" name="noticeImageName" value="${notice.noticeImageName }">
					<input type="hidden" name="noticeImagePath" value="${notice.noticeImagePath }">
				</form>
			</c:if>
			
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
					                    <input type="hidden" name="boardId" value="N">
					                    <input type="hidden" name="postNo" value="${notice.noticeNo}">
					                    <input type="hidden" name="url" value="/notice/detail.ztp?noticeNo=">
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
			                            <td id="comment-td2" style="white-space: pre-wrap;">${commentList.commentContent}</td>
			                            <td id="comment-td3"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${commentList.commentCreateDate}"/></td>
			                            <c:if test="${sessionScope.loginUser.memberId eq commentList.commentWriterId}">
			                            	<td id="comment-td4">
			                            		<button onclick="modifyComment(${commentList.commentNo}, 'N');">
			                            			<img src="../../../resources/img/icon-modify.png" style="width: 15px; height: auto;">
			                            		</button>
			                            	</td>
			                            </c:if>

			                            <c:if test="${sessionScope.loginUser.memberId eq notice.noticeWriter || sessionScope.loginUser.memberId eq commentList.commentWriterId || sessionScope.loginUser.mAdminYN eq 'Y'}">
			                            	<td id="comment-td5">
			                            		<button onclick="deleteComment(${commentList.commentNo}, 'N');">
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
		 	
			<!-- 첨부파일 수정 -->
			
			window.onload = function() {
		    	
		        target = document.getElementById('inputFile');
		        target.addEventListener('change', function() {
		        	
		            fileList = "";
		            for(i = 0; i < target.files.length; i++) {
		                
		            	fileList += target.files[i].name + '<br>';
		                
		            }
		            
		            target2 = document.getElementById('upload-file');
		            target2.innerHTML = fileList;
		        	
		        });
		        
		    };
			
			<!-- 공지사항 댓글 수정 -->
			var url = "/notice/detail.ztp?noticeNo=";
			function modifyComment(commentNo, boardId) {

	            window.open(
	                    "/comment/modifyView.ztp?boardId="+boardId+"&postNo="+${notice.noticeNo}+"&commentNo="+commentNo+"&url="+url
	                    , "댓글 수정"
	                    , "directories=no, titlebar=no, toolbar=no, status=no, menubar=no, location=no,width=820, height=200, scrollbars=no");

	        }
			
			<!-- 공지사항 댓글 삭제 -->
		 	
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