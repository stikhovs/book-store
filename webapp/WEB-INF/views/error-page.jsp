<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Error</title>
</head>
<body>

	<c:choose>
		<c:when test="${errorCode == 404 }">		
			<div style="max-width: 400px; margin: 10% auto 0;">
				<img class="img-fluid" src='<spring:url value="/resources/images/404.jpg"/>'>
				<h3 class="text-center">${errorMsg }</h3>
			</div>		
		</c:when>
		<c:otherwise>
			<div style="max-width: 400px; margin: 10% auto 0;">
				<img class="img-fluid" src='<spring:url value="/resources/images/homer.jpg"/>'>
				<h3 class="text-center">${errorMsg }</h3>
			</div>
		</c:otherwise>
	</c:choose>

</body>
</html>