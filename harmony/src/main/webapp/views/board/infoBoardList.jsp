<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.harmony.board.info.model.dto.InfoBoard"%>
<%
List<InfoBoard> boards = null;
if (request.getAttribute("searchResults") != null) {
	boards = (List<InfoBoard>) request.getAttribute("searchResults");
} else {
	boards = (List<InfoBoard>) request.getAttribute("boards");
}
%>

<%@ include file="/views/common/header.jsp"%>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoCommunity.css"
	type="text/css">


<div class="content">
	<div class="main">
		<div class="board">
			<div class="info-container">
				<h3 class="info-board">
					<a href="<%=request.getContextPath()%>/infoBoardList.do">정보 게시판</a>
				</h3>
				<h3 class="free-board">
					<a href="<%=request.getContextPath()%>/freeBoardList.do">자유 게시판</a>
				</h3>
			</div>
		</div>

		<div class="main-container">
			<div class="filter">
				<div class="category-select">
					<select id="infocategory-select" name="infocategory">
						<option value="all">카테고리</option>
						<option value="cat1">공연</option>
						<option value="cat2">입시</option>
						<option value="cat3">오디션</option>
						<option value="cat4">버스킹</option>
					</select>
				</div>

				<div class="tag-select">
					<select id="infotag-select" name="infotag">
						<option value="all">태그</option>
						<option value="tag1">정보</option>
						<option value="tag2">후기</option>
						<option value="tag3">TIP</option>
						<option value="tag4">이벤트</option>
					</select>
				</div>

				<div class="region-select">
					<select id="inforegion-select" name="region">
						<option value="all">지역</option>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="제주도">제주도</option>
					</select>
				</div>

				<div class="post-writer-button-div">
					<button class="post-writer-button"
						onclick="location.assign('<%=request.getContextPath()%>/board/boardWrite.do')">
						글쓰기</button>
				</div>
			</div>

			<div class="post">
				<%
				if (!boards.isEmpty()) {
					for (InfoBoard post : boards) {
				%>
				<div class="individual-post">
					<a
						href="<%=request.getContextPath()%>/board/boardView.do?no=<%=post.getInfBrdNo()%>">
						<p class="categorytag"><%=request.getAttribute("categoryName" + post.getInfBrdNo())%>
							(<%=request.getAttribute("tagName" + post.getInfBrdNo())%>)
						</p>
						<div class="post-main">
							<div>
								<section class="post-content">
									<h3><%=post.getInfBrdTitle()%></h3>
									<p><%=post.getInfBrdContent()%></p>
								</section>
								<%--<p class="post-writer"><%=post.getInfBrdWriter()%></p>--%>
								<p class="post-writer"><%=post.getInfBrdWriter()%></p>
								<p class="post-region"><%=post.getInfBrdRegion()%></p>
							</div>
							<img src="<%=request.getContextPath()%>/image/board/No1.png">
						</div>

						<div class="post-footer">
							<div class="view-comment">
								<div class="views-comments-container">
									<span>댓글 <%= request.getAttribute("commentCount" + post.getInfBrdNo()) %></span>
								</div>
							</div>
						</div>
					</a>
				</div>
				<%
				}
				}
				%>
			</div>

			<form action="<%=request.getContextPath()%>/board/InfoBoardSearch.do"
				method="get" class="search-form">
				<select name="searchType" class="search-select">
					<option value="both">제목+본문</option>
					<option value="title">제목</option>
					<option value="content">본문</option>
				</select> <input type="text" name="query" placeholder="검색어 입력"
					class="search-input">
				<button type="submit" class="search-button">
					<img src="<%=request.getContextPath()%>/image/board/search2.png">
				</button>
			</form>

			<div class="pagination-form">
				<ul class="pagination">
					<%=request.getAttribute("pageBar")%>
				</ul>
			</div>
		</div>
	</div>
</div>

<script>
		<%-- document.querySelectorAll(".main select").forEach(e=>{
			// 각 <select> 요소에 'change' 이벤트 리스너를 추가합니다.
		    // 이 리스너는 사용자가 드롭다운의 옵션을 변경할 때마다 실행됩니다.
			e.addEventListener("change",e=>{
			      // e.target은 이벤트가 발생한 <select> 요소를 가리킵니다.
		        // value는 선택된 옵션의 값을 가져옵니다.
				const value=e.target.value;
				 // name은 <select> 요소의 name 속성 값을 가져옵니다.
				const name=e.target.name;
				 // location.assign을 사용하여 새 URL로 페이지를 이동시킵니다.
		        // 여기서 URL은 사용자가 선택한 카테고리와 값을 기반으로 동적으로 생성됩니다.
				location.assign("<%=request.getContextPath()%>/community/searchcommunity.do?" + name + "=" + value);				
				 
			});
			
		}); --%>
		<%-- document.querySelectorAll(".main select").forEach(e => {
		    e.addEventListener("change", event => {
		        let url = "<%=request.getContextPath()%>/community/searchcommunity.do";

		        const params = new URLSearchParams(window.location.search);

		        const paramName = event.target.id.replace('info', '').replace('-select', '');

		        params.set(paramName, event.target.value);
		        
		        url += "?" + params.toString();

		        location.assign(url);
		    });
		});
 --%>
 document.querySelectorAll(".main select").forEach(e => {
	    // 페이지 로드 시 URL의 검색 파라미터에 따라 셀렉트 박스의 선택된 옵션 설정
	    const params = new URLSearchParams(window.location.search);
	    const paramName = e.id.replace('info', '').replace('-select', '');
	    if (params.has(paramName)) {
	        e.value = params.get(paramName);
	    }

	    // 셀렉트 박스의 선택이 변경되었을 때 URL 업데이트
	    e.addEventListener("change", event => {
	        let url = "<%=request.getContextPath()%>/community/searchcommunity.do";
	        params.set(event.target.id.replace('info', '').replace('-select', ''), event.target.value);
	        url += "?" + params.toString();
	        location.assign(url);
	    });
	});


		
	</script>
<%@ include file="/views/common/footer.jsp"%>
