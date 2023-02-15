<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@page import="kr.nclcorp.comm.vo.BoardVO"%>
<%@page import="kr.nclcorp.comm.vo.PaginationVO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/boardlist.css" rel="stylesheet" />
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<title>게시판 리스트</title>
</head>
<body class="body">
	<div class="main_contanier">
		<!-- 게시판 리스트 목록 -->
		<div class="board">
			<div class="board_1">
				<div class="title">
					<h1>공지사항</h1>
					<div class="search_area">
						<form>
							<input type="search" placeholder="Search"> <span>검색</span>
						</form>
						</form>
					</div>
				</div>
				<table class="b_2">
					<colgroup>
						<col width="5%">
						<col width="50%">
						<col width="20%">
						<col width="20%">
						<col width="5%">
					</colgroup>
					<thead>
						<tr>
							<th style="padding: 8px;"></th>
							<th style="padding: 8px;">제목</th>
							<th style="padding: 8px;">등록자</th>
							<th style="padding: 8px;">등록일</th>
							<th style="padding: 8px;"></th>
						</tr>
					</thead>
					<tbody>
						<%
						@SuppressWarnings("unchecked")
						List<BoardVO> boardListVO = (List<BoardVO>) request.getAttribute("boardListVO");
						for (BoardVO board : boardListVO) {
						%>
						<tr>
							<td><%=board.getIdx()%></td>
							<td><a href="/detail/<%=board.getIdx()%>"><%=board.getTitle()%></a></td>
							<td><%=board.getWriter()%></td>
							<td><%=board.getRegDate()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<div class="number">
					<a class="contents6">1</a>
				</div>
				<div class="enroll">
					<input type="button" value="등록" onclick="location.href='http://localhost:8080/insert'">
				</div>
			</div>
		</div>
	</div>
</body>
</html>