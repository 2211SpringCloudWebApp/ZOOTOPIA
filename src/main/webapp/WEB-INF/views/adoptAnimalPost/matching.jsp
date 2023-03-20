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
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
            <main>
                <!-- 헤더 부분 피하기 위한 div -->
                <div></div>

                <div id="selectArea">
                    <div onclick="loadPersonalities('강아지')">강아지</div>
                    <div onclick="loadPersonalities('고양이')">고양이</div>
                    <div onclick="loadPersonalities('소동물')">소동물</div>
                    <div onclick="loadPersonalities('기타')">기타</div>
                </div>
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