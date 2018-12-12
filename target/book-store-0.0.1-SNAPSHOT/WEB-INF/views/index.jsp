<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="s" uri="http://sergiobooks/mytags"%>
<!DOCTYPE html>
<html lang="ru">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sergio Books - книжный магазин</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href='<spring:url value="/resources/js/slick-1.8.1/slick/slick.css" />' />
<link rel="stylesheet" type="text/css"
	href='<spring:url value="/resources/js/slick-1.8.1/slick/slick-theme.css" />' />

<link rel="stylesheet"
	href='<spring:url value="/resources/css/main-slider.css"/>'>
<link rel="stylesheet"
	href='<spring:url value="/resources/css/style.css"/>'>

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


		<div id="slider">
			<div class="book-slide">
				<img class="background"
					src='<spring:url value="/resources/images/slider/01.jpg"/>'>
				<div class="slide-content d-flex">
					<div class="top-slider__books books-showcase">
						<a href="#" class="books-showcase__item" tabindex="0"> <img
							src='<spring:url value="/resources/images/slider/1.jpg"/>' alt=""
							class="books-showcase__img img-fluid"> <!-- ОБЛОЖКА -->
						</a>
					</div>
					<div class="top-slider__content">
						<div class="container">
							<div class="top-slider__subtitle">
								<span style="color: #e7b49e;">Виктория Мельник</span>
							</div>
							<div class="top-slider__title">
								<span style="color: #e7b49e;">«Чизкейк внутри. Книга 2»</span>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="book-slide">
				<img class="background"
					src='<spring:url value="/resources/images/slider/04.jpg"/>'>
				<div class="top-slider__books books-showcase">
					<a href="#" class="books-showcase__item" tabindex="0"> <img
						src='<spring:url value="/resources/images/slider/4.jpg"/>' alt=""
						class="books-showcase__img img-fluid"> <!-- ОБЛОЖКА -->
					</a>
				</div>
				<div class="top-slider__content">
					<div class="container">
						<div class="top-slider__subtitle">
							<span style="color: white;">Виктор Пелевин</span>
						</div>
						<div class="top-slider__title">
							<span style="color: white;">«Тайные виды на гору Фудзи»</span>
						</div>

					</div>
				</div>
			</div>
			<div class="book-slide">
				<img class="background"
					src='<spring:url value="/resources/images/slider/03.jpg"/>'>
				<div class="top-slider__books books-showcase">
					<a href="#" class="books-showcase__item" tabindex="0"> <img
						src='<spring:url value="/resources/images/slider/3.jpg"/>' alt=""
						class="books-showcase__img img-fluid"> <!-- ОБЛОЖКА -->
					</a>
				</div>
				<div class="top-slider__content">
					<div class="container">
						<div class="top-slider__subtitle">
							<span style="color: red;">Юваль Ной Харари </span>
						</div>
						<div class="top-slider__title">
							<span style="color: black;">«Ноmo Deus. Краткая история
								будущего»</span>
						</div>
					</div>
				</div>
			</div>
			<div class="book-slide">
				<img class="background"
					src='<spring:url value="/resources/images/slider/05.jpg"/>'>
				<div class="top-slider__books books-showcase">
					<a href="#" class="books-showcase__item" tabindex="0"> <img
						src='<spring:url value="/resources/images/slider/5.jpg"/>' alt=""
						class="books-showcase__img img-fluid"> <!-- ОБЛОЖКА -->
					</a>
				</div>
				<div class="top-slider__content">
					<div class="container">
						<div class="top-slider__subtitle">
							<span style="color: white;">Ричард Джордж Адамс</span>
						</div>
						<div class="top-slider__title">
							<span style="color: white;">«Истории обитателей холмов»</span>
						</div>
					</div>
				</div>
			</div>
			<div class="book-slide">
				<img class="background"
					src='<spring:url value="/resources/images/slider/06.jpg"/>'>
				<div class="top-slider__books books-showcase">
					<a href="#" class="books-showcase__item" tabindex="0"> <img
						src='<spring:url value="/resources/images/slider/6.jpg"/>' alt=""
						class="books-showcase__img img-fluid"> <!-- ОБЛОЖКА -->
					</a>
				</div>
				<div class="top-slider__content">
					<div class="container">
						<div class="top-slider__subtitle">
							<span style="color: #faebc3;">Вячеслав Недошивин</span>
						</div>
						<div class="top-slider__title">
							<span style="color: #faebc3;">«Джордж Оруэлл. Неприступная
								душа»</span>
						</div>
					</div>
				</div>
			</div>
			<div class="book-slide">
				<img class="background"
					src='<spring:url value="/resources/images/slider/07.jpg"/>'>
				<div class="top-slider__books books-showcase">
					<a href="#" class="books-showcase__item" tabindex="0"> <img
						src='<spring:url value="/resources/images/slider/7.jpg"/>' alt=""
						class="books-showcase__img img-fluid"> <!-- ОБЛОЖКА -->
					</a>
				</div>
				<div class="top-slider__content">
					<div class="container">
						<div class="top-slider__subtitle">
							<span style="color: #e8e9ad;">Марк Твен</span>
						</div>
						<div class="top-slider__title">
							<span style="color: #e8e9ad;">«Похищение принца
								Олеомаргарина»</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="newArrivals" class="slider-block">
			<div class="title-block">
				<h2 class="title-text">Новинки</h2>
				<div class="show-all">
					<a href='<spring:url value="/catalog?genre=newArrivals"/>'
						target="_blank">Показать все</a>
				</div>
			</div>
			<div class="slider">

				<c:forEach items="${newArrivals}" var="newBook">
					<div class="book-slide">
						<div class="card bg-light">
							<a class="card-body d-flex justify-content-center"
								href='<spring:url value="/catalog/${newBook.bookId}"/>'
								target="_blank">
								<div class="image">
									<img class="img-fluid" title='${newBook.title}'
										alt='${newBook.title}'
										src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${newBook.coverPath}">
								</div>
								<div class="book-stickers">
									<div class="stickers-item d-flex flex-column">
										<div class="label label_new" title="Новинка">
											<p class="label-text">Новинка</p>
										</div>
									</div>
								</div>
							</a>
							<div class="card-footer text-muted">
								<div class="author">
									<a class="author-name" href='<spring:url value="/search?search=${newBook.author}"/>'>${newBook.author}</a>
								</div>
								<div class="title">
									<a href='<spring:url value="/catalog/${newBook.bookId}"/>'
										class="title-link" target="_blank">${newBook.title}</a>
								</div>
								<div class="buy">
									<div class="price">
										<p>
											<span class="price-sum"><fmt:formatNumber
													type="number" maxFractionDigits="2"
													value="${newBook.price}" /></span> руб.
										</p>
									</div>
									<s:incart
										falseString='<a href="#" class="btn btn-success btn-buy"
												data-productid="${newBook.bookId}">В корзину</a>'
										trueString='<a href="#" class="btn book-in-cart-btn disabled"
															data-productid="#">В корзине</a>'
										bookId="${newBook.bookId}"
										booksInCart="${currentUser.booksInCartList }" />
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>

		<div id="bestSellers" class="slider-block">
			<div class="title-block">
				<h2 class="title-text">Бестселлеры</h2>
				<div class="show-all">
					<a href='<spring:url value="/catalog?genre=bestsellers"/>'
						target="_blank">Показать все</a>
				</div>
			</div>
			<div class="slider">


				<c:forEach items="${bestsellers}" var="bestseller">
					<div class="book-slide">
						<div class="card bg-light">
							<a class="card-body d-flex justify-content-center"
								href='<spring:url value="/catalog/${bestseller.bookId}"/>'
								target="_blank">
								<div class="image">
									<img class="img-fluid" title='${bestseller.title}'
										alt='${bestseller.title}'
										src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${bestseller.coverPath}">
								</div>
								<div class="book-stickers">
									<div class="stickers-item d-flex flex-column">

										<c:if test="${bestseller.newArrival}">
											<div class="label label_new" title="Новинка">
												<p class="label-text">Новинка</p>
											</div>
										</c:if>
										<div class="label label_best" title="Бестселлер">
											<p class="label-text">Бестселлер</p>
										</div>
									</div>
								</div>
							</a>
							<div class="card-footer text-muted">
								<div class="author">
									<a class="author-name" href='<spring:url value="/search?search=${bestseller.author}"/>'>${bestseller.author}</a>
								</div>
								<div class="title">
									<a href='<spring:url value="/catalog/${bestseller.bookId}"/>'
										class="title-link" target="_blank">${bestseller.title}</a>
								</div>
								<div class="buy">
									<div class="price">
										<p>
											<span class="price-sum"><fmt:formatNumber
													type="number" maxFractionDigits="2"
													value="${bestseller.price}" /></span> руб.
										</p>
									</div>

									<s:incart
										falseString='<a href="#" class="btn btn-success btn-buy"
												data-productid="${bestseller.bookId}">В корзину</a>'
										trueString='<a href="#" class="btn book-in-cart-btn disabled"
															data-productid="#">В корзине</a>'
										bookId="${bestseller.bookId}"
										booksInCart="${currentUser.booksInCartList }" />

								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>

		<div id="soonArrivals" class="slider-block">
			<div class="title-block">
				<h2 class="title-text">Скоро в продаже</h2>
				<!--<div class="show-all"><a href="#" target="_blank">Показать все</a></div>-->
			</div>
			<div class="slider">


				<c:forEach items="${preOrders}" var="preOrder">
					<div class="book-slide">
						<div class="card bg-light">
							<a class="card-body d-flex justify-content-center"
								href='<spring:url value="/catalog/${preOrder.bookId}"/>'
								target="_blank">
								<div class="image">
									<img class="img-fluid" title='${preOrder.title}'
										alt='${preOrder.title}'
										src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${preOrder.coverPath}">
								</div>
							</a>
							<div class="card-footer text-muted">
								<div class="author">
									<a class="author-name" href='<spring:url value="/search?search=${preOrder.author}"/>'>${preOrder.author}</a>
								</div>
								<div class="title">
									<a href='<spring:url value="/catalog/${preOrder.bookId}"/>'
										class="title-link" target="_blank">${preOrder.title}</a>
								</div>
								<div class="buy">
								<c:choose>								
									<c:when test="${currentUser.anonymUser == false}">
										<a href='<spring:url value="/catalog/${preOrder.bookId}/preorder"/>' class="btn btn-outline-secondary btn-order"
										data-productid="${preOrder.bookId}">Предзаказ</a>
									</c:when>
									<c:otherwise>
										<a href="#" data-toggle="modal" data-target="#signInModal" class="btn btn-outline-secondary btn-order"
										data-productid="${preOrder.bookId}">Предзаказ</a>
									</c:otherwise>					
								</c:choose>
									
								</div>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>

		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>


	<script type="text/javascript"
		src='<spring:url value="/resources/js/slick-1.8.1/slick/slick.min.js"/>'></script>

	<script src='<spring:url value="/resources/js/main-slider.js"/>'></script>

</body>
</html>