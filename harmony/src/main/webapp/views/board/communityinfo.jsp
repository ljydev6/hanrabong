<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.harmony.board.info.model.dto.InfoBoard"%>
<%
List<InfoBoard> boards = (List<InfoBoard>) request.getAttribute("boards");
%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoCommunity.css" type="text/css">	


	<div class="content">
		<div class="infoboard">
			<div class="info-container">
				<h3 class="info"><a href ="<%=request.getContextPath()%>/communitymain.do">정보 게시판</a></h3>
				<h3 class="free"><a href="<%=request.getContextPath()%>/communitysub.do">자유 게시판</a></h3>
			</div>
		</div>
		<div class="main-sort-container">
			<div class="main">
				<div class="category">
					<select id="infocategory-select" name="infocategory">
						<option value="all">카테고리</option>
						<option value="cat1">공연</option>
						<option value="cat2">입시</option>
						<option value="cat3">오디션</option>
						<option value="cat4">버스킹</option>
					</select>
				</div>
				<script>
				 
				</script>
				<div>
					<select id="infotag-select" name="infotag">
						<option value="all">태그</option>
						<option value="tag1">정보</option>
						<option value="tag2">후기</option>
						<option value="tag3">TIP</option>
						<option value="tag4">이벤트</option>
					</select>
				</div>
				<div>
					<select id="region-select" name="region">
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
				<div class="info-sort">
					<select id="sort-select" name="sort">
						<option value="최신등록순">최신등록순</option>
						<option value="오래된순">오래된순</option>
						<option value="조회수">조회수</option>
						<option value="댓글수">댓글수</option>
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
					<a href="<%=request.getContextPath()%>/board/boardView.do?no=<%=post.getInfBrdNo()%>">
					<%=post.getInfBrdTitle() %> 
				</a>
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
			<button onclick="location.assign('<%=request.getContextPath() %>/board/boardWrite.do')">
				정보게시판글쓰기
			</button>
			
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
