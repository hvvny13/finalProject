<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
@font-face {
    font-family: 'PuradakGentleGothicR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.1/PuradakGentleGothicR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
#title {
	font-family: 'PuradakGentleGothicR';
	font-style: italic;
}
.table {
	text-align: center;
}

a:link, a:visited, a:hover {
	color: black;
	text-decoration: none;
}
</style>
<script type="text/javascript">
$(function() {
	$("#btnWrite").click(function() {
		location.href="${path}/notice/write.do";
	})
})

function list(page) {
	location.href="${path}/notice/list.do?curPage="+page
}

</script>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.userid == 'admin'}">
<%@ include file="../include/admin_menu.jsp" %>
</c:when>
<c:otherwise><%@ include file="../include/menu.jsp" %></c:otherwise>
</c:choose>
<div class="container">
<div class="row">
<form>
<h2 id="title">Notice</h2>
<table class="table">
<thead class="table-dark">
<tr>
<th>&nbsp</th>
<th>제목</th>
<th>작성자</th>
<th>작성일자</th>
<th>조회수</th>
</tr>
</thead>
<tbody>
<c:forEach var="row" items="${map.list}">
<tr>
<td>${row.bno }</td>
<td><a href="${path}/notice/view.do?bno=${row.bno}">${row.title}</a></td>
<td>${row.name }</td>
<td><fmt:formatDate value="${row.regdate}" 
  pattern="yyyy-MM-dd"/></td>
<td>${row.viewcnt }</td>
</tr>
</c:forEach>
</tbody>
<!-- 페이징 -->
<tr>
		<td colspan="6" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
<tr>
<c:if test="${sessionScope.userid == 'admin'}">
<td colspan="5"><input class="btn btn-outline-dark flex-shrink-0, btn float-right" type="button" value="글쓰기" id="btnWrite"></td>
</c:if>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>