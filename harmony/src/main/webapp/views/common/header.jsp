<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.harmony.model.dto.Member" %>
<% Member loginMember = (Member)request.getSession().getAttribute("loginMember"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이제 너에게 음악을 알려줄게 - 이음줄</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/navbarStyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/footerStyle.css">
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container d-flex justify-content-between align-items-center">
				<a class="navbar-brand logo h1 align-self-center" href="<%=request.getContextPath()%>">
					<img src="/harmony/image/slur_logo1.png" height="70px" alt="이음줄로고">
				</a>
				<div class="align-self-center collapse navbar-collapse flex-fill d-lg-flex justify-content-lg-between"
					id="harmony_main_nav">
					<div class="flex-fill">
						<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>">메인페이지</a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/lesson/findLesson.do">레슨찾기</a></li>
							<li class="nav-item"><a class="nav-link" href="http://localhost:8080/harmony/views/ensemble/boardList.jsp">합주찾기</a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/communitymain.do">커뮤니티</a></li>
						</ul>
					</div>
				</div>
				<div class="navbar align-self-center d-flex">
					<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
					<%if(loginMember==null){ %>
						<li class="nav-item">
							<a class="btn nav-link" href="<%=request.getContextPath()%>/loginServlet.do">로그인</a>
						</li>
					<%}else{ %>
						<li class="nav-item">
							<a class="btn nav-link" href="<%=request.getContextPath() %>/member/myPageServlet.do">내정보보기</a>
						</li>
						<li class="nav-item">
							<a class="btn nav-link btn-warning" href="https://kauth.kakao.com/oauth/logout?client_id=7a71de50fa7db8d6bb2395a8a5fba504&logout_redirect_uri=http://localhost:8080/harmony/logout.do">로그아웃</a>
						</li>
					<%} %>
					</ul>
				</div>
			</div>
		</nav>
	</header>