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
						<a href="/member/mypage.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" onclick="updateSidebar(); return false;">
							<i class="fas fa-user-circle fa-fw me-3"></i><span>나의 정보</span>
						</a>	
						<a href="/member/animalList.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" onclick="updateSidebar(); return false;">
							<i class="fas fa-paw fa-fw me-3"></i><span>입양한 동물 리스트</span>
						</a>
						<a href="/member/mypageAdoptPost.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" onclick="updateSidebar(); return false;">
							<i class="fas fa-list fa-fw me-3"></i><span>입양공고 게시글</span>
						</a> 
						<a href="/member/mypageAdoptPostComment.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" onclick="updateSidebar(); return false;">
							<i class="fas fa-comment fa-fw me-3"></i><span>입양공고 댓글</span>
						</a> 
						<a href="/member/mypageAdoptPostLike.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" onclick="updateSidebar(); return false;">
							<i class="fas fa-heart fa-fw me-3"></i><span>입양공고 좋아요 누른 글</span>
						</a> 
						<a href="/member/mypageReview.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" onclick="updateSidebar(); return false;">
							<i class="fas fa-list fa-fw me-3"></i><span>입양후기 게시글</span>
						</a>
						<a href="/member/mypageReviewComment.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" onclick="updateSidebar(); return false;">
							<i class="fas fa-comment fa-fw me-3"></i><span>입양후기 댓글</span>
						</a> 
						<a href="/member/mypageReviewLike.ztp?aria-current=true" class="list-group-item list-group-item-action py-2 ripple" onclick="updateSidebar(); return false;">
							<i class="fas fa-heart fa-fw me-3"></i><span>입양후기 좋아요 누른 글</span>
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
						<th>작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adoptPostList }" var="adoptPost">
					<tr>
						<td><input type="checkbox" name="rowcheck" value="${adoptPost.adoptPostNo }">${adoptPost.adoptPostNo }</td>
						<td><a href="/review/detail.ztp?postNo=${adoptPost.adoptPostNo}">${adoptPost.adoptContent}</a></td>
						<td>${adoptPost.adoptWriterId }</td>
						<td>${adoptPost.adoptCreateDate }</td>
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
				        	<a href="/member/mypageAdoptPost.ztp?page=1" class="first-last-page"><<</a>
				        </c:if>
				        <c:if test="${pageInfo.currentPage > 1}">
				        	<a href="/member/mypageAdoptPost.ztp?page=${pageInfo.currentPage - 1}" class="prev-next-page"><</a>
				        </c:if>
				        <c:forEach begin="${pageInfo.startNav}" end="${pageInfo.endNav}" var="page">
				        	<c:url var="pageUrl" value="/member/mypageAdoptPost.ztp">
				        		<c:param name="page" value="${page}" />
				        	</c:url>
				        		<a href="${pageUrl}" <c:if test="${pageInfo.currentPage == page}">style="color: #EEE5C6; background-color: #4E422D"</c:if>>${page}</a>
				        </c:forEach>
				        <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
				        	<a href="/member/mypageAdoptPost.ztp?page=${pageInfo.currentPage + 1}" class="prev-next-page">></a>
				        </c:if>
				        <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
				        	<a href="/member/mypageAdoptPost.ztp?page=${pageInfo.maxPage}" class="first-last-page">>></a>
				        </c:if>
			        </div>
		        </div>
		        <div class="searchBar">
		        	<form action="/member/adoptPostSearch.ztp" method="post">
						<select id="selectBtn" name="condition">
							<option value="all">전체</option>
							<option value="no">게시글 번호</option>
							<option value="content">내용</option>
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
		// 클릭 이벤트 핸들러
		  function updateSidebar() {
		    // 현재 URL 가져오기
		    let currentUrl = window.location.href;

		    // 매개 변수 추가 또는 업데이트
		    if (currentUrl.indexOf('?') === -1) {
		      currentUrl += '?aria-current=true';
		    } else {
		      currentUrl += '&aria-current=true';
		    }

		    // URL 업데이트
		    window.location.href = currentUrl;
		  }

		  
		  const elements = document.querySelectorAll('.list-group-item');
		  elements.forEach(element => {
		    element.addEventListener('click', () => {
		      // Remove the "selected" class from all elements
		      elements.forEach(el => {
		        el.classList.remove('active');
		      });
		      // Add the "selected" class to the clicked element
		      element.classList.add('active');
		    });
		  });

			
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
		<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.2.0/mdb.min.js"></script>
	</body>
</html>