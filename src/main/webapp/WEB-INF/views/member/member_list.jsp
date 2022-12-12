<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
h2 {
	font-family: 'NanumSquareNeo-Variable';
	text-align: center;
	margin: 2%;
}
table {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<h2>회원목록</h2>
<table class="table">
<thead class="table-dark">
 <tr>
  <th>아이디</th>
  <th>이름</th>
  <th>이메일</th>
  <th>우편번호</th>
  <th>도로명주소</th>
  <th>상세주소</th>
  <th>가입일자</th>
 </tr>
 </thead>
<c:forEach var="row" items="${list}">
 <tr>
  <td>${row.userid}</td>
  <td><a href="${path}/member/view.do?userid=${row.userid}">
  ${row.name}</a></td>
  <td>${row.email}</td>
  <td>${row.zipcode}</td>
  <td>${row.address1}</td>
  <td>${row.address2}</td>
  <td><fmt:formatDate value="${row.join_date}" 
  pattern="yyyy-MM-dd HH:mm:ss"/> </td>
 </tr>
</c:forEach> 
<tr>
 	<td colspan="7"><input class="btn btn-outline-dark flex-shrink-0" type="button" value="회원추가" 
onclick="location.href='${path}/member/write.do'"></td>
 </tr>
</table>
</body>
</html>
