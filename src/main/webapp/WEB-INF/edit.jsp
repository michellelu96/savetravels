<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Edit</title>
</head>
<body class="container">
<div class="d-flex flex-column align-items-center">
		<h1>Edit an Expense</h1>
		<form:form action="/expenses/edit/${expense.id }" method="post" modelAttribute="expense">
			<input type="hidden" name="_method" value="put">

			<p>
				<form:errors path="name" class="error" />
			</p>
			<p>
				<form:errors path="vendor" class="error" />
			</p>
			<p>
				<form:errors path="amount" class="error" />
			</p>
			<p>
				<form:errors path="description" class="error" />
			</p>

			<p>
				<form:label path="name">Expense Name:</form:label>
				<form:input path="name" type="text" value="${expense.name }" />
			</p>
			<p>
				<form:label path="vendor">Vendor Name:</form:label>
				<form:input path="vendor" type="text" value="${expense.vendor }"/>
			</p>
			<p>
				<form:label path="amount">Amount</form:label>
				<form:input type="number" path="amount" value="${expense.amount }"/>
			</p>
			<p>
				<form:label path="description">Description:</form:label>
				<form:textarea path="description" type="textarea" value="${expense.description }"/>
			</p>
			<input type="submit" value="Submit" />
		</form:form>
	</div>
</body>
</html>