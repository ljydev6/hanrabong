<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">    
    
    
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/boardView.css" type="text/css">
<%@ include file="/views/common/header.jsp" %>  
<%@ page import = "com.harmony.ensemble.model.dto.VBoardView" %>
<%
	VBoardView b = (VBoardView)request.getAttribute("board");
%>
<section>

	<div class="board_container">
		<%if(b!=null){%>
		
		<div class="title">
			<%= b.getEnsBoardTitle() %>
		</div>
		<div class="type">
			<%= b.getEnsTeamType() %>
		</div>
		<div class="writer">
			<%= b.getEnsWriter()%>	
		</div>
		<div class="teamName">
			<%= b.getEnsTeamName() %>		
		</div>
		<div class="genre">
			<%= b.getGenreName() %>
		</div>
		<div class="wantPart">
			<%= b.getInstrument() %>		
		</div>
		<div class="location">
			<%= b.getEnsLocation() %> <br>
			<%= b.getEnsPlace() %>		
		</div>	
		<div class="detail">
			<%= b.getEnsDetail() %>		
		</div>
		<div class="date">
			<%= b.getEnsBoardDate() %>		
		</div>
			
		<%}%>
	</div>

</section>
<%@ include file="/views/common/footer.jsp" %>  