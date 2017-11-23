<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<title>Login page</title>
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


.login {
	background: #eceeee;
	border: 1px solid #42464b;
	border-radius: 6px;
	height: 257px;
	margin: 20px auto 0;
	width: 298px;
}

input[type="password"],input[type="text"] {
	background: url('http://i.minus.com/ibhqW9Buanohx2.png') center left
		no-repeat, linear-gradient(top, #d6d7d7, #dee0e0);
	border: 1px solid #a1a3a3;
	border-radius: 4px;
	box-shadow: 0 1px #fff;
	box-sizing: border-box;
	color: #696969;
	height: 39px;
	margin: 31px 0 0 29px;
	padding-left: 37px;
	transition: box-shadow 0.3s;
	width: 240px;
}

input[type="password"]:focus,input[type="text"]:focus {
	box-shadow: 0 0 4px 1px rgba(55, 166, 155, 0.3);
	outline: 0;
}

.show-password {
	display: block;
	height: 16px;
	margin: 26px 0 0 28px;
	width: 87px;
}

input[type="checkbox"] {
	cursor: pointer;
	height: 16px;
	opacity: 0;
	position: relative;
	width: 64px;
}

input[type="checkbox"]:checked {
	left: 29px;
	width: 58px;
}

.toggle {
	background: url(http://i.minus.com/ibitS19pe8PVX6.png) no-repeat;
	display: block;
	height: 16px;
	margin-top: -20px;
	width: 87px;
	z-index: -1;
}

input[type="checkbox"]:checked+.toggle {
	background-position: 0 -16px
}

.forgot {
	color: #7f7f7f;
	display: inline-block;
	float: right;
	font: 12px/1 sans-serif;
	left: -19px;
	position: relative;
	text-decoration: none;
	top: 5px;
	transition: color .4s;
}

.forgot:hover {
	color: #3b3b3b
}

input[type="submit"] {
	width: 240px;
	height: 35px;
	display: block;
	font-family: Arial, "Helvetica", sans-serif;
	font-size: 16px;
	font-weight: bold;
	color: #fff;
	text-decoration: none;
	text-transform: uppercase;
	text-align: center;
	text-shadow: 1px 1px 0px #37a69b;
	padding-top: 6px;
	margin: 29px 0 0 29px;
	position: relative;
	cursor: pointer;
	border: none;
	background-color: #37a69b;
	background-image: linear-gradient(top, #3db0a6, #3111);
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	border-bottom-left-radius: 5px;
	box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #497a78, 0px 10px
		5px #999;
}

.shadow {
	background: #000;
	border-radius: 12px 12px 4px 4px;
	box-shadow: 0 0 20px 10px #000;
	height: 12px;
	margin: 30px auto;
	opacity: 0.2;
	width: 270px;
}

input[type="submit"]:active {
	top: 3px;
	box-shadow: inset 0px 1px 0px #2ab7ec, 0px 2px 0px 0px #31524d, 0px 5px
		3px #999;
}
</style>
<div id="main">
	<div id="header">
		<div id="logo">
			<div id="logo_text">

				<h1 align="center">
					<a href="#">Task<span class="logo_colour"> Management </span></a>
				</h1>
			</div>
		</div>
	</div>
</div></head>
<body>

<h1>${param.alert}</h1>
<div class="login">

	<c:url var="addAction" value="/login/add"></c:url>
	<form:form  action="${addAction}" >


		<!--<form:label path="username">
						<spring:message text="Username" />
					</form:label>-->
				<form:input path="username" placeholder="User name"  required="required" />
				
				<!--<form:label path="password">
						<spring:message text="Password" />
					</form:label>
					-->
					<form:input type="password" path="password" placeholder="Password"  required="required" />
					
					
					<input type="submit"
				value="<spring:message text="Login"/>" />
				
	</form:form>
</div>

</body>
</html>