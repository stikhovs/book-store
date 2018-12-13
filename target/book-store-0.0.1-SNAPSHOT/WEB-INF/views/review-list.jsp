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
<title>Список отзывов - Sergio Books</title>

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

<link rel="stylesheet"
	href='<spring:url value="/resources/css/admin.css"/>'>

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700"
	rel="stylesheet">
<link rel="shortcut icon"
	href='<spring:url value="/resources/images/favicon.ico"/>'
	type="image/x-icon">

<style>
tbody tr {
	cursor: pointer;
}
</style>

</head>
<body>
	<jsp:include page="../views/fragments/admin-header.jsp"></jsp:include>


	<div class="container-fluid">


		<div class="row">

			<div id="admin-menu" class="col-2">

				<nav class="nav flex-column bg-dark"
					style="">
					<li class="nav-item"><a class="nav-link" href='<spring:url value="/admin/book-list"/>'>Список
							книг</a></li>
					<li class="nav-item"><a class="nav-link" href='<spring:url value="/admin/order-list"/>'>Список
							заказов</a></li>
					<li class="nav-item"><a class="nav-link" href='<spring:url value="/admin/preorder-list"/>'>Список
							предзаказов</a></li>
					<li class="nav-item"><a class="nav-link active" href='<spring:url value="/admin/review-list"/>'>Список
							отзывов</a></li>
					<li class="nav-item"><a class="nav-link" href='<spring:url value="/admin/user-list"/>'>Список
							пользователей</a></li>
				</nav>

			</div>
			<div class="col-10" style="padding-top: 40px;">

				<h3 style="margin: 40px 0;">Список отзывов</h3>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead
							style="background: #424242; color: white; font-weight: bold; text-align: center;">
							<tr>
								<td>Id отзыва</td>								
								<td>Текст отзыва</td>								
								<td>Id книги</td>								
								<td>Положительность</td>								
								<td>Одобрен</td>								
								<td>Имя пользователя</td>								
								<td>Телефон пользователя</td>								
								<td>Email</td>								
								<td>Дата отзыва</td>								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reviewlist}" var="review">
								<tr
									data-href='<spring:url value="/admin/review-list/edit/${review.reviewId}"/>' style="text-align: center;">
									<td>${review.reviewId}</td>							
									<td class="review-text">${review.reviewText}</td>							
									<td>${review.bookId}</td>							
									<td>${review.positive}</td>							
									<td>${review.permitted}</td>							
									<td>${review.user.lastName} ${review.user.firstName}</td>							
									<td>${review.user.phone}</td>							
									<td>${review.user.email}</td>							
									<td>${review.reviewDate}</td>							
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>


	</div>

	<script>
		$('tbody tr[data-href]').on("click", function() {
			window.open($(this).data('href'), '_blank');
		});
		$(document).ready(function() {
			var descr = $("td.review-text");
			descr.each(function(id) {
				if ($(this).text().length > 30) {
					$(this).text($(this).text().substring(0, 27) + '...');
				}
			});

		});
	</script>

</body>
</html>