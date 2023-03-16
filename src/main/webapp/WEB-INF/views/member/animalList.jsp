<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양한 동물 리스트</title>
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
		    <h1>입양한 동물 목록</h1>
			    <div id="memberList">
	                <form action="/review/writeView.ztp" method="post">
			        <table>
			            <thead>
			                <tr>
			                    <th>동물 번호</th>
			                    <th>동물 종류</th>
			                    <th></th>
			                </tr>
			            </thead>
			            <tbody>
			            	<c:forEach items="${animalList}" var="animalList">
				                <tr>
				                   	<td>${animalList.animalNo}</td>
				                   	<td>${animalList.animalSpecies}</td>
				                    <td><button type="button" onclick="insertReview(${animalList.animalNo});">후기 등록</button>
				                </tr>	            	
			            	</c:forEach>
			            </tbody>
			        </table>
	                </form>
			    </div>

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
	    	
	    	function insertReview(animalNo) {
	    		
	    		var form = document.createElement("form");
                var object = document.createElement('input');
                object.setAttribute('type', 'hidden');
                object.setAttribute('name', 'animalNo');
                object.setAttribute('value', animalNo);
                form.appendChild(object);
                form.setAttribute('method', 'post');
                form.setAttribute('action', '/review/writeView.ztp');
                document.body.appendChild(form);
                form.submit();
	    		
	    	}
	    </script>
	</body>
</html>