<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,com.harmony.board.info.model.dto.InfoBoard,com.harmony.board.info.model.dto.InfoCommentBoard"%>
<%
InfoBoard board = (InfoBoard) request.getAttribute("InfoBoard");
List<InfoCommentBoard> comments = (List<InfoCommentBoard>) request.getAttribute("comments");
%>
<%@ include file="/views/common/header.jsp"%>




<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/board/infoboardView.css"
	type="text/css">
<div class="main-container">
    <div class="infoboard">
        <div class="info-container">
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
                <td><h3><%=board.getInfBrdTitle()%></h3></td>
            </tr>
            <tr>
                <td><p><%=board.getInfBrdContent()%></p></td>
            </tr>
        </table>

        <div id="comment-container">
            <div class="comment-editor">
                <form action="<%=request.getContextPath()%>/board/insertComment.do" method="post">
                    <input type="hidden" name="boardRef" value="<%=board.getInfBrdNo()%>">
                    <input type="hidden" name="level" value="1">
                    <input type="hidden" name="infComWriter" value="temp001">
                    <input type="hidden" name="infComNoRef" value="">
                    <textarea name="content" cols="55" rows="3"></textarea>
                    <button type="submit" id="btn-insert">등록</button>
                </form>
            </div>

            <% if (comments != null && !comments.isEmpty()) { %>
                <table id="tbl-comment">
                    <% for (InfoCommentBoard comment : comments) {
                        if (comment.getInfComLevel() == 1) { %>
                            <tr class="level1">
                                <td>
                                    <sub class="comment-writer"><%=comment.getInfComWriter()%></sub>
                                    <sub class="comment-date"><%=comment.getInfComDate()%></sub><br>
                                    <%=comment.getInfComContent()%>
                                </td>
                                <td>
                                    <button class="btn-reply" value="<%=comment.getInfComNo()%>">답글</button>
                                    <button class="btn-delete">삭제</button>
                                </td>
                            </tr>
                    <% } else { %>
                            <tr class="level2">
                                <td>
                                    <sub><%=comment.getInfComWriter()%></sub>
                                    <sub><%=comment.getInfComDate()%></sub><br>
                                    <%=comment.getInfComContent()%>
                                </td>
                                <td></td>
                            </tr>
                    <% }
                    } %>
                </table>
            <% } %>
        </div>
    </div>
</div>

<%@ include file="/views/common/footer.jsp"%>
