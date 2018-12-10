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
<title>Регистрация - Sergio Books</title>

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
			<h3>Регистрация</h3>

			<spring:url value="/registration" var="registerUrl" />
			<form:form action="${registerUrl}" method="POST"
				modelAttribute="newUser" enctype="multipart/form-data">
				<div class="form-group row">
					<label for="firstName" class="col-sm-2 col-form-label">Имя</label>
					<div class="col-sm-4">
						<form:input path="firstName" id="firstName"
							cssClass="form-control" htmlEscape="true" placeholder="Ваше имя" />
						<form:errors path="firstName" />
					</div>
				</div>
				<div class="form-group row">
					<label for="lastName" class="col-sm-2 col-form-label">Фамилия</label>
					<div class="col-sm-4">
						<form:input path="lastName" id="lastName" cssClass="form-control"
							htmlEscape="true" placeholder="Ваша фамилия" />
						<form:errors path="lastName" />
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">Телефон</label>
					<div class="col-sm-4">
						<form:input path="phone" id="phone" cssClass="form-control"
							htmlEscape="true" placeholder="Ваш телефон" />
						<form:errors path="phone" />
					</div>
				</div>
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">E-mail</label>
					<div class="col-sm-4">
						<form:input path="email" id="email" cssClass="form-control"
							htmlEscape="true" placeholder="Email" />
						<form:errors path="email" />
					</div>
				</div>

				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">Пароль</label>
					<div class="col-sm-4">
						<form:password path="password" id="password"
							cssClass="form-control" htmlEscape="true" />
						<form:errors path="password" />
					</div>
				</div>
				<div class="form-group row">
					<label for="passwordConfirm" class="col-sm-2 col-form-label">Пароль
						(еще раз)</label>
					<div class="col-sm-4">
						<form:password path="passwordConfirm" id="passwordConfirm"
							cssClass="form-control" htmlEscape="true" />
						<form:errors path="passwordConfirm" />
					</div>
				</div>
				<form:input path="file" type="file" />
				<form:errors path="file" />
				<button type="submit" class="btn btn-success">Зарегистрироваться</button>
			</form:form>

			<a href='<spring:url value="/"/>' class="btn btn-outline-secondary">Назад</a>
		</div>



		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>