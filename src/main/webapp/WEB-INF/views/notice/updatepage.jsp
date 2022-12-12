<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 숮</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
table{
	margin-left:auto; 
    margin-right:auto;
	text-align: center;
}
table .name {
	width: 100px;
}
</style>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.userid == 'admin'}">
<%@ include file="../include/admin_menu.jsp" %>
</c:when>
<c:otherwise><%@ include file="../include/menu.jsp" %></c:otherwise>
</c:choose>
<table class="table table-bordered" style="width: 90%;">
<tr>
<td style="width: 100px">제목</td>
<td colspan="3">${dto.title}</td>
</tr>
<tr>
<td class="name">작성자</td>
<td colspan="3">${dto.name}</td>
</tr>
<tr>
<td class="name">작성일</td>
<td style="width: 40%"><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
<td class="name">조회수</td>
<td>${dto.viewcnt}</td>
</tr>
<tr>
<td class="name">내용</td>
<td colspan="3">${dto.content}</td>
</tr>
<c:choose>
<c:when test="${sessionScope.userid == 'admin'}">
<tr>
<td colspan="4">
<input class="btn btn-outline-dark flex-shrink-0" type="button" value="수정" id="btnUpdate" onclick="location.href='${path}/notice/updatepage.do';">
<input class="btn btn-outline-dark flex-shrink-0" type="button" value="목록" id="btnList" onclick="location.href='${path}/notice/list.do';">
<input class="btn btn-outline-dark flex-shrink-0" type="button" value="삭제" id="btnDelete"onclick="location.href='${path}/notice/delete.do';">
</td>
</tr>
</c:when>
<c:otherwise>
<tr>
<td colspan="4">
<input class="btn btn-outline-dark flex-shrink-0" type="button" value="목록" id="btnUpdate" onclick="location.href='${path}/notice/list.do';">
</td>
</tr>
</c:otherwise>
</c:choose>

</table>

</body>
</html>