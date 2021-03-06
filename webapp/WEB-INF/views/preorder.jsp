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
<title>Предзаказ - Sergio Books</title>

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
footer {
	position: absolute;
	width: 100%;
	bottom: 0;
}
</style>


</head>
<body>
	<div class="container-fluid">

		<jsp:include page="../views/fragments/header.jsp"></jsp:include>
		<jsp:include page="../views/fragments/main-categories.jsp"></jsp:include>

		<div class="container">
			<h3 style="margin: 40px 0;">Предварительный заказ:</h3>

			<div class="d-flex">

				<div class="book-info-block">
					<div class="book-item d-flex" style="margin-bottom: 15px;">
						<div class="book-cover" style="width: 250px;">
							<a target="_blank"
								href='<spring:url value="/catalog/${book.bookId}"/>'> <img
								class="img-fluid"
								src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${book.coverPath}">
							</a>
						</div>
						<div
							class="book-info-block d-flex flex-column justify-content-between"
							style="margin-left: 30px;">
							<div class="book-info-details">
								<p class="book-info title">
									<strong><a
										style="color: #000; margin-bottom: 5px; font-size: 20px;"
										target="_blank"
										href='<spring:url value="/catalog/${book.bookId}"/>'>${book.title }</a></strong>
								</p>
								<p class="book-info author">
									<a style="color: #000; margin-bottom: 5px; font-size: 20px;"
										href='<spring:url value="/search?search=${book.author}"/>'>${book.author}</a>
								</p>
								<p class="book-info price"
									style="color: #000; margin-bottom: 5px; font-size: 22px;">
									${book.price} руб.</p>
							</div>
						</div>
					</div>

				</div>

				<div class="form-block" style="margin-left: 40px; width: 100%;">
					<form:form action="" method="POST" modelAttribute="preorder">
					
					<p>Ваше имя: ${user.firstName}</p>
					<p>Ваш телефон: ${user.phone}</p>
					<p>Ваш email: ${user.email}</p>
					
						<div class="form-group">
							<label for="comment">Ваш комментарий (необязательно):</label>
							<form:textarea htmlEscape="true" id="comment" rows="7"
								cssClass="form-control" path="comment" style="resize: none;" />
							<small class="form-text text-muted">Текст комментария
								не должен превышать 500 символов</small>
							<form:errors cssClass="form-errors" path="comment" />
						</div>

						<button type="submit" class="btn btn-success">Заказать</button>
					</form:form>
				</div>

			</div>


		</div>





		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>