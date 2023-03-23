<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
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
						<a href="/member/mypage.ztp?category=infoList" class="list-group-item list-group-item-action py-2 ripple" id="infoList">
							<i class="fas fa-user-circle fa-fw me-3"></i><span>나의 정보</span>
						</a>	
						<a href="/member/animalList.ztp?category=animalList" class="list-group-item list-group-item-action py-2 ripple" id="animalList">
							<i class="fas fa-paw fa-fw me-3"></i><span>입양한 동물 리스트</span>
						</a>
						<a href="/member/mypageAdoptPost.ztp?category=adoptPostList" class="list-group-item list-group-item-action py-2 ripple" id="adoptPostList" >
							<i class="fas fa-list fa-fw me-3"></i><span>입양공고 게시글</span>
						</a> 
						<a href="/member/mypageAdoptPostComment.ztp?category=adoptPostComment" class="list-group-item list-group-item-action py-2 ripple" id="adoptPostComment" >
							<i class="fas fa-comment fa-fw me-3"></i><span>입양공고 댓글</span>
						</a> 
						<a href="/member/mypageAdoptPostLike.ztp?category=adoptPostLike" class="list-group-item list-group-item-action py-2 ripple" id="adoptPostLike" >
							<i class="fas fa-heart fa-fw me-3"></i><span>입양공고 좋아요 누른 글</span>
						</a> 
						<a href="/member/mypageReview.ztp?category=reviewList" class="list-group-item list-group-item-action py-2 ripple" id="reviewList" >
							<i class="fas fa-list fa-fw me-3"></i><span>입양후기 게시글</span>
						</a>
						<a href="/member/mypageReviewComment.ztp?category=reviewComment" class="list-group-item list-group-item-action py-2 ripple" id="reviewComment">
							<i class="fas fa-comment fa-fw me-3"></i><span>입양후기 댓글</span>
						</a> 
						<a href="/member/mypageReviewLike.ztp?category=reviewLike" class="list-group-item list-group-item-action py-2 ripple" id="reviewLike" >
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
	
	    <div id="container">
		    <h1>입양한 동물 목록</h1>
			    <div id="memberList">
	                <form action="/review/writeView.ztp" method="post">
			        <table>
			            <thead>
			                <tr>
			                    <th>동물 번호</th>
			                    <th>동물 종류</th>
			                    <th></th>
			                </tr>
			            </thead>
			            <tbody>
			            	<c:forEach items="${animalList}" var="animalList">
				                <tr>
				                   	<td>${animalList.animalNo}</td>
				                   	<td>${animalList.animalSpecies}</td>
				                    <td><button type="button" onclick="insertReview(${animalList.animalNo}, '${animalList.animalSpecies}', '${animalList.animalGender}', ${animalList.animalAge});">후기 등록</button>
				                </tr>	            	
			            	</c:forEach>
			            </tbody>
			        </table>
	                </form>
			    </div>

	        	
	    </div>
	    <script>
	 // 클릭 이벤트 핸들러
		var category = "${category }";
		document.querySelector("#"+category).classList.add("active");
 		    
		
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
	    	
	    	function insertReview(animalNo, animalSpecies, animalGender, animalAge) {

                var form = document.createElement("form");
                var object1 = document.createElement('input');
                object1.setAttribute('type', 'hidden');
                object1.setAttribute('name', 'animalNo');
                object1.setAttribute('value', animalNo);
                form.appendChild(object1);
                var object2 = document.createElement('input');
                object2.setAttribute('type', 'hidden');
                object2.setAttribute('name', 'animalSpecies');
                object2.setAttribute('value', animalSpecies);
                form.appendChild(object2);
                var object3 = document.createElement('input');
                object3.setAttribute('type', 'hidden');
                object3.setAttribute('name', 'animalGender');
                object3.setAttribute('value', animalGender);
                form.appendChild(object3);
                var object4 = document.createElement('input');
                object4.setAttribute('type', 'hidden');
                object4.setAttribute('name', 'animalAge');
                object4.setAttribute('value', animalAge);
                form.appendChild(object4);

                form.setAttribute('method', 'post');
                form.setAttribute('action', '/review/writeView.ztp');
                document.body.appendChild(form);
                form.submit();

            }
	    	
	    </script>
	</body>
</html>