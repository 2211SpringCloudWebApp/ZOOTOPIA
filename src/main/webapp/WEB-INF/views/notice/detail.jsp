<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세 조회</title>
		<style>
			* {
			    margin: 0;
			    padding: 0;
			}
			main {
			    width: 100vw;
			    margin-top: 125px;
			}
		</style>
	</head>
	<body>
		<form action="/notice/modify.ztp" method="post" enctype="multipart/form-data">
			제목 <input type="text" name="noticeSubject" value="${notice.noticeSubject }" readonly><br>
			작성자 <input type="text" name="noticeWriter" value="${notice.noticeWriter }" readonly><br>
			내용 <textarea name="noticeContent" id=""  rows="10" cols="30" readonly>${notice.noticeContent }</textarea><br>
			첨부된 파일 <input type="file" name="reloadFile" value="">${notice.noticeImageName }<br>
			<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
			<input type="hidden" name="noticeImageName" value="${notice.noticeImageName }">
			<input type="hidden" name="noticeImagePath" value="${notice.noticeImagePath }">
			<input type="submit" value="수정">  <!-- 주석 -->
			<input type="reset" value="초기화">	<!-- 주석 -->		
		</form>
			<c:url var="nList" value="/notice/list.ztp">
				<c:param name="noticeNo" value="${notice.noticeNo }"/>
			</c:url>
			<a href="${nList }">목록으로</a><br>
			<c:url var="nDelete" value="/notice/remove.ztp">			<!-- 주석 -->
				<c:param name="noticeNo" value="${notice.noticeNo }"/>  <!-- 주석 -->
			</c:url>													<!-- 주석 -->
			<a href="${nDelete }">삭제하기</a>							<!-- 주석 -->
<%-- 		<c:if test="${memberId == 관리자 }"> --%>
<!-- 		<form action="/notice/modify.ztp" method="post"> -->
<%-- 			제목 <input type="text" name="noticeSubject" value="${notice.noticeSubject }"><br> --%>
<%-- 			작성자 <input type="text" name="noticeWriter" value="${notice.noticeWriter }"><br> --%>
<%-- 			내용 <textarea name="noticeContent" id=""  rows="10" cols="30">${notice.noticeContent }</textarea><br> --%>
<%-- 			파일첨부 <input type="file" name="noticeImageName" value="${notice.noticeImageName }"><br> --%>
<%-- 			<input type="hidden" name="noticeNo" value="${notice.noticeNo }"> --%>
<%-- 			<input type="hidden" name="noticeImageName" value="${notice.noticeImageName }"> --%>
<!-- 			<input type="submit" value="수정"> -->
<!-- 			<input type="reset" value="초기화">			 -->
<!-- 		</form> -->
<%-- 		<c:url var="nDelete" value="/notice/remove.ztp"> --%>
<%-- 			<c:param name="noticeNo" value="${notice.noticeNo }"/> --%>
<%-- 		</c:url> --%>
<%-- 		<a href="${nDelete }">삭제하기</a> --%>
<%-- 		</c:if> --%>
	</body>
</html>