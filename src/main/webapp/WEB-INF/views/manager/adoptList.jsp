<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양공고리스트</title>
		<link rel="stylesheet" href="../../../resources/css/manager/adoptList.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<main>
			<div id="main-head">
				<h1>미승인 입양공고 리스트</h1>
			</div>
			<div>
				<form action="/manager/approveAdopt.ztp" name="myform" method="get">
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
									<td><input type="checkbox" name="checkRow" value="${adoptPost.adoptPostNo }"></td>
									<td>${adoptPost.adoptPostNo }</td>
									<td>${adoptPost.adoptWriterId }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="buttonTag">
						<button type="button" onclick="approveBtn()">승인</button>
					</div>
				    <div class="pageWrap">
				    	<div class="pageNation">
		        			<c:if test="${pi.currentPage > 1}">
		        				<a href="/manager/selectAdopt.ztp?page=1" class="first-last-page"><<</a>
		        			</c:if>
		        			<c:if test="${pi.currentPage > 1}">
		        				<a href="/manager/selectAdopt.ztp?page=${pi.currentPage - 1}" class="prev-next-page"><</a>
		        			</c:if>
		        			<c:forEach begin="${pi.startNav}" end="${pi.endNav}" var="page">
		        				<c:url var="pageUrl" value="/manager/selectAdopt.ztp">
		        					<c:param name="page" value="${page}" />
		        				</c:url>
		        				<a href="${pageUrl}">${page}</a>
		        			</c:forEach>
		        			<c:if test="${pi.currentPage < pi.maxPage}">
		        				<a href="/manager/selectAdopt.ztp?page=${pi.currentPage + 1}" class="prev-next-page">></a>
		        			</c:if>
		        			<c:if test="${pi.currentPage < pi.maxPage}">
		        				<a href="/manager/selectAdopt.ztp?page=${pi.maxPage}" class="first-last-page">>></a>
		        			</c:if>
				        </div>
			        </div>

				</form>
			</div>
		</main>
		
		<jsp:include page="../common/footer.jsp" />
		
		<script>
			// 체크박스 전체체크
	    	function allCheck(){
	    		var ac = document.myform.allcheck;
	    		var rc = document.myform.checkRow;
	    		
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
			
			// 버튼클릭 시 confirm창
			function approveBtn(){
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
				  if(confirm("입양공고를 승인하시겠습니까?")){
					location.href="/manager/approveAdopt.ztp?adoptPostNo="+checkRow;					
				  }
			}
	    	
	    </script>
	</body>
</html>