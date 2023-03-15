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
	
		<jsp:include page="../common/header.jsp"></jsp:include>
	
	    <div id="container">
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
			        </table>
			    </div>
			    <div id="buttonTag">
			        <button type="submit">삭제</button>
			    </div>
		    </form>
	    </div>
	    
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