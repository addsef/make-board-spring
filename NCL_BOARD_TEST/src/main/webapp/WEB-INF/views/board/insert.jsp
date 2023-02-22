<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.nclcorp.comm.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<link href="${path}/resources/css/board-inp.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>글 등록하기</title>
</head>
<body>
	<!-- 글 등록 폼 -->
	<div class="fix">
		<div class="head">
			<h1>글 등록하기</h1>
			<div class="body">
				<form action="/insBoard" method="post">
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
								<td colspan="3" id="noticeTitle"><input class="inp_title"
									type="text" name="title"></td>
							</tr>
							<tr>
								<th>등록자</th>
								<td id="noticEmpName"><input class="inp_writer" type="text"
									name="writer"></td>
								<th>등록일</th>
								<td id="noticRegDate"><input type="date" class="inp_date"
									name="regDate" id="regDate" tabindex="-1" readonly></td>
							</tr>
							<tr>
								<th>내용</th>
								<td id="contrnTd" colspan="3" height="400" valign="top">
									<div class="contents6" id="noticeContents">
										<textarea name="content" class="inp_content"></textarea>
									</div>
								</td>
							</tr>
						</thead>
					</table>
					<script>
						document.getElementById('regDate').value = new Date()
								.toISOString().substring(0, 10);
					</script>
					<div class="btns">
						<input type="button" value="취소" onclick="history.back()">
						<input type="submit" value="등록">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>