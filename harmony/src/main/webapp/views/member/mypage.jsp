<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.harmony.model.dto.MemberInfo" %>
<%@ include file="/views/common/header.jsp"%>
<%MemberInfo mi = (MemberInfo)request.getAttribute("MemberInfo"); %>
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
<div class="cont_personal">
	<h3>마이페이지</h3>
	<div class="container mypage-container">
		<div class="row">
			<div class="col-4 my-title">
				<span>프로필사진</span>
			</div>
			<div class="col-8 my-content">
				<img src="https://blog.kakaocdn.net/dn/c3vWTf/btqUuNfnDsf/VQMbJlQW4ywjeI8cUE91OK/img.jpg" 
				alt="프로필" class="profile-img" value="<%=mi.getProfilPhoto()%>">
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
				<input type="text" name="" value="">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>장르</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getAge()%>">
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
				<input type="file" name="" value="<%=mi.getMemberVideo()%>">
			</div>
		</div>	
		<div class="row">
			<div class="col-4 my-title">
				<span>연주링크</span>
			</div>
			<div class="col-8 my-content">
				<input type="text" name="" value="<%=mi.getAge()%>">
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
		
		
	<%-- <div class="col-lg-3" style="text-align:center; height:500px; border:1px solid red;">
		<div class="photo" style="margin-top:100px;">
			<strong>프로필 사진</strong>
		</div>
		<div class="name">
			<strong>이름</strong>
		</div>
		<div class="">
			<strong>학교</strong>
		</div>
		<div class="">
			<strong>학과</strong>
		</div>
		<div class="">
			<strong>경력</strong>
		</div>
		<div class="">
			<strong>연주영상</strong>
		</div>
		<div class="">
			<strong>음원</strong>
		</div>
		<div class="">
			<strong>악기</strong>
		</div>
		<div class="">
			<strong>장르</strong>
		</div>
		<div class="">
			<strong>한줄소개</strong>
		</div>
		
	</div>
	<div class="col-lg-9" style=" height:500px; border:1px solid green;">
		<div class="photo">
			<a><%=mi.getAge() %></a>
		</div>
		<div class="nameInfo">
			<a><%=mi.getName()%></a>
		</div>
		<div class="">
			<a></a>
		</div>
		<div class="">
			<a></a>
		</div>
		<div class="">
			<a></a>
		</div>
		<div class="">
			<a></a>
		</div>
		<div class="">
			<a></a>
		</div>
		<div class="">
			<a></a>
		</div>
		<div class="">
			<a></a>
		</div>
	</div> --%>
	</div>
	</div>
</div>















<%@ include file="/views/common/footer.jsp"%>