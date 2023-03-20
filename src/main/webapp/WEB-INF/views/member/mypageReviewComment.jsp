<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="../../../resources/css/member/login.css">
		<!-- Font Awesome -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
		<!-- MDB -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../../../resources/css/member/sidebar.css">
		<link rel="stylesheet" href="../../../resources/css/notice.css">
	</head>
	<body>
		<!--Main Navigation-->
		<header>
		<jsp:include page="../common/header.jsp" />
		</header>
		<main>
		<div></div>
		<div id="hd">
			<!-- Sidebar -->
			<nav id="sidebarMenu"
				class="collapse d-lg-block sidebar collapse bg-white">
				<div class="position-sticky">
					<div class="list-group list-group-flush mx-3 mt-4">
						<a href="/member/mypage.ztp" class="list-group-item list-group-item-action py-2 ripple" aria-current="true">
							<i class="fas fa-tachometer-alt fa-fw me-3"></i><span>나의 정보</span>
						</a>	
						<a href="/member/animalList.ztp" class="list-group-item list-group-item-action py-2 ripple active">
							<i class="fas fa-chart-area fa-fw me-3"></i><span>입양한 동물 리스트</span>
						</a>
						<a href="/member/mypageAdoptPost.ztp" class="list-group-item list-group-item-action py-2 ripple">
							<i class="fas fa-lock fa-fw me-3"></i><span>입양공고 게시글</span>
						</a> 
						<a href="/member/mypageAdoptPostComment.ztp" class="list-group-item list-group-item-action py-2 ripple">
							<i class="fas fa-chart-line fa-fw me-3"></i><span>입양공고 댓글</span>
						</a> 
						<a href="/member/mypageAdoptPostLike.ztp" class="list-group-item list-group-item-action py-2 ripple">
							<i class="fas fa-chart-pie fa-fw me-3"></i><span>입양공고 좋아요 누른 글</span>
						</a> 
						<a href="/member/mypageReview.ztp" class="list-group-item list-group-item-action py-2 ripple">
							<i class="fas fa-chart-bar fa-fw me-3"></i><span>입양후기 게시글</span>
						</a>
						<a href="/member/mypageReviewComment.ztp" class="list-group-item list-group-item-action py-2 ripple">
							<i class="fas fa-globe fa-fw me-3"></i><span>입양후기 댓글</span>
						</a> 
						<a href="/member/mypageReviewLike.ztp" class="list-group-item list-group-item-action py-2 ripple">
							<i class="fas fa-building fa-fw me-3"></i><span>입양후기 좋아요 누른 글</span>
						</a> 
					</div>
				</div>
			</nav>
			<!-- Sidebar -->
			<!-- Navbar -->
			<nav id="main-navbar"
				class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
				<!-- Container wrapper -->
				<div class="container-fluid">
					<!-- Toggle button -->
					<button class="navbar-toggler" type="button"
						data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu"
						aria-controls="sidebarMenu" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-bars"></i>
					</button>
				</div>
				<!-- Container wrapper -->
			</nav>
			<!-- Navbar -->
		</div>
		<!--Main Navigation-->
		<!--Main layout-->
		<form action="/member/deleteBoard.ztp" name="myform" method="post">
		<table class="">
				<thead>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reviewCommentList }" var="reviewComment">
					<tr>
						<td><input type="checkbox" name="rowcheck" value="${reviewComment.postNo }">${reviewComment.postNo }</td>
						<td><a href="/review/detail.ztp?postNo=${reviewComment.postNo}">${reviewComment.commentContent}</a></td>
						<td>${reviewComment.commentWriterId }</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
				</tfoot>			
			</table>
			 <div id="buttonTag">
			        <button type="submit">삭제</button>
			  </div>
			</form>
				<div class="pageWrap">
					<div class="pageNation">
			    		<c:if test="${pageInfo.currentPage > 1}">
				        	<a href="/member/mypageReviewComment.ztp?page=1" class="first-last-page"><<</a>
				        </c:if>
				        <c:if test="${pageInfo.currentPage > 1}">
				        	<a href="/member/mypageReviewComment.ztp?page=${pageInfo.currentPage - 1}" class="prev-next-page"><</a>
				        </c:if>
				        <c:forEach begin="${pageInfo.startNav}" end="${pageInfo.endNav}" var="page">
				        	<c:url var="pageUrl" value="/member/mypageReviewComment.ztp">
				        		<c:param name="page" value="${page}" />
				        	</c:url>
				        		<a href="${pageUrl}" >${page}</a>
				        </c:forEach>
				        <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
				        	<a href="/member/mypageReviewComment.ztp?page=${pageInfo.currentPage + 1}" class="prev-next-page">></a>
				        </c:if>
				        <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
				        	<a href="/member/mypageReviewComment.ztp?page=${pageInfo.maxPage}" class="first-last-page">>></a>
				        </c:if>
			        </div>
		        </div>
		        <div class="searchBar">
		        	<form action="/member/reviewSearch.ztp" method="post">
						<select id="selectBtn" name="condition">
							<option value="all">전체</option>
							<option value="no">게시글 번호</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select>
						<input type="text" name="keyword" placeholder="검색어를 입력해주세요">
						<input type="submit" id="searchBtn" value="검색">
					</form>
		        </div>
		</main>
		<footer>
		<jsp:include page="../common/footer.jsp" />
		</footer>
		  <script>
			
	    	function allCheck(){
	    		var allcheck = document.myform.allcheck;
	    		var rowcheck = document.myform.rowcheck;
	    		
	    		if(allcheck.checked == true){
	    			for(i=0; i<rowcheck.length; i++){
	    				rowcheck[i].checked = true;
	    			}
	    		}else{
	    			for(i=0; i<rowcheck.length; i++){
	    				rowcheck[i].checked = false;
	    			}
	    		}
	    	}
	    	
	    </script>
		<option value=""></option>
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	</body>
</html>