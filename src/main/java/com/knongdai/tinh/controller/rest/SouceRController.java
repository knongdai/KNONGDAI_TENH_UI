package com.knongdai.tinh.controller.rest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
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

import com.knongdai.tinh.entities.Product;
import com.knongdai.tinh.entities.Source;


@RestController
@CrossOrigin
@RequestMapping("/rest/source")

public class SouceRController {

	@Autowired
	private HttpHeaders httpHeader;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String WS_URL;

	/**
	 * Test Scrape Data..
	 * @param sc
	 * @return
	 */
			@RequestMapping(value="/testscrape", method = RequestMethod.POST)
			public ResponseEntity<Map<String, Object>> testScrape(@RequestBody Source sc){
				   ArrayList<Product>arr = new ArrayList<>();
				   Map<String, Object> map = new HashMap<>();
				   try {
						org.jsoup.nodes.Document doc =Jsoup.connect(sc.getSourceCategory()).userAgent("Mozila").timeout(6000).get();
						Elements els = doc.select(sc.getRowsselector());
						for(Element el : els){
							String title=el.select(sc.getTitleselector()).text();
							String image=el.select(sc.getImageselector()).attr(sc.getImageattribute());
							String price=el.select(sc.getPriceselector()).text();
							String link=el.select(sc.getLinkselector()).attr("href");
							
							Product p = new Product();
							p.setTitle(title);
							p.setImage(image);
							p.setPrice(price);
							p.setUrl(link);
							arr.add(p);
						}
						map.put("MESSAGE", "SUCCESS");
						map.put("STATUS", true);
						map.put("DATA", arr);
					} catch (IOException e) {
						e.printStackTrace();
					}
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			}
			
			//end new update
	
	/**
	 * Request source from API as get
	 * @return source as JSON 
	 */
	@RequestMapping(value="/get-all",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getAllSource(){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source/", HttpMethod.GET, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Request source objec from API as get
	 * @return source as JSON 
	 */
	@RequestMapping(value="/get-object",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getSourceObject(){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source/get-object", HttpMethod.GET, request,Map.class);

		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}

	/**
	 * Post Data to source in API
	 * @param source object
	 * @return source as JSON 
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> addSource(@RequestBody Source source){
		
		HttpEntity<Object> request = new HttpEntity<Object>(source, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source/", HttpMethod.POST, request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
	
	/**
	 * Update Data from source in API
	 * @param source object
	 * @return source as JSON 
	 */
	@RequestMapping(value="/update",method=RequestMethod.PUT)
	public ResponseEntity<Map<String,Object>> updateSource(@RequestBody Source source){
		
		HttpEntity<Object> request = new HttpEntity<Object>(source, httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source/", HttpMethod.PUT,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	}
	
	/**
	 * Delete Data from source in API by id
	 * @param id
	 * @return source as JSON 
	 */
	@RequestMapping(value="/delete/{id}",method=RequestMethod.DELETE)
	public ResponseEntity<Map<String,Object>> deleteSource(@PathVariable int id){
		
		HttpEntity<Object> request = new HttpEntity<Object>(httpHeader);
		ResponseEntity<Map> response = rest.exchange(WS_URL+"/source/"+id, HttpMethod.DELETE,request,Map.class);
		
		return new ResponseEntity<Map<String,Object>>(response.getBody(),HttpStatus.OK);
	
	}
}
