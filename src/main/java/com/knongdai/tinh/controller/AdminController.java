package com.knongdai.tinh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.knongdai.tinh.entities.Product;

@Controller
@RequestMapping("/admin")
public class AdminController {

	/*
	 * Test scrape
	 */
	@RequestMapping(value="/testscrap", method = RequestMethod.POST)
	public ModelAndView scrape(@RequestParam("url") String url,@RequestParam("rowselector") String row ,
		   @RequestParam("imageselector") String imageselector ,@RequestParam("imageattribute") String imageattribute,@RequestParam("linkselector") String linkselector,@RequestParam("titleselector") String titleselector,@RequestParam("priceselector") String priceselector){
		   ArrayList<Product>arr=new ArrayList<>();
		   Map<String, Object> model = new HashMap<String, Object>();
		   try {
				org.jsoup.nodes.Document doc =Jsoup.connect(url).userAgent("Mozila").timeout(6000).get();
				Elements els=doc.select(row);
				for(Element el:els){
					String title=el.select(titleselector).text();
					String image=el.select(imageselector).attr(imageattribute);
					String price=el.select(priceselector).text();
					String link=el.select(linkselector).attr("href");
					Product p=new Product();
					p.setTitle(title);
					p.setImage(image);
					p.setPrice(price);
					p.setUrl(link);
					arr.add(p);
				}
				
			    model.put("productlist",arr);
			
			} catch (IOException e) {
				e.printStackTrace();
			}
		return new ModelAndView("admin/testscrap", "model", model);
	}
	
	
	/*
	 * Request dashboard page
	 */
	@RequestMapping(value="/dashboard", method = RequestMethod.GET)
	public String dashboard(ModelMap m)
	{
		m.addAttribute("title", "Dashboard");
		return "admin/dashboard";
	}
	
	/*
	 * Request user page
	 */
	@RequestMapping(value="/user", method = RequestMethod.GET)
	public String user(ModelMap m)
	{
		m.addAttribute("title", "Admin >> User");
		return "admin/user";
	}
	
	/*
	 * Request user page
	 */
	@RequestMapping(value="/changepassword", method = RequestMethod.GET)
	public String changePassword(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Password");
		return "admin/changepassword";
	}
	
	/*
	 * Request source page
	 */
	@RequestMapping(value="/source", method = RequestMethod.GET)
	public String source(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Source");
		return "admin/source";
	}
	
	/*
	 * Request source-category page
	 */
	@RequestMapping(value="/sourcecategory", method = RequestMethod.GET)
	public String sourceCategory(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Source-Category");
		return "admin/sourcecategory";
	}
	
	/*
	 * Request main-category page
	 */
	@RequestMapping(value="/maincategory", method = RequestMethod.GET)
	public String mainCategory(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Main-Category");
		return "admin/maincategory";
	}
	
	/*
	 * Request sub-one-category page
	 */
	@RequestMapping(value="/subonecategory", method = RequestMethod.GET)
	public String subOneCategory(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Sub-One-Category");
		return "admin/subonecategory";
	}
	
	/*
	 * Request sub-two-category page
	 */
	@RequestMapping(value="/subtwocategory", method = RequestMethod.GET)
	public String subTwoCategory(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Sub-two-Category");
		return "admin/subtwocategory";
	}
	
	/*
	 * Request add-module page
	 */
	@RequestMapping(value="/addmodule", method = RequestMethod.GET)
	public String addModule(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Add-Module");
		return "admin/addmodule";
	}
	
	/*
	 * Request map-category page
	 */
	@RequestMapping(value="/mapcategory", method = RequestMethod.GET)
	public String mapCategory(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Mapping-Category");
		return "admin/mapcategory";
	}
	
	/**
	 * Request test scrapping page
	 * @param m
	 * @return
	 */
	@RequestMapping(value="/testscrap", method = RequestMethod.GET)
	public String scraptesting(ModelMap m)
	{
		m.addAttribute("title", "Admin >> Test-Scrape");
		return "admin/testscrap";
	}

}
