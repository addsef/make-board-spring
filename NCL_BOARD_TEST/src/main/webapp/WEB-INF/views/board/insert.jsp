<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.nclcorp.comm.vo.BoardVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${path}/resources/css/common.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>글 등록하기</title>
</head>
<body>
	<!-- 글 등록 폼 -->
	<div class="fix">
		<div class="head">
			<h1>글 등록하기</h1>
			<div class="body">
				<form>
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
									type="text"></td>
							</tr>
							<th>등록자</th>
							<td id="noticEmpName"><input class="inp_writer" type="text"></td>
							<th>등록일</th>
							<td id="noticRegDate"><script>
								var date = new Date().toLocaleString();
								document.getElementById('noticRegDate').innerText = date;
							</script></td>
							<tr>
								<th>내용</th>
								<td id="contrnTd" colspan="3" height="400" valign="top">
									<div class="contents6" id="noticeContents">
										<textarea></textarea>
									</div>
								</td>
							</tr>
						</thead>
					</table>
					<div class="btns">
						<input type="button" value="취소" onclick="location.href='http://localhost:8080/list'">
						<input type="button" value="등록">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>