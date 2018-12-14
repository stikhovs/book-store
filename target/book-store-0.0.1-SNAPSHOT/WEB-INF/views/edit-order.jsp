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
<title>Редактор заказов - Sergio Books</title>

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
					<li class="nav-item"><a class="nav-link active"
						href='<spring:url value="/admin/order-list"/>'>Список заказов</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/admin/preorder-list"/>'>Список
							предзаказов</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/admin/review-list"/>'>Список отзывов</a></li>
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/admin/user-list"/>'>Список
							пользователей</a></li>
				</nav>

			</div>
			<div class="col-10" style="padding-top: 40px;">

				<h3 style="margin: 40px 0;">Редактирование заказа</h3>


				<div class="d-flex" style="margin-bottom: 30px;">

					<div class="order-info-block">
						<h3 style="margin-bottom: 20px;">Детали заказа:</h3>
						<div class="order-item" style="margin-bottom: 15px;">
							<c:forEach items="${orderBooks}" var="book">
								<div class="book-item d-flex" style="margin-bottom: 15px;">
									<div class="book-cover" style="width: 150px;">
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
											<p class="book-info title" style="max-width: 400px;">
												<strong><a style="color: #000; margin-bottom: 5px;"
													target="_blank"
													href='<spring:url value="/catalog/${book.bookId}"/>'>${book.title }</a></strong>
											</p>
											<p class="book-info author">
												<a style="color: #000; margin-bottom: 5px;"
													href='<spring:url value="/search?search=${book.author}"/>'>${book.author}</a>
											</p>
											<p class="book-info price">
												Цена:
												<fmt:formatNumber type="number" maxFractionDigits="2"
													value="${book.price}" />
												руб.
											</p>
										</div>
									</div>
								</div>
							</c:forEach>

							<p style="text-align: right; font-size: 20px;">
								<strong>Общая сумма заказа:</strong>
								<fmt:formatNumber type="number" maxFractionDigits="2"
									value="${totalOrderPrice }" />
								руб.
							</p>



						</div>
					</div>
					<div class="user-info-block" style="margin-left: 100px;">
						<h3 style="margin-bottom: 20px;">Информация о заказчике:</h3>
						<div style="font-size: 20px;">
							<p><strong>Имя:</strong> ${order.userName }</p>
							<p><strong>Телефон:</strong> ${order.userPhone }</p>
							<p><strong>Email:</strong> ${order.userEmail }</p>
							<p><strong>Адрес доставки:</strong> ${order.address }</p>
						</div>

						<div style="margin-top: 60px; font-size: 20px;">
							<form:form action="" method="POST" modelAttribute="order">
								<p>Изменить статус заказа:</p>
								<div>
									<form:radiobutton id="positive" path="finished" value="true" />
									<label for="positive">Доставлен</label>
								</div>
								<div>
									<form:radiobutton id="negative" path="finished" value="false" />
									<label for="negative">Обрабатывается</label>
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