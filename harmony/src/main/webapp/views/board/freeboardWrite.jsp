<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page
	import="java.util.List,com.harmony.board.info.model.dto.InfoBoard"%>
<%
List<InfoBoard> boards = (List<InfoBoard>) request.getAttribute("boards");
%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoCommunity.css" type="text/css">


    

    <div class="content">
      <div class="infoboard">
        <div class="info-container">
          <h3 class="info">정보게시판</h3>
          <div class="freeboard">
            <h3>자유게시판</h3>
          </div>
        </div>
      </div>
      <div class="main-sort-container">
        <div class="write-post-container">
        
     
            <h3>글쓰기</h3>
			<form action='<%=request.getContextPath()%>/board/freeboardWriteEnd.do'
					enctype="multipart/form-data" method="post" >
              <div class="form-field">
                <label for="post-title">제목</label>
                <input type="text" id="post-title" name="title">
              </div>
             
              
             
              
          
              <div class="form-field">
                <label for="post-content">내용</label>
                <textarea id="post-content" name="content" rows="8"></textarea>
              </div>
              
				
				<input type="file" name="upfile"/>
			
			<button type="submit" class="submit-post-button">글쓰기</button>
            </form>
          </div>
        <div class="text-center">
          <ul class="pagintion">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
          </ul>
        </div>
        <div class="text-center">
				<ul class="pagination">
					<%=request.getAttribute("pageBar")%>
				</ul>
			</div>
      
      </div>
      <div class="write-button-container">
        <button type="button" class="write-button">글쓰기</button>
      </div>
    </div>


<%@ include file="/views/common/footer.jsp"%>