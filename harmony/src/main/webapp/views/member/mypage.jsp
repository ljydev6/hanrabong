<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.harmony.model.dto.MemberInfo" %>
<%@ page import="com.harmony.model.dto.MemberVideo" %>
<%@ include file="/views/common/header.jsp"%>
<%MemberInfo mi = (MemberInfo)request.getAttribute("MemberInfo"); %>
<%MemberVideo mv = (MemberVideo)request.getAttribute("mv"); %>
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
</style>
<form action="<%=request.getContextPath()%>/member/mypage.do">
<div class="cont_personal" >
	<h3>마이페이지</h3>
	<div class="container mypage-container">
		<div class="row">
			<div class="col-4 my-title">
				<span>프로필사진</span>
			</div>
			<div class="col-8 my-content">
				<img src="<%=mi.getProfilPhoto()%>" 
				alt="프로필" class="profile-img" value="">
			</div>
		</div>
		<div class="row">
			<div class="col-4 my-title">
				<span>이름</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getName()%>">
			</div>
		</div>
		<div class="row">
			<div class="col-4 my-title">
				<span>한줄소개</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getIntroduce()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>활동지역</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getActivityArea()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>학교</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getSchool()%>">
				<span>전공</span>
				<input type="text" name="" value="<%=mi.getDepartment()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>악기</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getInterest()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>장르</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getGenre()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>경력</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getMemCareer()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>연주영상</span>
			</div>
			<div class="col-8 my-content">
				<input type="file" name="" value="<%=mv.getVideoLink()%>">//포문으로 돌리자
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>연주링크</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>음원</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getAge()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>음원링크</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getAge()%>">
			</div>
		</div>	
		
		
		
		
		
		<div class="row">
			<div class="col-4 my-title">
				<span>학력</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getAge()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>학력</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getAge()%>">
			</div>
		</div>		
	</div>
	</div>
</div>
		<input type="submit" value="수정하기">
		</form>
		
















<%@ include file="/views/common/footer.jsp"%>