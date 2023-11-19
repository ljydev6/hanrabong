<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page
	import="java.util.List,com.harmony.board.info.model.dto.InfoBoard"%>
<%
List<InfoBoard> boards = (List<InfoBoard>) request.getAttribute("boards");
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
				action='<%=request.getContextPath()%>/board/boardWriteEnd.do'enctype="multipart/form-data" method="post"onsubmit="return submitPost()">
            
            <div class="form-field">
                <label>카테고리</label>
                <div class="radio-group">
                    <label><input type="radio" name="category" value="cat1"> 공연</label>
                    <label><input type="radio" name="category" value="cat2"> 입시</label>
                    <label><input type="radio" name="category" value="cat3"> 오디션</label>
                    <label><input type="radio" name="category" value="cat4"> 버스킹</label>
                </div>
            </div>

            <div class="form-field">
                <label>태그</label>
                <div class="radio-group">
                    <label><input type="radio" name="tag" value="tag1"> 정보</label>
                    <label><input type="radio" name="tag" value="tag2"> 후기</label>
                    <label><input type="radio" name="tag" value="tag3"> TIP</label>
                    <label><input type="radio" name="tag" value="tag4"> 이벤트</label>
                </div>
            </div>

            <div class="form-field">
                <label>지역</label>
                <div class="radio-group">
                    <label><input type="radio" name="region" value="서울"> 서울</label>
                    <label><input type="radio" name="region" value="경기도"> 경기도</label>
                    <label><input type="radio" name="region" value="강원도"> 강원도</label>
                    <label><input type="radio" name="region" value="충청북도"> 충청북도</label>
                    <label><input type="radio" name="region" value="충청남도"> 충청남도</label>
                    <label><input type="radio" name="region" value="전라북도"> 전라북도</label>
                    <label><input type="radio" name="region" value="전라남도"> 전라남도</label>
                    <label><input type="radio" name="region" value="경상북도"> 경상북도</label>
                    <label><input type="radio" name="region" value="경상남도"> 경상남도</label>
                    <label><input type="radio" name="region" value="제주도"> 제주도</label>
                </div>
            </div>
            <div class="write-title">
                <input type="text" id="post-title" name="title" placeholder="제목을 입력해 주세요.">
            </div>
			<div class="post-write">
            <textarea class="form-control" rows="20" name="bo_content"id="bo_content"></textarea>
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
  sSkinURI: "<%=request.getContextPath()%>/board/smarteditor2/SmartEditor2Skin.html",
  fCreator: "createSEditor2"
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