package com.sjl.neer.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sjl.neer.database.NeerDB;

public class OrderDAO {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addOrder(OrderDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "insert into orders (Product_id, Amount, User_id, Ordered_Quantity, Maximum_Quantity, OTP, Country, State, City, Address, lat, lng,Delivery_Date_Time) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);

			ps.setInt(1, dto.getProduct_id());
			ps.setFloat(2, dto.getAmount());
			ps.setInt(3, dto.getUser_id());
			ps.setInt(4, dto.getOrdered_quantity());
			ps.setInt(5, dto.getMaximum_quantity());
			ps.setString(6, dto.getOtp());
			ps.setString(7, dto.getCountry());
			ps.setString(8, dto.getState());
			ps.setString(9, dto.getCity());
			ps.setString(10, dto.getAddress());
			ps.setString(11, dto.getLat());
			ps.setString(12, dto.getLng());
			ps.setString(13, dto.getDelivery_date_time());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addOrder: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public boolean updateOrder(OrderDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "update  orders set  Amount=?, Ordered_Quantity=?, OTP=?, Delivery_Date_Time=?, Country=?, State=?, City=?, Address=?, lat=?, lng=? where order_id=?";
			ps = conn.prepareStatement(query);

			ps.setFloat(1, dto.getAmount());
			ps.setInt(2, dto.getOrdered_quantity());
			ps.setString(3, dto.getOtp());
			ps.setString(4, dto.getDelivery_date_time());
			ps.setString(5, dto.getCountry());
			ps.setString(6, dto.getState());
			ps.setString(7, dto.getCity());
			ps.setString(8, dto.getAddress());
			ps.setString(9, dto.getLat());
			ps.setString(10, dto.getLng());
			ps.setInt(11, dto.getOrder_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateOrder: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public boolean deleteOrder(int order_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "delete from orders where Order_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, order_id);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception at deleteOrder: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public boolean checkOtp(String otp, int order_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select otp from orders where Order_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, order_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString("otp").equalsIgnoreCase(otp)) {
					flag = true;
				}
			}

		} catch (Exception e) {
			System.out.println("+++Exception at checkOtp: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public OrderDTO getOrder(int order_id) {
		OrderDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select user.unique_id,product.name,Order_id, orders.Product_id, Amount, orders.User_id, orders.Status, Created_Date_Time, Ordered_Quantity, Maximum_Quantity, OTP, Delivery_Date_Time, Delivered_Date_Time, orders.Rating, orders.Country, orders.State, orders.City, orders.Address, orders.lat, orders.lng from neer.user,neer.product,neer.orders where order_id=? and orders.product_id=product.Product_Id and orders.user_id=user.user_Id";
			ps = conn.prepareStatement(query);
			ps.setInt(1, order_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new OrderDTO();
				dto.setProduct_name(rs.getString("product.name"));
				dto.setUnique_id(rs.getString("user.unique_id"));
				dto.setOrder_id(rs.getInt("Order_id"));
				dto.setProduct_id(rs.getInt("Product_id"));
				dto.setAmount(rs.getFloat("Amount"));
				dto.setUser_id(rs.getInt("User_id"));
				dto.setStatus(rs.getString("Status"));
				dto.setCreated_date_time(rs.getString("Created_Date_Time"));
				dto.setOrdered_quantity(rs.getInt("Ordered_Quantity"));
				dto.setMaximum_quantity(rs.getInt("Maximum_Quantity"));
				dto.setOtp(rs.getString("OTP"));
				dto.setDelivery_date_time(rs.getString("Delivery_Date_Time"));
				dto.setDelivered_date_time(rs.getString("Delivered_Date_Time"));
				dto.setRating(rs.getFloat("Rating"));
				dto.setCountry(rs.getString("Country"));
				dto.setState(rs.getString("State"));
				dto.setCity(rs.getString("City"));
				dto.setAddress(rs.getString("Address"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getOrder: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public int getOrderQuantity(int order_id) {
		int quantity = 0;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select Ordered_Quantity from orders where order_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, order_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				quantity = rs.getInt("Ordered_Quantity");
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getOrderQuantity: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return quantity;
		}
	}

	public ArrayList<OrderDTO> getAllOrdersByCompanyId(int company_id) {

		ArrayList<OrderDTO> list = new ArrayList<>();
		OrderDTO dto = null;

		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT Order_id,orders.Product_id,product.Name,orders.User_id,unique_id,Ordered_Quantity,Amount FROM orders,user,product where  orders.user_id=user.user_id and orders.product_id=product.Product_Id and company_id=? order by product.name";
			ps = conn.prepareStatement(query);
			ps.setInt(1, company_id);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new OrderDTO();
				dto.setOrder_id(rs.getInt("Order_id"));
				dto.setProduct_id(rs.getInt("Product_id"));
				dto.setProduct_name(rs.getString("product.name"));
				dto.setUser_id(rs.getInt("User_id"));
				dto.setUnique_id(rs.getString("Unique_id"));
				dto.setOrdered_quantity(rs.getInt("Ordered_Quantity"));
				dto.setAmount(rs.getFloat("Amount"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllOrdersByCompanyId: " + e);
		} finally {
			if (list.isEmpty()) {
				list = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return list;
		}
	}

	public ArrayList<OrderDTO> getAllOrdersByUserId(int user_id) {

		ArrayList<OrderDTO> list = new ArrayList<>();
		OrderDTO dto = null;

		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT Order_id,product.name,ordered_quantity,amount,created_Date_Time,status,otp FROM neer.orders,product where user_id=? and product.Product_Id=orders.product_id";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new OrderDTO();
				dto.setOrder_id(rs.getInt("Order_id"));
				dto.setProduct_name(rs.getString("product.name"));
				dto.setOrdered_quantity(rs.getInt("Ordered_Quantity"));
				dto.setAmount(rs.getFloat("Amount"));
				dto.setCreated_date_time(rs.getString("created_date_time"));
				dto.setStatus(rs.getString("status"));
				dto.setOtp(rs.getString("otp"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllOrdersByUserId: " + e);
		} finally {
			if (list.isEmpty()) {
				list = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return list;
		}
	}

	public int getOrderId(int user_id, int product_id) {
		int order_id = 0;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select order_id from orders where user_id=? and product_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			ps.setInt(2, product_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				order_id = rs.getInt("order_id");
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getOrderId: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return order_id;
		}

	}
}