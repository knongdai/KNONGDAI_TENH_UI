package com.knongdai.tinh.service;

import com.knongdai.tinh.entities.User;

public interface UserService {	
	public User findUserByUserHash(String userHash);
	public int countUserByUserHash(String userHash);
	public boolean registerUser(String userHash);
}
