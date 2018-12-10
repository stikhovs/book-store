<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
    <style>
    	@import url('<spring:url value="/resources/css/footer.css"/>');
    </style>
    
<footer>
            <nav class="navbar navbar-expand-xl navbar-dark bg-dark">
                <a class="navbar-brand" href='<spring:url value="/"/>'>Sergio Books</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        
                        <c:forEach items="${firstCategories }" var="categ">
							<li class="nav-item">
	                            <a class="nav-link" href='<spring:url value="/catalog?genre=${categ.key }"/>'>${categ.value }</a>
	                        </li>							
						</c:forEach>
						
                        <c:forEach items="${outerGenres }" var="genre">
							<li class="nav-item">
                            	<a class="nav-link" href='<spring:url value="/catalog?genre=${genre}"/>'>${genre}</a>
                        	</li>		
						</c:forEach>
                        
                        <li class="nav-item dropup">
                            <a class="nav-link dropdown-toggle" href="https://getbootstrap.com" id="dropdown10" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ещё</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown10">

                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </footer>
        
        
        
 <script src='<spring:url value="/resources/js/footer.js"/>'></script>