<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<%@ include file="../include/header.jsp" %>
<!-- ckeditor의 라이브러리 -->
<script src="${path}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function save()	{
	var title=$("#title").val();
	var content=$("#content").val();
	document.form1.action="${path}/notice/insert.do";
	document.form1.submit();
	}
</script>
<style type="text/css">
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.notice {
	font-family: 'NanumSquareNeo-Variable';
	text-align: center;
	margin: 2%;
}

table{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container">
<div class="row">
<form id="form1" name="form1" method="post" enctype="multipart/form-data" autocomplete="off">

<h2 class="notice">공지사항 작성</h2>
<table class="table table-striped">
<thead>
<tr>
<td>제목</td>
<td><input name="title" id="title" placeholder="제목을 입력하세요 " class="form-control" ></td></tr>
<tr><td>내용</td>
<td><textarea rows="10" class="form-control" placeholder="내용을 입력하세요" name="content" id="content"></textarea></td></tr>
<script>
   CKEDITOR.replace("content", {
	   filebrowserUploadUrl : "${path}/imageUpload.do"
   });
   </script>
<!-- <tr><td colspan="2">첨부파일<input type="file" class="btn btn-default btn-xs pull-right" name="file"></td></tr> -->
<tr><td colspan="2"><input type="button" class="btn btn-outline-dark flex-shrink-0" value="글쓰기" onclick="save()"></td></tr>
</thead>
</table>
</form>
</div>
</div>
</body>
</html>