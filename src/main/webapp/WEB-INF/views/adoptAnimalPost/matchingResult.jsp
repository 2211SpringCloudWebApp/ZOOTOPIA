<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>매칭 결과❤️</title>
        <link rel="stylesheet" href="../../../resources/css/adoptAnimalPost/adoptAnimalPost_matching_result.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="icon" href="../../../resources/img/favicon.png" />
        <link rel="apple-touch-icon" href="../../../resources/img/favicon.png" />
        <style type="text/css">
            body{ cursor:url("../../../resources/img/cursor.png"), auto;}
        </style>
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <main>
            <!-- 헤더 부분 피하기 위한 div -->
            <div></div>
            
            
            <div id="title">❤️랜덤 매칭 결과❤️</div>
            <div id="title">CLICK!</div>
        
            <table id="animalList">
                <tr>
                    <td onclick="location.href='/adoptAnimal/detailView.ztp?animalNo=${aPost.animal.animalNo }'">
                        <div>
                            <img src="../../../resources/uploadFiles/${aPost.adoptPost.adoptImageName }" onerror="this.onerror=null; this.src='../../../resources/img/matching-result.png';" alt="" class="animal-img">
                        </div>
                        <div id="info">
                            <c:set var="adoptCreateTimeStamp" value="${aPost.adoptPost.adoptCreateDate }" />
                            <c:set var="adoptCreateDate" value="${fn:split(adoptCreateTimeStamp, ' ')[0]}" />
                            <div>
                                <span>${aPost.animal.animalSpecies }</span> <span>${adoptCreateDate }</span>
                            </div>
                            <div>
                                <span>${aPost.animal.animalAddr }</span><span>에서 보호중</span>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>ml>