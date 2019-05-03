package com.sjl.neer.order;

import java.io.Serializable;

public class OrderDTO implements Serializable {

	private int order_id, product_id, user_id, ordered_quantity, maximum_quantity;
	private String unique_id,product_name, status, created_date_time, otp, delivery_date_time, delivered_date_time, country, state,
			city, address, lat, lng;
	private float amount, rating;

	public OrderDTO() {

	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(String unique_id) {
		this.unique_id = unique_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getOrdered_quantity() {
		return ordered_quantity;
	}

	public void setOrdered_quantity(int ordered_quantity) {
		this.ordered_quantity = ordered_quantity;
	}

	public int getMaximum_quantity() {
		return maximum_quantity;
	}

	public void setMaximum_quantity(int maximum_quantity) {
		this.maximum_quantity = maximum_quantity;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreated_date_time() {
		return created_date_time;
	}

	public void setCreated_date_time(String created_date_time) {
		this.created_date_time = created_date_time;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public String getDelivery_date_time() {
		return delivery_date_time;
	}

	public void setDelivery_date_time(String delivery_date_time) {
		this.delivery_date_time = delivery_date_time;
	}

	public String getDelivered_date_time() {
		return delivered_date_time;
	}

	public void setDelivered_date_time(String delivered_date_time) {
		this.delivered_date_time = delivered_date_time;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}
}
