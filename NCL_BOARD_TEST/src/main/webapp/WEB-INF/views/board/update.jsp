<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<link href="${path}/resources/css/board-inp.css" rel="stylesheet" />
<link href="${path}/resources/css/updatedate.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<title>글 수정</title>
</head>
<body>
	<!-- 글 수정 폼 -->
	<!-- 입력 태그 value 현 index값의 title, content등이 있어야 함 -->
	<!-- 이를 수정하고 확인 버튼 누르면 /update  + idx 파라미터로 같이 보냄. -->
	<div class="fix">
		<div class="head">
			<h1>수정</h1>
			<div class="body">
				<form action="/udtBoard" method="post">
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
								<td colspan="3" id="noticeTitle"><input type="text"
									value=${boardDetailVO.getTitle() } name="title"
									class="up_title"></td>
							</tr>
							<tr>
								<th>등록자</th>
								<td id="noticEmpName"><input type="text"
									value=${boardDetailVO.getWriter() } name="writer"
									class="up_writer" tabindex="-1" readonly></td>
								<th>등록일</th>
								<td id="noticRegDate"><input type="date" name="regDate"
									id="up-date" class="up_date" tabindex="-1"
									value="${boardDetailVO.getRegDate().substring(0, 10) }"
									readonly></td>
							</tr>
							<tr>
								<th>내용</th>
								<td id="contrnTd" colspan="3" height="400" valign="top">
									<div class="contents6" id="noticeContents">
										<textarea name="content" class="up_content">${boardDetailVO.getContent() }</textarea>
									</div>
								</td>
							</tr>
						</thead>
					</table>
					<div class="update">
						<input type="button" value="취소" onclick="history.back()">
						<input type="hidden" name="idx" value="${boardDetailVO.getIdx() }">
						<input type="submit" value="저장">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>