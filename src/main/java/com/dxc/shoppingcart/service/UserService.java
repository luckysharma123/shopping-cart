package com.dxc.shoppingcart.service;

import com.dxc.shoppingcart.entity.User;

public interface UserService {

	void addUser(User user);

	boolean validateLogin(User user);

}
