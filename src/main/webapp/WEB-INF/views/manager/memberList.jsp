<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>멤버리스트</title>
		<link rel="stylesheet" href="../../../resources/css/manager/list.css">
<!-- 		<style> -->
<!-- 	        div{text-align: center;} -->
<!-- 	        table{display: flex;flex-direction: column;align-items: center;} -->
<!--     	</style> -->
	</head>
	<body>
	
		<jsp:include page="../common/header.jsp"></jsp:include>

	    <main>
	    	<div id="main">
			    <h1>검색 조건</h1>
			    <div id="searchTag">
			        <form action="/member/search.ztp" method="get">
			            <select name="condition" id="memberId-select">
			                <option value="id">아이디</option>
			                <option value="name">회원이름</option>
			            </select>
			            <input type="text" name="keyword">
			            <button type="submit">검색</button>
			        </form>
			    </div>
			    <form action="/member/deleteMembers.ztp" name="myform" method="post">
				    <div id="memberList">
				        <table>
				            <thead>
				                <tr>
				                    <th><input type="checkbox" name="allcheck" onclick="allCheck()"></th>
				                    <th>아이디</th>
				                    <th>이름</th>
				                    <th>가입일자</th>
				                </tr>
				            </thead>
				            <tbody>
				            	<c:forEach items="${mList }" var="member">
					                <tr>
					                    <td><input type="checkbox" name="rowcheck" value="${member.memberId }"></td>
					                    <td><a href="/member/detail.ztp?memberId=${member.memberId }">${member.memberId }</a></td>
					                    <td>${member.memberName }</td>
					                    <td>${member.mEnrollDate }</td>
					                </tr>	            	
				            	</c:forEach>
				            </tbody>
				            <tfoot>
					            <tr align="center">
					        		<td colspan="4">
					        			<c:if test="${pi.currentPage > 1}">
					        				<a href="/member/list.ztp?page=1" class="first-last-page">첫페이지</a>
					        			</c:if>
					        			<c:if test="${pi.currentPage > 1}">
					        				<a href="/member/list.ztp?page=${pi.currentPage - 1}" class="prev-next-page">이전</a>
					        			</c:if>
					        			<c:forEach begin="${pi.startNav}" end="${pi.endNav}" var="page">
					        				<c:url var="pageUrl" value="/member/list.ztp">
					        					<c:param name="page" value="${page}" />
					        				</c:url>
					        				<a href="${pageUrl}" <c:if test="${pi.currentPage == page}">style="font-weight: 400; color: red"</c:if>>${page}</a>
					        			</c:forEach>
					        			<c:if test="${pi.currentPage < pi.maxPage}">
					        				<a href="/member/list.ztp?page=${pi.currentPage + 1}" class="prev-next-page">다음</a>
					        			</c:if>
					        			<c:if test="${pi.currentPage < pi.maxPage}">
					        				<a href="/member/list.ztp?page=${pi.maxPage}" class="first-last-page">마지막페이지</a>
					        			</c:if>
					        		</td>
					        	</tr>
				            </tfoot>
				        </table>
				    </div>
				    <div id="buttonTag">
				        <button type="submit">삭제</button>
				    </div>
			    </form>
		    </div>
	    <main>
	    
	    <jsp:include page="../common/footer.jsp" />
	    
	    <script>
			
	    	function allCheck(){
	    		var ac = document.myform.allcheck;
	    		var rc = document.myform.rowcheck;
	    		
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
	    	
	    </script>
	</body>
</html>