<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<%@ include file="/views/common/header.jsp" %>  
<%@ page import= "java.util.List,com.harmony.ensemble.model.dto.EnsembleTeam" %>
<%
	List<EnsembleTeam> team = (List<EnsembleTeam>)request.getAttribute("team");
%>


<section>

</section>



<%@ include file="/views/common/footer.jsp" %>