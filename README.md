# ZOOTOPIA
동물의 숲 - 세미프로젝트

<h2>주토피아(ZOOTOPIA)는 보살핌을 받지 못하는 동물들에게 새로운 가족을 만들어주는 역할을 함</h2>
<li>대부분의 입양 사이트들이 사진과 접종 여부 등, 기본 정보만 제공<br>
<li>입양자들이 반려동물을 선택 시 신중하게 결정할 수 있는 서비스 제공<br>
<li>매칭게시판을 통해 개개인에게 맞는 종을 더 상세히 알아볼 수 있게 함<br>
<h3> → 파양을 줄이고 반려동물이 새로운 보금자리를 찾도록 해줌</h3><br>

<hr>
<br>
<h2>:factory: 기능</h2>
<li><strong>입양 공고</strong><br>
- 각 동물의 성격을 그룹화해서 작성<br>
- 예약<br>
- 댓글<br>
- 좋아요<br>
- 공유
<li><strong>매칭</strong>
<li><strong>공지사항</strong><br>
- 공지 등록/수정/삭제<br>
- 댓글<br>
<li><strong>후기</strong><br>
- 후기 등록/수정/삭제<br>
- 댓글<br>
- 좋아요<br>
<li><strong>관리자 페이지</strong><br>
- 회원관리<br>
- 입양공고/동물 관리<br>
- 후기관리<br>
- 댓글/좋아요 관리<br>
<li><strong>회원관리(마이페이지)</strong><br>
- 회원가입 및 ID/PW찾기<br>
- 회원정보 출력/수정<br>
- 본인이 올린 글/댓글/좋아요 확인/삭제<br>


<div class="ritz grid-container" dir="ltr">
    <table class="waffle" cellspacing="0" cellpadding="0">
        <thead>
            <tr>
                <th class="row-header freezebar-origin-ltr"></th>
                <th id="0C0" style="width:88px;" class="column-headers-background">A</th>
                <th id="0C1" style="width:76px;" class="column-headers-background">B</th>
                <th id="0C2" style="width:76px;" class="column-headers-background">C</th>
                <th id="0C3" style="width:1139px;" class="column-headers-background">D</th>
                <th id="0C4" style="width:81px;" class="column-headers-background">E</th>
                <th id="0C5" style="width:81px;" class="column-headers-background">F</th>
                <th id="0C6" style="width:81px;" class="column-headers-background">G</th>
            </tr>
        </thead>
        <tbody>
            <tr style="height: 20px">
                <th id="0R0" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">1</div>
                </th>
                <td class="s0" dir="ltr" colspan="3"></td>
                <td class="s1" dir="ltr">설명</td>
                <td class="s0" dir="ltr">Guest</td>
                <td class="s0" dir="ltr">Member</td>
                <td class="s0" dir="ltr">Manager</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R1" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">2</div>
                </th>
                <td class="s0" dir="ltr" rowspan="4">회원관리</td>
                <td class="s0" dir="ltr" colspan="2">로그인</td>
                <td class="s2" dir="ltr">로그인이 되지 않은 상태에서 로그인 페이지 출력</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0"></td>
                <td class="s0"></td>
            </tr>
            <tr style="height: 20px">
                <th id="0R2" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">3</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">회원가입</td>
                <td class="s2" dir="ltr">회원 가입</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0"></td>
                <td class="s0"></td>
            </tr>
            <tr style="height: 20px">
                <th id="0R3" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">4</div>
                </th>
                <td class="s0" dir="ltr" rowspan="2">마이페이지</td>
                <td class="s0" dir="ltr">수정</td>
                <td class="s2" dir="ltr">회원 정보 내용 수정, 이 때 ID, 이름은 변경 불가</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0"></td>
            </tr>
            <tr style="height: 20px">
                <th id="0R4" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">5</div>
                </th>
                <td class="s0" dir="ltr">삭제</td>
                <td class="s2" dir="ltr">회원 정보 삭제</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0"></td>
            </tr>
            <tr style="height: 20px">
                <th id="0R5" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">6</div>
                </th>
                <td class="s0" dir="ltr" rowspan="11">동물관리</td>
                <td class="s0" dir="ltr" colspan="2">리스트</td>
                <td class="s2" dir="ltr">
                  관리자에 의해 승인되어 등록된 동물들 목록,<br>
                  리스트에는 썸네일과 제목이 보여지고,<br>
                  클릭할 경우 해당 글에 대한 세부정보로 넘어감<br>
                  이 페이지에서 동물 등록페이지로 이동 가능</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R6" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">7</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">디테일</td>
                <td class="s2" dir="ltr">
                  리스트에서 선택된 글에 대한 세부정보<br>
                  이 페이지에는 예약, 좋아요, 댓글, 링크공유가 가능하며,<br>
                  글작성자에 한 해 글의수정과 삭제가,<br>
                  관리자에 한 해 글 삭제가 가능함</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R7" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">8</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">등록</td>
                <td class="s2" dir="ltr">
                  동물들의 정보를 올릴 수 있음<br>
                  이 때 반드시 사진과 동영상을 올려야 글을 등록할 수 있으며,<br>
                  올린 글은 관리자가 승인을 해야 최종 등록이 됨</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R8" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">9</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">수정</td>
                <td class="s2" dir="ltr">글작성자는 수정 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">◎</td>
                <td class="s0" dir="ltr"></td>
            </tr>
            <tr style="height: 20px">
                <th id="0R9" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">10</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">삭제</td>
                <td class="s2" dir="ltr">글작성자 및 관리자가 필요에 의해 글 삭제 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">◎</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R10" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">11</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">좋아요</td>
                <td class="s2" dir="ltr">올라와있는 동물에 좋아요를 누를 수 있게 해<br>해당 동물에 대한 관심도를 표시할 수 있음</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R11" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">12</div>
                </th>
                <td class="s0" dir="ltr" rowspan="4">댓글</td>
                <td class="s0" dir="ltr">리스트</td>
                <td class="s2" dir="ltr">
                  동물글의 상세페이지에 존재<br>
                  모든 사용자가 볼 수는 있으나 로그인을 하지 않으면 댓글쓰기가 보이지 않음</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R12" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">13</div>
                </th>
                <td class="s0" dir="ltr">등록</td>
                <td class="s2" dir="ltr">회원일 경우 댓글 등록 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R13" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">14</div>
                </th>
                <td class="s0" dir="ltr">수정</td>
                <td class="s2" dir="ltr">댓글을 등록한 사람이 댓글 수정 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">◎</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R14" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">15</div>
                </th>
                <td class="s0" dir="ltr">삭제</td>
                <td class="s2" dir="ltr">댓글작성자, 해당 게시물의 작성자,<br>그리고 관리자가 필요에 의해 댓글 삭제 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">◎</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R15" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">16</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">예약</td>
                <td class="s2" dir="ltr">회원이 예약을 하게 되면 시간과 장소를 정할 수 있고,<br>글작성자는 예약현황을 알 수 있음</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R16" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">17</div>
                </th>
                <td class="s0" dir="ltr" rowspan="10">입양후기</td>
                <td class="s0" dir="ltr" colspan="2">리스트</td>
                <td class="s2" dir="ltr">
                  쇼핑몰의 리뷰페이지와 같이 입양후기에 대한 내용을 볼 수 있음<br>
                  회원일 경우 후기작성 버튼이 보여짐</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R17" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">18</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">디테일</td>
                <td class="s2" dir="ltr">
                  리스트에서 후기글을 선택하면 해당 글에 대한 내용을 볼 수 있음<br>
                  작성자의 경우 이 페이지에서 수정/삭제페이지로 들어갈 수 있으며,<br>
                  동물관리디테일페이지와 마찬가지로 댓글과 좋아요가 있음</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R18" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">19</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">등록</td>
                <td class="s2" dir="ltr">
                  입양후기를 올릴 수 있음<br>
                  여기서는 관리자의 승인이 필요하지는 않음</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R19" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">20</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">수정</td>
                <td class="s2" dir="ltr">글 작성자에 한 해 글 수정 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">◎</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R20" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">21</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">삭제</td>
                <td class="s2" dir="ltr">글작성자 및 관리자가 필요에 의해 글 삭제 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">◎</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R21" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">22</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">좋아요</td>
                <td class="s2" dir="ltr">후기글에 좋아요를 누를 수 있고, 좋아요가 눌러지면 글을 올린 계정에 알림이 가도록 함</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R22" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">23</div>
                </th>
                <td class="s0" dir="ltr" rowspan="4">댓글</td>
                <td class="s0" dir="ltr">리스트</td>
                <td class="s2" dir="ltr">
                  동물글의 상세페이지에 존재<br>
                  모든 사용자가 볼 수는 있으나 로그인을 하지 않으면 댓글쓰기가 보이지 않음</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R23" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">24</div>
                </th>
                <td class="s0" dir="ltr">등록</td>
                <td class="s2" dir="ltr">회원일 경우 댓글 등록 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R24" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">25</div>
                </th>
                <td class="s0" dir="ltr">수정</td>
                <td class="s2" dir="ltr">댓글을 등록한 사람이 댓글 수정 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">◎</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R25" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">26</div>
                </th>
                <td class="s0" dir="ltr">삭제</td>
                <td class="s2" dir="ltr">댓글작성자, 해당 게시물의 작성자,<br>
                그리고 관리자가 필요에 의해 댓글 삭제 가능</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">◎</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R26" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">27</div>
                </th>
                <td class="s0" dir="ltr" colspan="3">상담 예약</td>
                <td class="s2" dir="ltr">관리자의 승인 하에 상담이 예약됨</td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R27" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">28</div>
                </th>
                <td class="s0" dir="ltr">매칭</td>
                <td class="s0" dir="ltr" colspan="2">조건 선택</td>
                <td class="s2" dir="ltr">등록된 동물들의 성격/조건들을 그룹화 한 후,<br>
                큰 그룹부터 세분화된 그룹으로 선택하게 해, 그 조건에 맞는 결과를 리스트로 출력</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R28" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">29</div>
                </th>
                <td class="s0" dir="ltr" rowspan="3">관리자</td>
                <td class="s0" dir="ltr" rowspan="2">게시판</td>
                <td class="s0" dir="ltr">동물관리</td>
                <td class="s2" dir="ltr">회원이 동물을 등록할 경우 관리자의 승인 하에 최종 등록이 가능<br>
                등록된 동물 삭제 가능</td>
                <td class="s0"></td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R29" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">30</div>
                </th>
                <td class="s0" dir="ltr">입양후기</td>
                <td class="s2" dir="ltr">입양후기 게시판 관리가능<br>
                일반회원이 보여지는 페이지와 별도로 제작<br>
                리스트에서 삭제를 할 수 있도록 함</td>
                <td class="s0"></td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R30" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">31</div>
                </th>
                <td class="s0" dir="ltr" colspan="2">회원관리</td>
                <td class="s2" dir="ltr">가입한 회원들의 정보를 볼 수 있으며, 필요 시 회원의 삭제도 가능</td>
                <td class="s0"></td>
                <td class="s0"></td>
                <td class="s0" dir="ltr">✔</td>
            </tr>
            <tr style="height: 20px">
                <th id="0R31" style="height: 20px;" class="row-headers-background">
                    <div class="row-header-wrapper" style="line-height: 20px">32</div>
                </th>
                <td class="s3"></td>
                <td class="s3"></td>
                <td class="s4" dir="ltr" colspan="5">◎ : 해당글 또는 댓글 작성자에 한해서 가지는 권한</td>
            </tr>
        </tbody>
    </table>
</div>

<br>
<h2>:arrow_forward: 진행순서</h2>
<li>피입양자 → 공고글 작성 → 관리자 확인 → 관리자 승인 → 공고글 게시
<li>입양희망자 → 공고글 클릭 → 예약 → 관리자 확인 → 관리자 승인 → 입양완료

<br>
<h2>:hammer: 개발환경</h2>
<li>Front-end <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=React&logoColor=white"/><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=React&logoColor=white"/><img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=React&logoColor=white"/><img src="https://img.shields.io/badge/JQuery-0769AD?style=flat&logo=React&logoColor=white"/><br>
<li>Back-end <img src="https://img.shields.io/badge/STS-6DB33F?style=flat&logo=React&logoColor=white"/><img src="https://img.shields.io/badge/VSCode-007ACC?style=flat&logo=React&logoColor=white"/><br>
<li>DB, Server <img src="https://img.shields.io/badge/Oracle-F80000?style=flat&logo=React&logoColor=white"/><img src="https://img.shields.io/badge/Tomcat-F8DC75?style=flat&logo=React&logoColor=white"/><br>

<br>
<h2>:computer: 시연화면</h2>

![zootopia (1)](https://user-images.githubusercontent.com/120631985/227816639-2f397a8e-58fa-4e52-b599-015897b89214.png)
![zootopia (2)](https://user-images.githubusercontent.com/120631985/227816641-3eeb273e-17ac-4675-904a-f6856ca1ecc2.png)
![zootopia (3)](https://user-images.githubusercontent.com/120631985/227816644-cb4babb3-2105-48bf-8fb3-330730f0458f.png)
![zootopia (4)](https://user-images.githubusercontent.com/120631985/227816646-b264db27-630b-4646-9b13-829803afcdda.png)
![zootopia (5)](https://user-images.githubusercontent.com/120631985/227816647-42990baa-10a7-49bc-b9aa-0fa5b2075f4d.png)
![zootopia (6)](https://user-images.githubusercontent.com/120631985/227816648-d4051ad8-2b63-4468-a3e7-38e977c9aced.png)
![zootopia (7)](https://user-images.githubusercontent.com/120631985/227816650-99fa2c17-9c0e-470d-ba50-ecf7396d11bb.png)
![zootopia (8)](https://user-images.githubusercontent.com/120631985/227816651-c588ed16-f1e1-4a4b-b23c-23a682e87922.png)
![zootopia (9)](https://user-images.githubusercontent.com/120631985/227816653-90a8e2b7-75e7-423b-b2fe-01aa9b507afd.png)
![zootopia (10)](https://user-images.githubusercontent.com/120631985/227816655-2294ab44-cf75-40a2-ad63-6be199af0af6.png)
![zootopia (11)](https://user-images.githubusercontent.com/120631985/227816657-cfd4b1ce-b1fe-4480-baa1-650910fcc96e.png)
![zootopia (12)](https://user-images.githubusercontent.com/120631985/227816659-b9987fdf-67d7-4546-8c3a-fd6cad299804.png)
![zootopia (13)](https://user-images.githubusercontent.com/120631985/227816660-af6a9711-9ce0-436c-bb1f-1a96c646ee9f.png)
![zootopia (14)](https://user-images.githubusercontent.com/120631985/227816661-885efe38-983e-4910-bc96-d726705fe612.png)

