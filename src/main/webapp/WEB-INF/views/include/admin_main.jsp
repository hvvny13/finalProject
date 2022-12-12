<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.swiper {
	  width: 90%;
	  height: 70%;
	}
	img {
		width: 100%;
		height: 100%;	
	}
</style>
<%@ include file="../include/header.jsp" %>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>	
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<!-- Slider main container -->
<div class="swiper">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="swiper-slide">
    <div><img src="${path}/images/slider.jpg"></div>
    </div>
    <div class="swiper-slide">
    <div><img src="${path}/images/fashion2.jpg"></div>
	</div>
    <div class="swiper-slide">
    <div><img src="${path}/images/jeans.jpg"></div>
	</div>
    ...
  </div>
  <!-- If we need pagination -->
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>

  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>

<script type="text/javascript">
const swiper = new Swiper('.swiper', {
	  // If we need pagination
	  pagination: {
	    el: '.swiper-pagination',
	  },

	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },
	});
</script>
</body>
</html>