<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${expense.name }</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class = "row justify-content-md-center">
	<h1 class="col-md-auto">Expense Details</h1>
	<a class ="col offset-6" href="/expenses">Go Back</a>
	</div>
	<p>Expense Name: <c:out value="${expense.name }"/></p>
	<p>Expense Description: <c:out value="${expense.description }"/></p>
	<p>Vendor: <c:out value="${expense.vendor }"/></p>
	<p>Amount Spent: <c:out value="${expense.amount}"/></p>
	
</body>
</html>