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
		
		
		<h3 style="margin: 40px 0;">Личный кабинет</h3>

		<div class="row" style="margin-bottom: 30px;">

<div style="width: 150px;">
<img alt="" class="img-fluid" src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/userAvatars/${user.avatarPath}">
</div>
<div class="user-info-block" style="margin-left: 30px;">
		<p class="user-info name" style="font-size: 24px;">${user.firstName} ${user.lastName}</p>
		<p class="user-info phone" style="font-size: 20px;">${user.phone}</p>
		<p class="user-info email" style="font-size: 20px;">${user.email}</p>
</div>
		</div>
		
		<div class="orders">
		<c:choose>
			<c:when test="${fn:length(orderAndBooksMap) > 0 }">
			<h4>Ваши заказы:</h4>
			<c:forEach items="${orderAndBooksMap }" var="order">
			
				<p style="font-size: 20px; margin-top: 20px; border-bottom: 1px solid #555;">Заказ от ${order.key.date }</p>
				
					<c:forEach items="${order.value }" var="book">
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
				
				<p style="font-size: 20px; margin-top: 20px; text-align: right;">Статус: 
					<c:choose>
						<c:when test="${order.key.finished}"><span>Заказ доставлен</span></c:when>
						<c:otherwise><span>Заказ обрабатывается</span></c:otherwise>
					</c:choose>
				</p>
			
			</c:forEach>
			</c:when>
			<c:otherwise>
				<p style="font-size: 20px;margin-top: 70px;text-align: center;margin-bottom: 5px;">Вы пока не оформили ни одного заказа...</p>
				<p style="font-size: 20px; text-align: center">Давайте это исправим!</p>
				<div class="shopping-image" style="text-align: center; margin-bottom: 20px;">
					<img class="img-fluid rounded" src='<spring:url value="/resources/images/shoponline.jpg"/>'>
				</div>
				<div style="text-align: center;">
				<a href='<spring:url value="/catalog?genre=all"/>' class="btn btn-success" style="font-size: 22px; margin: 20px 0 50px; padding: 10px 40px;">
							Исправить отсутствие заказов
						</a>
				</div>
				
			</c:otherwise>
		</c:choose>
			
		
		</div>
		
		<div class="text-right" style="margin-bottom: 30px; margin-top: 70px;">
			<a href="#" data-toggle="modal" data-target="#deleteProfileModal" class="btn btn-danger">Удалить профиль</a> 
		</div>
		</div>
		
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