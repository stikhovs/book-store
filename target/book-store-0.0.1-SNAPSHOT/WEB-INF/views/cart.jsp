<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href='<spring:url value="/resources/css/breadcrumb.css"/>'>
<link rel="stylesheet"
	href='<spring:url value="/resources/css/book.css"/>'>

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700"
	rel="stylesheet">
<link rel="shortcut icon"
	href='<spring:url value="/resources/images/favicon.ico"/>'
	type="image/x-icon">

</head>
<body>
	<div class="container-fluid">

		<jsp:include page="../views/fragments/header.jsp"></jsp:include>
		<jsp:include page="../views/fragments/main-categories.jsp"></jsp:include>



		<h3>Книги в корзине:</h3>
		<ol>
			<c:forEach items="${booksInCartList }" var="book">
				<li>${book.title }- ${book.author}, ${book.price} руб.
					<a href='<spring:url value="/cart?deleteitem=${book.bookId }"/>' class="btn btn-outline-secondary btn-sm">Удалить из корзины</a>
				</li>
			</c:forEach>
		</ol>
		<p>Общая сумма: ${totalSum} руб.</p>
		
		

		<a href="#" data-toggle="modal" data-target="#refreshCartModal"
			class="btn btn-danger">Очистить корзину</a>
			
		<c:choose>
			<c:when test="${currentUser.anonymUser == true}">
				<a href="#" data-toggle="modal" data-target="#signInModal" class="btn btn-success">Оформить заказ</a>
			</c:when>
			<c:otherwise>
				<a href='<spring:url value="/order"/>' class="btn btn-success">Оформить заказ</a>
			</c:otherwise>
		</c:choose>		
			
			
		<!-- Modal -->
		<div class="modal fade" id="refreshCartModal" tabindex="-1"
			role="dialog" aria-labelledby="refreshCartModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="refreshCartModalTitle">Очистить корзину</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Вы уверены, что хотите очистить корзину?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Закрыть</button>
						<a href='<spring:url value="/cart?deleteall=true"/>' class="btn btn-danger">Очистить</a>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>