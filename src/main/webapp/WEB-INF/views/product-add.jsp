<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<b>Add new product</b>
	</h1>
	<form:form action="addproduct" method="post" modelAttribute="product"
		enctype="multipart/form-data">
		<form:hidden path="productId" />
		<table>

			<tr>
				<td>Enter the Product name</td>
				<td><form:input id="productName" path="productName"
						name="productName" /></td>
			</tr>
			<tr>
				<td>Enter the Quantity</td>
				<td><form:input id="quantity" path="quantity" name="quantity" /></td>
			</tr>
			<tr>
				<td>Enter the Price</td>
				<td><form:input id="price" path="price" name="price" /></td>
			</tr>
			<tr>
				<td>Enter the discount</td>
				<td><form:input id="discount" path="discount" name="discount" /></td>
			</tr>
			<tr>
				<td>upload image</td>
				<td><input type="file" name="file" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Add product" /></td>
				<td><input type="reset" value="cancel selections" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>
<style>
body {
	background-color:skyblue;
	align-content: center;
	height: 100%;
	width: 100%;
	background-size: 100%;
	color: white;
}

table {
	margin-left: auto;
	margin-right: auto;
}

h1 {
	text-align: center;
}
</style>