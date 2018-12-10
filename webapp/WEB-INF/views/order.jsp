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



		<h3>Оформление заказа</h3>

		<ol>
			<c:forEach items="${booksInCartList }" var="book">
				<li>${book.title }-${book.author}, ${book.price} руб.</li>
			</c:forEach>
		</ol>
		<p>Общая сумма: ${totalSum} руб.</p>


		<spring:url value="/order" var="finalUrl"/>
		<form:form action="${finalUrl}" method="POST" modelAttribute="orderDetails">
			<div class="form-group row">
				<label for="userName" class="col-sm-1 col-form-label">Имя</label>
				<div class="col-sm-4">
				<form:input path="userName" id="userName" cssClass="form-control"
								htmlEscape="true" placeholder="Ваше имя" value="${user.firstName}" />
				<form:errors path="userName"/>
				</div>
			</div>
			<div class="form-group row">
				<label for="userPhone" class="col-sm-1 col-form-label">Телефон</label>
				<div class="col-sm-4">
				<form:input path="userPhone" id="userPhone" cssClass="form-control"
								htmlEscape="true" placeholder="Ваш телефон" value="${user.phone}" />
				<form:errors path="userPhone"/>
				</div>
			</div>
			<div class="form-group row">
				<label for="userEmail" class="col-sm-1 col-form-label">E-mail</label>
				<div class="col-sm-4">
				<form:input path="userEmail" id="userEmail" cssClass="form-control"
								htmlEscape="true" placeholder="Email" value="${user.email}" />
				<form:errors path="userEmail"/>
				</div>
			</div>
			<div class="form-group row">
				<label for="userAddress" class="col-sm-1 col-form-label">Адрес</label>
				<div class="col-sm-4">
				<form:input path="address" id="userAddress" cssClass="form-control"
								htmlEscape="true" placeholder="Адрес доставки" />
				<form:errors path="address"/>
				</div>
			</div>
			<button type="submit" class="btn btn-success">Подтвердить</button>
		</form:form>

		<a href='<spring:url value="/cart"/>' class="btn btn-outline-secondary">Назад</a> 
		
		
		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>