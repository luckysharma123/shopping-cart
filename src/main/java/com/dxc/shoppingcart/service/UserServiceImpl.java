package com.dxc.shoppingcart.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxc.shoppingcart.entity.User;
import com.dxc.shoppingcart.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserRepository userRepository;


	@Override
	public void addUser(User user) {
		userRepository.save(user);
	}

	@Override
	public boolean validateLogin(User user) {

		User regUser = userRepository.findById(user.getUsername()).get();
		
       if(regUser.getPassword().equals(user.getPassword())) {
    	   user.setRoles(regUser.getRoles());
    	   user.setFirstName(regUser.getFirstName());
    	   return true;
       }
       return false;
	}


}
