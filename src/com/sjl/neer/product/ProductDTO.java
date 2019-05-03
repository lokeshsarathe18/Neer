package com.sjl.neer.product;

import java.io.Serializable;

public class ProductDTO implements Serializable {

	private int product_id, company_id;
	private String name;
	private float cost, quantity, rating;

	public ProductDTO() {

	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

}
