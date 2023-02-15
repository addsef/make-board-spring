<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.nclcorp.comm.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<title>details</title>
</head>
<body>
	<%
	BoardVO boardDetailVO = (BoardVO) request.getAttribute("boardDetailVO");
	%>
	<!-- 해당 글의 상세 페이지 -->
	<!-- 해당 글의 정보가 보여지도록 -->
	<!-- 글 번호 | 제목 | 내용 | 글쓴이 | 등록일 -->
	<div class="fix">
		<div class="head">
			<h1>상세 페이지</h1>
			<div class="body">
				<table class="b_3">
					<colgroup>
						<col width="18%">
						<col width="32%">
						<col width="18%">
						<col width="32%">
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<td colspan="3" id="noticeTitle"><%=boardDetailVO.getTitle()%></td>
						</tr>
						<th>등록자</th>
						<td id="noticEmpName"><%=boardDetailVO.getWriter()%></td>
						<th>등록일</th>
						<td id="noticRegDate"><%=boardDetailVO.getRegDate()%></td>
						<tr>
							<th>내용</th>
							<td id="contrnTd" colspan="3" height="400" valign="top">
								<div class="contents6" id="noticeContents">
									<%=boardDetailVO.getContent()%>
								</div>
							</td>
						</tr>
					</thead>
				</table>
				<div class="btns">
					<input type="button" value="목록"
						onclick="location.href='/list'"> <input
						type="button" value="수정"> <input type="button" value="삭제">
				</div>
			</div>
		</div>
	</div>
</body>
</html>