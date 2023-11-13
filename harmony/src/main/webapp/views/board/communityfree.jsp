<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.harmony.board.free.model.dto.FreeBoard"%>
<%
List<FreeBoard> boards = (List<FreeBoard>) request.getAttribute("boards");
%>
<%@ include file="/views/common/header.jsp"%>

  <link rel="stylesheet" href="styles.css">
  <link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/freeCommunity.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">

    <div class="content">
      <div class="infoboard">
        <div class="info-container">
          <h3 class="info">정보게시판</h3>
          <div class="freeboard">
            <h3>자유게시판</h3>
          </div>
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
                    <tr>
                        <td style="text-align: center;">1</td>
                        <td style="text-align: center;">제목</td>
                        <td style="text-align: center;">자유글내용</td>
                        <td style="text-align: center;">12/24</td>
                        <td style="text-align: center;">사진</td>
                        <td style="text-align: center;">796</td>
                    </tr>
                </tbody>

                
        
            </table>
            <div class="text-center">
                <ul class="pagintion">
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                </ul>
            </div>

        </div>
        <div class="write-button-container">
          <button type="button" class="write-button"><a href="자유글쓰기.html">글쓰기</a></button>
        </div>
    </div>
<%@ include file="/views/common/footer.jsp"%>