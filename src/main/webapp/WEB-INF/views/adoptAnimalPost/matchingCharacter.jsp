<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>매칭페이지❤️</title>
        <!-- 얘는 css 새로 만들 필요가 있을지도 ! 일단ㄱ은 걍 잇는거 적용! -->
        <link rel="stylesheet" href="../../../resources/css/adoptAnimalPost/adoptAnimalPost_matching.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="icon" href="../../../resources/img/favicon.png" />
        <link rel="apple-touch-icon" href="../../../resources/img/favicon.png" />
        <style type="text/css">
            body{ cursor:url("../../../resources/img/cursor.png"), auto;}
        </style>
    </head>

    <body>

        <form method="post" action="/matching/result.ztp">
            <input type="hidden" name="animalSpecies" value="${animalSpecies }">
            <div id="selectArea-char">

                <div id="section1">
                    <div onclick="loadMatchingResult('예민보스 유형')">
                        <div class="img-area">
                            <img src="../../../resources/img/예민보스.png" alt="">
                        </div>
                        <div class="txt-area">예민보스 유형</div>
                    </div>
    
                    <div onclick="loadMatchingResult('호기심 대마왕 유형')">
                        <div class="img-area">
                            <img src="../../../resources/img/호기심.png" alt="">
                        </div>
                        <div class="txt-area">호기심 대마왕 유형</div>
                    </div>
    
                    <div onclick="loadMatchingResult('껌딱지 유형')">
                        <div class="img-area">
                            <img src="../../../resources/img/껌딱지.png" alt="">
                        </div>
                        <div class="txt-area">껌딱지 유형</div>
                    </div>
                </div>

                <div id="section2">
                    <div onclick="loadMatchingResult('독립심이 강한 유형')">
                        <div class="img-area">
                            <img src="../../../resources/img/독립심.png" alt="">
                        </div>
                        <div class="txt-area">독립심이 강한 유형</div>
                    </div>
    
                    <div onclick="loadMatchingResult('소심한 유형')">
                        <div class="img-area">
                            <img src="../../../resources/img/소심.png" alt="">
                        </div>
                        <div class="txt-area">소심한 유형</div>
                    </div>
    
                    <div onclick="loadMatchingResult('열정적인 유형')">
                        <div class="img-area">
                            <img src="../../../resources/img/열정.png" alt="">
                        </div>
                        <div class="txt-area">열정적인 유형</div>
                    </div>

                    <div onclick="loadMatchingResult('적응력 만렙 유형')">
                        <div class="img-area">
                            <img src="../../../resources/img/적응력.png" alt="">
                        </div>
                        <div class="txt-area">적응력 만렙 유형</div>
                    </div>
    
                    
                </div>


                <input type="hidden" name="animalCharacter">
            </div>

            <!-- <button type="submit">선택 완료</button> -->
        </form>
        <script>
            function loadMatchingResult(animalCharacter) {
                // 클릭한 성격을 animalCharacter값으로 전달하기 위함
                $("[name=animalCharacter]").val(animalCharacter);
                // submit하기!
                $("[action='/matching/result.ztp']").submit();
            }

        </script>

    </body>

    </html>