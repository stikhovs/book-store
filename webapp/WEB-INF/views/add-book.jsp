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
<title>Добавить книгу - Sergio Books</title>

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
			<h3 style="margin: 40px 0;">Добавление книги<br>
				<small class="text-muted">Все поля являются обязательными</small>
			</h3>

			<spring:url value="/admin/add-book" var="addBookUrl" />
			<form:form action="${addBookUrl}" method="POST"
				modelAttribute="book" enctype="multipart/form-data">
				<div class="form-group row">
					<label for="title" class="col-sm-2 col-form-label">Заголовок</label>
					<div class="col-sm-4">
						<form:input path="title" id="title"
							cssClass="form-control" htmlEscape="true" placeholder="Заголовок" />
						<form:errors cssClass="form-errors" path="title" />
					</div>
				</div>
				<div class="form-group row">
					<label for="author" class="col-sm-2 col-form-label">Автор</label>
					<div class="col-sm-4">
						<form:input path="author" id="author"
							cssClass="form-control" htmlEscape="true" placeholder="Автор" />
						<form:errors cssClass="form-errors" path="author" />
					</div>
				</div>
				
				<div class="form-group row">
					<label for="description" class="col-sm-2 col-form-label">Описание</label>
					<div class="col-sm-4">
						<form:input path="description" id="description"
							cssClass="form-control" htmlEscape="true" placeholder="Описание" />
						<form:errors cssClass="form-errors" path="description" />
					</div>
				</div>
				
				<div class="form-group row">
					<label for="newArrival" class="col-sm-2 col-form-label">Это новинка?</label>
					<div class="col-sm-4">
						<form:select id="newArrival" path="newArrival"
								cssClass="form-control">
								<form:option value="false">Не новинка</form:option>
								<form:option selected="selected" value="true">Новинка</form:option>
							</form:select>
					</div>
				</div>
				<div class="form-group row">
					<label for="bestseller" class="col-sm-2 col-form-label">Это бестселлер?</label>
					<div class="col-sm-4">
						<form:select id="bestseller" path="bestseller"
								cssClass="form-control">
								<form:option value="false">Не бестселлер</form:option>
								<form:option selected="selected" value="true">Бестселлер</form:option>
							</form:select>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="genreOne" class="col-sm-2 col-form-label">Жанр 1</label>
					<div class="col-sm-4">
						<form:input path="genreOne" id="genreOne"
							cssClass="form-control" htmlEscape="true" placeholder="Художественная литература" />
						<form:errors cssClass="form-errors" path="genreOne" />
					</div>
				</div>
				<div class="form-group row">
					<label for="genreTwo" class="col-sm-2 col-form-label">Жанр 2</label>
					<div class="col-sm-4">
						<form:input path="genreTwo" id="genreTwo"
							cssClass="form-control" htmlEscape="true" placeholder="Фантастика" />
						<form:errors cssClass="form-errors" path="genreTwo" />
					</div>
				</div>
				<div class="form-group row">
					<label for="pages" class="col-sm-2 col-form-label">Количество страниц</label>
					<div class="col-sm-4">
						<form:input path="pages" id="pages"
							cssClass="form-control" htmlEscape="true" placeholder="384" />
						<form:errors cssClass="form-errors" path="pages" />
					</div>
				</div>
				<div class="form-group row">
					<label for="publisher" class="col-sm-2 col-form-label">Издательство</label>
					<div class="col-sm-4">
						<form:input path="publisher" id="publisher"
							cssClass="form-control" htmlEscape="true" placeholder="Издательство" />
						<form:errors cssClass="form-errors" path="publisher" />
					</div>
				</div>
				<div class="form-group row">
					<label for="publishYear" class="col-sm-2 col-form-label">Год издания</label>
					<div class="col-sm-4">
						<form:input path="publishYear" id="publishYear"
							cssClass="form-control" htmlEscape="true" placeholder="Год издания" value="2018" />
						<form:errors cssClass="form-errors" path="publishYear" />
					</div>
				</div>
				<div class="form-group row">
					<label for="coverType" class="col-sm-2 col-form-label">Тип обложки</label>
					<div class="col-sm-4">
						<form:input path="coverType" id="coverType"
							cssClass="form-control" htmlEscape="true" placeholder="Тип обложки" value="Твердая бумажная" />
						<form:errors cssClass="form-errors" path="coverType" />
					</div>
				</div>
				<div class="form-group row">
					<label for="isbn" class="col-sm-2 col-form-label">Номер ISBN</label>
					<div class="col-sm-4">
						<form:input path="isbn" id="isbn"
							cssClass="form-control" htmlEscape="true" placeholder="Номер ISBN"/>
						<form:errors cssClass="form-errors" path="isbn" />
					</div>
				</div>
				<div class="form-group row">
					<label for="price" class="col-sm-2 col-form-label">Цена</label>
					<div class="col-sm-4">
						<form:input path="price" id="price"
							cssClass="form-control" htmlEscape="true" placeholder="Цена" value="500"/>
						<form:errors cssClass="form-errors" path="price" />
					</div>
				</div>
				
				
				<div class="form-group row">
					<label for="preOrder" class="col-sm-2 col-form-label">Только по предзаказу?</label>
					<div class="col-sm-4">
						<form:select id="preOrder" path="preOrder"
								cssClass="form-control">
								<form:option value="true">Да</form:option>
								<form:option selected="selected" value="false">Нет</form:option>
							</form:select>
					</div>
				</div>
				
				
				<p style="margin-top: 20px; margin-bottom: 5px;">Обложка</p>
				
				<form:input path="bookCover" type="file" accept=".jpg, .jpeg, .png" />
				<small class="form-text text-muted">Изображение не должно превышать 1 мегабайт</small>
				<form:errors cssClass="form-errors" path="bookCover" />
				<div class="register-button text-right" style="margin-top: 20px; margin-bottom: 20px;">
					<button type="submit" class="btn btn-success">Добавить книгу</button>
				</div>
			</form:form>

		</div>



		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
</body>
</html>