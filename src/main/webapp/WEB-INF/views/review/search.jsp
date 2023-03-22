<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기 리스트</title>
	<link rel="stylesheet" href="../../../resources/css/review.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<style type="text/css">
		body{ cursor:url("../../../resources/img/cursor.png"), auto;}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<main>
		<div></div>
	    <div class="list">
	    <h1>입양 후기</h1>
	    <form action="/manager/deleteReviews.ztp" method="get" name="deleteReviews">
	 		<table class="review-table wrapper-table">
		 		<tbody>
		 		
		        <!-- 리스트 -->
		        <c:set var="i" value="0" />
		 		<c:set var="j" value="2" />
	  			<c:choose>
	   				<c:when test="${reviewList != null}">
	    				<c:forEach items="${reviewList}" var="reviewList">
	     					<c:if test="${i % j == 0}"><tr></c:if>
	     						<td class="wrapper-td">
	     						
	     							<table class="review-table inner-table">
		     							<tr>
		     								<!-- 썸네일 -->
		     								<td rowspan="3" class="thumnail-td"style="background-image: url(../../../resources/uploadFiles/review/${reviewList.reviewImageName});" >
		     									<c:if test="${member.mAdminYN eq 'Y'}">
		     										<input type="checkbox" style="width: 20px; height: 20px;" name="checkRow" value="${reviewList.reviewPostNo}">
		     									</c:if>
		     								</td>
		     								<!-- 후기글 제목 -->
		     								<th class="post post-th" onclick="location.href='/review/detail.ztp?reviewPostNo=${reviewList.reviewPostNo}';"><img src="../../../resources/img/manager-icon2.png" style="width: 15px; margin-right: 10px;"> ${reviewList.reviewTitle}</th>
		     							</tr>
		     							<tr>
		     								<td class="post post-writer-info" onclick="location.href='/review/detail.ztp?reviewPostNo=${reviewList.reviewPostNo}';">
		     									<span>${reviewList.reviewWriterId}</span>
		     									<span><fmt:formatDate pattern="yyyy-MM-dd" value="${reviewList.reviewCreateDate}" /></span>
		     								</td>
		     							</tr>
		     							<tr>
		     								<td class="post post-content">${reviewList.reviewContent}</td>
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
				
				<!-- 관리자로 로그인해서 들어온 경우 전체삭제 가능 -->
		        <c:if test="${member.mAdminYN eq 'Y'}">
					<tr>
						<td colspan="2" style="text-align: right;"><button type="button" onclick="deleteBtn()">전체삭제</button></td>
					</tr>
				</c:if>
			</table>
			</form>
			
			<!-- 페이징 -->
			<div class="pageWrap">
	            <div class="pageNation">
	                <c:if test="${pageInfo.currentPage > 1}">
	                    <a href="/review/search.ztp?page=1&condition=${condition}&keyword=${keyword}" class="first-last-page"><<</a>
	                </c:if>
	                <c:if test="${pageInfo.currentPage > 1}">
	                    <a href="/review/search.ztp?page=${pageInfo.currentPage - 1}&condition=${condition}&keyword=${keyword}" class="prev-next-page"><</a>
	                </c:if>
	                <c:forEach begin="${pageInfo.startNav}" end="${pageInfo.endNav}" var="page">
	                    <c:url var="pageUrl" value="/review/search.ztp">
	                        <c:param name="page" value="${page}" />
	                        <c:param name="condition" value="${condition}" />
	                        <c:param name="keyword" value="${keyword}" />
	                    </c:url>
	                        <a href="${pageUrl}" >${page}</a>
	                </c:forEach>
	                <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
	                    <a href="/review/search.ztp?page=${pageInfo.currentPage + 1}&condition=${condition}&keyword=${keyword}" class="prev-next-page">></a>
	                </c:if>
	                <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
	                    <a href="/review/search.ztp?page=${pageInfo.maxPage}&condition=${condition}&keyword=${keyword}" class="first-last-page">>></a>
	                </c:if>
	            </div>
	        </div>
	        
			<!-- 검색 -->
	        <div class="searchBar" style="margin-top: 10px;">
				<form action="/review/search.ztp" method="get">
					<select name="condition" id="select-condition">
						<option value="all">전체</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input id="input-keyword" type="text" name="keyword" placeholder="검색어 입력">
					<button type="submit">검색</button>
				</form>
			</div>
        
	    </div>
    
    <div></div>
    </main>
    
    <jsp:include page="../common/footer.jsp" />

<script>

	// 버튼클릭 시 confirm창
	function deleteBtn(){
		var checkRow = "";
		  $( "input[name='checkRow']:checked" ).each (function (){
		    checkRow = checkRow + $(this).val()+"," ;
		  });
		  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
		  if(checkRow == ''){
			    alert("삭제할 대상을 선택하세요.");
			    return false;
		  }
		  console.log("### checkRow => {}"+checkRow);
		  if(confirm("후기를 삭제 하시겠습니까?")){
			location.href="/manager/deleteReviews.ztp?reviewPostNo="+checkRow;					
		  }
	}


</script>
</body>
</html>