<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글리스트❤️</title>
		<link rel="stylesheet" href="../../../resources/css/manager/commentList.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<main>
			<div class="titleTag">
				<img alt="" src="../../../resources/img/manager-icon2.png">
				<h1>댓글리스트</h1>
			</div>

				<div class="commentList">
					<table>
						<thead>
							<tr>
			                    <th><input type="checkbox" name="allcheck" onclick="allCheck()"></th>
			                    <th>게시판</th>
			                    <th>댓글내용</th>
			                    <th>댓글작성자</th>
							</tr>
						</thead>
			            <tbody>
			            	<c:forEach items="${cList }" var="comment">
				                <tr>
				                    <td><input type="checkbox" id="checkRow" name="checkRow" value="${comment.commentNo }"></td>
				                    <c:if test="${comment.boardId  eq 'A'}">
					                    <td>입양공고</td>
				                    </c:if>
				                    <c:if test="${comment.boardId  eq 'R'}">
					                    <td>입양후기</td>
				                    </c:if>
				                    <c:if test="${comment.boardId  eq 'N'}">
					                    <td>공지사항</td>
				                    </c:if>
				                    <td><a href="/manager/detailComment.ztp?commentNo=${comment.commentNo }">${comment.commentContent }</a></td>
				                    <td>${comment.commentWriterId }</td>
				                </tr>	            	
			            	</c:forEach>
			            </tbody>
					</table>
					<div class="buttonTag">
						<button type="button" onclick="deleteBtn()">삭제</button>
					</div>
			        <div class="pageWrap">
			        	<div class="pageNation">
		        			<c:if test="${pi.currentPage > 1}">
		        				<a href="/manager/commentList.ztp?page=1" class="first-last-page"><<</a>
		        			</c:if>
		        			<c:if test="${pi.currentPage > 1}">
		        				<a href="/manager/commentList.ztp?page=${pi.currentPage - 1}" class="prev-next-page"><</a>
		        			</c:if>
		        			<c:forEach begin="${pi.startNav}" end="${pi.endNav}" var="page">
		        				<c:url var="pageUrl" value="/manager/commentList.ztp">
		        					<c:param name="page" value="${page}" />
		        				</c:url>
		        				<a href="${pageUrl}" <c:if test="${pi.currentPage == page}"></c:if>>${page}</a>
		        			</c:forEach>
		        			<c:if test="${pi.currentPage < pi.maxPage}">
		        				<a href="/manager/commentList.ztp?page=${pi.currentPage + 1}" class="prev-next-page">></a>
		        			</c:if>
		        			<c:if test="${pi.currentPage < pi.maxPage}">
		        				<a href="/manager/commentList.ztp?page=${pi.maxPage}" class="first-last-page">>></a>
		        			</c:if>
						</div>
				    </div>
				</div>
		</main>
		
		<jsp:include page="../common/footer.jsp" />
		
	    <script>
			// 체크박스 전체선택
	    	function allCheck(){
	    		var ac = document.myform.allcheck;
	    		var rc = document.myform.checkRow;
	    		
	    		if(ac.checked == true){
	    			for(i=0; i<rc.length; i++){
	    				rc[i].checked = true;
	    			}
	    		}else{
	    			for(i=0; i<rc.length; i++){
	    				rc[i].checked = false;
	    			}
	    		}
	    	}
	    	
			// 버튼클릭 시 confirm창
			function deleteBtn(){
				var checkRow = "";
				  $( "input[name='checkRow']:checked" ).each (function (){
				    checkRow = checkRow + $(this).val()+"," ;
				  });
				  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
				  if(checkRow == ''){
					    alert("삭제할 대상을 선택하세요.");
					    return false;
				  }
				  if(confirm("정보를 삭제 하시겠습니까?")){
					location.href="/manager/deleteComments.ztp?commentNo="+checkRow;					
				  }
			}
			
	    </script>
	</body>
</html>