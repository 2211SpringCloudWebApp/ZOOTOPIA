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
		        <form action="/member/searchBoard.ztp" method="post">
		            <select name="search_list" id="memberId-select">
		            	<option value="all">전체</option>
		                <option value="No">게시글 번호</option>
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
				                    <td><a href="/member/detail.ztp?reviewTitle=${Review.reviewTitle}">${Review.reviewTitle}</a></td>
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