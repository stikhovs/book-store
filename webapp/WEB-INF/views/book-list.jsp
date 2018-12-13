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
<title>Список книг - Sergio Books</title>

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
	tbody tr {
		cursor: pointer;
	}
</style>

</head>
<body>
	<div class="container-fluid">

		<jsp:include page="../views/fragments/header.jsp"></jsp:include>
		<jsp:include page="../views/fragments/main-categories.jsp"></jsp:include>


		
			<h3 style="margin: 40px 0;">Список книг</h3>
			<div class="table-responsive">
				<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<td>Id</td>
						<td>Заголовок</td>
						<td>Автор</td>
						<td>Описание</td>
						<td>Новинка</td>
						<td>Бестселлер</td>
						<td>Жанр 1</td>
						<td>Жанр 2</td>
						<td>Страницы</td>
						<td>Издательство</td>
						<td>Год издания</td>
						<td>Тип обложки</td>
						<td>ISBN</td>
						<td>Цена</td>
						<td>По предзаказу</td>
						<td>Путь к обложке</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${booklist}" var="book">
						<tr data-href='<spring:url value="/admin/book-list/edit/${book.bookId}"/>'>
							<td>${book.bookId}</td>
							<td>${book.title}</td>
							<td>${book.author}</td>
							<td class="description">${book.description}</td>
							<td>${book.newArrival}</td>
							<td>${book.bestseller}</td>
							<td>${book.genreOne}</td>
							<td>${book.genreTwo}</td>
							<td>${book.pages}</td>
							<td>${book.publisher}</td>
							<td>${book.publishYear}</td>
							<td>${book.coverType}</td>
							<td>${book.isbn}</td>
							<td>${book.price}</td>
							<td>${book.preOrder}</td>
							<td>${book.coverPath}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			

			

		



		<jsp:include page="../views/fragments/footer.jsp"></jsp:include>

	</div>
	
	<script>
	$('tbody tr[data-href]').on("click", function() {
	    /* document.location = $(this).data('href'); */
	    window.open($(this).data('href'),'_blank');
	});
	
	$(document).ready(function () {
		var descr = $("td.description");
		descr.each(function(id){
			if($(this).text().length > 30) {
				$(this).text($(this).text().substring(0,27) + '...');
			}
		});
		
	});
	
	</script>
	
</body>
</html>