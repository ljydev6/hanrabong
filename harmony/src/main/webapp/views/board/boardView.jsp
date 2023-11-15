<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.harmony.board.info.model.dto.InfoBoard"%>
<%
InfoBoard board = (InfoBoard) request.getAttribute("InfoBoard");
%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoCommunity.css" type="text/css">	
	
	
	<<div class="infoboard">
			<div class="info-container">
				<h3 class="info"><a href ="<%=request.getContextPath()%>/communitymain.do">정보 게시판</a></h3>
				<h3 class="free"><a href="<%=request.getContextPath()%>/test2.do">자유 게시판</a></h3>
			</div>
		</div>
	<table>
		<tr>
			<td><h1><%=board.getInfBrdTitle() %></h1></td>
			
		</tr>
		<tr>
			
			<td><h1><%=board.getInfBrdContent() %></h1></td>
		</tr>
	</table>
	
	<div id="comment-container">
		<div class="comment-editor">
			<form action="<%=request.getContextPath() %>/board/insertComment.do" method="post">
				<input type="hidden" name="boardRef" value="<%=b.getBoardNo()%>">
				<input type="hidden" name="level" value="1">
				<input type="hidden" name="writer" value="<%=loginMember!=null?loginMember.getUserId():"" %>">
				<input type="hidden" name="boardCommentRef" value="0">
				<textarea name="content" cols="55" rows="3"></textarea>
				<button type="submit" id="btn-insert">등록</button>
			</form>
		</div>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
<%@ include file="/views/common/footer.jsp"%>