<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.harmony.board.free.model.dto.FreeBoard,com.harmony.board.free.model.dto.FreeCommentBoard"%>

<%
FreeBoard board = (FreeBoard) request.getAttribute("FreeBoard");
List<FreeCommentBoard> comments = (List<FreeCommentBoard>) request.getAttribute("comments");
%>

<%@ include file="/views/common/header.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/freeboardView.css"
	type="text/css">
<div class="main-container">
	<div class="freeboard">
		<div class="free-container">
			<h3 class="info">
				<a href="<%=request.getContextPath()%>/infoBoardList.do">정보 게시판</a>
			</h3>
			<h3 class="free">
				<a href="<%=request.getContextPath()%>/freeBoardList.do">자유 게시판</a>
			</h3>
		</div>
	</div>

	<div class="content-container">
		<table>
			<tr>
				<td><h3><%=board.getFreBrdTitle()%></h3></td>
			</tr>
			<tr>
				<td><p><%=board.getFreBrdContent()%></p></td>
			</tr>
			
		</table>
		<button onclick="confirmDeletion(<%=board.getFreBrdNo()%>)">게시글 삭제</button>
		<button onclick="editfreeBoard(<%=board.getFreBrdNo()%>)">수정하기</button>
		


		<!-- 댓글 입력 폼 -->
		<div id="comment-container">
			<div class="comment-editor">
				<form
					action="<%=request.getContextPath()%>/board/freeInsertComment.do"
					method="post">
					<input type="hidden" name="boardRef"
						value="<%=board.getFreBrdNo()%>"> <input type="hidden"
						name="level" value="1"> <input type="hidden"
						name="freComWriter" value="temp001">
					<!-- 수정 필요 -->
					<input type="hidden" name="freComNoRef" value="">
					<textarea name="content" cols="55" rows="3"></textarea>
					<button type="submit" id="btn-insert">등록</button>
				</form>
			</div>

			<!-- 댓글 목록 -->
			<%
			if (comments != null && !comments.isEmpty()) {
			%>
			<table id="tbl-comment">
				<%
				for (FreeCommentBoard comment : comments) {
					if (comment.getFreComLevel() == 1) {
				%>
				<tr class="level1">
					<td><sub class="comment-writer"><%=comment.getFreComWriter()%></sub>
						<sub class="comment-date"><%=comment.getFreComDate()%></sub><br>
						<%=comment.getFreComContent()%></td>
					<td>
						<button class="btn-reply" value="<%=comment.getFreComNo()%>">답글</button>
						<button class="btn-delete"
							onclick="confirmCommentDeletion(<%=comment.getFreComNo()%>, <%=board.getFreBrdNo()%>)">삭제</button>
					</td>
				</tr>
				<%
				} else {
				%>
				<tr class="level2">
					<td><sub><%=comment.getFreComWriter()%></sub> <sub><%=comment.getFreComDate()%></sub><br>
						<%=comment.getFreComContent()%></td>
					<td>
						<button class="btn-delete"
							onclick="confirmCommentDeletion(<%=comment.getFreComNo()%>, <%=board.getFreBrdNo()%>)">삭제</button>
					</td>
				</tr>
				<%
				}
				}
				%>
			</table>
			<%
			}
			%>
		</div>
	</div>
</div>


<script>
		function confirmDeletion(boardNo) {
		    if(confirm('게시글을 삭제하시겠습니까?')) {
		        window.location.href = '<%=request.getContextPath()%>/board/freeBoardDelete.do?no=' + boardNo;
		    }
		}

		function confirmCommentDeletion(commentNo, boardNo) {
		    if (confirm('댓글을 삭제하시겠습니까?')) {
		        window.location.href = '<%=request.getContextPath()%>/board/freeCommentDelete.do?no=' + commentNo + '&boardNo=' + boardNo;
		    }
		}
		$(".btn-reply").click(e=>{
		    // 답글 입력창이 이미 존재하면 함수를 종료
		    if ($(e.target).parents("tr").next().hasClass("reply-form")) {
		        return;
		    }
				    const $tr=$("<tr>").addClass("reply-form");
				    const $td=$("<td>").attr("colspan","2");
				    const $form=$(".comment-editor>form").clone();
				    console.log($form);
		    		$form.find("input[name=level]").val("2"); //대댓글번호 찾는
		    		$form.find("textarea").attr("rows","1");  //답글 쓰는곳 크기 줄이기
		    		$form.find("button").removeAttr("id").addClass("btn-insert2"); //아이디 지우기
		    		$form.find("input[name=freComNoRef]").val($(e.target).val()); //대글의 번호를 대댓글에 넣는..?
		    		$td.append($form);
		    		$tr.append($td);
		    		
		    		$(e.target).parents("tr")
		    			.after($tr);	
		    	});
		
		function editfreeBoard(boardNo) {
		    window.location.href = '<%=request.getContextPath()%>/board/freeBoardEdit.do?no=' + boardNo;
		}

		    </script>


<%@ include file="/views/common/footer.jsp"%>
