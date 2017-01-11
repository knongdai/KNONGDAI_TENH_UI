package com.knongdai.tinh.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class PsarnetWebMvcConfiguration extends WebMvcConfigurerAdapter{
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("login/login");
		registry.addViewController("/register").setViewName("login/register");
		registry.addViewController("user/wishlist").setViewName("user/wishlist");
		registry.addViewController("/access-denied").setViewName("errors/403");
		registry.addViewController("/404").setViewName("errors/404");
	}
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
				.allowedMethods("GET","POST","DELETE","PUT","OPTIONS","PATCH")
				.allowedOrigins("*");
	}
}
