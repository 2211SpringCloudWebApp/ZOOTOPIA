<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>매칭 결과❤️</title>
        <link rel="stylesheet" href="../../../resources/css/adoptAnimalPost/adoptAnimalPost_matching_result.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <link rel="icon" href="../../../resources/img/favicon.png" />
        <link rel="apple-touch-icon" href="../../../resources/img/favicon.png" />
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <main>
            <!-- 헤더 부분 피하기 위한 div -->
            <div></div>
            <h1>매칭결과입니다</h1>
            <table id="animalList">
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
        </main>
        <jsp:include page="../common/footer.jsp" />
    </body>
</html>