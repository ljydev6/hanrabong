<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>



<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoCommunityMake.css" type="text/css">
	  
    <div class="content">
      <div class="infoboard">
        <div class="info-container">
          <h3 class="info">정보게시판</h3>
         </div>
         <div class="freeboard">
            <h3>자유게시판</h3>
          </div>
      </div>
      <div class="main-sort-container">
        <div class="write-post-container">
            <h3>글쓰기</h3>
            <form id="write-post-form">
              <div class="form-field">
                <label for="post-title">제목</label>
                <input type="text" id="post-title" name="title">
              </div>
              <div class="form-field">
                <label>카테고리</label>
                <div class="radio-group">
                  <label><input type="radio" name="category" value="공연"> 공연</label>
                  <label><input type="radio" name="category" value="입시"> 입시</label>
                  <label><input type="radio" name="category" value="오디션"> 오디션</label>
                  <label><input type="radio" name="category" value="버스킹"> 버스킹</label>
                </div>
              </div>
              
              <div class="form-field">
                <label>태그</label>
                <div class="radio-group">
                  <label><input type="radio" name="tag" value="정보"> 정보</label>
                  <label><input type="radio" name="tag" value="후기"> 후기</label>
                  <label><input type="radio" name="tag" value="TIP"> TIP</label>
                  <label><input type="radio" name="tag" value="이벤트"> 이벤트</label>
                </div>
              </div>
              
              <div class="form-field">
                <label>지역</label>
                <div class="radio-group">
                  <label><input type="radio" name="region" value="서울"> 서울</label>
                  <label><input type="radio" name="region" value="경기도"> 경기도</label>
                  <label><input type="radio" name="region" value="강원도"> 강원도</label>
                  <label><input type="radio" name="region" value="충청북도"> 충청북도</label>
                  <label><input type="radio" name="region" value="충청남도"> 충청남도</label>
                  <label><input type="radio" name="region" value="전라북도"> 전라북도</label>
                  <label><input type="radio" name="region" value="전라남도"> 전라남도</label>
                  <label><input type="radio" name="region" value="경상북도"> 경상북도</label>
                  <label><input type="radio" name="region" value="경상남도"> 경상남도</label>
                  <label><input type="radio" name="region" value="제주도"> 제주도</label>
                </div>
              </div>
              <div class="form-field">
                <label for="post-content">내용</label>
                <textarea id="post-content" name="content" rows="8"></textarea>
              </div>
              <button type="submit" class="submit-post-button">글쓰기</button>
            </form>
          </div>
      </div>
    </div>
 <%@ include file="/views/common/footer.jsp" %>