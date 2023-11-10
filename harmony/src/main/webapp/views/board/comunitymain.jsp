<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
  <title>검색 페이지</title>

  <head>
  </head>

  <body>
    <div class="community">
      <h2>커뮤니티</h2>
    </div>
    <div class="content">
      <div class="infoboard">
        <div class="info-con
        66tainer">
          <h3 class="info">정보게시판</h3>
          <div class="freeboard">
            <h3>자유게시판</h3>
          </div>
          <div class="questionboard">
            <h3>문의게시판</h3>
          </div>
          <div class="noticeboard">
            <h3>공지사항</h3>
          </div>
        </div>
      </div>
      <div class="main-sort-container">
        <div class="main">
          <div class="category">
            <select id="infocategory-select" name="infocategory">
              <option value="all">카테고리</option>
              <option value="all">공연</option>
              <option value="all">입시</option>
              <option value="all">오디션</option>
              <option value="all">버스킹</option>
            </select>
          </div>
          <div>
            <select id="infotag-select" name="infotag">
              <option value="all">태그</option>
              <option value="all">정보</option>
              <option value="all">후기</option>
              <option value="all">TIP</option>
              <option value="all">이벤트</option>
            </select>
          </div>
          <div>
            <select id="region-select" name="region">
              <option value="all">지역</option>
              <option value="all">서울</option>
              <option value="all">경기도</option>
              <option value="all">강원도</option>
              <option value="all">충청북도</option>
              <option value="all">충청남도</option>
              <option value="all">전라북도</option>
              <option value="all">전라남도</option>
              <option value="all">경상북도</option>
              <option value="all">경상남도</option>
              <option value="all">제주도</option>
            </select>
          </div>
          <div class="sort">
            <select id="sort-select" name="sort">
              <option value="all">최신등록순</option>
              <option value="all">오래된순</option>
              <option value="all">조회수</option>
              <option value="all">댓글수</option>
            </select>
          </div>
        </div>
        <div class="posts">
          <div class="post">
            <h4>게시글 제목</h4>
            <p>본문 요약</p>
          </div>
          <div class="post">
            <h4>게시글 제목</h4>
            <p>본문 요약</p>
          </div>
        </div>
      </div>
    </div>
  </body>

<script>
</script>

</body>

</html>