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

		<h3>Оставить отзыв о книге:</h3>
		<p>${book.title }</p>
		<form:form action="" method="POST" modelAttribute="review">
			<div class="form-group">
				<label for="positive">Вам понравилась книга?</label>
				<form:select id="positive" path="positive" cssClass="form-control">
					<form:option value="false">Не понравилась</form:option>
					<form:option selected="selected" value="true">Понравилась</form:option>
				</form:select>
			</div>
			<div class="form-group">
				<label for="reviewText">Напишите о ней отзыв:</label>
				<form:textarea htmlEscape="true" id="reviewText" rows="5" cssClass="form-control" path="reviewText" />
				<form:errors path="reviewText"/>
			</div>
			
			<button type="submit" class="btn btn-success">Оставить отзыв</button>
		</form:form>



		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>