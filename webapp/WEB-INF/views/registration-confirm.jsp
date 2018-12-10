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



		<h3>Подтверждение регистрации</h3>


		<p>${newUser.firstName}</p>
		<p>${newUser.lastName}</p>
		<p>${newUser.phone}</p>
		<p>${newUser.email}</p>

<div style="width: 100px;">
<img alt="" class="img-fluid" src='<spring:url value="/resources/images/userAvatars/${avatar }"/>'>
</div>
		<spring:url value="/registration-success" var="successUrl"/>
		<form:form action="${successUrl}" method="POST" modelAttribute="newUser" enctype="multipart/form-data">
			<button type="submit" class="btn btn-success">Подтвердить</button>
		</form:form>


		<a href='<spring:url value="/"/>' class="btn btn-outline-secondary">Назад</a> 
		
		
		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>