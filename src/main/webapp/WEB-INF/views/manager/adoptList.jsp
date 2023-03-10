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
		<h1>미승인 입양공고 리스트</h1>
		<table>
			<thead>
				<tr>
					<th>게시글번호</th>
					<th>작성자아이디</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${aList}" var="adoptPost">
					<tr>
						<td>${adoptPost.adoptPostNo }</td>
						<td>${adoptPost.adoptWriterId }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>