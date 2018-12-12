<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ru">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sergio Books</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet"
	href='<spring:url value="/resources/css/style.css"/>'>
<link rel="stylesheet"
	href='<spring:url value="/resources/css/book.css"/>'>

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700"
	rel="stylesheet">
<link rel="shortcut icon"
	href='<spring:url value="/resources/images/favicon.ico"/>'
	type="image/x-icon">

<style>
	@keyframes ridingCart {
		from {left: 0; right: 100%;}
		to { left: 100%; right: 0;}
	}
	
	#riding-cart {
		position: absolute;
		left: 0;
		animation-name: ridingCart;
  		animation-duration: 5s;
	}
	
</style>

</head>
<body>
	<div class="container-fluid">
		<div style="margin-top: 5%; text-align: center;">
			<p style="font-size: 24px; margin-bottom: 5px;">Ваши книги уже в пути!</p>
			<p style="font-size: 24px;">Через несколько секунд вы будете перенаправлены на главную страницу...</p>
			<div class="cart-final" style="width: 300px;position: relative; width: 100%;  overflow: hidden;  height: 400px;">
			<%-- <img id="riding-cart" class="img-fluid" src='<spring:url value="/resources/images/riding-cart.jpg"/>'> --%>
    	<img id="riding-cart" class="img-fluid" src="https://media.istockphoto.com/photos/shopping-cart-with-books-3d-rendering-isolated-on-white-background-picture-id689416848?k=6&amp;m=689416848&amp;s=612x612&amp;w=0&amp;h=9bpfV4dtn-nP5u64puC-5_L8o7TkOtyTpaveQYQ1igU=">
    </div>	
		</div>
		
		
	</div>
	<spring:url value="/" var="home"/>
	<script>setTimeout(function(){window.location.href='${home}'},3000);</script>
</body>
</html>