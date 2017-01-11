package com.knongdai.tinh.controller.rest;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.knongdai.tinh.entities.Farvorite;

@RestController
@CrossOrigin
@RequestMapping("/rest/farvorite")

public class FavoriteRController {
	
	@Autowired
	private HttpHeaders httpHeader;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	/**
	 * Request favorite from API as get
	 * @return favorite as JSON 
	 */
	@RequestMapping(value="/get-all",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAllFavorite(){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/favorite/", HttpMethod.GET, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	

	/**
	 * Post Data to favorite in API
	 * @param favorite object
	 * @return favorite as JSON 
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addFavorite(@RequestBody Farvorite favorite){
		
		HttpEntity<Object> request = new HttpEntity<Object>(favorite, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/favorite/", HttpMethod.POST, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Delete Data from favorite in API by id
	 * @param id
	 * @return favorite as JSON 
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	public ResponseEntity<Map<String,Object>> deleteFavoriteById(@PathVariable int id){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/history/"+id, HttpMethod.DELETE, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
}
