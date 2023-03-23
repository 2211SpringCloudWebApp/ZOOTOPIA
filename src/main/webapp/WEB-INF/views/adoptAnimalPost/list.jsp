<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>입양 공고 목록❤️</title>
        <link rel="stylesheet" href="../../../resources/css/adoptAnimalPost/adoptAnimalPost_list.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="icon" href="../../../resources/img/favicon.png"/>
        <link rel="apple-touch-icon" href="../../../resources/img/favicon.png"/>
        <style type="text/css">
          body{ cursor:url("../../../resources/img/cursor.png"), auto;}
        </style>
    </head>
    <body>

		<jsp:include page="../common/header.jsp" />

        <main>
          <!-- 헤더 부분 피하기 위한 div -->
          <div></div>

          <!-- 현재 메뉴 정보 div 시작 -->
          <div id="menu-info">

            <!-- 밝은 색 부분 -->
            <div id="section1">
              <div>입양 공고 확인하기</div>
              <div>가나다라 마바사 아자차카 타파하</div>
            </div>

            <!-- 어두운 색 부분 -->
            <div id="section2">
              <!-- 마름모 그림자 -->
              <div></div>
              <!-- 마름모 -->
              <div></div>
            </div>

            <!-- 여백을 주기 위함 -->
            <div id="section3"></div>

          </div>
          <!-- 현재 메뉴 정보 div 끝 -->
          <!-- 이거 공통으로 쓰자고 얘기해보기 -->

            
            <!-- main-content : 내용 시작, filter, list, pageNation -->
            <div id="main-content">
              <h4><a href="/adoptAnimal/registerView.ztp">입양 공고 등록하기</a></h4>
            
              <!-- 조건 필터링 -->
              <form action="/adoptAnimal/list.ztp" method="post" id="filter">
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
                      <!-- <input type="text" placeholder="지역 입력하샘" id="addr" name="animalAddr"> -->
                      <select name="sido" id="sido"></select>
						          <select name="sigungu" id="sigugun"></select>
                    </li>
                    
                    <li>
                      <label for="">등록일</label>
                      <input type="date" name="adoptCreateDateStart">
                      <label id="wave" for="">~</label>
                      <input type="date" name="adoptCreateDateEnd">
                    </li>
                  </ul>
                  <button type="submit">검색</button>
              </form>
  
  
              <!-- 동물 게시글 목록 -->
              <div id="animalListArea">
                <table id="animalList">
                    <c:forEach items="${aPostList}" var="aPost" varStatus="status">
                        <c:if test="${status.index % 4 == 0}">
                            <tr>
                        </c:if>
                        <td onclick="location.href='/adoptAnimal/detailView.ztp?animalNo=${aPost.animal.animalNo }'">
                            <div>
                                <img src="../../../resources/uploadFiles/${aPost.adoptPost.adoptImageName }" onerror="this.onerror=null; this.src='../../../resources/uploadFiles/no-img.png';" alt="" class="animal-img">
                                <!-- <img src="${pageContext.request.contextPath}/resources/uploadFiles/${aPost.adoptPost.adoptImageName}" alt="이미지 없음"> -->
                            </div>
                            <div>
                              <!-- timestamp에서 시간부분 잘라내기 -->
                                <c:set var="adoptCreateTimeStamp" value="${aPost.adoptPost.adoptCreateDate }" />
                                <c:set var="adoptCreateDate" value="${fn:split(adoptCreateTimeStamp, ' ')[0]}" />
                                <span>${aPost.animal.animalSpecies }</span> <span>${adoptCreateDate }</span>
                                <br>
                                <span>${aPost.animal.animalAddr }</span><span>에서 보호중</span>
                            </div>
                        </td>
                        <c:if test="${status.index % 4 == 3 || status.last}">
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
              </div>
  
              <!-- 페이징 네비게이션 -->
              <div class="paging">
                <c:if test="${paging.currentPage != 1}">
                  <c:if test="${paging.startNavi != 1}">
                    <!-- 첫 페이지로 버튼 -->
                    <a href="javascript:getAnimalList(1)" class="move first">&lt;&lt;</a>
                  </c:if>
                  <!-- 이전 페이지로 버튼 -->
                  <a href="javascript:getAnimalList(${paging.currentPage-1})" class="move prev">&lt;</a>
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
                  <!-- 다음 페이지로 버튼 -->
                  <a href="javascript:getAnimalList(${paging.currentPage+1})" class="move next">&gt;</a>
                  <c:if test="${paging.endNavi != paging.maxPage}">
                    <!-- 맨 끝 페이지로 버튼 -->
                    <a href="javascript:getAnimalList(${paging.maxPage})" class="move last">&gt;&gt;</a>
                  </c:if>
                </c:if>
              </div>

            </div>
            <!-- main-content : 내용 끝!, filter, list, pageNation -->

        </main>

		<jsp:include page="../common/footer.jsp" />


        <script>

          // 검색 버튼 클릭할 경우
          $('#filter button[type="submit"]').on('click', function(e) {
            // 폼 전송 막기
            e.preventDefault(); 

            var animalSpecies = $('#animalSpecies').val();
            var sido = $('#sido').val();
            var sigungu = $('#sigugun').val();
            var adoptCreateDateStart = $('input[name="adoptCreateDateStart"]').val();
            var adoptCreateDateEnd = $('input[name="adoptCreateDateEnd"]').val();

            $.ajax({
              url: '/adoptAnimal/list.ztp',
              type: 'POST',
              data: {
                animalSpecies: animalSpecies,
                sido: sido,
                sigungu: sigungu,
                adoptCreateDateStart: adoptCreateDateStart,
                adoptCreateDateEnd: adoptCreateDateEnd,
              },
              dataType: 'html',
              success: function(data) {
                // 서버로부터 받은 HTML 데이터에서 동물 목록과 페이징 정보 추출
                var postList = $(data).find('#animalList').html();
                var paging = $(data).find('.paging').html();

                // 동물 목록과 페이징 정보 업데이트
                $('#animalList').html(postList);
                $('.paging').html(paging);
              },
              error: function(xhr, status, error) {
                alert('동물 목록 가져오기 실패: ' + error);
              }
            });

          });


          // 페이지 이동 함수
          function getAnimalList(page) {

            var animalSpecies = $('#animalSpecies').val();
            var sido = $('#sido').val();
            var sigungu = $('#sigugun').val();
            var adoptCreateDateStart = $('input[name="adoptCreateDateStart"]').val();
            var adoptCreateDateEnd = $('input[name="adoptCreateDateEnd"]').val();

            $.ajax({
              url: "/adoptAnimal/list.ztp",
              type: "POST",
              data: {
                animalSpecies: animalSpecies,
                sido: sido,
                sigungu: sigungu,
                adoptCreateDateStart: adoptCreateDateStart,
                adoptCreateDateEnd: adoptCreateDateEnd,
                page: page
              },
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


          // 지역선택~~
          $('document').ready(function () {

            // 시/도 선택
            var area0 = ["시/도 선택", "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];

            // 시/군/구 선택
            // 서울특별시
            var area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];

            // 인천광역시
            var area2 = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];

            // 대전광역시
            var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];

            // 광주광역시
            var area4 = ["광산구", "남구", "동구", "북구", "서구"];

            // 대구광역시
            var area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];

            // 울산광역시
            var area6 = ["남구", "동구", "북구", "중구", "울주군"];

            // 부산광역시
            var area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];

            // 경기도
            var area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];

            // 강원도
            var area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];

            // 충청북도
            var area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];

            // 충청남도
            var area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"];

            // 전라북도
            var area12 = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];

            // 전라남도
            var area13 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];

            // 경상북도
            var area14 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];

            // 경상남도
            var area15 = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];

            // 제주도
            var area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];



            // 시/도 선택 박스 초기화
            $("select[name^=sido]").each(function () {
              $selsido = $(this);
              $.each(eval(area0), function () {
                $selsido.append("<option value='" + this + "'>" + this + "</option>");
              });
              $selsido.next().append("<option value=''>시/군/구 선택</option>");
            });



            // 시/도 선택시 시/군/구 설정

            $("select[name^=sido]").change(function () {
              var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
              var $sigungu = $(this).next(); // 선택영역 군구 객체
              $("option", $sigungu).remove(); // 구군 초기화

              if (area == "area0")
                $sigungu.append("<option value=''>시/군/구 선택</option>");
              else {
                $.each(eval(area), function () {
                  $sigungu.append("<option value='" + this + "'>" + this + "</option>");
                });
              }
            });


          }); 


          // 페이지 스크롤에 따라 상단 베이지 배경 높이 조절
          // 처음 페이지가 열렸을 때
          window.addEventListener('load', function() {
            document.getElementById('section1').style.height = '250px';
          });

          // 스크롤 할 때 
          window.addEventListener('scroll', function() {
            // 스크롤 위치 계산
            var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            // 스크롤을 내린 경우
            if (scrollTop > 0 && scrollTop < 250) {
              document.getElementById('section1').style.height = (250 - scrollTop) + 'px';
            }
            // 스크롤을 올린 경우
            else if (scrollTop <= 0) {
              document.getElementById('section1').style.height = '250px';
            }
            // 스크롤을 더 내린 경우
            else {
              document.getElementById('section1').style.height = '0';
            }
          });
          

        </script>
    </body>
</html>