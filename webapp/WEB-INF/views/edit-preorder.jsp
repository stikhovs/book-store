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
<title>Редактор предзаказов - Sergio Books</title>

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
					<li class="nav-item"><a class="nav-link active"
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

				<h3 style="margin: 40px 0;">Редактирование предзаказа</h3>


				<div class="d-flex" style="margin-bottom: 30px;">

					<div class="order-info-block">
						<h3 style="margin-bottom: 20px;">Детали предзаказа:</h3>
						<div class="order-item" style="margin-bottom: 15px;">
						
							<div class="book-item d-flex" style="margin-bottom: 15px;">
									<div class="book-cover" style="width: 150px;">
										<a target="_blank"
											href='<spring:url value="/catalog/${preorderBook.bookId}"/>'> <img
											class="img-fluid"
											src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${preorderBook.coverPath}">
										</a>
									</div>
									<div
										class="book-info-block d-flex flex-column justify-content-between"
										style="margin-left: 30px;">
										<div class="book-info-details">
											<p class="book-info title" style="max-width: 400px;">
												<strong><a style="color: #000; margin-bottom: 5px;"
													target="_blank"
													href='<spring:url value="/catalog/${preorderBook.bookId}"/>'>${preorderBook.title }</a></strong>
											</p>
											<p class="book-info author">
												<a style="color: #000; margin-bottom: 5px;"
													href='<spring:url value="/search?search=${preorderBook.author}"/>'>${preorderBook.author}</a>
											</p>
											<p class="book-info price">
												Цена:
												<fmt:formatNumber type="number" maxFractionDigits="2"
													value="${preorderBook.price}" />
												руб.
											</p>
										</div>
									</div>
								</div>



						</div>
					</div>
					<div class="user-info-block" style="margin-left: 100px;">
						<h3 style="margin-bottom: 20px;">Информация о заказчике:</h3>
						<div style="font-size: 20px;">
							<p><strong>Имя:</strong> ${preorderUser.lastName } ${preorderUser.firstName }</p>
							<p><strong>Телефон:</strong> ${preorderUser.phone }</p>
							<p><strong>Email:</strong> ${preorderUser.email }</p>
							<p><strong>Комментарий:</strong> ${preorder.comment }</p>
						</div>

						<div style="margin-top: 60px; font-size: 20px;">
						
						<div style="margin-top: 20px; text-align: right;">
									<a href="#" class="btn btn-danger" data-toggle="modal" data-target="#deletePreorderModal" >Удалить предзаказ</a>
								</div>
						
						</div>

					</div>


				</div>
			</div>


		</div>
<!-- Modal -->
<div class="modal fade" id="deletePreorderModal" tabindex="-1" role="dialog" aria-labelledby="deletePreorderModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deletePreorderModalTitle">Удалить предзаказ?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Вы действительно хотите удалить предзаказ?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
        <form:form action="" method="POST" modelAttribute="preorder">
				<button type="submit" class="btn btn-danger">Удалить</button>
		</form:form>        
      </div>
    </div>
  </div>
</div>


	</div>
</body>
</html>