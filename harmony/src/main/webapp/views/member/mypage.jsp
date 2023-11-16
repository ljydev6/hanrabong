<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.harmony.model.dto.MemberInfo" %>
<%@ include file="/views/common/header.jsp"%>
<%MemberInfo mi = (MemberInfo)request.getAttribute("MemberInfo"); %>
<style>

</style>
<div class="cont_personal">
	<h3>마이페이지</h3>
	<div class="container">
	<div class="row"">
	<div class="col-lg-3" style="text-align:center; height:500px; border:1px solid red;">
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
	</div>
	</div>
	</div>
</div>















<%@ include file="/views/common/footer.jsp"%>