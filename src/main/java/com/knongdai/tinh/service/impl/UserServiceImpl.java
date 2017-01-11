package com.knongdai.tinh.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.knongdai.tinh.entities.Role;
import com.knongdai.tinh.entities.User;
import com.knongdai.tinh.entities.input.UserFrm;
import com.knongdai.tinh.service.UserService;

@Service
@PropertySource(
		value={"classpath:configuration.properties"}
)
public class UserServiceImpl implements UserService{

	@Autowired
	Environment environment;
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	//TODO : Get User Object by user hash
	@Override
	public User findUserByUserHash(String userHash) {
		try{
			HttpEntity<Object> request = new HttpEntity<Object>(header);
			ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/find-user-by-user-hash/"+userHash, HttpMethod.POST , request , Map.class);
			Map<String, Object> map = (HashMap<String, Object>)response.getBody();
			if(map.get("DATA") != null){
				Map<String , Object> data =  (Map<String, Object>) map.get("DATA");
				List<Role> roles = new ArrayList<>();
				User u = new User();
				u.setUserid((Integer) data.get("ID"));
				u.setUsername((String)data.get("USERNAME"));
				u.setPassword((String) data.get("PASSWORD"));
				u.setDescription((String) data.get("DESCRIPTION"));
				u.setUser_image((String) data.get("USER_IMAGE"));
				Role role = new Role();
				role.setRole((String)data.get("ROLE"));
				roles.add(role);
					
				u.setRoles(roles);
				return u;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//TODO : Count number of by user hash
	@Override
	public int countUserByUserHash(String userHash) {
		HttpEntity<Object> request = new HttpEntity<Object>(header);
		ResponseEntity<Map> response = rest.exchange(WS_URL + "/user/count-user-by-user-hash//"+userHash, HttpMethod.POST , request , Map.class);
		Map<String, Object> map = (HashMap<String, Object>)response.getBody();
		System.out.println("=====> "  + map.get("DATA"));
		if(map.get("DATA") != null){
			return (Integer) map.get("DATA");
		}
		return 0;
	}

	//TODO : Register user 
	@Override
	public boolean registerUser(String userHash) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String credentials = environment.getProperty("ACCOUNT.API.SECRET.HEADER");
		headers.set("Authorization", "Basic " + credentials);
		
		//TODO : Get user object by user hash from login.knongdai.com/knongdai/user/user-hash/{user-hash}
		HttpEntity<Object> request = new HttpEntity<Object>(headers);
		ResponseEntity<Map> response = rest.exchange(environment.getProperty("ACCOUNT.API.URL") + "/knongdai/user/user-hash/"+userHash, HttpMethod.POST , request , Map.class);
		Map<String, Object> map = (HashMap<String, Object>)response.getBody();
		System.out.println("=====> "  + map.get("DATA"));
		Map<String, Object> userMap = (Map<String, Object>) map.get("DATA");
		
		if(userMap != null){
			//TODO : If user object exists in KhmerAacademy Database, but user doesn't exist in TinhEy Database, so save user object in TinhEy Database
			UserFrm user = new UserFrm();
			user.setUsername((String)userMap.get("USERNAME"));
			user.setPassword((String)userMap.get("PASSWORD"));
			user.setUser_image((String)userMap.get("USER_IAMGE_URL"));
			user.setUser_hash((String)userMap.get("USER_HASH"));
			user.setRole("ROLE_USER");
			
			System.out.println("//TODO : If user exists in KhmerAacademy Database, but user doesn't exists in TinhEy Database, so save user in TinhEy Database");
			
			//TODO : Save user from KhmerAcademy into TinhEy Database 
			HttpEntity<Object> savedRequest = new HttpEntity<Object>(user,header);
			ResponseEntity<Map> savedResponse = rest.exchange(WS_URL + "/user/register", HttpMethod.POST , savedRequest , Map.class);
			Map<String, Object> savedMap = (HashMap<String, Object>)savedResponse.getBody();
			System.out.println("savedMap ====== > " + savedMap);
			return true;
		}else{
			System.out.println("//TODO : If user doesn't exists in KhmerAacademy.");
			return false;
			
		}
		
	
	}
}
