<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>우술초</title>
<link rel="stylesheet" href="/wsch/resources/css/home.css"/>
<script>
	window.addEventListener("wheel", function(e) {
		e.preventDefault();
	}, {
		passive : false
	});

	var $html = $("html");

	var page = 1;

	var lastPage = $(".content").length;

	$html.animate({
		scrollTop : 0
	}, 10);

	$(window).on("wheel", function(e) {

		if ($html.is(":animated"))
			return;

		if (e.originalEvent.deltaY > 0) {
			if (page == lastPage)
				return;

			page++;
		} else if (e.originalEvent.deltaY < 0) {
			if (page == 1)
				return;

			page--;
		}
		var posTop = (page - 1) * $(window).height();

		$html.animate({
			scrollTop : posTop
		});

	});

	let topText = document.querySelector("#topText");

	document.addEventListener("DOMContentLoaded", function() {
		let topText = document.querySelector("#topText");

		window.addEventListener("scroll", function() {
			let value = window.scrollY;
			console.log("scrollY", value);

			if (value > 200) {
				topText.style.animation = "disappear 2s ease-out forwards";
			} else {
				topText.style.animation = "slide 2s ease-out";
			}
		});
	});
</script>
</head>
<body>
	<div class="content1">
		
		<h1 class="topText">
			시간이 흐를수록 빛나는 모던함. 한국전통주의 철학입니다.<br> 조상의 정성으로 빚은 우리의 술<br>
			역사와 전통이 살아 숨쉬는, 꼭 한번 맛보고 싶은<br> 우리 술을 귀하게 담았습니다.<br> 전통이
			담기고, 역사가 흐르고, 이야기가 있는<br> 우리 술 한잔, 알면 마시고, 마시면 사랑하게 되느니,<br>
			그것이 바로 우리 술입니다.<br />
		</h1>
	</div>

	<div class="content2">

		<div class="circle">
			<img
				src="http://koreansool.com/bizdemo51809/component/board/board_16/u_image/11/2029680230_EBAFBCEC868DECA3BCEC9588EB8F99EC868CECA3BC-EC9588EB8F99EC868CECA3BC600.jpg"
				alt="원형 이미지 1">
		</div>

		<div class="circle">
			<img
				src="http://koreansool.com/bizdemo51809/component/board/board_21/u_image/11/1054645617_ECA084ECA3BCEC9DB4EAB095ECA3BC.jpg"
				alt="원형 이미지 2">
		</div>

		<div class="circle">
			<img
				src="http://koreansool.com/bizdemo51809/component/board/board_22/u_image/11/493418232_ED959CEC82B0EC868CEAB3A1ECA3BC-1.8.jpg"
				alt="원형 이미지 3">
		</div>

		<div class="circle">
			<img
				src="http://koreansool.com/bizdemo51809/component/board/board_23/u_image/10/624179740_EC8B9CED8AB8EB9FACEC8AA4-ED98BCEB9494ECA3BC.jpg"
				alt="원형 이미지 4">
		</div>

		<div class="circle">
			<img
				src="http://koreansool.com/bizdemo51809/component/board/board_24/u_image/5/113035907_EC82ACEAB3A1EC9691ECA1B0EC9B90-EBB0A4EABD83ED96A5EAB8B0.jpg"
				alt="원형 이미지 5">
		</div>
	</div>

	<div class="content3">
		
	</div>
</body>
</html>