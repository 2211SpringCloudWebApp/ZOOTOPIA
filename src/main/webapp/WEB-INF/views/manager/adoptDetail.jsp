<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양공고 상세페이지❤️</title>
		<link rel="stylesheet" href="../../../resources/css/manager/memberDetail.css">
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp"></jsp:include>
		
		<main>
			<div id="titleTag">
				<img alt="" src="../../../resources/img/manager-icon2.png">
		    	<h1>미승인 입양공고</h1>
		    </div>
			    <table>
		            <tr>
		                <td><span>축종</span></td>
		                <td>${animal.animalSpecies }</td>
		            </tr>
		            <tr>
		                <td><span>성별</span></td>
		                <td>${animal.animalGender }</td>
		            </tr>
		            <tr>
		                <td><span>체중</span></td>
		                <td>${animal.animalWeight }</td>		            
		            </tr>
		            <tr>
		                <td><span>나이</span></td>
		                <td>${animal.animalAge }</td>
		            </tr>
		            <tr>
		                <td><span>중성화여부</span></td>
		                <td>${animal.neuterYN }</td>
		            </tr>
		            <tr>
		                <td><span>지역</span></td>
		                <td>${animal.animalAddr }</td>
		            </tr>
		            <tr>
		                <td><span>임보자아이디</span></td>
		                <td>${animal.animalFosterId }</td>
		            </tr>
			    </table>
			    <div id="buttonTag">
			    	<button onclick="approveBtn()">공고승인</button>
			    </div>
	    </main>
	    <jsp:include page="../common/footer.jsp" />
	    
	    <script>

	    </script>
	</body>
</html>