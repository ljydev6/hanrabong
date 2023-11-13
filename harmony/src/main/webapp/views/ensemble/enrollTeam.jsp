<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<%@ include file="/views/common/header.jsp" %>  
<%@ page import= "java.util.List, com.harmony.ensemble.model.dto.Genre" %>
<%
	List<Genre> genre = (List<Genre>)request.getAttribute("genre");
%>


<section>

<form action="">
	<div>
		<h2>팀명</h2>
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
	
	</div>
	
</form>


</section>

팀 등록 페이지

팀 번호 seq
팀명
장르번호 : select op으로 선택하도록.  서블릿 : db에서 카테고리를 가져옴 setAttr로 꽂아주기
구분 : 취미/전문 선택
한 줄 소개
비디오
음원
팀원리스트
합주 일시


<%@ include file="/views/common/footer.jsp" %>