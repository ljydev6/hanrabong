<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 
page import="java.util.List, 
			com.harmony.ensemble.model.dto.EnsembleTeamComment,
			com.harmony.ensemble.model.dto.EnsembleTeam,
			com.harmony.ensemble.model.dto.EnsembleTeamTime,
			com.harmony.ensemble.model.dto.EnsembleTeamMusic,
			com.harmony.ensemble.model.dto.EnsembleTeamVideo,
			com.harmony.ensemble.model.dto.EnsembleTeamComment" 
%>
<%
EnsembleTeam team=(EnsembleTeam)request.getAttribute("team");
List<EnsembleTeamTime> time = (List<EnsembleTeamTime>)request.getAttribute("time");
List<EnsembleTeamMusic> music = (List<EnsembleTeamMusic>)request.getAttribute("music");
List<EnsembleTeamVideo> video = (List<EnsembleTeamVideo>)request.getAttribute("video");
// List<EnsembleTeamComment> comments=(List<EnsembleTeamComment>)request.getAttribute("comments");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/teamProfile.css" type="text/css">

<%@ include file="/views/common/header.jsp" %>  

<main>
<input type="hidden" name="teamNo" value="<%=team.getEnsTeamNo()%>">
	<section>
	<%if(team!=null){ %>
		<div class="teamName_container">
			<p><b>팀명</b></p>
			<%=team.getEnsTeamName() %>
			<br>
		</div>
		<div class="hr_container">
			<hr>
		</div>
		<div>
			<p><b>장르</b></p>
			<%=team.getEnsTeamType() %>
		</div>
		<div class="time_container">
			<p><b>합주 일정</b></p>
		<%if(!time.isEmpty()){ 
			for(EnsembleTeamTime t : time){%>
			<%=t.getEnsStartTime() %> <br>
			<%=t.getEnsEndTime() %>
			<%} 
		}%>
		</div>
		<div class="video_container">
			<p><b>영상</b></p>
			<%if(!video.isEmpty()){ 
			for(EnsembleTeamVideo v : video){%>
			<%=v.getVReName() %> <br>
			<%} 
		}%>
		</div>
		<div class="music_container">
			<p><b>음원</b></p>
				<%if(!music.isEmpty()){ 
			for(EnsembleTeamMusic m : music){%>
			<%=m.getMReName() %> <br>
			<%} 
		}%>
		</div>
		<div class="hr_container">
			<hr>
		</div>
		<div class="detail_container">
			<p><b>한 줄 소개</b></p>
			<%=team.getEnsTeamInfo() %>		
		</div>
		<div class="comments_container">
			<p><b>댓글 보기</b></p>
		</div>
		
	<%} %>
	</section>
	<aside>
		<div class="mem_profile_container">
			<p><b>멤버 프로필</b></p>
		</div>
	</aside>
</main>

<%@ include file="/views/common/footer.jsp" %>  