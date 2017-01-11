package com.knongdai.tinh.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.knongdai.tinh.entities.User;

@Service("CustomUserDetailService")
public class CustomUserDetailService implements UserDetailsService{
	
	@Autowired
	private UserServiceImpl userService;
	
	@Override
	public UserDetails loadUserByUsername(String userHash) throws UsernameNotFoundException {
		User user = userService.findUserByUserHash(userHash);
		if(user == null){
			System.out.println("User not found");
			throw new UsernameNotFoundException("User not found");
		}
		return user;
	}
}
