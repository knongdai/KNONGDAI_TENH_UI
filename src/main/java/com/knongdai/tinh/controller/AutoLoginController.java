package com.knongdai.tinh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.knongdai.tinh.entities.User;
import com.knongdai.tinh.service.UserService;

@Controller
public class AutoLoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/auto-login" , method= RequestMethod.GET)
	public String autoLogin(@RequestParam("user-hash") String userHash , @RequestParam(name="continue-site", required=false , defaultValue="http://www.knongdai.com") String continueSite) {
		try{
			
			//TODO : Find user by user hash from TinhEy Database 
			User user = userService.findUserByUserHash(userHash);
			
			//TODO : If user doesn't exit in TinhEy Database 
			if(user == null){
				//TODO : Get user from KhmerAcademy Database by user hash to save into TinhEy Database 
				if(userService.registerUser(userHash)){
					user = userService.findUserByUserHash(userHash);
					System.out.println("User from KhmerAcademy  has beend saved into TinhEy Database successfully! Username : "+  user.getUsername());
				}else{
					System.out.println("User from KhmerAcademy  has not beend saved into TinhEy Database");
				}
			}else{
				System.out.println("User aleady exists in KhmerAcademy and TinhEy Databaes.");
			}
			
			System.out.println("Username : " + user.getUsername());
			
			//TODO : Set User Object into Spring Security Authentication
			Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities());
	
			SecurityContext context = new SecurityContextImpl();
			
			//TODO : Set User authentication to SecurityContext
			context.setAuthentication(authentication);
			
			//TODO : store user information
			SecurityContextHolder.setContext(context);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:"+continueSite;

	}
	
}