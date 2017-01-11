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

import com.knongdai.tinh.entities.MainCategory;

@RestController
@CrossOrigin
@RequestMapping("/rest/main-category")

public class MainCategoryRController {

	@Autowired
	private HttpHeaders httpHeader;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	/**
	 * Request Main Category from api as get
	 * @return category as json 
	 */
	@RequestMapping(value="/get-all",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAllMainCategories(){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/main-category/", HttpMethod.GET,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	
	/**
	 * Request Main Category from api as get
	 * @return category as json 
	 */
	@RequestMapping(value="/get-main-category-object",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAllMainCategoryLists(){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/main-category/get-sub-category-list/", HttpMethod.GET,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Post data to main category api
	 * @return category as json 
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addNewMainCategory(@RequestBody MainCategory maincategory){
		
		HttpEntity<Object> request = new HttpEntity<Object>(maincategory, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/main-category/", HttpMethod.POST,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Delete data from main category api
	 * @return category as json 
	 */
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<Map<String,Object>> deleteMainCategoryById(@PathVariable int id){

		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/main-category/"+ id, HttpMethod.DELETE, request, Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Update data from main category api
	 * @return category as json 
	 */
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	public ResponseEntity<Map<String,Object>> updateMainCategoryById(@RequestBody MainCategory mainCategory){
		
		HttpEntity<Object> request = new HttpEntity<Object>(mainCategory, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/main-category/", HttpMethod.PUT, request, Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
}
