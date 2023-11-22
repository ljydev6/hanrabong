<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.harmony.board.free.model.dto.FreeBoard"%>

<%
FreeBoard board = (FreeBoard) request.getAttribute("FreeBoard");
%>

<form action="<%=request.getContextPath()%>/board/FreeBoardEditEnd.do" method="post">

    <input type="hidden" name="no" value="<%=board.getFreBrdNo()%>">
    <input type="text" name="title" value="<%=board.getFreBrdTitle()%>">
    <textarea name="content"><%=board.getFreBrdContent()%></textarea>
    <button type="submit">저장하기</button>
</form>
