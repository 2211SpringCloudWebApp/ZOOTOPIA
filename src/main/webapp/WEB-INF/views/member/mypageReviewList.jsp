<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>멤버리스트</title>
		<style>
	        div{
	            text-align: center;
	        }
	        table{
	            display: flex;
	            flex-direction: column;
	            align-items: center;
	        }
    	</style>
	</head>
	<body>
	    <div id="container">
		    <h1>검색 조건</h1>
		    <div id="searchTag">
		        <form action="/member/reviewSearch.ztp" method="post">
		            <select name="condition" id="memberId-select">
		            	<option value="all">전체</option>
		                <option value="no">게시글 번호</option>
		                <option value="title">제목</option>
		                <option value="content">내용</option>
		            </select>
		            <input type="text" name="keyword">
		            <button type="submit">검색</button>
		        </form>
		    </div>
		    <form action="/member/deleteBoard.ztp" name="myform" method="post">
			    <div id="memberList">
			        <table>
			            <thead>
			                <tr>
			                    <th><input type="checkbox" name="allcheck" onclick="allCheck()"></th>
			                    <th>번호</th>
			                    <th>제목</th>
			                    <th>작성자</th>
			                    <th>작성일자</th>
			                </tr>
			            </thead>
			            <tbody>
			            	<c:forEach items="${reviewList }" var="Review">
				                <tr>
				                    <td><input type="checkbox" name="rowcheck" value="${Review.reviewPostNo }">${Review.reviewPostNo }</td>
				                    <td><a href="/review/detail.ztp?reviewPostNo=${Review.reviewPostNo}">${Review.reviewTitle}</a></td>
				                   	<td>${loginUser.memberName}</td>
				                    <td>${Review.reviewCreateDate }</td>
				                </tr>	            	
			            	</c:forEach>
			            </tbody>
			        </table>
			    </div>
			    <div id="buttonTag">
			        <button type="submit">삭제</button>
			    </div>
		    </form>

	        	<%-- <tr align="center">
	        		<td colspan="4">
	        			<c:if test="${pageInfo.currentPage > 1}">
	        				<a href="/review/list.ztp?page=1" class="first-last-page">첫페이지</a>
	        			</c:if>
	        			<c:if test="${pageInfo.currentPage > 1}">
	        				<a href="/review/list.ztp?page=${pageInfo.currentPage - 1}" class="prev-next-page">이전</a>
	        			</c:if>
	        			<c:forEach begin="${pageInfo.startNav}" end="${pageInfo.endNav}" var="page">
	        				<c:url var="pageUrl" value="/review/list.ztp">
	        					<c:param name="page" value="${page}" />
	        				</c:url>
	        				<a href="${pageUrl}" <c:if test="${pageInfo.currentPage == page}">style="font-weight: 400; color: red"</c:if>>${page}</a>
	        			</c:forEach>
	        			<c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
	        				<a href="/review/list.ztp?page=${pageInfo.currentPage + 1}" class="prev-next-page">다음</a>
	        			</c:if>
	        			<c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
	        				<a href="/review/list.ztp?page=${pageInfo.maxPage}" class="first-last-page">마지막페이지</a>
	        			</c:if>
	        		</td>
	        	</tr> --%>
	    </div>
	    <script>
			
	    	function allCheck(){
	    		var allcheck = document.myform.allcheck;
	    		var rowcheck = document.myform.rowcheck;
	    		
	    		if(allcheck.checked == true){
	    			for(i=0; i<rowcheck.length; i++){
	    				rowcheck[i].checked = true;
	    			}
	    		}else{
	    			for(i=0; i<rowcheck.length; i++){
	    				rowcheck[i].checked = false;
	    			}
	    		}
	    	}
	    	
	    </script>
		<option value=""></option>
	</body>
</html>