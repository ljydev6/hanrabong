<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<meta charset="UTF-8">
<%@ page import= "java.util.List,com.harmony.ensemble.model.dto.Inst" %>
<%
	List<Inst> inst = (List<Inst>)request.getAttribute("inst");
%>

<title>Insert title here</title>
</head>
<body>

-팀원추가
고유번호 : seq('TM'||TEAM_MEMBER_SEQ.NEXTVAL) ->서버
팀번호 : seq (selectSeq : ET_00) ->서버
악기번호 : seq (INST_00)  
회원번호 : seq -> 서버
가입일 : DATE 
탈퇴일 : DATE -> 팀원제외/탈퇴 페이지
비회원성별 -> 합주모집글에서
비회원나이 -> 합주모집글에서
<form action="<%=request.getContextPath()%>/ensemble/addTeamMemEnd.do">
<div class="add_mem_container">
	
	<div>
		<label for="inst">파트</label>
		<select name="inst" id="inst">
			<%if(!inst.isEmpty()) {
				for(Inst i : inst){ %>
					<option value="<%=i.getInstCode() %>"><%=i.getInstName() %></option>
			
			<%	} 
			}%>
		</select>
	</div>
	<div>
		<p>가입일</p>
		<input type="date" id="enrollDate" name="enrollDate">
	</div>
	
	<div class="submit-container">
		<input type="submit">
	</div>
	
</form>
<script>
	
</script>

</div>

</body>
</html>