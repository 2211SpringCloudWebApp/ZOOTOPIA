<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>입양 공고 등록</title>
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
	    <form action="/adoptAnimal/register.ztp"  method="post" enctype="multipart/form-data">
			
			<!-- 세션에서 작성자 아이디 가져올 건데 -->
			<!-- <input type="hidden" name="" value="${loginUser.memberId }"> -->

			<!-- 없으니까 그냥 일단 'loginUserId' 라고 넣겟음 -->
			<input type="hidden" name="adoptWriterId" value="loginUserId">

			<ul>	
				<li>
					<label for="" class="postContentLabel">축종</label>
					<select name="animalSpecies" id="">
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
						<option value="소동물">소동물</option>
						<option value="기타">기타</option>
					</select>
				</li>

				<li>
					<label for="" class="postContentLabel">성별</label>
					<select name="animalGender" id="">
						<option value="암컷">암컷</option>
						<option value="수컷">수컷</option>
						<option value="">알 수 없음</option>
					</select>
				</li>

				<li>
					<label for="" class="postContentLabel">체중</label>
					<input type="number" name="animalWeight"> kg
				</li>

				<li>
					<label for="" class="postContentLabel">추정 나이</label>
					<input type="number" name="animalAge"> 살
				</li>

				<li>
					<label for="" class="postContentLabel">중성화</label>
					<select name="neuterYN" id="">
						<option value="Y">ㅇㅇ</option>
						<option value="N">ㄴㄴ</option>
						<option value="">알 수 없음</option>
					</select>
				</li>

				<li>
					<!-- 일단은 text로 받는데 select로 변경 예정 -->
					<label for="" class="postContentLabel">임시보호지역</label>
					<input type="text" name="animalAddr">
				</li>

				<li>
					<label for="animalCharacter" class="postContentLabel">성격</label>
					<!-- <input type="checkbox" id="char1">
					<label for="char1">성격1</label>

					<input type="checkbox" id="char2">
					<label for="char2">성격2</label>

					<input type="checkbox" id="char3">
					<label for="char3">성격3</label>

					<input type="checkbox" id="char4">
					<label for="char4">성격4</label> -->
					<input type="text" name="animalCharacter" id="animalCharacter">
				</li>

				<li>
					
					<textarea placeholder="게시글 내용을 입력하시길" name="adoptContent" cols="30" rows="10"></textarea>
				</li>

				<li>
					<label for="" class="postContentLabel">이미지</label>
					<input type="file" name="uploadFile">
				</li>

			</ul>

			<input type="submit" value="등록하기">
	    </form>	
	</body>
</html>