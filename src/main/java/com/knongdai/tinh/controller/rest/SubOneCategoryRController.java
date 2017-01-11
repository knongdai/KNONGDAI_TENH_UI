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

import com.knongdai.tinh.entities.SubOneCategory;

@RestController
@CrossOrigin
@RequestMapping("/rest/sub-one-category")

public class SubOneCategoryRController {
	
	@Autowired
	private HttpHeaders httpHeader;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	/**
	 * Request Sub one Category from API as get
	 * @return category as json 
	 */
	@RequestMapping(value="/get-all",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAllSubOneCategories(){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/sub-one-category/", HttpMethod.GET,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	

	/**
	 * Post Data to Sub one Category in API
	 * @param category object
	 * @return category as json 
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addSubOneCategory(@RequestBody SubOneCategory category){
		
		HttpEntity<Object> request = new HttpEntity<Object>(category, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/sub-one-category/", HttpMethod.POST,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Update Data from Sub one Category in API
	 * @param category object
	 * @return category as json 
	 */
	@RequestMapping(value="/update",method=RequestMethod.PUT)
	public ResponseEntity<Map<String,Object>> updateSubOneCategory(@RequestBody SubOneCategory category){
		System.out.println(category.getCategoryname()+""+category.getSubonecategoryid());
		
		HttpEntity<Object> request = new HttpEntity<Object>(category, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/sub-one-category/", HttpMethod.PUT,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	}
	
	/**
	 * Delete Data from Sub one Category in API by id
	 * @param id
	 * @return category as json 
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	public ResponseEntity<Map<String,Object>> deleteSubOneCategory(@PathVariable int id){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/sub-one-category/"+id, HttpMethod.DELETE,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
}
