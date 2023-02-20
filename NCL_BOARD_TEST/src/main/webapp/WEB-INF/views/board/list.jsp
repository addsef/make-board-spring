<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@page import="kr.nclcorp.comm.vo.BoardVO"%>
<%@page import="kr.nclcorp.comm.vo.PaginationVO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="data:,">
<link href="${path}/resources/css/boardlist.css" rel="stylesheet" />
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<title>게시판 리스트</title>
</head>
<body class="body">
	<div class="main_contanier">
		<!-- 게시판 리스트 목록 -->
		<div class="board">
			<div class="board_1">
				<div class="title">
					<h1>게시판</h1>
					<div class="search_area">
						<form>
							<input type="search" placeholder="Search"> <span>검색</span>
						</form>
					</div>
				</div>
				<table class="b_2">
					<colgroup>
						<%-- 						<col width="5%"> --%>
						<col width="50%">
						<col width="20%">
						<col width="20%">
						<col width="5%">
					</colgroup>
					<thead>
						<tr>
							<!-- 							<th style="padding: 8px;"></th> -->
							<th style="padding: 8px;">제목</th>
							<th style="padding: 8px;">등록자</th>
							<th style="padding: 8px;">등록일</th>
							<th style="padding: 8px;"></th>
						</tr>
					</thead>
					<tbody>
						<!-- 컨트롤러로부터 현재 페이지 인덱스를 받아와서 해당 페이지에 있는 게시글들만 보여지도록  -->
						<%
						@SuppressWarnings("unchecked")
						List<BoardVO> boardListVO = (List<BoardVO>) request.getAttribute("boardListVO");
						for (BoardVO board : boardListVO) {
						%>
						<tr>
							<!-- 							<td></td> -->
							<td><a href="/detail/<%=board.getIdx()%>"><%=board.getTitle()%></a></td>
							<td><%=board.getWriter()%></td>
							<%-- 							<% String date = board.getRegDate().substring(0, 10);  --%>
							<%-- 							%> --%>
							<td><%=board.getRegDate().substring(0, 10)%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<div class="number">
					<!-- 목록 페이지 -->
					<!-- 현재 페이지가 1이거나 라스트 페이지이면 -->
					<!-- 이전 버튼 or 다음 버튼 비활성화  -->
					<ul class="num_ul">
						<li><a href="/list?pageIndex=${paginationVO.getStartPage() }">First</a></li>
						<li><a id="prev"
							href="/list?pageIndex=${paginationVO.getPrevPage() }">Previous</a></li>
						<c:forEach var="num" begin="${paginationVO.getStartPage() }"
							end="${paginationVO.getEndPage() }">
							<li><a id="cur" href="/list?pageIndex=${num }">${num }</a></li>
						</c:forEach>
						<li><a id="next"
							href="/list?pageIndex=${paginationVO.getNextPage() }">Next</a></li>
						<li><a href="/list?pageIndex=${paginationVO.getEndPage() }">Last</a></li>
					</ul>
					<c:if test="${paginationVO.getCurPage() eq paginationVO.getStartPage() }">
						<script>document.getElementById('prev').setAttribute('href', '');</script>
					</c:if>
					<c:if test="${paginationVO.getCurPage() eq paginationVO.getEndPage() }">
						<script>document.getElementById('next').setAttribute('href', '');</script>
					</c:if>
					<div class="enroll">
						<input type="button" value="등록" onclick="location.href='/insert'">
					</div>
				</div>
			</div>
		</div>
</body>
</html>