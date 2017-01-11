package com.knongdai.tinh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value={"/","/home","/index"})
public class HomeController {
	
	/*
	 * Request home page
	 */
	@RequestMapping(value="", method = RequestMethod.GET)
	public String home(ModelMap m){
		m.addAttribute("title", "Home");
					/*	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
						if(!authentication.equals("")){
							
						}
						User user = (User)authentication.getPrincipal();
						System.out.println(user.getRoles().get(0).getRole());*/
		return "home/index";
	}
	
	/*
	 * Request home favorite page
	 */
	@RequestMapping(value="/wishlist", method = RequestMethod.GET)
	public String wishList(){
		return "home/wishlist";
	}
	
	/**
	 * Request product page
	 * @param m
	 * @return page product
	 */
	@RequestMapping(value="/product", method = RequestMethod.GET)
	public String products(ModelMap m){
		m.addAttribute("title", "product");
		return "home/product";
	}
	
	@RequestMapping(value="/compare", method = RequestMethod.GET)
	public String comparePrice(){
		return "home/compare";
	}
	
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String about(){
		return "home/about";
	}
	
	
}
