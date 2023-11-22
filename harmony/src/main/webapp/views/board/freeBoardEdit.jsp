<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="com.harmony.board.free.model.dto.FreeBoard"%>
<%
FreeBoard board = (FreeBoard) request.getAttribute("board");
%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoCommunityWrite.css"
	type="text/css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/board/smarteditor2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<div class="content">
	<div class="main">
		<div class="board">
			<div class="info-container">
				<h3 class="info-board">
				
					<a href="<%=request.getContextPath()%>/infoBoardList.do">정보 게시판</a>
				</h3>
				<h3 class="free-board">
					<a href="<%=request.getContextPath()%>/freeBoardList.do">자유 게시판</a>
				</h3>
			</div>
		</div>	
		
	<form action="<%=request.getContextPath()%>/board/FreeBoardEditEnd.do" method="post">

    <input type="hidden" name="no" value="<%=board.getFreBrdNo()%>">
    <input type="text" name="title" value="<%=board.getFreBrdTitle()%>">
    <textarea name="content"><%=board.getFreBrdContent()%></textarea>
    <button type="submit">저장하기</button>
</form>













<%@ include file="/views/common/footer.jsp"%>