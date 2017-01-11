package com.knongdai.tinh.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Product {
	
	@JsonProperty("ID")
	private long productid;
	
	@JsonProperty("TITLE")
	private String title;
	
	@JsonProperty("PRICE")
	private String price;
	
	@JsonProperty("IMAGE")
	private String image;
	
	@JsonProperty("URL")
	private String url;
	
	@JsonProperty("DESCRIPTION")
	private String description;
	
	@JsonProperty("DATE")
	private String datecreate;
	
	@JsonProperty("CATEGORY")
	private SubTwoCategory subtwoCategory;
	
	@JsonProperty("SOURCE")
	private SourceCategory sourceCategory;
	
	public long getProductid() {
		return productid;
	}
	public void setProductid(long productid) {
		this.productid = productid;
	}
	public SubTwoCategory getSubtwoCategory() {
		return subtwoCategory;
	}
	public void setSubtwoCategory(SubTwoCategory subtwoCategory) {
		this.subtwoCategory = subtwoCategory;
	}
	public SourceCategory getSourceCategory() {
		return sourceCategory;
	}
	public void setSourceCategory(SourceCategory sourceCategory) {
		this.sourceCategory = sourceCategory;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDatecreate() {
		return datecreate;
	}
	public void setDatecreate(String datecreate) {
		this.datecreate = datecreate;
	}
	
	
}
