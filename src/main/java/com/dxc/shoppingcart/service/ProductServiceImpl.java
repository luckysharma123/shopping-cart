package com.dxc.shoppingcart.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxc.shoppingcart.entity.Order;
import com.dxc.shoppingcart.entity.Product;
import com.dxc.shoppingcart.model.UserProduct;
import com.dxc.shoppingcart.repository.OrderRepository;
import com.dxc.shoppingcart.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private OrderRepository orderRepository;

	@Override
	public List<Product> getAllProducts() {
		return productRepository.findAll();

	}


	@Override
	public void saveProduct(Product product) {
		productRepository.save(product);

	}

	@Override
	public Product getproduct(Integer pid) {

		return productRepository.findById(pid).get();
	}

	@Override
	public void deleteProduct(Integer pid) {
		productRepository.deleteById(pid);

	}


	@Override
	public void placeOrder(List<Product> cart,double totalcost) {
		List<UserProduct> list = new ArrayList<UserProduct>();
		Iterator<Product> itr= cart.iterator();
		while(itr.hasNext()) {
			Product product  = itr.next();
			UserProduct userProduct= new UserProduct(product.getProductId(),
					product.getProductName(), product.getQuantity(), 
					product.getPrice(),
					(product.getQuantity()*product.getPrice()-product.getQuantity()*product.getPrice()*product.getDiscount())/1000,
					product.getDiscount());
		    list.add(userProduct);
		}
		Order order = new Order();
		order.setProductList(list);
		order.setTotalCost(totalcost);
		orderRepository.save(order);
		
	}


	@Override
	public List<Order> getAllOrders() {
		return orderRepository.findAll();
	}
}
