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
<title>Редактор книг - Sergio Books</title>

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

<style>
	.form-block label {
		font-weight: bold;
	}
</style>

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../views/fragments/header.jsp"></jsp:include>
		<jsp:include page="../views/fragments/main-categories.jsp"></jsp:include>
		<div class="container">

			<h3 style="margin: 40px 0;">Редактирование книги<br>
			</h3>


			<div class="d-flex" style="margin-bottom: 30px;">

				<div class="book-info-block">
					<div class="book-item" style="margin-bottom: 15px;">
					<div
							class="book-info-block d-flex flex-column justify-content-between"
							style="">
							<div class="book-info-details">
								<p class="book-info title">
									<strong><a
										style="color: #000; margin-bottom: 5px; font-size: 20px;"
										target="_blank"
										href='<spring:url value="/catalog/${book.bookId}"/>'>${book.title }</a></strong>
								</p>
								<p class="book-info author">
									<a style="color: #000; margin-bottom: 5px; font-size: 20px;"
										href='<spring:url value="/search?search=${book.author}"/>'>${book.author}</a>
								</p>
							</div>
						</div>
						<div class="book-cover" style="width: 300px;">
							<a target="_blank"
								href='<spring:url value="/catalog/${book.bookId}"/>'> <img
								class="img-fluid"
								src="https://s3.us-east-2.amazonaws.com/stikhovs-book-store/bookCovers/${book.coverPath}">
							</a>
						</div>
						
					</div>

				<div style="margin-top: 20px;">							
							<a href='<spring:url value="/admin/book-list/edit/${book.bookId}/add-slide"/>' class="btn btn-primary">Добавить в слайдер</a>
						</div>

				</div>
				<div class="form-block" style="margin-left: 40px; width: 100%;">

					<spring:url value="/admin/book-list/edit/${book.bookId }"
						var="editBookUrl" />
					<form:form action="${editBookUrl}" method="POST"
						modelAttribute="book" enctype="multipart/form-data">

						<div class="form-group row">
							<label for="title" class="col-sm-4 col-form-label">Заголовок</label>
							<div class="col-sm-12">
								<form:input path="title" id="title" cssClass="form-control"
									htmlEscape="true" placeholder="Заголовок"
									value="${book.title }" />
								<form:errors cssClass="form-errors" path="title" />
							</div>
						</div>
						<div class="form-group row">
							<label for="author" class="col-sm-4 col-form-label">Автор</label>
							<div class="col-sm-12">
								<form:input path="author" id="author" cssClass="form-control"
									htmlEscape="true" placeholder="Автор" value="${book.author }" />
								<form:errors cssClass="form-errors" path="author" />
							</div>
						</div>
						<div class="form-group">
							<label for="description">Описание</label>
							<form:textarea htmlEscape="true" id="description" rows="7"
								cssClass="form-control" path="description"
								value="${book.description }" />
							<small class="form-text text-muted">Текст не должен
								превышать 3000 символов</small>
							<form:errors cssClass="form-errors" path="description" />
						</div>

						<div class="form-group row">
							<label for="newArrival" class="col-sm-4 col-form-label">Это
								новинка?</label>
							<div class="col-sm-12">
								<form:select id="newArrival" path="newArrival"
									cssClass="form-control">
									<c:choose>
										<c:when test="${book.newArrival}">
											<form:option value="false">Не новинка</form:option>
											<form:option selected="selected" value="true">Новинка</form:option>
										</c:when>
										<c:otherwise>
											<form:option value="true">Новинка</form:option>
											<form:option selected="selected" value="false">Не новинка</form:option>
										</c:otherwise>
									</c:choose>

								</form:select>
							</div>
						</div>
						<div class="form-group row">
							<label for="bestseller" class="col-sm-4 col-form-label">Это
								бестселлер?</label>
							<div class="col-sm-12">
								<form:select id="bestseller" path="bestseller"
									cssClass="form-control">
									<c:choose>
										<c:when test="${book.bestseller}">
											<form:option value="false">Не бестселлер</form:option>
											<form:option selected="selected" value="true">Бестселлер</form:option>
										</c:when>
										<c:otherwise>
											<form:option value="true">Бестселлер</form:option>
											<form:option selected="selected" value="false">Не бестселлер</form:option>
										</c:otherwise>
									</c:choose>
								</form:select>
							</div>
						</div>

						<div class="form-group row">
							<label for="genreOne" class="col-sm-4 col-form-label">Жанр
								1</label>
							<div class="col-sm-12">
								<form:input path="genreOne" id="genreOne"
									cssClass="form-control" htmlEscape="true"
									placeholder="Художественная литература" value="${book.genreOne }" />
								<form:errors cssClass="form-errors" path="genreOne" />
							</div>
						</div>
						<div class="form-group row">
							<label for="genreTwo" class="col-sm-4 col-form-label">Жанр
								2</label>
							<div class="col-sm-12">
								<form:input path="genreTwo" id="genreTwo"
									cssClass="form-control" htmlEscape="true"
									placeholder="Фантастика" value="${book.genreTwo }" />
								<form:errors cssClass="form-errors" path="genreTwo" />
							</div>
						</div>
						<div class="form-group row">
							<label for="pages" class="col-sm-4 col-form-label">Количество
								страниц</label>
							<div class="col-sm-12">
								<form:input path="pages" id="pages" cssClass="form-control"
									htmlEscape="true" placeholder="384" value="${book.pages }" />
								<form:errors cssClass="form-errors" path="pages" />
							</div>
						</div>
						<div class="form-group row">
							<label for="publisher" class="col-sm-4 col-form-label">Издательство</label>
							<div class="col-sm-12">
								<form:input path="publisher" id="publisher"
									cssClass="form-control" htmlEscape="true"
									placeholder="Издательство" value="${book.publisher }" />
								<form:errors cssClass="form-errors" path="publisher" />
							</div>
						</div>
						<div class="form-group row">
							<label for="publishYear" class="col-sm-4 col-form-label">Год
								издания</label>
							<div class="col-sm-12">
								<form:input path="publishYear" id="publishYear"
									cssClass="form-control" htmlEscape="true"
									placeholder="Год издания" value="${book.publishYear }" />
								<form:errors cssClass="form-errors" path="publishYear" />
							</div>
						</div>
						<div class="form-group row">
							<label for="coverType" class="col-sm-4 col-form-label">Тип
								обложки</label>
							<div class="col-sm-12">
								<form:input path="coverType" id="coverType"
									cssClass="form-control" htmlEscape="true"
									placeholder="Тип обложки" value="${book.coverType }" />
								<form:errors cssClass="form-errors" path="coverType" />
							</div>
						</div>
						<div class="form-group row">
							<label for="isbn" class="col-sm-4 col-form-label">Номер
								ISBN</label>
							<div class="col-sm-12">
								<form:input path="isbn" id="isbn" cssClass="form-control"
									htmlEscape="true" placeholder="Номер ISBN" value="${book.isbn }" />
								<form:errors cssClass="form-errors" path="isbn" />
							</div>
						</div>
						<div class="form-group row">
							<label for="price" class="col-sm-4 col-form-label">Цена</label>
							<div class="col-sm-12">
								<form:input path="price" id="price" cssClass="form-control"
									htmlEscape="true" placeholder="Цена" value="${book.price }" />
								<form:errors cssClass="form-errors" path="price" />
							</div>
						</div>


						<div class="form-group row">
							<label for="preOrder" class="col-sm-6 col-form-label">Только
								по предзаказу?</label>
							<div class="col-sm-12">
								<form:select id="preOrder" path="preOrder"
									cssClass="form-control">
									<c:choose>
										<c:when test="${book.preOrder}">
											<form:option value="false">Нет</form:option>
											<form:option selected="selected" value="true">Да</form:option>
										</c:when>
										<c:otherwise>
											<form:option value="true">Да</form:option>
											<form:option selected="selected" value="false">Нет</form:option>
										</c:otherwise>
									</c:choose>
								</form:select>
							</div>
						</div>

						<p style="margin-bottom: 5px; font-weight: bold;">Сменить обложку: </p>
						<form:input path="bookCover" type="file" />
						<%-- <form:errors path="file" /> --%>
						<div style="margin-top: 20px; text-align: right;">							
							<button type="submit" class="btn btn-success">Сохранить изменения</button>
						</div>

					</form:form>

				</div>
			</div>





		</div>


		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>
	</div>
</body>
</html>