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
<title>Добавление слайдов - Sergio Books</title>

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
			<h3 style="margin: 40px 0;">Добавление слайда на главную страницу<br>
				<small class="text-muted">Книга: ${book.title}</small>
			</h3>

			<spring:url value="/admin//book-list/edit/${book.bookId}/add-slide" var="addSlideUrl" />
			<form:form action="${addSlideUrl}" method="POST"
				modelAttribute="slider" enctype="multipart/form-data">
				<div class="form-group row">
					<label for="titleColor" class="col-sm-4 col-form-label">Цвет заголовка</label>
					<div class="col-sm-6">
						<form:input path="titleColor" id="titleColor"
							cssClass="form-control" htmlEscape="true" placeholder="#000" value="#000" />
						<form:errors cssClass="form-errors" path="titleColor" />
					</div>
				</div>
				<div class="form-group row">
					<label for="authorColor" class="col-sm-4 col-form-label">Цвет автора</label>
					<div class="col-sm-6">
						<form:input path="authorColor" id="authorColor"
							cssClass="form-control" htmlEscape="true" placeholder="#000" value="#000" />
						<form:errors cssClass="form-errors" path="authorColor" />
					</div>
				</div>
				
				<p style="margin-top: 20px; margin-bottom: 5px;">Фоновое изображение</p>
				
				<form:input path="bookBackground" type="file" accept=".jpg, .jpeg, .png" />
				<small class="form-text text-muted">Изображение не должно превышать 1 мегабайт</small>
				<form:errors cssClass="form-errors" path="bookBackground" />
				<div class="register-button text-right" style="margin-top: 20px; margin-bottom: 20px;">
					<button type="submit" class="btn btn-success">Добавить слайд</button>
				</div>
			</form:form>

		</div>



		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>