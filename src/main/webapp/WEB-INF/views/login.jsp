<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>Welcome To Spices Mart</h1>
		<form:form action="login" modelAttribute="login" method="post">

			<table>
				<tr>
					<td>Username</td>
					<td><form:input path="username" name="username" id="username" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><form:input type="password" path="password"
							name="password" id="password" /></td>
				</tr>
				<tr>
					<td><input id="buttons" type="submit" value="login" /></td>
					<td><input id="buttons" type="reset" value="Cancel" /></td>
				</tr>
			</table>
		</form:form>
		<b>Not A User? <a href="showregister">Click Here</a> to register
		</b>
	</div>
</body>
</html>
<style>
body {
	background-image:url("images/homepage.jpg");	
	background-color: black;
	align-content: center;
	color: white;
	height: 100%;
	width: 100%;
	background-size: 100%;
}

table {
	margin-left: auto;
	margin-right: auto;
}
a {
	color:  Blue;
}

div {
	height: 100%;
	text-align: center;
	
}
</style>