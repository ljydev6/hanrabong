<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.harmony.board.free.model.dto.FreeBoard"%>
<%
List<FreeBoard> boards = (List<FreeBoard>) request.getAttribute("boards");
String pageBar = (String) request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board/freeCommunity.css" type="text/css">

<div class="content">
  <div class="infoboard">
    <div class="info-container">
      <h3 class="info"><a href ="<%=request.getContextPath()%>/infoBoardList.do">정보 게시판</a></h3>  
      <h3 class="free"><a href="<%=request.getContextPath()%>/freeBoardList.do">자유 게시판</a></h3>
    </div>
  </div>
  <div class="content-detail">
    <div class="sort">
      <select id="sort-select-free" name="sort">
        <option value="all">최신등록순</option>
        <option value="all">오래된순</option>
        <option value="all">조회수</option>
        <option value="all">댓글수</option>
      </select>
    </div>

    <div class="main-sort-container">
      <table class="table">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
            <th>첨부파일</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <% for (FreeBoard board : boards) { %>
            <tr>
              <td style="text-align: center;"><%= board.getFreBrdNo() %></td>
              <td style="text-align: center;"><%= board.getFreBrdTitle() %></td>
              <td style="text-align: center;"><%= board.getFreBrdWriter() %></td>
              <td style="text-align: center;"><%= board.getFreBrdDate() %></td>
              <td style="text-align: center;"><%= board.getFreBrdTitleImg() != null ? "Yes" : "No" %></td>
              <td style="text-align: center;"><%= board.getFreBrdViews() %></td>
            </tr>
          <% } %>
        </tbody>
      </table>
      <div class="text-center">
        <ul class="pagintion">
          <%= pageBar %>
        </ul>
      </div>
    </div>

    <div class="write-button-container">
      <button onclick="location.assign('<%=request.getContextPath() %>/board/freeboardWrite.do')">
        자유게시판글쓰기
      </button>
    </div>
  </div>
</div>
<%@ include file="/views/common/footer.jsp"%>
