<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.harmony.model.dto.MemberInfo,java.util.List,com.harmony.model.dto.MemberVideo,java.util.Arrays" %>

<%@ include file="/views/common/header.jsp"%>
<%MemberInfo mi = (MemberInfo)request.getAttribute("MemberInfo"); %>
<% List<MemberVideo> memberVideos = (List<MemberVideo>) request.getAttribute("memberVideos"); %>
<%List<String> genreAll = (List<String>)request.getAttribute("GenreAll"); %>
<style>
	.my-title,.my-content{
		display:flex;
		justify-content: center;
		align-items: center;
		min-height:100px;
		border:1px solid red;
	}
	.my-content{
		justify-content: center;
	}
	.my-title>span{
		font-weight:bolder;
	}
	.mypage-container{
		min-height:500px;
		
	}
	.profile-img{
		width:150px;
		height:150px;
		border-radius:100px;
	}
</style>list for문돌려 가져오기
<form action="<%=request.getContextPath()%>/member/mypage.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="memNo" value=<%=mi.getMemNo() %>>
<input type="hidden" name="email" value=<%=mi.getEmail() %>>
<div class="cont_personal" >
	<h3>마이페이지</h3>
	<div class="container mypage-container">
		<div class="row">
			<div class="col-4 my-title">
				<span>프로필사진</span>
			</div>
			<div class="col-8 my-content">
				<img src="<%=request.getContextPath() %>/image/profile/profile.png"
					width="150" height="150" id="profile" >
					<input type="file" id="profiledata" name="profilephoto">
				
					<script>
						$("#profile").click(e=>{
							$("#profiledata").click();
						})
						$("#profiledata").change(e=>{
							const reader=new FileReader();
							reader.readAsDataURL(e.target.files[0]);
							reader.onload=e=>{
								const path=e.target.result;
								$("#profile").attr("src",path);
							}
						})
					</script>
			</div>
		</div>
		<div class="row">
			<div class="col-4 my-title">
				<span>이름</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="name" value="<%=mi.getName()%>">
			</div>
		</div>
		<div class="row">
			<div class="col-4 my-title">
				<span>나이</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="age" value="<%=mi.getAge()%>">
			</div>
		</div>
		<div class="row">
			<div class="col-4 my-title">
				<span>한줄소개</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="introduce" value="<%=mi.getIntroduce()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>학교</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="school" value="<%=mi.getSchool()%>">
				<span>전공</span>
				<input type="text" name="department" value="<%=mi.getDepartment()%>">
			</div>
		</div>
		<div class="row">
			<div class="col-4 my-title">
				<span>성별</span>
			</div>
			<div class="col-8 my-content">
				남<input type="radio" name="gender" value="남">
				여<input type="radio" name="gender" value="여">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>활동지역</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="activityarea" value="<%=mi.getActivityArea()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>악기</span>
			</div>
			<div class="col-8 my-content">
				<%if(mi.getInterest()!=null){
					for(String interest : mi.getInterest()){%>
					<label>
						<input type="checkbox" name="interest"  value="<%=interest%>">
						<%=interest%>
					</label>
				<%	}
				}%>
				
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>장르</span>
			</div>
			<div class="col-8 my-content">
			
				<%if(genreAll!=null){
					for(String genre : genreAll){%>
					<label>
						<input type="checkbox" name="genre"  value="<%=genre%>"<%=Arrays.stream(mi.getGenre()).anyMatch(t->t.equals(genre))?"checked":"" %>>
						<%=genre%>
					</label>
				<%	}
				}%>
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>경력</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="memcareer" value="<%=mi.getMemCareer()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>연주영상</span>
			</div>
			<div class="col-8 my-content">
				<input type="file" name="video" value="<%=mi.getMemberVideo()%>"><!-- //포문으로 돌리자 -->
			<% for(MemberVideo video : mi.getMemberVideo()) { %>
    <video width="320" height="240" controls>
        <source src="<%=request.getContextPath() %>/upload/<%= video.getVideoLink() %>" type="video/mp4">
    </video>
<% } %>
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>연주링크</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="videolink" value="">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>음원</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="music" value="<%=mi.getAge()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>음원링크</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="musiclink" value="<%=mi.getAge()%>">
			</div>
		</div>	
		
		
		</div>		
	</div>
	</div>
</div>
		<input type="submit" value="수정하기">
		</form>
		
















<%@ include file="/views/common/footer.jsp"%>