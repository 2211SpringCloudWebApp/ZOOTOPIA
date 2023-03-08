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
	    <h1>검색 조건</h1>
	    <div id="searchTag">
	        <form action="">
	            <select name="memberId" id="memberId-select">
	                <option value="id">아이디</option>
	                <option value="name">회원이름</option>
	            </select>
	            <input type="text" name="searchMember">
	            <button id="searchBtn">검색</button>
	        </form>
	    </div>
	    <div id="memberList">
	        <table>
	            <thead>
	                <tr>
	                    <th> </th>
	                    <th>아이디</th>
	                    <th>이름</th>
	                    <th>가입일자</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:forEach items="${mList }" var="member">
		                <tr>
		                    <td><input type="checkbox"></td>
		                    <td><a href="/member/detail.kh?memberId=${member.memberId }">${member.memberId }</a></td>
		                    <td>${member.memberName }</td>
		                    <td>${member.enrollDate }</td>
		                </tr>	            	
	            	</c:forEach>
	            </tbody>
	        </table>
	    </div>
	    <div id="buttonTag">
	        <button id="deleteBtn">삭제</button>
	    </div>
	    <script>
	        var deleteBtn = document.querySelector("#deleteBtn");
	        deleteBtn.addEventListener("click", function(){ confirm("회원을 삭제하시겠습니까?")});
	    </script>
	</body>
</html>