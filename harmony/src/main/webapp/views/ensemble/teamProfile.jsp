<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 
page import="java.util.List, 
			com.harmony.ensemble.model.dto.Genre,
			com.harmony.ensemble.model.dto.EnsembleTeamComment,
			com.harmony.ensemble.model.dto.EnsembleTeam" 
%>
<%
EnsembleTeam team=(EnsembleTeam)request.getAttribute("team");
// List<EnsembleTeamComment> comments=(List<EnsembleTeamComment>)request.getAttribute("comments");
%>

<%@ include file="/views/common/header.jsp" %>  


<section>
<div>

<%if(team!=null){ %>
<%=team.getEnsTeamName() %>
<%} %>

</div>

</section>