<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 목록</title>
		<link rel="stylesheet" href="../../../resources/css/notice.css">
<!-- 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> -->
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
			<div id="registerArea">
				<c:if test="${sessionScope.loginUser.memberId eq 'admin' }">
					<button id="" onclick="location.href='/notice/registerView.ztp'">글쓰기</button>
				</c:if>	
			</div>
			<table class="" style="table-layout: fixed">
				<thead>
					<tr>
						<th style="width:5%;">번호</th>
						<th style="width:40%;">제목</th>
						<th style="width:10%;">작성자</th>
						<th style="width:25%;">작성날짜</th>
						<th style="width:10%;">첨부파일</th>
						<th style="width:10%;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${nList }" var="notice" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td><a href="/notice/detail.ztp?noticeNo=${notice.noticeNo }">${notice.noticeSubject }</a></td>
						<td>${notice.noticeWriter }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeCreateDate }"/></td>
						<td>
							<c:if test="${!empty notice.noticeImageName}"><img src="../../../resources/img/notice-file.png" alt=""></c:if>
							<c:if test="${empty notice.noticeImagePath}"></c:if>
						</td>					
						<td>${notice.noticeViewCount }</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
				</tfoot>			
			</table>
				<div class="pageWrap">
					<div class="pageNation">
			    		<c:if test="${pi.currentPage > 1}">
				        	<a href="/notice/list.ztp?page=1" class="first-last-page"><<</a>
				        </c:if>
				        <c:if test="${pi.currentPage > 1}">
				        	<a href="/notice/list.ztp?page=${pi.currentPage - 1}" class="prev-next-page"><</a>
				        </c:if>
				        <c:forEach begin="${pi.startNav}" end="${pi.endNav}" var="page">
				        	<c:url var="pageUrl" value="/notice/list.ztp">
				        		<c:param name="page" value="${page}" />
				        	</c:url>
				        		<a href="${pageUrl}" >${page}</a>
				        </c:forEach>
				        <c:if test="${pi.currentPage < pi.maxPage}">
				        	<a href="/notice/list.ztp?page=${pi.currentPage + 1}" class="prev-next-page">></a>
				        </c:if>
				        <c:if test="${pi.currentPage < pi.maxPage}">
				        	<a href="/notice/list.ztp?page=${pi.maxPage}" class="first-last-page">>></a>
				        </c:if>
			        </div>
		        </div>
		        <div class="searchBar" style="margin-top: 10px;">
		        	<form action="/notice/search.ztp" method="get">
						<select id="select-condition" name="condition">
							<option value="all">전체</option>
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" id="input-keyword" name="keyword" placeholder="검색어를 입력해주세요">
						<input type="submit" id="" value="검색">
					</form>
		        </div>
		        <div class="area"></div>
		</main>
		<footer>
			<jsp:include page="../common/footer.jsp" />
		</footer>
	</body>
</html>