<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
@font-face {
    font-family: 'MonoplexKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_Monoplex-kr@1.0/MonoplexKR-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

@font-face {
    font-family: 'SANGJUGyeongcheonIsland';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/SANGJUGyeongcheonIsland.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

a:hover {
	text-decoration: none;
}
#member{
    font-size: 15px;
    font-weight: normal;
    letter-spacing: 1px;
	font-family: 'MonoplexKR-Regular';
}

.title {
	font-family: 'SANGJUGyeongcheonIsland';
	font-style: italic;
}

.topnav {
	font-size: 17px;
	letter-spacing: 1px;
}

.topnav a {
	margin: 2%;
}

.topnav-centered a {
	color: black;
	font-family: 'NanumSquareNeo-Variable';
}
</style>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div style="text-align: center;" id="member">
<br>
<h1 class="title">
	BAON
</h1>
<br>
<!-- Top navigation -->
<div class="topnav">
  <!-- Centered link -->
  <div class="topnav-centered">
  <c:choose>
  	<c:when test="${sessionScope.userid == null}"><a href="${path}/">Home</a> |</c:when>
  	<c:otherwise><a href="${path}/member/main.do">Home</a> |</c:otherwise>
  </c:choose>
	<%-- <a href="${path}/">Home</a> | --%>
	<a href="${path}/shop/product/list.do">상품목록</a> |
	<a href="${path}/notice/list.do">공지사항</a>
<c:if test="${sessionScope.userid != null}">
	| <a href="${path}/shop/order/list.do" >주문내역</a> |
	<a href="${path}/shop/cart/list.do">장바구니</a> |
	<a href="${path}/shop/wish/list.do">관심상품</a>
	</c:if>
	</div>
</div>

	<%-- <a href="${path}/" class="btn btn-outline-dark flex-shrink-0">Home</a> |
	<a href="${path}/shop/product/list.do" class="btn btn-outline-dark flex-shrink-0">상품목록</a> |
	<a href="${path}/notice/list.do" class="btn btn-outline-dark flex-shrink-0">공지사항</a>
	
	<c:if test="${sessionScope.userid != null}">
	| <a href="${path}/shop/order/list.do" class="btn btn-outline-dark flex-shrink-0">주문내역</a> |
	 <a href="${path}/shop/cart/list.do" class="btn btn-outline-dark flex-shrink-0">장바구니</a> |
	 <a href="${path}/shop/wish/list.do" class="btn btn-outline-dark flex-shrink-0">관심상품</a> 
	</c:if> --%>
	
	<div style="text-align: right;">
	 <c:choose>
	   <c:when test="${sessionScope.userid == null }">
	     <!-- 로그인하지 않은  상태 -->
	     <a style="color: black;" href="${path}/member/write.do">회원가입</a> |
	     <a style="color: black;" href="${path}/member/login.do">로그인</a>&nbsp
	   </c:when>
	   <c:otherwise>
	     <!-- 로그인한 상태 -->
	     ${sessionScope.name}님이 로그인 중입니다.
	     <a style="color: black;" href="${path}/member/myPage.do?userid=${sessionScope.userid}">마이페이지</a> |
	     <a style="color: black;" href="${path}/member/logout.do">로그아웃</a>&nbsp
	   </c:otherwise>
	 </c:choose>
  </div>
</div>
<hr>
