package com.knongdai.tinh.configuration.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component("ajaxAuthenticationSuccessHandler")
public class AjaxAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {			
			response.getWriter().print(determineTargetUrl(auth));
	        response.getWriter().flush();
	        
	}
	
	/*
	 * This method extracts the roles of currently logged-in user and returns
	 * appropriate URL according to his/her role.
	 */
	private String determineTargetUrl(Authentication authentication) {
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		List<String> roles = new ArrayList<String>();
		for (GrantedAuthority authority : authorities) {
			roles.add(authority.getAuthority());
		}
		if (roles.contains("ROLE_ADMIN")) {
			return "admin/dashboard";
		}
		else if(roles.contains("ROLE_USER"))
		{
			return "";
		}
		else
		{
			return "accessDenied";
		}

	}
	
	/*// Get API User from HttpSession
	private APIUser getAPIUser(){
		Authentication authentication =  SecurityContextHolder.getContext().getAuthentication();
		APIUser user = (APIUser) authentication.getPrincipal();
		return user;
	}*/

}
