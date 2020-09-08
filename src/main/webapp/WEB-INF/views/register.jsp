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
	<form:form action="register" modelAttribute="user" method="post">
		<table>
			<tr>
				<td>Firstname</td>
				<td><form:input id="firstname" path="firstName"
						name="firstname" /></td>
			</tr>
			<tr>
				<td>Lastname</td>
				<td><form:input path="lastName" name="lastname" id="lastname" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><form:input path="email" name="email" id="email" /></td>
			</tr>
			<tr>
				<td>Mobileno</td>
				<td><form:input path="mobileNo" name="mobileno" id="mobileno" /></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><form:input path="username" name="username" id="username" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><form:input type="password" path="password" name="password"
						id="password" /></td>
			</tr>
			<tr>
				<td>Role</td>
				<td><form:select path="roles" name="roles" id="roles">
						<form:option value="admin">Admin</form:option>
						<form:option value="user" selected="selected">User</form:option>
					</form:select></td>
			</tr>
			<tr>
				<td><input type="submit" value="Register"></td>
				<td><input type="reset" value="Cancel"></td>
			</tr>
		</table>
	</form:form>
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


div {
	height: 100%;
	text-align: center;

</style>