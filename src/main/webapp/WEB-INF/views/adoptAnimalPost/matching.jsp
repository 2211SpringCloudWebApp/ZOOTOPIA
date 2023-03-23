<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>매칭페이지❤️</title>
        <link rel="stylesheet" href="../../../resources/css/adoptAnimalPost/adoptAnimalPost_matching.css">
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
                
                <div id="selectArea">

                    <div onclick="loadPersonalities('강아지')">
                        <div class="img-area">
                            <img src="../../../resources/img/matching-3d-dog.png" alt="" id="dog-img">
                        </div>
                        <div class="txt-area">강아지</div>
                    </div>

                    <div onclick="loadPersonalities('고양이')">
                        <div class="img-area">
                            <img src="../../../resources/img/matching-3d-cat.png" alt="" id="cat-img">
                        </div>
                        <div class="txt-area">고양이</div>
                    </div>
                    
                    <div onclick="loadPersonalities('소동물')">
                        <div class="img-area">
                            <img src="../../../resources/img/matching-3d-duck.png" alt="" id="duck-img">
                        </div>
                        <div class="txt-area">소동물</div>                 
                    </div>
                    
                    <div onclick="loadPersonalities('기타')">
                        <div class="img-area">
                            <img src="../../../resources/img/matching-3d-ghost.png" alt="" id="ghost-img">
                        </div>
                        <div class="txt-area">기타</div>                 
                    </div>
                </div>

                Illustration by <a href="https://icons8.com/illustrations/author/zD2oqC8lLBBA">Icons 8</a> from <a href="https://icons8.com/illustrations">Ouch!</a>

            </main>
        <jsp:include page="../common/footer.jsp" />

        <script>

            // character jsp로 축종 정보 보낸 다음에 그거 갖고 있는 jsp여기로 불러오기
            function loadPersonalities(animalSpecies) {
                $.ajax({
                    url: "/matching/character.ztp",
                    data: { animalSpecies: animalSpecies },
                    success: function(html) {
                        $('#selectArea').html(html);
                    }
                });
            }

            

        </script>

    </body>
</html>