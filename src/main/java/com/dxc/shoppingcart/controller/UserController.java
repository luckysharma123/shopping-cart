package com.dxc.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dxc.shoppingcart.entity.User;
import com.dxc.shoppingcart.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String showRegisterPage(@ModelAttribute("login") User user) {

		return "login";

	}

	@PostMapping("/login")
	public String loginUser(@ModelAttribute("login") User user, BindingResult result,RedirectAttributes redirectAttributes) {
           
		
		if (result.hasErrors())
			return "login";
		else {
			if (userService.validateLogin(user)) {
				redirectAttributes.addFlashAttribute("name",user.getFirstName());
				if (user.getRoles().equals("admin"))
					return "redirect:/product/admin";
				else if (user.getRoles().equals("user"))
					return "redirect:/product/user";
			}
			return "login";

		}
	}

	@RequestMapping("/showregister")
	public String showRegister(@ModelAttribute("user") User user) {

		return "register";

	}

	@PostMapping("/register")
	public String registerUser(@ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors())
			return "register";
		else {
			userService.addUser(user);
			return "redirect:/";
		}

	}
	@RequestMapping("/role")
	public String selectRole() {
		return "role";
	}

}
