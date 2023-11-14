<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이제 너에게 음악을 알려줄게 - 이음줄</title>
	<link rel="stylesheet" href="/harmony/css/bootstrap.css">
	<link rel="stylesheet" href="/harmony/css/navbarStyle.css">
	<link rel="stylesheet" href="/harmony/css/footerStyle.css">
	<script src="/harmony/js/bootstrap.min.js"></script>
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
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/lesson/findlesson.do">레슨찾기</a></li>
							<li class="nav-item"><a class="nav-link" href="합주찾기">합주찾기</a></li>
							<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/communitymain.do">커뮤니티</a></li>
						</ul>
					</div>
				</div>
				<div class="navbar align-self-center d-flex">
					<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item">
							<a class="btn nav-link" href="<%=request.getContextPath()%>/loginServlet.do">로그인</a>
						</li>
						<li class="nav-item">
							<a class="btn nav-link" href="회원가입">회원가입</a>
						</li>
						<li class="nav-item">
							<button class="btn btn-warning btn-sm" type="button">강사가입</button>
						</li>
					</ul>
				</div>
				
			</div>
		</nav>
	</header>