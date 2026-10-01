<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="board.dto.BoardDTO" %>
<%@ page import="board.dto.BoardCommentDTO" %>

<%
	String contextPath = request.getContextPath();
	
	String tab = (String) request.getAttribute("tab");
	
	if(tab == null || tab.trim().isEmpty()) {
	    tab = "posts";
	}
	
	List<BoardDTO> postList = (List<BoardDTO>) request.getAttribute("postList");
	
	List<BoardCommentDTO> commentList = (List<BoardCommentDTO>) request.getAttribute("commentList");
%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="UTF-8">

<meta name="viewport"
    content="width=device-width, initial-scale=1.0">

<title>나의 활동 내역 | NEXORA</title>

<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet" />
<link href="<%=contextPath%>/assets/css/pages/index.css" rel="stylesheet" />
<style>
body {
    margin: 0;
    font-family: "Pretendard", sans-serif;
    background-color: #f8f9ff;
    color: #0b1c30;
}
.activity-main {
    width: 100%;
    min-height: calc(100vh - 72px);
    background-color: #f8f9ff;
}
.activity-container {
    width: calc(100% - 48px);
    max-width: 1200px;
    margin: 0 auto;
    padding-top: 40px;
    padding-bottom: 80px;
}
.activity-header {
    margin-bottom: 28px;
}
.activity-title {
    margin: 0;
    color: #0a192f;
    font-size: 26px;
    font-weight: 700;
    letter-spacing: -0.5px;
}
.activity-description {
    margin-top: 8px;
    margin-bottom: 0;
    color: #64748b;
    font-size: 14px;
}
.activity-card {
    overflow: hidden;
    background-color: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
}
.activity-tabs {
    display: flex;
    align-items: center;
    gap: 28px;
    padding-left: 24px;
    padding-right: 24px;
    border-bottom: 1px solid #e2e8f0;
}
.activity-tab {
    position: relative;
    display: inline-block;
    padding-top: 17px;
    padding-bottom: 17px;
    color: #64748b;
    font-size: 14px;
    font-weight: 600;
    text-decoration: none;
    transition: color 0.2s;
}
.activity-tab:hover {
    color: #1c4fd7;
}
.activity-tab.active {
    color: #1c4fd7;
}
.activity-tab.active::after {
    position: absolute;
    right: 0;
    bottom: -1px;
    left: 0;
    height: 3px;
    background-color: #1c4fd7;
    border-radius: 3px 3px 0 0;
    content: "";
}
.activity-table-wrapper {
    width: 100%;
    overflow-x: auto;
}
.activity-table {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
}
.activity-table thead {
    background-color: #f8fafc;
}
.activity-table th {
    padding: 15px 20px;
    color: #334155;
    border-bottom: 1px solid #e2e8f0;
    font-size: 13px;
    font-weight: 700;
}
.activity-table td {
    padding: 16px 20px;
    color: #334155;
    border-bottom: 1px solid #f1f5f9;
    font-size: 14px;
}
.activity-table tbody tr:last-child td {
    border-bottom: 0;
}
.activity-table tbody tr.activity-row:hover {
    background-color: #f8fafc;
}
.title-column {
    text-align: left;
}
.comment-column {
    width: 130px;
    text-align: center;
}
.date-column {
    width: 180px;
    text-align: center;
}
.board-title {
    color: #1e293b;
    font-weight: 500;
    text-decoration: none;
}
.board-title:hover {
    color: #1c4fd7;
    text-decoration: underline;
}
.comment-count {
    color: #1c4fd7;
    font-weight: 700;
}
.activity-empty {
    padding: 70px 20px !important;
    text-align: center;
}
.empty-icon {
    display: block;
    margin-bottom: 10px;
    color: #cbd5e1;
    font-family: "Material Symbols Outlined";
    font-size: 42px;
    font-weight: normal;
}
.empty-text {
    margin: 0;
    color: #94a3b8;
    font-size: 14px;
}
@media(max-width: 768px) {
    .activity-container {
        width: calc(100% - 32px);
        padding-top: 28px;
    }
    .activity-tabs {
        gap: 20px;
        padding-left: 16px;
        padding-right: 16px;
    }
    .activity-table {
        min-width: 650px;
    }
    .activity-title {
        font-size: 22px;
    }
}
</style>
</head>
<body>
<jsp:include page="/inc/top.jsp" />
<main class="activity-main">
    <div class="activity-container">
        <div class="activity-header">
            <h1 class="activity-title">
                나의 활동 내역
            </h1>
            <p class="activity-description">
                작성한 게시글, 댓글 및 문의 내역을 확인할 수 있습니다.
            </p>
        </div>

        <div class="activity-card">
            <div class="activity-tabs">
                <a
                    href="<%=contextPath%>/member/activity.do?tab=posts"
                    class="activity-tab <%="posts".equals(tab) ? "active" : ""%>">
                    작성 글
                </a>
                <a
                    href="<%=contextPath%>/member/activity.do?tab=comments"
                    class="activity-tab <%="comments".equals(tab) ? "active" : ""%>">
                    작성 댓글
                </a>
                <a
                    href="<%=contextPath%>/member/activity.do?tab=inquiries"
                    class="activity-tab <%="inquiries".equals(tab) ? "active" : ""%>">
                    문의 내역
                </a>
            </div>
            <div class="activity-table-wrapper">
                <table class="activity-table">
                    <thead>
                        <tr>
						    <th class="title-column">
						        게시글 제목
						    </th>
						    <th class="comment-column">
						        <% if("comments".equals(tab)) { %>
						            작성 댓글
						        <% } else { %>
						            댓글 수
						        <% } %>
						    </th>
						    <th class="date-column">
						        작성일자
						    </th>
						</tr>
                    </thead>
                    <tbody>
						<%
							if("posts".equals(tab)) {
							    if(postList != null && !postList.isEmpty()) {
							        for(BoardDTO board : postList) {
						%>
						    <tr class="activity-row">
						        <td class="title-column">
						            <a
						                class="board-title"
						                href="<%=contextPath%>/board/detail?id=<%=board.getBoardId()%>">
						                <%=board.getTitle()%>
						            </a>
						        </td>
						        <td class="comment-column">
						            <span class="comment-count"><%=board.getCommentCount()%></span>
						        </td>
						        <td class="date-column">
						            <%=board.getCreatedAt()%>
						        </td>
						    </tr>
						<%
						        }
						    } else {
						%>
						    <tr>
						        <td colspan="3" class="activity-empty">
						            <span class="empty-icon">description</span>
						            <p class="empty-text">작성한 게시글이 없습니다.</p>
						        </td>
						    </tr>
						<%
						    }
						} else if("comments".equals(tab)) {
						    if(commentList != null && !commentList.isEmpty()) {
						        for(BoardCommentDTO comment : commentList) {
						%>
						    <tr class="activity-row">
						        <td class="title-column">
						            <a
						                class="board-title"
						                href="<%=contextPath%>/board/detail?id=<%=comment.getBoardId()%>#comments">
						                <%=comment.getBoardTitle()%>
						            </a>
						        </td>
						        <td class="comment-column">
						            <%=comment.getContent()%>
						        </td>
						        <td class="date-column">
						            <%=comment.getCreatedAt()%>
						        </td>
						    </tr>
						<%
						        }
						    } else {
						%>
						    <tr>
						        <td colspan="3" class="activity-empty">
						            <span class="empty-icon">chat</span>
						            <p class="empty-text">작성한 댓글이 없습니다.</p>
						        </td>
						    </tr>
						<%
						    }
						} else {
						%>
						    <tr>
						        <td colspan="3" class="activity-empty">
						            <span class="empty-icon">contact_support</span>
						            <p class="empty-text">문의 내역이 없습니다.</p>
						        </td>
						    </tr>
						<% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
</body>
</html>