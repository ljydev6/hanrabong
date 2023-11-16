<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.List,
				com.harmony.ensemble.model.dto.Inst,
				com.harmony.model.dto.Member,
				com.harmony.model.dto.MemberInfo" %>
<%@ include file="/views/common/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
List<Inst> inst = (List<Inst>)request.getAttribute("inst");
Member member = (Member)request.getAttribute("member");
String memberChk = (String)request.getAttribute("memberChk");

%>
<title>Insert title here</title>
</head>
<body>
<!-- 
-팀원추가
고유번호 : seq('TM'||TEAM_MEMBER_SEQ.NEXTVAL) ->서버
팀번호 : seq (selectSeq : ET_00) ->서버
악기번호 : seq (INST_00)  
회원번호 : seq -> 서버
가입일 : DATE ->default
탈퇴일 : DATE -> 팀원제외/탈퇴 페이지
비회원성별 -> 합주모집글에서
비회원나이 -> 합주모집글에서 -->
<form action="<%=request.getContextPath()%>/ensemble/addTeamMemEnd.do">
<div class="add_mem_container">
	
	
	<div>
		<p>이메일로 회원 찾기</p>
		<input type="search" name="searchKeyword" id="searchKeyword">
		<input id="searchEmailBtn" type="button" value="검색" onclick="searchEmail();" >
	</div>
	<div>
		<span id="searchMem"></span>
	</div>
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
		<p>구분</p>
		<label><input type="radio" name="position" value="leader">리더</label>		
		<label><input type="radio" name="position" value="member">멤버</label> 
	</div>
	
	<div>
		<span id="add_mem_result">
			
		</span>
	</div>
	
	<div class="submit-container">
		<input type="submit">
	</div>
	
</form>
<script>

	if($('#searchKeyword').equals(<%%>))

	/* if(memberChk!=null){
		$('#searchMem').text($('#searchKeyword'));
	} */
	
	
	
	const searchEmail=()=>{
		const searchMem = $("#searchKeyword").val().trim();
		open("<%=request.getContextPath()%>/ensemble/searchEmail.do?searchMem="+searchMem,
						"_blank","width=500, height=400");
	};
	//searchEmailBtn.addEventListener("click", searchEmail);

	
	</script>

</div>

</body>
</html>