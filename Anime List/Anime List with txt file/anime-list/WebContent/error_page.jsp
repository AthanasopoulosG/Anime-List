<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isErrorPage = "true"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>

<style>
	<%@include file="css/Error.css"%>
</style>
</head>
<body class="image">

<div class="ghost">
	<span>&#9760;&#9760;&nbsp;</span>
	<span class="ghost1">ERROR PAGE</span>
	<span>&nbsp;&#9760;&#9760;</span>
</div>
	<div class="centered">
		<c:if test="${error =='666' }">
			<span class="cross">&#9768;</span>
			Fill all the * fields and/or check database connection!!!
			<span class="cross">&#9768;</span>
			${pageContext.exception}
		</c:if>
	</div >
	
	<div class="cent">
		<div class=" border centered2">
			<c:if test="${error !='666' }">
				<p>
					<span class="cross">&#9768;</span>
					&nbsp; Something went wrong print screen and contact me !!!&nbsp;
					<span class="cross">&#9768;</span>
				</p>
				<div>${msg}</div>
				<div>${pageContext.exception}</div>
			</c:if>
		</div>
	</div >
	
	
</body>
</html>