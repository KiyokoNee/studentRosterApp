<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>All Dorms</title>
	</head>
	<body>
		<h1>All Dorms</h1>
		<div class="navlinks">
			<a href="/dorms/new">Create Dorm</a>
			<a href="/students/new">Create Student</a>
		</div>
		<table id="dormDisplay">
			<thead>
				<tr>
					<th>Dorm</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dorm" items="${dorms}">
					<tr>
						<td><c:out value="${dorm.name}"></c:out></td>
						<td><a href="/dorms/${dorm.id}">See Students</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>