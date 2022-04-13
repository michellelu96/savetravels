<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="container">
	<h1 class="text-center">Save Travels</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">Expense</th>
				<th scope="col">Vendor</th>
				<th scope="col">Amount</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="expense" items="${expenses }">
				<tr>
					<td scope="row"><a href="/expenses/${expense.id }">${expense.name }</a></td>
					<td><c:out value="${expense.vendor }" /></td>
					<td><c:out value="${expense.amount }" /></td>
					<td class="d-flex align-content-center"><a class="btn btn-link" href="/expenses/edit/${expense.id }">Edit</a>
						<form action="/expenses/delete/${expense.id}" method="post">
							<input type="hidden" name="_method" value="delete"> 
							<input type="submit" value="Delete" class="btn btn-link">
						</form></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="d-flex flex-column align-items-center">
		<h1>Add an Expense</h1>
		<form:form action="/expenses" method="post" modelAttribute="expense">

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
				<form:input path="name" type="text" />
			</p>
			<p>
				<form:label path="vendor">Vendor Name:</form:label>
				<form:input path="vendor" type="text" />
			</p>
			<p>
				<form:label path="amount">Amount</form:label>
				<form:input type="number" path="amount" />
			</p>
			<p>
				<form:label path="description">Description:</form:label>
				<form:textarea path="description" type="textarea" />
			</p>
			<input type="submit" value="Submit" />
		</form:form>
	</div>
</body>
</html>