<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>입양 공고 목록❤️</title>
        <link rel="stylesheet" href="../../../resources/css/adoptAnimalPost/adoptAnimalPost_list.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="icon" href="../../../resources/img/favicon.png"/>
        <link rel="apple-touch-icon" href="../../../resources/img/favicon.png"/>
    </head>
    <body>

		<jsp:include page="../common/header.jsp" />

        <main>
          <!-- 헤더 부분 피하기 위한 div -->
          <div></div>
          <h1>입양 공고 목록</h1>
          <h4><a href="/adoptAnimal/registerView.ztp">입양 공고 등록하기</a></h4>
          <!-- <h3>${paging.currentPage}</h3>
          <h3>${paging.totalCount}</h3>
          <h3>${paging.animalPostLimit}</h3>
          <h3>${paging.startNavi}</h3>
          <h3>${paging.endNavi}</h3>
          <h3>${paging.maxPage}</h3> -->
            <!-- 조건 필터링 -->
            <form id="filter">
                <ul>
                  <li>
                    <label for=animalSpecies"">축종</label>
                    <select name="animalSpecies" id="animalSpecies">
                      <option value="전체">전체</option>
                      <option value="강아지">강아지</option>
                      <option value="고양이">고양이</option>
                      <option value="소동물">소동물</option>
                      <option value="기타">기타</option>
                    </select>
                  </li>
  
                  <li>
                    <label for="addr">지역</label>
                    <input type="text" placeholder="지역 입력하샘" id="addr" name="animalAddr">
                  </li>
                  
                  <li>
                    <label for="">여기부터</label>
                    <input type="date" name="adoptCreateDateStart">
                    <label for="">여기까지</label>
                    <input type="date" name="adoptCreateDateEnd">
                  </li>
                </ul>
            </form>


            <!-- 동물 게시글 목록 -->
            <table id="animalList">

              <h3>현재 페이지 : ${paging.currentPage }</h3>
              <h3>전체 동물 입양 공고 게시글 수 : ${paging.totalCount }</h3>
              <h3>한 페이지에 노출할 동물 입양 공고 게시글 수 : ${paging.animalPostLimit }</h3>
              <h3>한 페이지 당 pageNavi 수 : ${paging.naviLimit }</h3>
              <h3>pageNavi 시작값 : ${paging.startNavi }</h3>
              <h3>pageNavi 끝값 : ${paging.endNavi }</h3>
              <h3>페이지의 마지막 번호 : ${paging.maxPage }</h3>
              
                <c:forEach items="${aPostList}" var="aPost" varStatus="status">
                    <c:if test="${status.index % 4 == 0}">
                        <tr>
                    </c:if>
                    <td onclick="location.href='/adoptAnimal/detailView.ztp?animalNo=${aPost.animal.animalNo }'">
                        <div>
                            <img src="../../../resources/uploadFiles/${aPost.adoptPost.adoptImageName }" alt="" class="animal-img">
                            <!-- <img src="${pageContext.request.contextPath}/resources/uploadFiles/${aPost.adoptPost.adoptImageName}" alt="이미지 없음"> -->
                        </div>
                        <div>
                            <span>${aPost.animal.animalSpecies }</span> <span>${aPost.adoptPost.adoptCreateDate }</span>
                            <br>
                            <span>${aPost.animal.animalAddr }</span><span>에서 보호중</span>
                        </div>
                    </td>
                    <c:if test="${status.index % 4 == 3 || status.last}">
                        </tr>
                    </c:if>
                </c:forEach>
            </table>

            <!-- 페이징 네비게이션 -->
            <div class="paging">
              <c:if test="${paging.currentPage != 1}">
                <c:if test="${paging.startNavi != 1}">
                  <a href="javascript:getAnimalList(1)" class="move first">처음으로</a>
                </c:if>
                <a href="javascript:getAnimalList(${paging.currentPage-1})" class="move prev">이전</a>
              </c:if>
              
              <c:forEach begin="${paging.startNavi}" end="${paging.endNavi}" var="i">
                
                <c:choose>
                  <c:when test="${i == paging.currentPage}">
                    <span class="page current">${i}</span>
                  </c:when>
                  <c:otherwise>
                    <a href="javascript:getAnimalList(${i})" class="page">${i}</a>
                  </c:otherwise>
                </c:choose>

              </c:forEach>

              <c:if test="${paging.currentPage != paging.maxPage}">
                <a href="javascript:getAnimalList(${paging.currentPage+1})" class="move next">다음</a>
                <c:if test="${paging.endNavi != paging.maxPage}">
                  <a href="javascript:getAnimalList(${paging.maxPage})" class="move last">맨뒤로</a>
                </c:if>
              </c:if>
            </div>

        </main>

		<jsp:include page="../common/footer.jsp" />


        <script>
          // animalList.js
          // 필터링 함수
          $(document).on("change", "#filter select, #filter input", function(e) {
            e.preventDefault();
            var formData = $(this).serialize();
            $.ajax({
              url: "/adoptAnimal/filteredList.ztp",
              type: "GET",
              data: formData,
              dataType: "html",
              success: function(data) {
                var postList = $(data).find("#animalList").html();
                var paging = $(data).find(".paging").html();
                if (!postList || postList.trim() === "") {
                  $("#animalList").empty();
                  $(".paging").empty();
                } else {
                  $("#animalList").html(postList);
                  $(".paging").html(paging);
                }
              }
            });
          });

          // 페이지 이동 함수
          function getAnimalList(page) {
            $.ajax({
              url: "/adoptAnimal/list.ztp?page=" + page,
              type: "GET",
              dataType: "html",
              success: function(data) {

                // $("#animalList").html(data);

                // 가져온 데이터에서 게시글 목록과 페이징 정보 추출
                var postList = $(data).find("#animalList").html();
                var paging = $(data).find(".paging").html();

                // 게시글 목록과 페이징 정보를 업데이트
                $("#animalList").html(postList);
                $(".paging").html(paging);

              }
            });
          }

          // 페이지 버튼 클릭 이벤트 처리
          $(document).on("click", ".paging-btn", function() {
            var page = $(this).data("page");
            getAnimalList(page);
          });

          // 처음으로 버튼 클릭 이벤트 처리
          $(document).on("click", "#btn-first", function() {
            var page = 1;
            getAnimalList(page);
          });

          // 이전 버튼 클릭 이벤트 처리
          $(document).on("click", "#btn-prev", function() {
            var page = $(this).data("prev");
            getAnimalList(page);
          });

          // 다음 버튼 클릭 이벤트 처리
          $(document).on("click", "#btn-next", function() {
            var page = $(this).data("next");
            getAnimalList(page);
          });

          // 마지막으로 버튼 클릭 이벤트 처리
          $(document).on("click", "#btn-last", function() {
            var page = $(this).data("last");
            getAnimalList(page);
          });

        </script>
    </body>
</html>