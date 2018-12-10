<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
@import url('<spring:url value="/resources/css/header.css"/>');
</style>
<div id="header">

	<div
		class="signIn-register row justify-content-md-end justify-content-between">
		<div class="logo-and-cart-min d-flex justify-content-between">
			<div class="logo">
				<a href='<spring:url value="/"/>'><img class="img-fluid"
					src='<spring:url value="/resources/images/logo-min.png"/>'></a>
			</div>
			<div class="signIn-block d-flex align-items-center">
				<c:choose>
					<c:when test="${user.email != null}">
						<a href='<spring:url value="/personal-page"/>' class="white-color">Добро пожаловать,
							${user.firstName }!</a>
						<a href='<spring:url value="/logout"/>' class="logout">Выйти</a>
					</c:when>
					<c:otherwise>
						<a href="#" class="signIn" data-toggle="modal"
							data-target="#signInModal">Войти</a>
						<a href='<spring:url value="/registration"/>' class="register">Зарегистрироваться</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="cart align-items-center">
			<div class="cart-items d-flex justify-content-center">
				<a href='<spring:url value="/cart"/>'
					class="cart-link d-flex align-items-center"> <img
					class="img-fluid"
					src='<spring:url value="/resources/images/cart.png"/>'> <span
					class="white-color">Корзина <span
						class="badge badge-pill badge-success">${totalItemsInCart }</span></span>
				</a>
			</div>
			<div class="sum">
				<p class="white-color mb-0">
					<span class="sum-numeric">${totalSum }</span> &#8381;
				</p>
			</div>
		</div>

		<div id="dots">
			<a class="show-block" href="#"> <span>&#8942;</span>
			</a>
			<div id="signIn-cart-min">
				<div class="signIn-block-min">
					<c:choose>
						<c:when test="${user != null}">
							<a href='<spring:url value="/personal-page"/>' class="white-color">Добро пожаловать,
								${user.firstName }!</a>
							<a href='<spring:url value="/logout"/>' class="logout">Выйти</a>
						</c:when>
						<c:otherwise>
							<a href="#" class="signIn" data-toggle="modal"
								data-target="#signInModal">Войти</a>
							<a href='<spring:url value="/registration"/>' class="register">Зарегистрироваться</a>
						</c:otherwise>
					</c:choose>

				</div>
				<div class="cart-min">
					<div class="cart-items ">
						<a href='<spring:url value="/cart"/>' class="cart-link">
							<div class=" d-flex align-items-center">
								<img class="img-fluid"
									src='<spring:url value="/resources/images/cart.png"/>'> <span
									class="white-color">Корзина <span
									class="badge badge-pill badge-success">${totalItemsInCart }</span></span>
							</div>
							<p class="sum white-color mb-0">
								<span class="sum-numeric">${totalSum }</span> &#8381;
							</p>
						</a>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div
		class="logo-search row align-items-center justify-content-lg-center justify-content-between">
		<div class="logo">
			<a href='<spring:url value="/"/>'><img class="img-fluid"
				src='<spring:url value="/resources/images/logo.png"/>'></a>
		</div>
		<div class="search">
			<form action='<spring:url value="/search"/>'>
				<div class="input-group d-flex flex-nowrap">
					<div class="search-background">
						<input type="text" name="search" class="form-control"
							placeholder="Поиск..." aria-label="Поиск..."
							aria-describedby="search-button">
					</div>
					<div class="input-group-append">
						<button class="btn btn-success" type="submit" id="search-button">
							<img class="img-fluid"
								src='<spring:url value="/resources/images/search.png"/>'>Поиск
						</button>
					</div>
				</div>
			</form>
		</div>
		<div class="cart">
			<div class="cart-items d-flex justify-content-center">
				<a href='<spring:url value="/cart"/>'
					class="cart-link d-flex align-items-center"> <img
					class="img-fluid"
					src='<spring:url value="/resources/images/cart.png"/>'> <span
					class="grey-color">Корзина <span
						class="badge badge-pill badge-success">${totalItemsInCart }</span></span>
				</a>
			</div>
			<div class="sum">
				<p class="grey-color mb-0">
					<span class="sum-numeric">${totalSum }</span> &#8381;
				</p>
			</div>
		</div>
	</div>
</div>

<c:if test="${currentUser.anonymUser == true}">
	<!-- Modal -->
	<div class="modal fade" id="signInModal" tabindex="-1" role="dialog"
		aria-labelledby="signInModalTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="signInModalTitle">Войдите в ваш
						аккаунт</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<spring:url value="/logInUser" var="myUrl" />
				<form:form action="${myUrl }" method="POST" modelAttribute="user">
					<div class="modal-body">
						<div class="form-body">
							<label for="inputEmail" class="sr-only">Ваш E-mail</label>
							<form:input path="email" id="inputEmail" cssClass="form-control"
								htmlEscape="true" placeholder="Email адрес" required="true" autocomplete="on"/>
								<form:errors path="email"/>
							<!-- <input
							type="email" id="inputEmail" class="form-control"
							placeholder="Email адрес" required="" autofocus="">  -->
							<label for="inputPassword" class="sr-only">Пароль</label> 
							<form:password path="password" id="inputPassword" cssClass="form-control" placeholder="Пароль" required="true"/>
							<form:errors path="password"/>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Закрыть</button>
						<button type="submit" class="btn btn-success">Войти</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</c:if>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src='<spring:url value="/resources/js/garand-sticky/jquery.sticky.js"/>'></script>
<script src='<spring:url value="/resources/js/header.js"/>'></script>