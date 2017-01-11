package com.knongdai.tinh.entities;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SubOneCategory {
	
	@JsonProperty("ID")
	private int subonecategoryid;
	
	@JsonProperty("SUB_CATEGORY")
	private String categoryname;
	
	@JsonProperty("DATE")
	private String datecreate;
	
	@JsonProperty("MAIN_CATEGORY")
	private MainCategory mainCategory;
	
	public int getSubonecategoryid() {
		return subonecategoryid;
	}
	public void setSubonecategoryid(int subonecategoryid) {
		this.subonecategoryid = subonecategoryid;
	}
	public MainCategory getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(MainCategory mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getDatecreate() {
		return datecreate;
	}
	public void setDatecreate(String datecreate) {
		this.datecreate = datecreate;
	}
	
	
}
