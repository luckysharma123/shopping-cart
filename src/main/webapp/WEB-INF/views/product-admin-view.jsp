<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<header class="cart-header">
		<div class="cart-header_brand"> Spices Mart</div>
		<nav class="cart-nav">
			<ul class="cart-nav-items">
				<li class="cart-nav-item">Welcome ${name }</li>
				<li class="cart-nav-item"><b><a class="anchor" href="add">Add new product</a></b></li>
				<li class="cart-nav-item"><a href="cart.html">Admin
						Settings</a></li>
				<li class="cart-nav-item"><a href="/shopping">logout</a></li>
			</ul>
		</nav>
	</header>
	<div class="row">
		<c:if test="${not empty allproductlist }">
			<c:forEach var="product" items="${ allproductlist}">
				<div class="col-sm-3">
					<div
						style="max-width: 500px; height: 200px; background-color: powderblue;">
						<img src="getimage/?id=${product.productId}" />
					</div>
					</br> <b>Product Id : </b>${product.productId } </br> <b>Product Name : </b>${product.productName }
					</br> <b>Quantity : </b>${product.quantity } </br> <b>Price : </b>${product.price}
					</br> <b>Discount : </b> ${product.discount} </br> <a
						href="deleteproduct?productid=${ product.productId}">delete</a>| <a
						href="updateproduct?productid=${ product.productId}">update</a>
				</div>
			</c:forEach>
		</c:if>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>
<style>
img {
	width: 100%;
	height: 100%;
	display: block;
}

div {
	border: ridge;
	border-color: green;
}

body {
	color: green;
	background-color: black;
}

a.anchor {
	color: white;
}

.cart-header {
	background-color: black;
	width: 100%;
	padding: 8px 16px;
}
.cart-header>div{

    display: inline-block;
    vertical-align: middle;

}
.cart-header_brand{
    color:white;
    text-decoration: none;
    font-weight:bold;
    font-size: 22px;
}
.cart-nav{
    display: inline-block;
    text-align: right;
    width: calc(100% - 74px);
    vertical-align: middle;
    
}
.cart-nav-items{
    margin:0;
    padding:0;
    list-style: none;
    color: yellow;
    

}
.cart-nav-items a{
    text-decoration: none;
    color: yellow;
}
.cart-nav-item{
    display: inline-block;
    margin:0px 16px;;
}
.cart-nav-item a:hover,
.cart-nav-item a:active{
color:white;
border-bottom:5px solid white;

}
</style>