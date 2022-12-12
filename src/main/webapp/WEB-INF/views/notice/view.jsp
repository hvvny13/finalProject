<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ include file="../include/header.jsp" %>
<!-- ckeditor의 라이브러리 -->
<script src="${path}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function update()	{
	var title=$("#title").val();
	var content=$("#content").val();
	document.form1.action="${path}/notice/update.do";
	document.form1.submit();
	}
</script>
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
<c:choose>
<c:when test="${sessionScope.userid == 'admin'}">
<form id="form1" name="form1" method="post" enctype="multipart/form-data" autocomplete="off">
<table class="table table-bordered" style="width: 90%;">
<tr>
<td style="width: 100px">제목</td>
<td colspan="3"><input name="title" id="title" class="form-control" value="${dto.title}"></td>
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
<td colspan="3"><textarea rows="10" class="form-control" name="content" id="content">${dto.content}</textarea></td></tr>
<script>
   CKEDITOR.replace("content", {
	   filebrowserUploadUrl : "${path}/imageUpload.do"
   });
   </script>
<tr>
<td colspan="4">
<input class="btn btn-outline-dark flex-shrink-0" type="button" value="수정" id="btnUpdate" onclick="update()">
<input class="btn btn-outline-dark flex-shrink-0" type="button" value="목록" id="btnList" onclick="location.href='${path}/notice/list.do';">
<input class="btn btn-outline-dark flex-shrink-0" type="button" value="삭제" id="btnDelete"onclick="location.href='${path}/notice/delete.do';">
</td>
</tr>
</table>
</form>
</c:when>
<c:otherwise>
<form id="form1" name="form1" method="post" enctype="multipart/form-data" autocomplete="off">
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
<td colspan="3">${dto.content}</td></tr>
<tr>
<td colspan="4">
<input class="btn btn-outline-dark flex-shrink-0" type="button" value="목록" id="btnList" onclick="location.href='${path}/notice/list.do';">
</td>
</tr>
</table>
</form>
</c:otherwise>
</c:choose>
</body>
</html>