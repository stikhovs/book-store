<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ru">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Информация о пользователе - Sergio Books</title>

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
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/admin/review-list"/>'>Список отзывов</a></li>
					<li class="nav-item"><a class="nav-link active"
						href='<spring:url value="/admin/user-list"/>'>Список
							пользователей</a></li>
				</nav>

			</div>
			<div class="col-10" style="padding-top: 40px;">

				<h3 style="margin: 40px 0;">Информация о пользователе (id
					${showUser.userId })</h3>


				<div class="d-flex flex-column" style="margin-bottom: 30px;">

					<div class="user-info-block" style="min-width: 600px;">
						<h3 style="margin-bottom: 20px;">Личные данные:</h3>
						<div class="user-item" style="margin-bottom: 15px;">
							<div style="font-size: 20px;">
								<div style="max-width: 200px; margin-bottom: 20px;">
									<img class="img-fluid"
										src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/userAvatars/${showUser.avatarPath}">
								</div>
								<p>
									<strong>Имя:</strong> ${showUser.firstName }
								</p>
								<p>
									<strong>Фамилия:</strong> ${showUser.lastName }
								</p>
								<p>
									<strong>Телефон:</strong> ${showUser.phone }
								</p>
								<p>
									<strong>Email:</strong> ${showUser.email }
								</p>

							</div>
						</div>
					</div>
					<div class="userOrders">
						<h3 style="margin-bottom: 20px; text-align: center;">Заказы</h3>
						<c:choose>
							<c:when test="${fn:length(orderAndBooksMap) > 0 }">
								<c:forEach items="${orderAndBooksMap }" var="order">

									<p
										style="font-size: 20px; margin-top: 20px; border-bottom: 1px solid #555;">Заказ
										от ${order.key.date }</p>

									<c:forEach items="${order.value }" var="book">
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
													<p class="book-info title">
														<strong><a
															style="color: #000; margin-bottom: 5px;" target="_blank"
															href='<spring:url value="/catalog/${book.bookId}"/>'>${book.title }</a></strong>
													</p>
													<p class="book-info author">
														<a style="color: #000; margin-bottom: 5px;"
															href='<spring:url value="/search?search=${book.author}"/>'>${book.author}</a>
													</p>
												</div>
											</div>
										</div>
									</c:forEach>

									<p
										style="font-size: 20px; margin-top: 20px;">
										<strong>Статус:</strong>
										<c:choose>
											<c:when test="${order.key.finished}">
												<span>Заказ доставлен</span>
											</c:when>
											<c:otherwise>
												<span>Заказ обрабатывается</span>
											</c:otherwise>
										</c:choose>
									</p>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="font-size: 20px;">Заказов нет.</p>
							</c:otherwise>
						</c:choose>


					</div>
					<div class="userPreorders">
						<h3 style="margin-bottom: 20px; text-align: center;">Предзаказы</h3>

						<c:choose>
							<c:when test="${fn:length(preorderAndBooksMap) > 0 }">
								<c:forEach items="${preorderAndBooksMap }" var="preorder">

									<div class="book-item d-flex" style="margin-bottom: 15px;">
										<div class="book-cover" style="width: 150px;">
											<a target="_blank"
												href='<spring:url value="/catalog/${preorder.value.bookId}"/>'>
												<img class="img-fluid"
												src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${preorder.value.coverPath}">
											</a>
										</div>
										<div
											class="book-info-block d-flex flex-column justify-content-between"
											style="margin-left: 30px;">
											<div class="book-info-details">
												<p class="book-info title">
													<strong><a
														style="color: #000; margin-bottom: 5px;" target="_blank"
														href='<spring:url value="/catalog/${preorder.value.bookId}"/>'>${preorder.value.title }</a></strong>
												</p>
												<p class="book-info author">
													<a style="color: #000; margin-bottom: 5px;"
														href='<spring:url value="/search?search=${preorder.value.author}"/>'>${preorder.value.author}</a>
												</p>
											</div>
										</div>
									</div>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="font-size: 20px;">Предзаказов нет.</p>
							</c:otherwise>
						</c:choose>

					</div>


					<div class="userReviews">
						<h3 style="margin-bottom: 20px; text-align: center;">Отзывы</h3>
						<c:choose>
							<c:when test="${fn:length(bookAndreviewsMap) > 0 }">
								<c:forEach items="${bookAndreviewsMap }" var="book">

									<p
										style="font-size: 20px; margin-top: 20px; border-bottom: 1px solid #555;">Отзыв
										к книге ${book.key.title }</p>
									<ol>
										<c:forEach items="${book.value }" var="review">
										<li style="font-size: 20px; margin-bottom: 20px;">
											<p>
												<strong>Тип отзыва: </strong>
												<c:choose>
													<c:when test="${review.positive == true }">Положительный</c:when>
													<c:otherwise>Отрицательный</c:otherwise>
												</c:choose>
											</p>
											<p>
												<strong>Одобрен: </strong>
												<c:choose>
													<c:when test="${review.permitted == true }">Да</c:when>
													<c:otherwise>Нет</c:otherwise>
												</c:choose>
											</p>
											<p>
												<strong>Дата отзыва:</strong> ${review.reviewDate }
											</p>
											<p>
												<strong>Отзыв:</strong> ${review.reviewText }
											</p>
										</li>
									</c:forEach>
									</ol>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p style="font-size: 20px;">Отзывов нет.</p>
							</c:otherwise>
						</c:choose>

					</div>


				</div>


			</div>


		</div>
</body>
</html>