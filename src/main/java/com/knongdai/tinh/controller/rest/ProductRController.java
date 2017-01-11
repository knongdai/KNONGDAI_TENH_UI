	package com.knongdai.tinh.controller.rest;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.knongdai.tinh.entities.Product;

@RestController
@CrossOrigin
@RequestMapping("/rest/product")

public class ProductRController {
	
	@Autowired
	private HttpHeaders httpHeader;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;
	
	/**
	 * Request product from API as get
	 * @return product as JSON 
	 */
	@RequestMapping(value="/get-all",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAllProducts(
			@RequestParam(required=true, defaultValue="0", name="page") int page,
			@RequestParam(required=true, defaultValue="0", name="limit") int limit
			){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/product/get-all-products?page="+page+"&limit="+limit, HttpMethod.GET, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Get Products with current date-time in local
	 * @param current_date
	 * @return products as JSON
	 */
	@RequestMapping(value="/get-by-current-date",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getProductsByCurrentDate(){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/product/get-by-current-date", HttpMethod.GET, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	
	/**
	 * Post product to product api
	 * @return product as JSON 
	 */
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addProducts(@RequestBody List<Product> p){
		System.out.println(p.size());
		try {
		HttpEntity<Object> request = new HttpEntity<Object>(p, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/product/", HttpMethod.POST, request, Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
		}
		catch (RestClientException restException) {
			 restException.printStackTrace();
		}
		return null;
		
	}
	
	/**
	 * Delete Data from product in API by id
	 * @param id
	 * @return product as JSON 
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	public ResponseEntity<Map<String,Object>> deleteProductById(@PathVariable int id){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/product/"+id, HttpMethod.DELETE, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	}
	
}
