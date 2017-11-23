<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Task Page</title>
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
					<a href="#">Task<span class="logo_colour"> Management </span></a>
				</h1>
			</div>
		</div>
	</div>
</div>
</head>
<body align="center">
<h1 align="left">Welcome ${param.message}</h1>
<form action="http://localhost:8080/TaskManagement/taskadd">
    <input type="submit" value="Add Task" />
</form>
<!-- 
	<h1>Add a Task</h1>

	<c:url var="addAction" value="/task/add"></c:url>

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
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="date">
						<spring:message text="Date" />
					</form:label></td>
				<td><form:input type="date" min="2000-01-02" path="date" /></td>
			</tr>
			<tr>
				<td><form:label path="stime">
						<spring:message text="Start Time" />
					</form:label></td>
				<td><form:input type="time" path="stime" /></td>
			</tr>
			<tr>
				<td><form:label path="etime">
						<spring:message text="End Time" />
					</form:label></td>
				<td><form:input type="time" path="etime" /></td>
			</tr>

			<tr>
				<td><form:label path="objtask">
						<spring:message text="Objetive of Task" />
					</form:label></td>
				<td><form:input path="objtask" /></td>
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
	<br> -->
	<h3>Task List</h3>
	<c:if test="${!empty listTasks}">
		<table class="tg" align="center">
			<tr>
				<th width="80">Task ID</th>
				<th width="120">Task Name</th>

				<th width="120">Task Date</th>
				<th width="120">Task Start Time</th>
				<th width="120">Task End Time</th>
				<th width="120">Task Objective</th>
				<th width="120">Task Status</th>
				<th width="60">Edit</th>
				<th width="60">Delete</th>
			</tr>
			<c:forEach items="${listTasks}" var="task">
				<tr>
					<td>${task.id}</td>
					<td>${task.name}</td>

					<td>${task.date}</td>
					<td>${task.stime}</td>
					<td>${task.etime}</td>
					<td>${task.objtask}</td>
					<td>${task.tstatus}</td>
					<td><a href="<c:url value='/edit/${task.id}' />">Edit</a></td>
					<td><a href="<c:url value='/remove/${task.id}' />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
