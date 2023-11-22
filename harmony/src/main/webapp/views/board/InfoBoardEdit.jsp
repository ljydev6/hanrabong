<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.harmony.board.info.model.dto.InfoBoard"%>
<%
InfoBoard board = (InfoBoard) request.getAttribute("board");
%>
<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoCommunityWrite.css"
	type="text/css">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/board/smarteditor2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

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

		<form id="postForm"
    action='<%=request.getContextPath()%>/board/boardEditEnd.do'
    method="post"
    onsubmit="return submitPost()">
    <input type="hidden" name="no" value="<%=board.getInfBrdNo()%>">

			<div class="form-field-container">
				<div class="form-field">
					<select name="category">
						<option value="cat1">공연</option>
						<option value="cat2">입시</option>
						<option value="cat3">오디션</option>
						<option value="cat4">버스킹</option>
					</select>
				</div>

				<div class="form-field">
					<select name="tag">
						<option value="tag1">정보</option>
						<option value="tag2">후기</option>
						<option value="tag3">TIP</option>
						<option value="tag4">이벤트</option>
					</select>
				</div>

				<div class="form-field">
					<select name="region">
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
			</div>
			<div class="write-title">
        <input type="text" id="post-title" name="title"
            value="<%=board.getInfBrdTitle()%>">
    </div>
    <div class="post-write">
        <textarea class="form-control" rows="20" name="bo_content"
            id="bo_content"><%=board.getInfBrdContent()%></textarea>
        <button type="submit" class="submit-post-button">글쓰기</button>
    </div>
		</form>
	</div>
</div>

<script>
    var oEditors = [];
    
    nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "bo_content",
      sSkinURI: "<%=request.getContextPath()%>
	/board/smarteditor2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});

	function submitPost() {
		oEditors.getById["bo_content"].exec("UPDATE_CONTENTS_FIELD", []);

		if (!document.querySelector('input[name="category"]:checked')) {
			alert("카테고리를 선택해주세요.");
			return false;
		}

		if (!document.querySelector('input[name="tag"]:checked')) {
			alert("태그를 선택해주세요.");
			return false;
		}

		if (!document.querySelector('input[name="region"]:checked')) {
			alert("지역을 선택해주세요.");
			return false;
		}

		var title = document.getElementById("post-title").value.trim();
		if (title === "") {
			alert("제목을 입력해주세요.");
			return false;
		}

		var content = document.getElementById("bo_content").value.trim();
		if (content === "") {
			alert("본문을 입력해주세요.");
			return false;
		}

		return true;
	}
</script>

<%@ include file="/views/common/footer.jsp"%>
