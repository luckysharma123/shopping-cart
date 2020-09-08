<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
<header class="cart-header">
        <div class="cart-header_brand">
        Spices Mart
        
        </div>
        <nav class="cart-nav">
        <ul class="cart-nav-items">
            <li class="cart-nav-item">Welcome ${name }</li>
            <li class="cart-nav-item">Enjoy Traditional Indian Spices Taste</li>
            <li class="cart-nav-item"><a href="cart.html">My Account</a></li>
            <li class="cart-nav-item"><a href="/shopping">logout</a></li>
        </ul>
        </nav>
        </header>
	<div class="row">
		<c:if test="${not empty allproductlist }">
			<c:forEach var="product" items="${ allproductlist}">
				<div class="col-sm-3" style="color: yellow">
					<div
						style="max-width: 500px; height: 200px; background-color: powderblue;">
						<img src="getimage/?id=${product.productId}" />
					</div><p style="color: white;">
					</br> <b>Product Name : </b>${product.productName }
					</br> <b>Price(per kg) : </b>${product.price}
					</br> <b>Discount : </b> ${product.discount} 
					</br><b>Quantity(in grams) :</b></p>
					<form:form modelAttribute="product" action="addtocart"
							method="post">
							
							<form:input style="background-color:yellow;" type="number" name="quantity"
									path="quantity" id="quantity" /></td>
							<form:input type="hidden" name="productName" path="productName"
								value="${product.productName}" />
							<form:input type="hidden" name="price" path="price"
								value="${product.price}" />

							<form:input type="hidden" name="discount" path="discount"
								value="${product.discount}" />

							<form:input  type="hidden" name="productid" path="productId"
								value="${product.productId}" />
							</br></br><input class="carticon" type="submit" value="addtocart"></input>
						</form:form>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<h1><b>Cart</b></h1>
	<div class="row">
		<c:if test="${not empty cart }">
			<c:forEach var="product" items="${ cart}">
				<div class="col-sm-3">
					<div
						style="max-width: 500px; height: 200px; background-color: powderblue;">
						<img src="getimage/?id=${product.productId}" />
					</div>
					</br> <b>Product Name : </b>${product.productName }
					</br> <b>Price : </b>${product.price}
					</br> <b>Discount : </b> ${product.discount} 
					</br><b>Quantity : </b>${product.quantity}
					</br><a
							href="deletefromcart?productid=${ product.productId}&quantity=${product.quantity}">delete</a>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<b>totalcost is ${cost }</b></br>
	<a href="order">placeorder</a>
	<b>My orders</b>
	<table>
		<tbody>
			<c:if test="${not empty orderlist }">
				<c:forEach var="order" items="${orderlist }">
					<tr>
						<td>order id</td>
						<td>totalcost</td>

					</tr>
					<tr>
						<td>${order.orderId}</td>
						<td>${order.totalCost }</td>
					</tr>
					<tr>
						<td>product name</td>
						<td>quantity</td>
						<td>price(per kg)</td>
						<td>discount</td>
						<td>totalprice(per item)</td>
					</tr>
					<c:if test="${not empty order.productList }">
						<c:forEach var="product" items="${order.productList }">
							<tr>
								<td>${product.productName}</td>
								<td>${product.quantity}</td>
								<td>${product.price}</td>
								<td>${product.discount}</td>
								<td>${product.totalpricePerItem }</td>
							</tr>
						</c:forEach>
					</c:if>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
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
	font-family: 'Exo 2', sans-serif;
}
.carticon:hover,
.carticon:active{
color:yellow;
background-color: black;
margin-bottom: 8px;

}
.carticon{
color: black;
    background:yellow;
    padding:6px 8px;
    border-radius: 8px;
    text-decoration: none;
    }
    .cart-header{

    background-color: black;
    width: 100%;
    padding: 8px 16px;
}
body{

    font-family: 'Anton', sans-serif;
    margin: 0;
    
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
