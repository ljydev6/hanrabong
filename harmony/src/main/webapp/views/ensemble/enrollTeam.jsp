<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<%@ include file="/views/common/header.jsp" %>  
<%@ page import= "java.util.List, com.harmony.ensemble.model.dto.Genre" %>
<%
	List<Genre> genre = (List<Genre>)request.getAttribute("genre");
%>

<script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/enrollTeam.css" type="text/css">

<section>

<form action="">
<div class="enroll_container">
	<div>
		<span>팀명</span>
		<input type="text">
	</div>
	<div>	
		<label for="genre">장르</label>
		<select name="genre" id="genre">
			<%if(!genre.isEmpty()) {
				for(Genre g : genre){ %>
					<option value="<%=g.getGenreName() %>"><%=g.getGenreName() %></option>
			
			<%	} 
			}%>
		</select>
	</div>
	<div>
		<p>구분</p>
		   <input type='radio' class="single_chk" name='type' value='ama' style='display:none'>
			<span class="single_chk_span">취미</span>
		  <input type='radio' class="single_chk" name='type' value='pro' style='display:none'>
			<span class="single_chk_span">전문</span>
		
	</div>
	<div>
		<p>한 줄 소개</p>
		<textarea cols="30" rows="3"></textarea>
	</div>
	<div>
		<p>영상</p>
	</div>
	<div>
		<p>음원</p>
	</div>
		<div class="submit_container">
			<input type="submit" name="submit" id="submit" onclick="location.assign('<%=request.getContextPath()%>/ensemble/enrollTeamEnd.do')">
		</div>
</div>


</form>


</section>

<!-- 팀 등록 페이지 -->

<!-- 팀 번호 seq -->
<!-- 팀명 -->
<!-- 장르번호 : select op으로 선택하도록.  서블릿 : db에서 카테고리를 가져옴 setAttr로 꽂아주기 -->
<!-- 구분 : 취미/전문 선택 -->
<!-- 한 줄 소개 -->
<!-- 비디오 -->
<!-- 음원 -->
<!-- 팀원리스트 -->
<!-- 합주 일시 -->
<script>

$(document).ready(function(){
	$('.single_chk_span').click(function(){
		$(this).toggleClass('selected');
	
	
	$('.single_chk_span').not(this).removeClass('selected');
});


});
</script>

<%@ include file="/views/common/footer.jsp" %>