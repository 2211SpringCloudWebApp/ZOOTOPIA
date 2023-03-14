<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>입양 공고 목록</title>
        <link rel="stylesheet" href="../../../resources/css/adoptAnimalPost_list.css">
    </head>
    <body>

		<jsp:include page="../common/header.jsp" />

        <main>
            <table>
                <c:forEach items="${aPostList}" var="aPost" varStatus="status">
                    <c:if test="${status.index % 4 == 0}">
                        <tr>
                    </c:if>
                    <td onclick="location.href='/adoptAnimal/detailView.ztp?animalNo=${aPost.animal.animalNo }'">
                        <div>
                            <img src="../../../resources/img/컴퓨터.png" alt="이미지없음" class="animal-img">
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