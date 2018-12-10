<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
@import url('<spring:url value="/resources/css/main-categories.css"/>');
</style>
<div id="main-categories" class="row">
	<a class="show-hide-categories flex-fill" href="#">Категории</a>
	<ul
		class="nav flex-lg-row flex-column justify-content-center flex-fill">
		<c:forEach items="${firstCategories }" var="categ">
			<c:choose>
				<c:when test="${filter == categ.key }">
					<li class="nav-item"><a class="nav-link active" href='<spring:url value="/catalog?genre=${categ.key }"/>'>${categ.value }</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link" href='<spring:url value="/catalog?genre=${categ.key }"/>'>${categ.value }</a></li>
				</c:otherwise>
			</c:choose>			
		</c:forEach>
		
		<c:forEach items="${outerGenres }" var="genre">
			<c:choose>
				<c:when test="${filter == genre || (genreOne != null && genre == genreOne)}">
					<li class="nav-item"><a class="nav-link active"
						href='<spring:url value="/catalog?genre=${genre}"/>'>${genre}</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a class="nav-link"
						href='<spring:url value="/catalog?genre=${genre}"/>'>${genre}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<li class="nav-item dropdown"><a class="btn dropdown-toggle"
			href="#" role="button" id="mainCategoriesDropdownMenuLink"
			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ещё</a>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			</ul></li>
	</ul>
</div>

<script src='<spring:url value="/resources/js/main-categories.js"/>'></script>