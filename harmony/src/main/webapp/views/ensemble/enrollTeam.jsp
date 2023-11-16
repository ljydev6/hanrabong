<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<%@ include file="/views/common/header.jsp" %>  
<%@ page import= "java.util.List, 
					com.harmony.ensemble.model.dto.Genre" %>
<%
	List<Genre> genre = (List<Genre>)request.getAttribute("genre");
%>

<script src="http://code.jquery.com/jquery-3.7.1.js"></script> 
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/enrollTeam.css" type="text/css">

<section>

<div class="enroll_container">
	<div>
		<span>팀명</span>
		<input type="text" id="teamName">
	</div>
	<div>	
		<label for="genre">장르</label>
		<select name="genre" id="genre">
			<%if(!genre.isEmpty()) {
				for(Genre g : genre){ %>
					<option value="<%=g.getGenreCode() %>"><%=g.getGenreName() %></option>
			
			<%	} 
			}%>
		</select>
	</div>
	<div>
		<p>구분</p>
		<label>
		    <input type='radio' class="single_chk" name='type' value='취미' style="display:none">
			<span class="single_chk_span">취미</span>
		</label>
		<label>
		 	<input type='radio' class="single_chk" name='type' value='전문' style="display:none">
			<span class="single_chk_span">전문</span>
		</label>
	</div>
	<input type="button" value="합주일정추가" name="schedule" id="schedule" 
			onclick="addSchedule();">
	<span id="sch_result">
		
	</span>
	<div>
		<p>한 줄 소개</p>
		<textarea cols="30" rows="3" id="detail"></textarea>
	</div>
	<div>
		<p>영상</p>
		<input type="file" id="video" multiple accept="video/*">
	</div>
	<div>
		<p>음원</p>
		<input type="file" id="music" multiple accept="audio/*">
	</div>
	<div class="add_mem">
		<p>멤버추가</p>
		<input type="button" value="회원추가" onclick="addTeamMem();">
	</div>
	<div>
		<span id="add_result">
			
		</span>	
	</div>	
	<div class="submit_container">
		<input type="button" value="등록" id="submit" >
	</div>

	
</div>



<input type="hidden" id="inst" name="dayOfWeek">
<input type="hidden" id="position" name="startTime">


</section>

<script>

const addTeamMem =()=>{
	open("<%=request.getContextPath()%>/ensemble/addTeamMem.do"
			,"_blank","width=500, height=400");
	
}


$(document).ready(function(){
	$('.single_chk_span').click(function(){
		$(this).toggleClass('selected');
	$('.single_chk_span').not(this).removeClass('selected');
});


});
</script>
<script>
		
	
	$("#submit").click(e=>{

		
		const form = new FormData();
		
		const teamName = $("#teamName").val();
		const genre = $("#genre").val();
		const type = $(".single_chk:checked").val(); 
		const detail = $("#detail").val();
		const dayOfWeek = $("#dayOfWeek").val();
		const startTime = $("#startTime").val();
		const endTime = $("#endTime").val();
		
		
		
		form.append("teamName", teamName);
		form.append("genre", genre);
		form.append("type", type);
		form.append("detail", detail);
		form.append("dayOfWeek",dayOfWeek);
		form.append("startTime", startTime);
		form.append("endTime",endTime);
		
		const videoInput=$("#video");
		$.each(videoInput[0].files, (i,v)=>{
			form.append("video"+i,v);
		});
			
		const musicInput=$("#music");
		$.each(musicInput[0].files, (i,m)=>{
			form.append("music"+i,m);

		});	
			
		$.ajax({
			url: "<%=request.getContextPath()%>/ensemble/enrollTeamEnd.do",
			data:form,
			type:"post",
			processData:false,
			contentType:false,
			success:data=>{
				alert("등록 성공");
			},
			error:(r,e)=>{
				alert("등록 실패");
			},
			complete:()=>{
				videoInput.val('');
				musicInput.val('');
			}
		});
	});
			

</script>

<%@ include file="/views/common/footer.jsp" %>