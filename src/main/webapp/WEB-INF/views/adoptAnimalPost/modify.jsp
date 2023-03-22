<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>입양 공고 수정❤️</title>
		<link rel="stylesheet" href="../../../resources/css/adoptAnimalPost/adoptAnimalPost_modify.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<link rel="icon" href="../../../resources/img/favicon.png" />
		<link rel="apple-touch-icon" href="../../../resources/img/favicon.png" />
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>

		<style>
			ul {
				list-style-type: none;
			}

			ul .postContentLabel {
				width: 100px;
				float: left;
				padding-right: 10px;
			}
		</style>

	</head>

	<body>
		<jsp:include page="../common/header.jsp" />
		<main>
			<!-- 헤더 부분 피하기 위한 div -->
			<div></div>

			<h1>입양공고수정하기</h1>
			<h3>아이디 : ${loginUser.memberId } / 이름 : ${loginUser.memberName }</h3>

			<form action="/adoptAnimal/modify.ztp" method="post" enctype="multipart/form-data" id="form">
				<h3>animalNo : ${aPost.animal.animalNo }</h3>

				<input type="hidden" name="animalNo" value="${aPost.animal.animalNo }">
				<input type="hidden" name="adoptWriterId" value="${loginUser.memberId }">

				<ul>
					<li>
						<label for="animalSpecies" class="postContentLabel">축종</label>
						<select name="animalSpecies" id="animalSpecies">
							<option value="강아지" <c:if test="${aPost.animal.animalSpecies eq '강아지'}">selected</c:if>>강아지</option>
							<option value="고양이" <c:if test="${aPost.animal.animalSpecies eq '고양이'}">selected</c:if>>고양이</option>
							<option value="소동물" <c:if test="${aPost.animal.animalSpecies eq '소동물'}">selected</c:if>>소동물</option>
							<option value="기타" <c:if test="${aPost.animal.animalSpecies eq '기타'}">selected</c:if>>기타</option>
						</select>
					</li>

					<li>
						<label for="animalGender" class="postContentLabel">성별</label>
						<select name="animalGender" id="animalGender">
							<option value="F" <c:if test="${aPost.animal.animalGender eq 'F'}">selected</c:if>>암컷</option>
							<option value="M" <c:if test="${aPost.animal.animalGender eq 'M'}">selected</c:if>>수컷</option>
							<option value="" <c:if test="${aPost.animal.animalGender eq ''}">selected</c:if>>알 수 없음</option>
						</select>
					</li>

					<li>
						<label for="" class="postContentLabel">체중</label>
						<input type="number" name="animalWeight" value="${aPost.animal.animalWeight }"> kg
					</li>

					<li>
						<label for="" class="postContentLabel">추정 나이</label>
						<input type="number" name="animalAge" value="${aPost.animal.animalAge }"> 살
					</li>

					<li>
						<label for="" class="postContentLabel">중성화</label>
						<select name="neuterYN" id="">
							<option value="Y" <c:if test="${aPost.animal.neuterYN eq 'Y'}">selected</c:if>>ㅇㅇ</option>
							<option value="N" <c:if test="${aPost.animal.neuterYN eq 'N'}">selected</c:if>>ㄴㄴ</option>
							<option value="" <c:if test="${aPost.animal.neuterYN eq ''}">selected</c:if>>알 수 없음</option>
						</select>
					</li>

					<li>

						<label for="" class="postContentLabel">임시보호지역</label>

						<!-- 주소 정보 시/도 와 시/군/구로 나눠서 각각 hidden태그에 담아주기 -->
						<c:set var="addr" value="${aPost.animal.animalAddr}" />
						<c:set var="sido" value="${fn:split(addr, ' ')[0]}" />
						<c:set var="sigungu" value="${fn:split(addr, ' ')[1]}" />
						<input type="hidden" value="${sido }" name="currSido">
						<input type="hidden" value="${sigungu }" name="currSigungu">
						
						<select name="sido" id="sido"></select>
						<select name="sigungu" id="sigugun"></select>

					</li>

					<li>
						<label for="animalCharacter" class="postContentLabel">성격</label>
						<br>
						<input type="checkbox" name="characters" value="독립심이 강한 유형" <c:if test="${fn:contains(aPost.animal.animalCharacter, '독립심이 강한 유형')}">checked</c:if>>독립심이 강한 유형<br>
						<input type="checkbox" name="characters" value="소심한 유형" <c:if test="${fn:contains(aPost.animal.animalCharacter, '소심한 유형')}">checked</c:if>>소심한 유형<br>
						<input type="checkbox" name="characters" value="열정적인 유형" <c:if test="${fn:contains(aPost.animal.animalCharacter, '열정적인 유형')}">checked</c:if>>열정적인 유형<br>
						<input type="checkbox" name="characters" value="적응력 만렙 유형" <c:if test="${fn:contains(aPost.animal.animalCharacter, '적응력 만렙 유형')}">checked</c:if>>적응력 만렙 유형<br>
						<input type="checkbox" name="characters" value="예민보스 유형" <c:if test="${fn:contains(aPost.animal.animalCharacter, '예민보스 유형')}">checked</c:if>>예민보스 유형<br>
						<input type="checkbox" name="characters" value="호기심 대마왕 유형" <c:if test="${fn:contains(aPost.animal.animalCharacter, '호기심 대마왕 유형')}">checked</c:if>>호기심 대마왕 유형<br>
						<input type="checkbox" name="characters" value="껌딱지 유형" <c:if test="${fn:contains(aPost.animal.animalCharacter, '껌딱지 유형')}">checked</c:if>>껌딱지 유형<br>

			
					</li>

					<li>
						<h3>변경사항이 ㅇ없을 경우 그대로 유지하ㅣ도록 하기</h3>
						<h3>이미지 새로 입력받을 경우 ㅇ이미지 업데이트</h3>
						<label for="" class="postContentLabel">이미지</label>
						<br>
						<button onclick="removeImg('${aPost.adoptPost.adoptImageName}')">업로드된 사진 삭제</button>
						<input type="file" name="reloadFile" id="uploadFile" accept="image/*" multiple>
						<div id="uploadFileBtn">이미지 등록하기!!</div>
						<div id="preview-area"></div>

						<!-- 등록된 이미지 출력 부분 -->
						이미지이름<input type="text" name="adoptImageName" value="${aPost.adoptPost.adoptImageName}">
						이미지경로<input type="text" name="adoptImagePath" value="${aPost.adoptPost.adoptImagePath}">
						<c:set var="imageNames" value="${aPost.adoptPost.adoptImageName}" />
						<c:set var="imageNameArr" value="${fn:split(imageNames, ';')}" />
						<c:forEach var="imageName" items="${imageNameArr}">
							<img src="../../../resources/uploadFiles/${imageName }" alt="" class="modal-trigger" data-modal-target="#modal-${imageName }">
						</c:forEach>
					</li>



					<li>
						<textarea placeholder="게시글 내용을 입력하시길" name="adoptContent" cols="30" rows="10">${aPost.adoptPost.adoptContent }</textarea>
					</li>


				</ul>

				<input type="submit" value="수정하기">
			</form>

		</main>

		<jsp:include page="../common/footer.jsp" />


		<script>

			// 이미지 삭제 
			function removeImg(adoptImageName) {
				
			}


			const uploadFile = document.querySelector('#uploadFile');
			const uploadFileBtn = document.querySelector('#uploadFileBtn');

			const previewArea = document.getElementById('preview-area');
			uploadFileBtn.addEventListener('click', () => uploadFile.click());

			uploadFile.addEventListener('change', () => {
				const files = uploadFile.files;
				
				if (files.length > 4) {
					alert('이미지는 최대 4개까지 등록 가능합니다.');
					uploadFile.value = '';
					return;
				}
				
				// 이미지 미리보기 등록
				previewArea.innerHTML = '';
				for (let i = 0; i < files.length; i++) {
					const file = files[i];
					const reader = new FileReader();
					reader.readAsDataURL(file);
					reader.onload = () => {
						const img = document.createElement('img');
						img.setAttribute('src', reader.result);
						img.setAttribute('class', 'preview-img');
						previewArea.appendChild(img);
					}
				}

			});






			// 주소 입력 관련

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
				// $("select[name^=sido]").each(function () {
				// 	$selsido = $(this);
				// 	$.each(eval(area0), function () {
				// 		$selsido.append("<option value='" + this + "'>" + this + "</option>");
				// 	});
				// 	$selsido.next().append("<option value=''>시/군/구 선택</option>");
				// });


				// 시/도 selected 속성 추가
				// $("select[name^=sido]").each(function () {

				// 	var currSido = $("input[name=currSido]").val();

				// 	$selsido = $(this);
				// 	$.each(eval(area0), function () {
				// 		var option = "<option value='" + this + "'";
				// 		if (this == currSido) {
				// 			option += " selected";
				// 		}
				// 		option += ">" + this + "</option>";
				// 		$selsido.append(option);
				// 	});
				// 	$selsido.next().append("<option value=''>시/군/구 선택</option>");
				// });



				// 시/도 선택시 시/군/구 설정

				// $("select[name^=sido]").change(function () {
					
				// 	var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
				// 	var $sigungu = $(this).next(); // 선택영역 군구 객체
				// 	$("option", $sigungu).remove(); // 구군 초기화

				// 	if (area == "area0")
				// 		$sigungu.append("<option value=''>시/군/구 선택</option>");
				// 	else {
				// 		$.each(eval(area), function () {
				// 			$sigungu.append("<option value='" + this + "'>" + this + "</option>");
				// 		});
				// 	}
				// });

				// 수정 시 현재 정보 selectbox에 selected속성으로 반영하기 위함
				$(document).ready(function () {
					var currSido = $("input[name=currSido]").val(); // 현재 선택된 시/도
					var currSigungu = $("input[name=currSigungu]").val(); // 현재 선택된 시/군/구

					// 시/도 선택 박스 초기화
					$("select[name^=sido]").each(function () {
						var $selsido = $(this);
						$.each(eval(area0), function () {
							var option = "<option value='" + this + "'";
							if (this == currSido) {
								option += " selected";
							}
							option += ">" + this + "</option>";
							$selsido.append(option);
						});
						$selsido.next().append("<option value=''>시/군/구 선택</option>");
					});

					// 시/군/구 선택 박스 초기화
					var area = "area" + $("option:selected", $("select[name^=sido]")).index(); // 선택된 시/도에 해당하는 구군 Array
					var $sigungu = $("select[name^=sigungu]");
					$.each(eval(area), function () {
						var option = "<option value='" + this + "'";
						if (this == currSigungu) {
							option += " selected";
						}
						option += ">" + this + "</option>";
						$sigungu.append(option);
					});
				});


			});
		</script>
	</body>

	</html>