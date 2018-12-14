<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://sergiobooks/mytags"%>
<!DOCTYPE html>
<html lang="ru">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${bookInfo.title}-SergioBooks</title>

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



		<div id="main-block" class="row">
			<div class="col-12 breadcrumb-block">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href='<spring:url value="/"/>'>Главная</a></li>
						<li class="breadcrumb-item"><a
							href='<spring:url value="/catalog?genre=all"/>'>Книги</a></li>
						<li class="breadcrumb-item"><a
							href='<spring:url value="/catalog?genre=${bookInfo.genreOne}"/>'>${bookInfo.genreOne}</a></li>
						<li class="breadcrumb-item" aria-current="page"><a
							href='<spring:url value="/catalog?genre=${bookInfo.genreTwo}"/>'>${bookInfo.genreTwo}</a></li>
					</ol>
				</nav>
			</div>
			<div class="container">
				<div class="book-info col-12">
					<div class="row">
						<div class="col-12 book-title-and-author">
							<h3 class="book-title">${bookInfo.title}</h3>
							<h5 class="book-author">
								<a
									href='<spring:url value="/search?search=${bookInfo.author}"/>'>${bookInfo.author}</a>
							</h5>
						</div>
						<div class="col-lg-3 book-cover">
							<div class="image">
								<img class="img-fluid"
									src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${bookInfo.coverPath}">
							</div>
						</div>
						<div class="col-lg-9 col-md-7 book-details">
							<div class="book-detail book-publisher d-flex">
								<p>Издательство:</p>
								<p>${bookInfo.publisher}</p>
							</div>
							<div class="book-detail book-publish-year d-flex">
								<p>Год издания:</p>
								<p>${bookInfo.publishYear}</p>
							</div>
							<div class="book-detail book-pages d-flex">
								<p>Кол-во страниц:</p>
								<p>${bookInfo.pages}</p>
							</div>
							<div class="book-detail book-cover-type d-flex">
								<p>Тип обложки:</p>
								<p>${bookInfo.coverType}</p>
							</div>
							<div class="book-detail book-isbn d-flex">
								<p>ISBN:</p>
								<p>${bookInfo.isbn}</p>
							</div>
							<div class="book-detail book-price d-flex">
								<p>Цена:</p>
								<p>
									<span class="price-sum"> <fmt:formatNumber type="number"
											maxFractionDigits="2" value="${bookInfo.price}" /></span> руб.
								</p>
							</div>
							<div class="buy">

								<c:choose>
									<c:when test="${bookInfo.preOrder}">
										<c:choose>
											<c:when test="${currentUser.anonymUser == false}">
												<a
													href='<spring:url value="/catalog/${bookInfo.bookId}/preorder"/>'
													class="btn btn-outline-secondary"
													data-productid="${bookInfo.bookId}">Предзаказ</a>
											</c:when>
											<c:otherwise>
												<a href="#" data-toggle="modal" data-target="#signInModal"
													class="btn btn-outline-secondary btn-order"
													data-productid="${bookInfo.bookId}">Предзаказ</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<s:incart
											falseString='<a href="#" class="btn btn-success btn-buy"
												data-productid="${bookInfo.bookId}">В корзину</a>'
											trueString='<a href="#" class="btn book-in-cart-btn disabled"
															data-productid="#">В корзине</a>'
											bookId="${bookInfo.bookId}"
											booksInCart="${currentUser.booksInCartList }" />
										<%-- <a href="#" class="btn btn-success btn-buy"
													data-productid="${bookInfo.bookId}">В корзину</a> --%>
										<%-- <c:choose>
											<c:when test="${bookInfo.inCart }">
												<a href="#" class="btn book-in-cart-btn disabled"
													data-productid="#">В корзине</a>
											</c:when>
											<c:otherwise>
												<a href="#" class="btn btn-success btn-buy"
													data-productid="${bookInfo.bookId}">В корзину</a>
											</c:otherwise>
										</c:choose> --%>

									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="book-description-and-reviews col-12">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-description-tab"
								data-toggle="tab" href="#nav-description" role="tab"
								aria-controls="nav-description" aria-selected="true">Описание</a>
							<a class="nav-item nav-link" id="nav-review-tab"
								data-toggle="tab" href="#nav-review" role="tab"
								aria-controls="nav-review" aria-selected="false">Отзывы</a>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-description"
							role="tabpanel" aria-labelledby="nav-description-tab">
							<div class="description">${bookInfo.description}</div>
						</div>
						<div class="tab-pane fade" id="nav-review" role="tabpanel"
							aria-labelledby="nav-review-tab">

							<c:forEach items="${reviews }" var="review">
								<c:choose>
									<c:when test="${review.positive == true }">
										<div class="review-item d-flex flex-column positive">
									</c:when>
									<c:otherwise>
										<div class="review-item d-flex flex-column negative">
									</c:otherwise>
								</c:choose>

								<div
									class="mark d-flex justify-content-between align-items-center">
									<div class="thumb">
										<c:choose>
											<c:when test="${review.positive == true }">
												<img class="img-fluid"
													src='<spring:url value="/resources/images/thumb-up.png"/>'>
											</c:when>
											<c:otherwise>
												<img class="img-fluid"
													src='<spring:url value="/resources/images/thumb-down.png"/>'>
											</c:otherwise>
										</c:choose>

									</div>
									<div class="date">
										<span class="date-text">${review.reviewDate }</span>
									</div>
								</div>
								<div class="avatar-and-content d-flex">
									<div class="user-avatar">
										<div class="image">
											<img class="img-fluid"
												src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/userAvatars/${review.user.avatarPath}">
										</div>
									</div>
									<div class="review-content">
										<p class="user-name">${review.user.lastName }
											${review.user.firstName }</p>
										<p class="user-review-text">${review.reviewText }</p>
									</div>
								</div>
						</div>

						</c:forEach>

						<div class="add-review">
							<p>Прочитали? Поделитесь с нами своими впечатлениями!</p>
							<c:choose>
								<c:when test="${currentUser.anonymUser == true}">
									<a href="#" data-toggle="modal" data-target="#signInModal"
										class="btn btn-outline-secondary">Добавить отзыв</a>
								</c:when>
								<c:otherwise>
									<a
										href='<spring:url value="/catalog/${bookInfo.bookId}/review"/>'
										class="btn btn-outline-secondary">Добавить отзыв</a>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>