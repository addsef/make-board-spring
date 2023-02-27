<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
					<h1 style="cursor: pointer;" onclick="location.href = '/list'">게시판</h1>
					<div class="search_area">
						<form action="/list" method="get" autocomplete="off">
							<select name="searchCondition" id="condition">
								<option value="title">제목</option>
								<option value="title_content">제목+내용</option>
								<option value="writer">작성자</option>
							</select> <input type="search" name="searchKeyword" id="keyword"
								placeholder="Search">
							<button type="submit">검색</button>
						</form>
					</div>
				</div>
				<table class="b_2">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th style="padding: 8px;">No.</th>
							<th style="padding: 8px;">제목</th>
							<th style="padding: 8px;">등록자</th>
							<th style="padding: 8px;">등록일</th>
						</tr>
					</thead>
					<tbody>
						<!-- 컨트롤러로부터 현재 페이지 인덱스를 받아와서 해당 페이지에 있는 게시글들만 보여지도록  -->
						<c:forEach var="board" items="${boardListVO }" varStatus="num">
							<tr>
								<td>${paginationVO.getListCnt() - (((paginationVO.getCurPage() - 1) * 10) + num.index)}</td>
								<td><a href="/detail/${board.getIdx() }">${board.getTitle() }</a></td>
								<td>${board.getWriter() }</td>
								<td>${board.getRegDate().substring(0, 10)}</td>
							</tr>
						</c:forEach>
						<c:if test="${paginationVO.getListCnt() == 0 }">
							<tr>
								<td colspan="4">검색 결과가 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<div class="number">
					<!-- 페이지네이션 -->
					<!-- 현재 페이지가 1이거나 라스트 페이지이면 -->
					<!-- 이전 버튼 or 다음 버튼 비활성화  -->
					<!-- 현재 페이지 번호에 색을 부여 -->
					<ul class="num_ul">
						<li><a id="first"
							href="/list?pageIndex=${paginationVO.getStartPage() }">First</a></li>
						<li><a id="prev"
							href="/list?pageIndex=${paginationVO.getPrevPage() }">Previous</a></li>
						<c:forEach var="num" begin="${paginationVO.getStartPage() }"
							end="${paginationVO.getEndPage() }">
							<li><a href="/list?pageIndex=${num }">${num }</a></li>
						</c:forEach>
						<li><a id="next"
							href="/list?pageIndex=${paginationVO.getNextPage() }">Next</a></li>
						<li><a id="last"
							href="/list?pageIndex=${paginationVO.getEndPage() }">Last</a></li>
					</ul>
					<c:if
						test="${paginationVO.getCurPage() eq paginationVO.getStartPage() }">
						<script>
							// 							document.getElementById('prev').setAttribute(
							// 									'href', '');
							document.getElementById('first').style.display = 'none';
							document.getElementById('prev').style.display = 'none';
						</script>
					</c:if>
					<c:if
						test="${paginationVO.getCurPage() eq paginationVO.getEndPage() }">
						<script>
							// 							document.getElementById('next').setAttribute(
							// 									'href', '');
							document.getElementById('next').style.display = 'none';
							document.getElementById('last').style.display = 'none';
						</script>
					</c:if>
					<c:if test="${paginationVO.getListCnt() == 0 }">
						<script>
							document.getElementById('next').style.display = 'none';
							document.getElementById('last').style.display = 'none';
						</script>
					</c:if>
					<div class="enroll">
						<input type="button" value="목록" onclick="location.href='/list'">
						<input type="button" value="등록" onclick="location.href='/insert'">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>