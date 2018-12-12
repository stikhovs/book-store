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

<style>

.cart-title {
	margin: 40px 0;
}

	.book-item {
		margin-bottom: 30px;
	}
	
	.book-item .book-cover {
	width: 200px;
	}
	
	.book-item .book-info-block {
		margin-left: 30px;
		position: relative;
	}
	
	.book-item .book-info p,
	.book-item .book-info a {
		color: #000;
	}
	.book-item .book-info.title {
		font-size: 20px;
		margin-bottom: 5px;
	}
	.book-item .book-info.author {
		font-size: 18px;
		margin-bottom: 5px;
	}
	.book-item .book-info.price {
		font-size: 20px;
		margin: 20px 0;
	}
	.book-item .book-info-block .delete-item {
		align-self: flex-start;
	} 
	
	.total-sum {
		margin-top: 150px;
	}
	
	.total-sum p {
		text-align: right;
		font-size: 24px;
		margin-bottom: 20px;
	}
	.cart-buttons {
		margin-bottom: 100px;
	}
	.cart-buttons a:first-child {
		margin-right: 30px;
	}
	
</style>


</head>
<body>
	<div class="container-fluid">

		<jsp:include page="../views/fragments/header.jsp"></jsp:include>
		<jsp:include page="../views/fragments/main-categories.jsp"></jsp:include>


		<div class="container">
			<c:choose>
				<c:when test="${totalItemsInCart > 0}">
					<h3 class="cart-title">В корзине:</h3>
						<c:forEach items="${booksInCartList }" var="book">
						
							<div class="book-item row">
								<div class="book-cover">
									<a target="_blank" href='<spring:url value="/catalog/${book.bookId}"/>'>
										<img class="img-fluid" src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${book.coverPath}">
									</a>
								</div>
								<div class="book-info-block d-flex flex-column justify-content-between">
									<div class="book-info-details">
										<p class="book-info title"><strong><a target="_blank" href='<spring:url value="/catalog/${book.bookId}"/>'>${book.title }</a></strong></p>
										<p class="book-info author"><a href='<spring:url value="/search?search=${book.author}"/>'>${book.author}</a></p>
										<p class="book-info price">${book.price} руб.</p>
										
									</div>
									<a href='<spring:url value="/cart?deleteitem=${book.bookId }"/>' class="delete-item btn btn-outline-secondary btn-sm">
										Удалить из корзины
									</a>
								</div>
							</div>
						</c:forEach>
						
						<div class="total-sum">
							<p>Общая сумма: ${totalSum} руб.</p>
						</div>
					
					<div class="row justify-content-end cart-buttons">
						<a href="#" data-toggle="modal" data-target="#refreshCartModal"
							class="btn btn-danger">Очистить корзину</a>

						<c:choose>
							<c:when test="${currentUser.anonymUser == true}">
								<a href="#" data-toggle="modal" data-target="#signInModal"
									class="btn btn-success">Оформить заказ</a>
							</c:when>
							<c:otherwise>
								<a href='<spring:url value="/order"/>' class="btn btn-success">Оформить
									заказ</a>
							</c:otherwise>
						</c:choose>
					</div>

				</c:when>
				<c:otherwise>
					<div class="empty-cart-image"
						style="margin: 70px 0; text-align: center;">
						<img class="img-fluid"
							src='<spring:url value="/resources/images/empty-cart.jpg"/>'>
					</div>
					<div
						class="empty-cart-text d-flex flex-column align-items-center justify-content-center">
						<h3>В вашей корзине еще нет товаров...</h3>
						<p style="color: #555555; padding: 20px 50px;">
							Главная цель вашей корзины - хранить интересные книги, которые вы можете
							приобрести в Sergio Books. Порадуйте корзину своим выбором, ищите
							кнопки "В корзину" на сайте!
							</p>
						<a href='<spring:url value="/catalog?genre=all"/>' class="btn btn-success" style="font-size: 22px; margin: 20px 0 50px; padding: 10px 40px;">
							Перейти в каталог
						</a>
					</div>
				</c:otherwise>
			</c:choose>


		</div>





		<!-- Modal -->
		<div class="modal fade" id="refreshCartModal" tabindex="-1"
			role="dialog" aria-labelledby="refreshCartModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="refreshCartModalTitle">Очистить
							корзину</h5>
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
						<a href='<spring:url value="/cart?deleteall=true"/>'
							class="btn btn-danger">Очистить</a>
					</div>
				</div>
			</div>
		</div>
	<c:if test="${totalItemsInCart > 0}">
		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
	</c:if>	

	</div>
</body>
</html>