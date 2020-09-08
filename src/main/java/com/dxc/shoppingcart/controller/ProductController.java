package com.dxc.shoppingcart.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;


import com.dxc.shoppingcart.entity.Product;
import com.dxc.shoppingcart.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	private List<Product> cart = new CopyOnWriteArrayList<Product>();
	private double cartcost;
	private String firstname;
	public static Logger logger = Logger.getLogger(ProductController.class.getName());

	
	@RequestMapping("/admin")
	public String showAdminProduct(Model map) {
		String name = (String) map.asMap().get("name");
		if (name != null) {
			this.firstname = name;

		}
		map.addAttribute("name", firstname);
		map.addAttribute("allproductlist", productService.getAllProducts());

		return "product-admin-view";
	}

	@RequestMapping("/add")
	public String addAdminProduct(@ModelAttribute("product") Product product) {

		return "product-add";
	}

	@RequestMapping("/addproduct")
	public String addAdminProduct(@ModelAttribute("product") Product product, BindingResult result,
			@RequestPart MultipartFile file) {
		if (result.hasErrors())
			return "product-add";

		else {
			try {
				byte[] image = file.getBytes();
				product.setProductImage(image);
			} catch (IOException e) {
				e.printStackTrace();
			}

			productService.saveProduct(product);
			return "redirect:/product/admin";
		}

	}

	@RequestMapping("/getallproducts")
	public String getAllProducts(ModelMap map) {

		map.addAttribute("allproductlist", productService.getAllProducts());
		return "product-admin-view";

	}

	@RequestMapping("/updateproduct")
	public String getproduct(@RequestParam("productid") Integer pid, ModelMap map) {

		map.addAttribute("product", productService.getproduct(pid));
		return "product-add";

	}

	@RequestMapping("/deleteproduct")
	public String deleteproduct(@RequestParam("productid") Integer pid) {

		productService.deleteProduct(pid);

		return "redirect:/product/getallproducts";

	}

	
	@RequestMapping("/user")
	public String showUserPage(Model model) {
		logger.info("=======================================");
		String name = (String) model.asMap().get("name");
		if (name != null) {
			this.firstname = name;

		}
		model.addAttribute("name", firstname);
		model.addAttribute("allproductlist", productService.getAllProducts());
		model.addAttribute("cart", cart);
		model.addAttribute("cost", cartcost);
		model.addAttribute("product", new Product());
		model.addAttribute("orderlist", productService.getAllOrders());
		return "product-user-view";

	}

	@RequestMapping("/addtocart")
	public String addUserProduct(@ModelAttribute("product") Product product) {
		Product productdb = productService.getproduct(product.getProductId());
		int available = productdb.getQuantity();
		int quantity = product.getQuantity();
		double price = product.getPrice();
		float discount = product.getDiscount();
		if (quantity > 0 && quantity <= available) {
			cart.add(product);
			cartcost += (quantity * price - quantity * price * discount) / 1000;
			productdb.setQuantity(available - quantity);
			productService.saveProduct(productdb);
		}
		logger.info("=============" + "in add method" + "===========");
		return "redirect:/product/user";
	}

	@RequestMapping("/deletefromcart")
	public String deleteUserProduct(@RequestParam("productid") Integer id, @RequestParam("quantity") int required) {
		logger.info("=============" + "in delete method" + "===========");
		Product productdb = productService.getproduct(id);
		int quantity = productdb.getQuantity();
		double price = productdb.getPrice();
		float discount = productdb.getDiscount();
		Iterator<Product> iterator = cart.iterator();
		while (iterator.hasNext()) {
			Product product = iterator.next();
			logger.info("=============" + product + "===========");
			if (product.getProductId().equals(id)) {
				logger.info("========" + "in if loop" + "=============");
				cart.remove(product);
				cartcost -= (required * price - required * price * discount) / 1000;
				productdb.setQuantity(quantity + required);
				productService.saveProduct(productdb);

			}
		}

		return "redirect:/product/user";
	}

	@RequestMapping("/order")
	public String placeOrder() {
		if (cart.isEmpty())
			return "redirect:/product/user";
		else {
			productService.placeOrder(cart, cartcost);
			cart.removeAll(cart);
			cartcost = 0;
			return "redirect:/product/user";
		}
	}

	@GetMapping("getimage")
	public void showImage(@RequestParam("id") Integer productId, HttpServletResponse response,
			HttpServletRequest request) throws ServletException, IOException, SQLException {

		Product product = productService.getproduct(productId);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(product.getProductImage());

	}

}
