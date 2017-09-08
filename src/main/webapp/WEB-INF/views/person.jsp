<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Person Page</title>
<style type="text/css">
body {
	font: normal .80em 'trebuchet ms', arial, sans-serif;
	background: #F0EFE2;
	color: #777;
}

.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph {
	background-color: #f9f9f9
}

#header {
	background: #1D1D1D repeat;
	height: 166px;
}

h1,h2,h3,h4,h5,h6 {
	font: normal 175% 'century gothic', arial, sans-serif;
	color: #43423F;
	margin: 0 0 15px 0;
	padding: 0px 0 5px 0;
}

#main,#logo,#menubar,#site_,#footer {
	margin-left: auto;
	margin-right: auto;
}

#logo {
	width: 90%;
	position: relative;
	height: 115px;
}

#logo #logo_text {
	position: relative;
	top: 20px;
	left: 0;
}

#logo h1,#logo h2 {
	font: normal 250% 'century gothic', arial, sans-serif;
	border-bottom: 0;
	text-transform: none;
	margin: 0;
}

#logo_text h1,#logo_text h1 a,#logo_text h1 a:hover {
	padding: 22px 0 0 0;
	color: #FFF;
	letter-spacing: 0.1em;
	text-decoration: none;
}

#logo_text h1 a .logo_colour {
	color: #1293EE;
}
</style>
<div id="main">
	<div id="header">
		<div id="logo">
			<div id="logo_text">

				<h1 style="padding-left: 10%;">
					<a href="#">Employee<span class="logo_colour">
							Database </span></a>
				</h1>
			</div>
		</div>
	</div>
</div>
</head>
<body align="center">
	<h1>Add a Employee</h1>

	<c:url var="addAction" value="/person/add"></c:url>

	<form:form action="${addAction}" commandName="person">
		<table align="center">
			<c:if test="${!empty person.name}">
				<tr>
					<td><form:label path="id">
							<spring:message text="ID" />
						</form:label></td>
					<td><form:input path="id" readonly="true" size="8"
							disabled="true" /> <form:hidden path="id" /></td>
				</tr>
			</c:if>
			<tr>
				<td><form:label path="name">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="department">
						<spring:message text="Department" />
					</form:label></td>
				<td><form:input path="department" /></td>
			</tr>

			<tr>
				<td colspan="2"><c:if test="${!empty person.name}">
						<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="<spring:message text="Edit Employee"/>" />
					</c:if> <c:if test="${empty person.name}">
						<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="<spring:message text="Add Employee"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>
	<br>
	<h3>Employees List</h3>
	<c:if test="${!empty listPersons}">
		<table class="tg" align="center">
			<tr>
				<th width="80">Employee ID</th>
				<th width="120">Employee Name</th>
				<th width="120">Employee Department</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${listPersons}" var="person">
				<tr>
					<td>${person.id}</td>
					<td>${person.name}</td>
					<td>${person.department}</td>
					<td><a href="<c:url value='/edit/${person.id}' />">Edit</a></td>
					<td><a href="<c:url value='/remove/${person.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
