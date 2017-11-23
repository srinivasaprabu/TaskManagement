<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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

</head>
<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">

					<h1 style="padding-left: 10%;">
						<a href="#">Task<span class="logo_colour"> Management </span></a>
					</h1>
				</div>
			</div>
		</div>
	</div>
</head>
<body align="center">


	<c:url var="addAction" value="/taskadd/new"></c:url>

	<h1>Add a Task</h1>


	<form:form action="${addAction}" commandName="task">
		<table align="center">
			<c:if test="${!empty task.name}">
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
				<td><form:input path="name" required="required" /></td>
			</tr>
			<tr>
				<td><form:label path="date">
						<spring:message text="Date" />
					</form:label></td>
				<td><form:input type="date" min="2000-01-02" path="date"
						required="required" /></td>
			</tr>
			<tr>
				<td><form:label path="stime">
						<spring:message text="Start Time" />
					</form:label></td>
				<td><form:input type="time" path="stime" required="required" /></td>
			</tr>
			<tr>
				<td><form:label path="etime">
						<spring:message text="End Time" />
					</form:label></td>
				<td><form:input type="time" path="etime" required="required" /></td>
			</tr>

			<tr>
				<td><form:label path="objtask">
						<spring:message text="Objetive of Task" />
					</form:label></td>
				<td><form:input path="objtask" required="required" /></td>
			</tr>
			<tr>
				<td><form:label path="tstatus">
						<spring:message text="Task Status" />
					</form:label></td>
				<td><select name="tstatus">
						<option selected="selected" value="New">New</option>
						<option value="Started">Started</option>
						<option value="Completed">Completed</option>
				</select></td>
			</tr>

			<tr>
				<td colspan="2"><c:if test="${!empty task.name}">
						<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="<spring:message text="Edit Task"/>" />
					</c:if> <c:if test="${empty task.name}">
						<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="<spring:message text="Add Task"/>" />
					</c:if></td>
			</tr>
		</table>
	</form:form>

</body>
</html>