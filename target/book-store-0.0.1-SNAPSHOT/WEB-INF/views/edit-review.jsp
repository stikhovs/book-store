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
<title>Редактор отзывов - Sergio Books</title>

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
<link rel="stylesheet"
	href='<spring:url value="/resources/css/admin.css"/>'>
<style>
.form-block label {
	font-weight: bold;
}
</style>

</head>
<body>
	<jsp:include page="../views/fragments/admin-header.jsp"></jsp:include>
	<div class="container-fluid">

		<div class="row">

			<div id="admin-menu" class="col-2">

				<nav class="nav flex-column bg-dark" style="">
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/admin/book-list"/>'>Список книг</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/admin/order-list"/>'>Список заказов</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/admin/preorder-list"/>'>Список
							предзаказов</a></li>
					<li class="nav-item"><a class="nav-link active"
						href='<spring:url value="/admin/review-list"/>'>Список отзывов</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/admin/user-list"/>'>Список
							пользователей</a></li>
				</nav>

			</div>
			<div class="col-10" style="padding-top: 40px;">

				<h3 style="margin: 40px 0;">Редактирование отзыва</h3>


				<div class="d-flex" style="margin-bottom: 30px;">

					<div class="order-info-block" style="min-width: 600px;">
						<h3 style="margin-bottom: 20px;">Книга:</h3>
						<div class="order-item" style="margin-bottom: 15px;">
						
							<div class="book-item d-flex" style="margin-bottom: 15px;">
									<div class="book-cover" style="width: 150px;">
										<a target="_blank"
											href='<spring:url value="/catalog/${reviewBook.bookId}"/>'> <img
											class="img-fluid"
											src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${reviewBook.coverPath}">
										</a>
									</div>
									<div
										class="book-info-block d-flex flex-column justify-content-between"
										style="margin-left: 30px;">
										<div class="book-info-details">
											<p class="book-info title" style="max-width: 400px;">
												<strong><a style="color: #000; margin-bottom: 5px;"
													target="_blank"
													href='<spring:url value="/catalog/${reviewBook.bookId}"/>'>${reviewBook.title }</a></strong>
											</p>
											<p class="book-info author">
												<a style="color: #000; margin-bottom: 5px;"
													href='<spring:url value="/search?search=${reviewBook.author}"/>'>${reviewBook.author}</a>
											</p>
											<p class="book-info price">
												Цена:
												<fmt:formatNumber type="number" maxFractionDigits="2"
													value="${reviewBook.price}" />
												руб.
											</p>
										</div>
									</div>
								</div>



						</div>
					</div>
					<div class="user-info-block" style="margin-left: 40px; padding-right: 40px;">
						<h3 style="margin-bottom: 20px;">Отзыв:</h3>
						<div style="font-size: 20px;">
							<p><strong>Пользователь:</strong> ${review.user.lastName } ${review.user.firstName }</p>
							<p><strong>Телефон:</strong> ${review.user.phone }</p>
							<p><strong>Email:</strong> ${review.user.email }</p>
							<p><strong>Тип отзыва: </strong> 
								<c:choose>
									<c:when test="${review.positive == true }">Положительный</c:when>
									<c:otherwise>Отрицательный</c:otherwise>
								</c:choose>
							</p>
							<p><strong>Дата отзыва:</strong> ${review.reviewDate }</p>
							<p><strong>Отзыв:</strong> ${review.reviewText }</p>
						</div>

						<div style="margin-top: 60px; font-size: 20px;">
						
						<div style="margin-top: 60px; font-size: 20px;">
							<form:form action="" method="POST" modelAttribute="review">
								<p>Изменить статус отзыва:</p>
								<div>
									<form:radiobutton id="p" path="permitted" value="true" />
									<label for="p">Одобрено</label>
								</div>
								<div>
									<form:radiobutton id="n" path="permitted" value="false" />
									<label for="n">Не одобрено</label>
								</div>
								<div style="margin-top: 20px; text-align: right;">
									<button type="submit" class="btn btn-success">Сохранить
										изменения</button>
								</div>
							</form:form>
						</div>

					</div>


				</div>
			</div>


		</div>


	</div>
</body>
</html>