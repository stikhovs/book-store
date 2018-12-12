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

		<div class="container">
			<h3 style="margin: 40px 0 20px;">Оформление заказа <br>
			<small class="text-muted">Все поля являются обязательными</small>
			</h3>
			
		
		<p style="font-size: 20px; margin-bottom: 20px;">Заказ на сумму: ${totalSum} руб.</p>


		<spring:url value="/order" var="finalUrl"/>
		<form:form action="${finalUrl}" method="POST" modelAttribute="orderDetails">
			<div class="form-group row">
				<label for="userName" class="col-sm-1 col-form-label">Имя</label>
				<div class="col-sm-4">
				<form:input path="userName" id="userName" cssClass="form-control"
								htmlEscape="true" placeholder="Ваше имя" value="${user.firstName}" />
								<small class="form-text text-muted">Пожалуйста, введите ваше имя</small>
				<form:errors cssClass="form-errors" path="userName"/>
				</div>
			</div>
			<div class="form-group row">
				<label for="userPhone" class="col-sm-1 col-form-label">Телефон</label>
				<div class="col-sm-4">
				<form:input path="userPhone" id="userPhone" cssClass="form-control"
								htmlEscape="true" placeholder="Ваш телефон" value="${user.phone}" />
								<small class="form-text text-muted">Пожалуйста, введите ваш номер телефона в формате +7-000-111-22-33</small>
				<form:errors cssClass="form-errors" path="userPhone"/>
				</div>
			</div>
			<div class="form-group row">
				<label for="userEmail" class="col-sm-1 col-form-label">E-mail</label>
				<div class="col-sm-4">
				<form:input path="userEmail" id="userEmail" cssClass="form-control"
								htmlEscape="true" placeholder="Email" value="${user.email}" />
								<small class="form-text text-muted">Пожалуйста, введите ваш адрес электронной почты</small>
				<form:errors cssClass="form-errors" path="userEmail"/>
				</div>
			</div>
			<div class="form-group row">
				<label for="userAddress" class="col-sm-1 col-form-label">Адрес</label>
				<div class="col-sm-4">
				<form:input path="address" id="userAddress" cssClass="form-control"
								htmlEscape="true" placeholder="Адрес доставки" />
								<small class="form-text text-muted">Пожалуйста, введите адрес доставки</small>
				<form:errors cssClass="form-errors" path="address"/>
				</div>
			</div>
			<div class="d-flex justify-content-end" style="margin: 20px 0 40px;">
				<a style="margin-right: 30px;" href='<spring:url value="/cart"/>' class="btn btn-outline-secondary">Вернуться к корзине</a> 
				<button type="submit" class="btn btn-success">Подтвердить</button>
			</div>
			
		</form:form>


		<p><strong>Книги к покупке:</strong></p>
		

		
			<c:forEach items="${booksInCartList }" var="book">
				<div class="book-item d-flex" style="margin-bottom: 15px;">
								<div class="book-cover" style="width: 150px;">
									<a target="_blank" href='<spring:url value="/catalog/${book.bookId}"/>'>
										<img class="img-fluid" src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${book.coverPath}">
									</a>
								</div>
								<div class="book-info-block d-flex flex-column justify-content-between" style="margin-left: 30px;">
									<div class="book-info-details">
										<p class="book-info title"><strong><a style="color: #000; margin-bottom: 5px;" target="_blank" href='<spring:url value="/catalog/${book.bookId}"/>'>${book.title }</a></strong></p>
										<p class="book-info author"><a style="color: #000; margin-bottom: 5px;"  href='<spring:url value="/search?search=${book.author}"/>'>${book.author}</a></p>										
									</div>
								</div>
							</div>
			</c:forEach>
		
		</div>

		
		
		
		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>