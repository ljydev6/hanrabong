<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import = "com.harmony.ensemble.model.dto.EnsembleBoardWantPart,
					java.util.List" %>
<%
	List<EnsembleBoardWantPart> parts = (List<EnsembleBoardWantPart>)request.getAttribute("wantPart");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(!parts.isEmpty()){ 
	for(EnsembleBoardWantPart part : parts){
	%>
	<%=part.getEnsInstNo() %>
	<%=part.getEnsPartIndex() %>
	<%}
	}%>



</body>
</html>
<script>
/* $("#dayOfWeek",opener.document).val */
</script>