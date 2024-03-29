<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약페이지❤️</title>
    <link rel="stylesheet" href="../../../resources/css/manager/reservation.css">
    <!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<style type="text/css">
			body{ cursor:url("../../../resources/img/cursor.png"), auto;}
		</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<main>
	    <div class="main">
			<h1>예약현황</h1>
	        <div class="content-wrap">
	          <div class="content-left">
	<!--             <div class="main-wrap"> -->
	<!--               <div id="main-day" class="main-day"></div> -->
	<!--               <div id="main-date" class="main-date"></div> -->
	<!--             </div> -->
	            <div class="todo-wrap">
<!-- 	              <div class="todo-title">Reservation List</div> -->
	              <div class="input-wrap" id="input-wrap">
	<!--                 <input type="text" placeholder="please write here!!" id="input-box" class="input-box"> -->
	<!--                 <button type="button" id="input-data" class="input-data">INPUT</button> -->
	                <div id="input-list" class="input-list">
	              		<form action="/manager/approveReserv.ztp" method="post" id="approveform">
		              		<table id="reservation">
		              			<tr>
		              				<th>예약번호</th>
		              				<th>동물번호</th>
		              				<th>임보자</th>
		              				<th>입양희망자</th>
		              				<th>예약날짜</th>
		              				<th></th>
		              			</tr>
		              			<c:forEach items="${aList }" var="aList">
				              		<tr>
				              			<td>${aList.reservationNo }</td>
				              			<td>${aList.animalNo }</td>
				              			<td>${aList.fosterId }</td>
				              			<td>${aList.adopterId }</td>
				              			<td>${aList.reservationTime }</td>
				              			<td><input type="hidden" name="reservationNo" value="${aList.reservationNo }"><button>승인</button></td>
				              		</tr>
		              			</c:forEach>
		              		</table>
	              		</form>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="content-right">
	            <table id="calendar" align="center">
	              <thead>
	                <tr class="btn-wrap clearfix">
	                  <td>
	                    <label id="prev">
	                        &#60;
	                    </label>
	                  </td>
	                  <td align="center" id="current-year-month" colspan="5"></td>
	                  <td>
	                    <label id="next">
	                        &#62;
	                    </label>
	                  </td>
	                </tr>
	                <tr>
	                    <td class = "sun" align="center">Sun</td>
	                    <td align="center">Mon</td>
	                    <td align="center">Tue</td>
	                    <td align="center">Wed</td>
	                    <td align="center">Thu</td>
	                    <td align="center">Fri</td>
	                    <td class= "sat" align="center">Sat</td>
	                  </tr>
	              </thead>
	              <tbody id="calendar-body" class="calendar-body"></tbody>
	            </table>
	          </div>
	        </div>
	      </div>
      </main>
      
      <jsp:include page="../common/footer.jsp" />
    <script>
        var current = document.querySelector("#current-year-month").innerHTML;
        var currentTitle = document.querySelector("#current-year-month");
        var calendarBody = document.getElementById("calendar-body");
        var today = new Date();
        var first = new Date(today.getFullYear(), today.getMonth(),1);
        var dayList = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
        var monthList = ["January","February","March","April","May","June","July","August","September","October","November","December"];
        var leapYear=[31,29,31,30,31,30,31,31,30,31,30,31];
        var notLeapYear=[31,28,31,30,31,30,31,31,30,31,30,31];
        var pageFirst = first;
        var pageYear;
        if(first.getFullYear() % 4 === 0){
            pageYear = leapYear;
        }else{
            pageYear = notLeapYear;
        }

        function showCalendar(){
            let monthCnt = 100;
            let cnt = 1;
            for(var i = 0; i < 6; i++){
                var $tr = document.createElement("tr");
                $tr.setAttribute("id", monthCnt);   
                for(var j = 0; j < 7; j++){
                    if((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]){
                        var $td = document.createElement("td");
                        $tr.appendChild($td);     
                    }else{
                        var $td = document.createElement("td");
                        $td.textContent = cnt;
                        $td.setAttribute("id", cnt);                
                        $tr.appendChild($td);
                        cnt++;
                    }
                }
                monthCnt++;
                calendarBody.appendChild($tr);
            }
        }
        showCalendar();

        function removeCalendar(){
            let catchTr = 100;
            for(var i = 100; i< 106; i++){
                var $tr = document.getElementById(catchTr);
                $tr.remove();
                catchTr++;
            }
        }

        function prev(){
//             inputBox.value = "";
            const $divs = document.querySelectorAll("#input-list > div");
            $divs.forEach(function(e){
            e.remove();
            });
            const $btns = document.querySelectorAll("#input-list > button");
            $btns.forEach(function(e1){
            e1.remove();
            });
            if(pageFirst.getMonth() === 1){
                pageFirst = new Date(first.getFullYear()-1, 12, 1);
                first = pageFirst;
                if(first.getFullYear() % 4 === 0){
                    pageYear = leapYear;
                }else{
                    pageYear = notLeapYear;
                }
            }else{
                pageFirst = new Date(first.getFullYear(), first.getMonth()-1, 1);
                first = pageFirst;
            }
            today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
            currentTitle.innerHTML = monthList[first.getMonth()] + ", " + first.getFullYear();
            removeCalendar();
            showCalendar();
//             showMain();
            clickedDate1 = document.getElementById(today.getDate());
            clickedDate1.classList.add("active");
            clickStart();
            reshowingList();
        }

        function next(){
//             inputBox.value = "";
            const $divs = document.querySelectorAll("#input-list > div");
            $divs.forEach(function(e){
            e.remove();
            });
            const $btns = document.querySelectorAll("#input-list > button");
            $btns.forEach(function(e1){
            e1.remove();
            });
            if(pageFirst.getMonth() === 12){
                pageFirst = new Date(first.getFullYear()+1, 1, 1);
                first = pageFirst;
                if(first.getFullYear() % 4 === 0){
                    pageYear = leapYear;
                }else{
                    pageYear = notLeapYear;
                }
            }else{
                pageFirst = new Date(first.getFullYear(), first.getMonth()+1, 1);
                first = pageFirst;
            }
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            currentTitle.innerHTML = monthList[first.getMonth()] + ", " + first.getFullYear();
            removeCalendar();
            showCalendar(); 
//             showMain();
            clickedDate1 = document.getElementById(today.getDate());
            clickedDate1.classList.add("active");  
            clickStart();
            reshowingList();
        }

        // 선택한 날짜 왼편에 보여주기
//         function showMain(){
//             var mainTodayDay = document.querySelector("#main-day");
//             var mainTodayDate = document.querySelector("#main-date");
//             mainTodayDay.innerHTML = dayList[today.getDay()];
//             mainTodayDate.innerHTML = today.getDate();
//         }

        var clickedDate1 = document.getElementById(today.getDate());
        clickedDate1.classList.add("active");
        var prevBtn = document.getElementById("prev");
        var nextBtn = document.getElementById("next");
        prevBtn.addEventListener("click",prev);
        nextBtn.addEventListener("click",next);
        var tdGroup = [];

        function clickStart(){
            for(let i = 1; i <= pageYear[first.getMonth()]; i++){
                tdGroup[i] = document.getElementById(i);
                tdGroup[i].addEventListener("click",changeToday);
            }
        }

        function changeToday(e){
            for(let i = 1; i <= pageYear[first.getMonth()]; i++){
                if(tdGroup[i].classList.contains("active")){
                    tdGroup[i].classList.remove("active");
                }
            }
            clickedDate1 = e.currentTarget;
            clickedDate1.classList.add("active");
            today = new Date(today.getFullYear(), today.getMonth(), clickedDate1.id);
//             showMain();
            keyValue = today.getFullYear() + "" + today.getMonth()+ "" + today.getDate();
            reshowingList();
            // 날짜 잘라내기
            var current = document.querySelector("#current-year-month").innerHTML;
            var date = document.querySelector(".active").innerHTML;
            var currentMY = current.split(", ");
            var year = currentMY[1];
            var month = currentMY[0];
            if(month == "January"){
                month = 1;
            }else if(month == "February"){
                month = 2;
            }else if(month == "March"){
                month = 3;
            }else if(month == "April"){
                month = 4;
            }else if(month == "May"){
                month = 5;
            }else if(month == "June"){
                month = 6;
            }else if(month == "July"){
                month = 7;
            }else if(month == "August"){
                month = 8;
            }else if(month == "September"){
                month = 9;
            }else if(month == "October"){
                month = 10;
            }else if(month == "November"){
                month = 11;
            }else if(month == "December"){
                month = 12;
            }
//             console.log(year + "년" + month + "월" + date + "일");
            
            // jsp내 날짜를 controller로 보내기
            $.ajax({
                url: "/manager/viewReservation.ztp",
                method: "POST",
                data: { 
                	yearParam: year,
                	monthParam: month,
                	dateParam: date
                },
                success: function(response) {
//                 	var $data = $(response);
                	
//                 	console.log(response);
// 					var myValue = myData
                	// 데이터를 담을 HTML 테이블 요소 생성
//                 	var table = $("<table>");
                	// 테이블 헤더 추가
//                 	table.append("<thead><tr><th>예약번호</th><th>동물번호</th><th>입양희망자</th><th>입양보내는자</th><th>예약날짜</th></tr></thead>")
                	// 테이블의 바디 추가
//                 	var tbody = $("<tbody>");
//                 	for(var i = 0; i < response.length; i++){
//                 		var row = $("<tr>");
//                 		row.append("<td>" + response[i].column1 + "</td>");
//                 		row.append("<td>" + response[i].column2 + "</td>");
//                 		row.append("<td>" + response[i].column3 + "</td>");
//                 		row.append("<td>" + response[i].column4 + "</td>");
//                 		row.append("<td>" + response[i].column5 + "</td>");
//                 		tbody.append(row);
//                 	}
//                 	table.append(tbody);
                	// 생성된 테이블을 출력할 div요소 선택 후 추가
//                 	$("#input-list").append(table)
                    // JSP 파일을 jQuery 객체로 변환
                    var $html = $(response);
                    
                    // div#result 태그의 내용 추출
                    var resultText = $html.find("#input-list")[0].outerHTML;
                    
                    // 추출한 내용 출력
//                     console.log(resultText)
                    var targetDiv = document.getElementById("input-list");
                    targetDiv.innerHTML = resultText;
//                     $(targetDiv).css("background-color","white");
                },
                error: function(jqXHR, textStatus, errorThrown) {
//                     console.error(errorThrown);
                }
            });
        }

        function reshowingList(){
            keyValue = today.getFullYear() + '' + today.getMonth()+ '' + today.getDate();
            if(todoList[keyValue] === undefined){
                inputList.textContent = '';
                todoList[keyValue] = [];
                const $divs = document.querySelectorAll('#input-list > div');
                $divs.forEach(function(e){
                e.remove();
                });
                const $btns = document.querySelectorAll('#input-list > button');
                $btns.forEach(function(e1){
                e1.remove();
                });
            }else if(todoList[keyValue].length ===0){
                inputList.textContent = "";
                const $divs = document.querySelectorAll('#input-list > div');
                $divs.forEach(function(e){
                e.remove();
                });
                const $btns = document.querySelectorAll('#input-list > button');
                $btns.forEach(function(e1){
                e1.remove();
                });
            }else{
                const $divs = document.querySelectorAll('#input-list > div');
                $divs.forEach(function(e){
                e.remove();
                });
                const $btns = document.querySelectorAll('#input-list > button');
                $btns.forEach(function(e1){
                e1.remove();
                });
                var $div = document.createElement('div');
                for(var i = 0; i < todoList[keyValue].length; i++){
                    var $div = document.createElement('div');
                    $div.textContent = '-' + todoList[keyValue][i];
                    var $btn = document.createElement('button');
                    $btn.setAttribute('type', 'button'); 
                    $btn.setAttribute('id', 'del-ata');
                    $btn.setAttribute('id', dataCnt+keyValue);
                    $btn.setAttribute('class', 'del-data');
                    $btn.textContent = delText;
                    inputList.appendChild($div);
                    inputList.appendChild($btn);
                    $div.addEventListener('click',checkList);
                    $btn.addEventListener('click',deleteTodo);
//                     inputBox.value = '';
                    function deleteTodo(){
                        $div.remove();
                        $btn.remove();
                    }
                }
            }

        }
//         var inputBox = document.getElementById('input-box');
//         var inputDate = document.getElementById('input-data');
        var inputList = document.getElementById('input-list');
        var delText = 'X';
//         inputDate.addEventListener('click',addTodoList);
        var dataCnt = 1;
        var keyValue = today.getFullYear() + '' + today.getMonth()+ '' + today.getDate();
        let todoList = [];
        todoList[keyValue] = [];
        
        // input버튼을 눌렀을 때 todo를 입력해주는 함수
//         function addTodoList(){
//             var $div = document.createElement('div');
//             $div.textContent = '-' + inputBox.value;
//             var $btn = document.createElement('button');
//             $btn.setAttribute('type', 'button'); 
//             $btn.setAttribute('id', 'del-ata');
//             $btn.setAttribute('id', dataCnt+keyValue);
//             $btn.setAttribute('class', "del-data");
//             $btn.textContent = delText;
//             inputList.appendChild($div);
//             inputList.appendChild($btn);
//             todoList[keyValue].push(inputBox.value);
//             dataCnt++;
//             inputBox.value = '';
//             $div.addEventListener('click',checkList);
//             $btn.addEventListener('click',deleteTodo);
//             function deleteTodo(){
//                 $div.remove();
//                 $btn.remove();
//             }
//         }
//         console.log(keyValue);
        function checkList(e){
            e.currentTarget.classList.add('checked');
        }
    </script>
</body>
</html>