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
<title>Результаты поиска</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">


<link rel="stylesheet"
	href='<spring:url value="/resources/css/style.css"/>'>
<link rel="stylesheet"
	href='<spring:url value="/resources/css/books.css" />'>
<link rel="stylesheet"
	href='<spring:url value="/resources/css/nav-burger.css" />'>

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
			<div id="nav-burger">
				<span></span> <span></span> <span></span> <span></span>
			</div>
			<div class="categories col-2">
				<div class="categories-title">
					<h3 class="categories-title-text">Категории</h3>
				</div>
				<div class="list-group categories-list">
					<c:forEach items="${firstCategories }" var="firstCategory">
						<c:choose>
							<c:when test="${filter == firstCategory.key }">
								<a
									class="main-category list-group-item list-group-item-action active"
									href='<spring:url value="/catalog?genre=${firstCategory.key }"/>'>${firstCategory.value }</a>
							</c:when>
							<c:otherwise>
								<a class="main-category list-group-item list-group-item-action"
									href='<spring:url value="/catalog?genre=${firstCategory.key }"/>'>${firstCategory.value }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:forEach items="${categories}" var="category">
						<c:choose>
							<c:when test="${filter ==  category.key}">
								<a
									class="main-category list-group-item list-group-item-action active"
									href='<spring:url value="/catalog?genre=${category.key }"/>'><c:out
										value="${category.key}" /></a>
							</c:when>
							<c:otherwise>
								<a class="main-category list-group-item list-group-item-action"
									href='<spring:url value="/catalog?genre=${category.key }"/>'><c:out
										value="${category.key}" /></a>
							</c:otherwise>
						</c:choose>


						<div class="inner-category list-group categories-list">
							<c:forEach items="${category.value}" var="innerCategory">
								<c:choose>
									<c:when test="${filter ==  innerCategory}">
										<a class="list-group-item active"
											href='<spring:url value="/catalog?genre=${innerCategory }"/>'><c:out
												value="${innerCategory}" /></a>
									</c:when>
									<c:otherwise>
										<a class="list-group-item"
											href='<spring:url value="/catalog?genre=${innerCategory }"/>'><c:out
												value="${innerCategory}" /></a>
									</c:otherwise>
								</c:choose>

							</c:forEach>
						</div>

					</c:forEach>
				</div>
			</div>
			<div class="books col-10">

				<c:choose>
					<c:when test="${page.totalElements == 0}">
						<div class="chosen-category-title">
							<h3 class="chosen-category-title-text">К сожалению, по
								запросу: ${searchWord} ничего не найдено...</h3>
						</div>
					</c:when>
					<c:otherwise>
						<div class="chosen-category-title">
							<h3 class="chosen-category-title-text">Результаты по
								запросу: ${searchWord}</h3>
						</div>
						<div class="books-found-number">
							<span>Найдено книг: <strong>${page.totalElements}</strong>
							</span>
						</div>
						<div class="sort-block">
							<div class="form-group">
								<div class="dropdown">
									<a class="btn btn-secondary dropdown-toggle" href="#"
										role="button" id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
										${activeSortItem } </a>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<c:forEach items="${sortMenuItems }" var="sortItem">
											<a class="dropdown-item"
												href='<spring:url value="/search?search=${searchWord }&page=0&sort=${sortItem.value }"/>'>${sortItem.key }</a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="books-list">
							<c:forEach items="${page.content}" var="book">

								<div class="book-item">
									<div class="card bg-light">
										<a class="card-body d-flex justify-content-center"
											target="_blank"
											href='<spring:url value="/catalog/${book.bookId}"/>'>
											<div class="image">
												<img class="img-fluid" title='${book.title}'
													alt='${book.title}'
													src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${book.coverPath}">
											</div>
											<div class="book-stickers">
												<div class="stickers-item d-flex flex-column">
													<c:if test="${book.newArrival}">
														<div class="label label_new" title="Новинка">
															<p class="label-text">Новинка</p>
														</div>
													</c:if>
													<c:if test="${book.bestseller}">
														<div class="label label_best" title="Бестселлер">
															<p class="label-text">Бестселлер</p>
														</div>
													</c:if>
												</div>
											</div>
										</a>
										<div class="card-footer text-muted">
											<div class="author">
												<a class="author-name"
													href='<spring:url value="/search?search=${book.author}"/>'>${book.author}</a>
											</div>
											<div class="title">
												<a href='<spring:url value="/catalog/${book.bookId}"/>'
													class="title-link" target="_blank">${book.title}</a>
											</div>
											<div class="buy">
												<div class="price">
													<p>
														<span class="price-sum"><fmt:formatNumber
																type="number" maxFractionDigits="2"
																value="${book.price}" /></span> руб.
													</p>
												</div>
												<c:choose>
													<c:when test="${book.preOrder}">
														<c:choose>
															<c:when test="${currentUser.anonymUser == false}">
																<a
																	href='<spring:url value="/catalog/${book.bookId}/preorder"/>'
																	class="btn btn-outline-secondary"
																	data-productid="${book.bookId}">Предзаказ</a>
															</c:when>
															<c:otherwise>
																<a href="#" data-toggle="modal"
																	data-target="#signInModal"
																	class="btn btn-outline-secondary btn-order"
																	data-productid="${book.bookId}">Предзаказ</a>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<s:incart
															falseString='<a href="#" class="btn btn-success btn-buy"
												data-productid="${book.bookId}">В корзину</a>'
															trueString='<a href="#" class="btn book-in-cart-btn disabled"
															data-productid="#">В корзине</a>'
															bookId="${book.bookId}"
															booksInCart="${currentUser.booksInCartList }" />
														<%-- <a href="#" class="btn btn-success"
													data-productid="${book.bookId}">Купить</a> --%>
													</c:otherwise>
												</c:choose>

											</div>
										</div>
									</div>
								</div>


							</c:forEach>
						</div>

						<nav id="books-pagination" aria-label="Page navigation example">
							<ul class="pagination justify-content-end">
								<c:choose>
									<c:when test="${page.first}">
										<li class="page-item disabled"><a class="page-link"
											href='#' aria-label="First page" title="В начало"> <span
												aria-hidden="true"><i class="icon-double-angle-left"></i></span>
												<span class="sr-only">First page</span>
										</a></li>
										<li class="page-item disabled"><a class="page-link"
											href='#' aria-label="Previous" title="Предыдущая страница">
												<span aria-hidden="true"><i class="icon-angle-left"></i></span>
												<span class="sr-only">Previous</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href='<spring:url value="/search?search=${searchWord }&page=0&sort=${sort},${direction}"/>'
											aria-label="First page" title="В начало"> <span
												aria-hidden="true"><i class="icon-double-angle-left"></i></span>
												<span class="sr-only">First page</span>
										</a></li>
										<li class="page-item "><a class="page-link"
											href='<spring:url value="/search?search=${searchWord }&page=${page.number - 1}&sort=${sort},${direction}"/>'
											aria-label="Previous" title="Предыдущая страница"> <span
												aria-hidden="true"><i class="icon-angle-left"></i></span> <span
												class="sr-only">Previous</span>
										</a></li>
									</c:otherwise>
								</c:choose>



								<c:forEach begin="${startpage }" end="${endpage}" var="p">
									<c:choose>
										<c:when test="${p eq page.number }">
											<li class="page-item active disabled"><a
												class="page-link" href="#">${p + 1}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href='<spring:url value="/search?search=${searchWord }&page=${p}&sort=${sort},${direction}"/>'>${p + 1}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<c:choose>

									<c:when test="${page.last}">
										<li class="page-item disabled"><a class="page-link"
											href='#' aria-label="Next" title="Следующая страница"> <span
												aria-hidden="true"><i class="icon-angle-right"></i></span> <span
												class="sr-only">Next</span>
										</a></li>
										<li class="page-item disabled"><a class="page-link"
											href='#' aria-label="Last page" title="В конец"> <span
												aria-hidden="true"><i class="icon-double-angle-right"></i></span>
												<span class="sr-only">Last page</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href='<spring:url value="/search?search=${searchWord }&page=${page.number + 1}&sort=${sort},${direction}"/>'
											aria-label="Next" title="Следующая страница"> <span
												aria-hidden="true"><i class="icon-angle-right"></i></span> <span
												class="sr-only">Next</span>
										</a></li>
										<li class="page-item"><a class="page-link"
											href='<spring:url value="/search?search=${searchWord }&page=${page.totalPages - 1}&sort=${sort},${direction}"/>'
											aria-label="Last page" title="В конец"> <span
												aria-hidden="true"><i class="icon-double-angle-right"></i></span>
												<span class="sr-only">Last page</span>
										</a></li>
									</c:otherwise>
								</c:choose>

							</ul>
						</nav>
					</c:otherwise>
				</c:choose>



			</div>
		</div>


		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
	</div>

	<script src='<spring:url value="/resources/js/catalog-list.js" />'></script>
	<script src='<spring:url value="/resources/js/nav-burger.js" />'></script>
</body>
</html>