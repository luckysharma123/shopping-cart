package com.dxc.shoppingcart.service;

import java.util.List;

import com.dxc.shoppingcart.entity.Order;
import com.dxc.shoppingcart.entity.Product;

public interface ProductService {

	List<Product> getAllProducts();

	void saveProduct(Product product);

	Product getproduct(Integer pid);

	void deleteProduct(Integer pid);

	void placeOrder(List<Product> cart,double totalcost);

	List<Order> getAllOrders();

}
