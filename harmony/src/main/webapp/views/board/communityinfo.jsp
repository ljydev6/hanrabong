<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.harmony.board.info.model.dto.InfoBoard"%>
<%
List<InfoBoard> boards = (List<InfoBoard>) request.getAttribute("boards");
%>
<%@ include file="/views/common/header.jsp"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoCommunity.css" type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<title>정보 게시판</title>
<head>
</head>

<body>
	<div class="content">
		<div class="infoboard">
			<div class="info-container">
				<h3 class="info"><a href ="<%=request.getContextPath()%>/communitymain.do">정보게시판</a></h3>
				<h3 class="free"><a href="<%=request.getContextPath()%>/test2.do">정보게시판</a></h3>
			</div>
		</div>
		<div class="main-sort-container">
			<div class="main">
				<div class="category">
					<select id="infocategory-select" name="infocategory">
						<option value="all">카테고리</option>
						<option value="all">공연</option>
						<option value="all">입시</option>
						<option value="all">오디션</option>
						<option value="all">버스킹</option>
					</select>
				</div>
				<div>
					<select id="infotag-select" name="infotag">
						<option value="all">태그</option>
						<option value="all">정보</option>
						<option value="aall">후기</option>
						<option value="all">TIP</option>
						<option value="all">이벤트</option>
					</select>
				</div>
				<div>
					<select id="region-select" name="region">
						<option value="all">지역</option>
						<option value="all">서울</option>
						<option value="all">경기도</option>
						<option value="all">강원도</option>
						<option value="all">충청북도</option>
						<option value="all">충청남도</option>
						<option value="all">전라북도</option>
						<option value="all">전라남도</option>
						<option value="all">경상북도</option>
						<option value="all">경상남도</option>
						<option value="all">제주도</option>
					</select>
				</div>
				<div class="info-sort">
					<select id="sort-select" name="sort">
						<option value="all">최신등록순</option>
						<option value="all">오래된순</option>
						<option value="all">조회수</option>
						<option value="all">댓글수</option>
					</select>
				</div>
			</div>


			<div class="posts">
				<%
				if (!boards.isEmpty()) {
					for (InfoBoard post : boards) {
				%>
				<div class="post">
					<h4><%=post.getInfBrdTitle()%></h4>
					<p><%=post.getInfBrdContent()%></p>
				</div>
				<%
				}
				}
				%>
			</div>

			<div class="text-center">
				<ul class="pagination">
					<%=request.getAttribute("pageBar")%>
				</ul>
			</div>

		</div>
		<div class="write-button-container">
			<button type="button" class="write-button">
				<a href="정보글쓰기.html">글쓰기</a>
			</button>
		</div>
	</div>
</body>

<script>
	
</script>

</body>

</html>

<%@ include file="/views/common/footer.jsp"%>
