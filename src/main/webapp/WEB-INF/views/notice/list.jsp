<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 목록</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<style>
			* {
			    margin: 0;
			    padding: 0;
			}
			main {
			    width: 100vw;
			    margin-top: 125px;
			}
			table {
				border : 1px solid black;
				text-align : center;
				border-collapse : collapse;
			}
			th,td {
				border : 1px solid black;
			}
			a:link, a:visited {
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<header>
<%-- 			<jsp:include page="../common/header.jsp" /> --%>
		</header>
		<main>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성날짜</th>
						<th>첨부파일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${nList }" var="notice" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td><a href="/notice/detail.ztp?noticeNo=${notice.noticeNo }">${notice.noticeSubject }</a></td>
						<td>${notice.noticeWriter }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeCreateDate }"/></td>
<%-- 						<td>${notice.noticeCreateDate }</td> --%>
						<td>
							<c:if test="${!empty notice.noticeImageName}">O</c:if>
							<c:if test="${empty notice.noticeImagePath}">X</c:if>
						</td>					
						<td>${notice.noticeViewCount }</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
	    			<c:if test="${pi.currentPage > 1}">
		        				<a href="/notice/list.ztp?page=1" class="first-last-page">첫페이지</a>
		        			</c:if>
		        			<c:if test="${pi.currentPage > 1}">
		        				<a href="/notice/list.ztp?page=${pi.currentPage - 1}" class="prev-next-page">이전</a>
		        			</c:if>
		        			<c:forEach begin="${pi.startNav}" end="${pi.endNav}" var="page">
		        				<c:url var="pageUrl" value="/notice/list.ztp">
		        					<c:param name="page" value="${page}" />
		        				</c:url>
		        				<a href="${pageUrl}" <c:if test="${pi.currentPage == page}">style="font-weight: 400; color: red"</c:if>>${page}</a>
		        			</c:forEach>
		        			<c:if test="${pi.currentPage < pi.maxPage}">
		        				<a href="/notice/list.ztp?page=${pi.currentPage + 1}" class="prev-next-page">다음</a>
		        			</c:if>
		        			<c:if test="${pi.currentPage < pi.maxPage}">
		        				<a href="/notice/list.ztp?page=${pi.maxPage}" class="first-last-page">마지막페이지</a>
		        			</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<form action="/notice/search.ztp" method="get">
								<select name="condition">
									<option value="all">전체</option>
									<option value="writer">작성자</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
								</select>
								<input type="text" name="keyword" placeholder="검색어를 입력해주세요">
								<input type="submit" value="검색">
							</form>
						</td>
<%-- 						<c:if test="${memberId == 관리자 }"> --%>
						<td>
							<button onclick="location.href='/notice/registerView.ztp'">글쓰기</button>
						</td>
<%-- 						</c:if> --%>
					</tr>
				</tfoot>			
			</table>
		</main>
		<footer>
<%-- 			<jsp:include page="../common/footer.jsp" /> --%>
		</footer>
	</body>
</html>