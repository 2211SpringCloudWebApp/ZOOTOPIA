<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기 리스트</title>
    <style>
        table tr td {
            border: 1px solid #000;
        }
    </style>
</head>
<body>
    <h1>입양 후기</h1>
    <div class="list">
 		<table>
	 		<tbody>
	        <!-- 리스트 -->
	        <c:set var="i" value="0" />
	 		<c:set var="j" value="2" />
  			<c:choose>
   				<c:when test="${reviewList != null}">
    				<c:forEach items="${reviewList}" var="reviewList">
     					<c:if test="${i % j == 0}"><tr></c:if>
     						<td>
     							<table onclick="location.href='/review/detail.ztp?reviewPostNo=${reviewList.reviewPostNo}';">
	     							<tr>
	     								<td rowspan="3"><img src="${reviewList.reviewImageName}" style="width: 100px; height: 100px"></td>
	     								<th>${reviewList.reviewTitle}</th>
	     							</tr>
	     								<td>${reviewList.animalNo}</td>
	     							</tr>
	     							<tr>
	     								<td>${reviewList.reviewWriterId}</td>
	     							</tr>
     							</table>
     						</td>
    					<c:if test="${i % j == j - 1}"></tr></c:if> 
   						<c:set var="i" value="${i + 1}" />
    				</c:forEach>
   				</c:when>
	  			<c:otherwise>
		   			<tr>
					    <td>존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
			<tfoot>
	        	<tr align="center">
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
	        	</tr>
            <!-- 검색 -->
	            <tr>
	                <td colspan="3">
	                	<form action="/review/search.ztp" method="get">
	                        <select name="condition">
	                            <option value="all">전체</option>
	                            <option value="writer">작성자</option>
	                            <option value="title">제목</option>
	                            <option value="content">내용</option>
	                        </select>
		                    <input type="text" name="keyword" placeholder="검색어 입력">
		                    <input type="submit" value="검색">
	                    </form>
	                </td>
	                <td>
		                <button onclick="location.href='/review/writeView.ztp';">작성</button>
		            </td>
	            </tr>
       		</tfoot>
		</table>
    </div>

</body>
</html>

