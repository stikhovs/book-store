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



		<h3>Личный кабинет</h3>


		<p>${user.firstName}</p>
		<p>${user.lastName}</p>
		<p>${useser.phone}</p>
		<p>${user.email}</p>

<div style="width: 100px;">
<img alt="" class="img-fluid" src="/uploads/userAvatars/${user.avatarPath}">
</div>

		<a href='<spring:url value="/"/>' class="btn btn-outline-secondary">Назад</a> 
		<a href="#" data-toggle="modal" data-target="#deleteProfileModal" class="btn btn-danger">Удалить профиль</a> 
		
		<!-- Modal -->
<div class="modal fade" id="deleteProfileModal" tabindex="-1" role="dialog" aria-labelledby="deleteProfileModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteProfileModalTitle">Удалить профиль?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Вы действительно хотите удалить профиль?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Закрыть</button>
        <a href='<spring:url value="/delete-profile"/>' class="btn btn-danger">Удалить профиль</a>
      </div>
    </div>
  </div>
</div>
		
		
		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>