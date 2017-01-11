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

import com.knongdai.tinh.entities.SourceCategory;

@RestController
@CrossOrigin
@RequestMapping("/rest/source-category")

public class SourceCategoryRController {
	@Autowired
	private HttpHeaders httpHeader;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	/**
	 * Request source category from API as get
	 * @return source category as JSON 
	 */
	@RequestMapping(value="/get-all",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAllSourceCategory(){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source-category/", HttpMethod.GET, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	

	/**
	 * Post Data to source category in API
	 * @param scategory object
	 * @return source category as JSON 
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addSourceCategory(@RequestBody SourceCategory scategory){
		
		HttpEntity<Object> request = new HttpEntity<Object>(scategory, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source-category/", HttpMethod.POST, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Update Data from source category in API
	 * @param scategory object
	 * @return source category as JSON 
	 */
	@RequestMapping(value="/update",method=RequestMethod.PUT)
	public ResponseEntity<Map<String,Object>> updateSourceCategory(@RequestBody SourceCategory scategory){
		
		HttpEntity<Object> request = new HttpEntity<Object>(scategory, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source-category/", HttpMethod.PUT,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	}
	
	/**
	 * Delete Data from source category in API by id
	 * @param id
	 * @return source category as JSON
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	public ResponseEntity<Map<String,Object>> deleteSourceCategory(@PathVariable int id){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source-category/"+id, HttpMethod.DELETE, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
}
