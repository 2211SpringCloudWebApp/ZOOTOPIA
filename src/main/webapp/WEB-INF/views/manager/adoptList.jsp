<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양공고리스트</title>
	</head>
	<body>
		<div>
			<h1>미승인 입양공고 리스트</h1>
			<form action="/manager/approveAdopt.ztp" name="myform" method="post">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="allcheck" onclick="allCheck()"></th>
							<th>게시글번호</th>
							<th>작성자아이디</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${aList}" var="adoptPost">
							<tr>
								<td><input type="checkbox" name="rowcheck" value="${adoptPost.adoptPostNo }"></td>
								<td>${adoptPost.adoptPostNo }</td>
								<td>${adoptPost.adoptWriterId }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="buttonTag">
					<button type="submit">승인</button>
				</div>
			</form>
		</div>
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