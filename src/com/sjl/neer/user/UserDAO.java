package com.sjl.neer.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.sjl.neer.database.NeerDB;
import com.sjl.neer.product.ProductDTO;

public class UserDAO {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addUser(UserDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "insert into user (Unique_id, Name, Gender, DOB, Picture, Customer_Type, mobile_no, Password, Status) values(?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getUnique_id());
			ps.setString(2, dto.getName());
			ps.setString(3, String.valueOf(dto.getGender()));
			ps.setString(4, dto.getDob());
			ps.setString(5, dto.getPicture());
			ps.setString(6, String.valueOf(dto.getCustomer_type()));
			ps.setString(7, dto.getMobile_no());
			ps.setString(8, dto.getPassword());
			ps.setString(9, "u" + dto.getCustomer_type());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addUser: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public boolean updateUser(UserDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "update user set Name=?, Mobile_no=?,country=?, city=?, state=?, address=?, lat=?, lng=? where User_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());
			ps.setString(3, dto.getCountry());
			ps.setString(4, dto.getCity());
			ps.setString(5, dto.getState());
			ps.setString(6, dto.getAddress());
			ps.setString(7, dto.getLat());
			ps.setString(8, dto.getLng());
			ps.setInt(9, dto.getUser_id());
			
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateUser: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}

	}

	public boolean updateAddress(UserDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "update user set  Country=?, State=?, City=?, Address=?, lat=?, lng=? where User_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getCountry());
			ps.setString(2, dto.getState());
			ps.setString(3, dto.getCity());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getLat());
			ps.setString(6, dto.getLng());
			ps.setInt(7, dto.getUser_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateAddress: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public HashMap<Integer, String> checkUser(String username, String password) {
		HashMap<Integer, String> map = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select User_id,Customer_type from user where Unique_id=? AND password=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {
				map = new HashMap<>();
				map.put(rs.getInt("User_id"), rs.getString("Customer_type"));
			}

		} catch (Exception e) {
			System.out.println("+++Exception at checkUser: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return map;
		}

	}

	public boolean deleteUser(int user_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "delete from user where User_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception at deleteUser: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public UserDTO getUser(int user_id) {
		UserDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select * from user where User_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new UserDTO();
				dto.setUser_id(rs.getInt("User_id"));
				dto.setUnique_id(rs.getString("Unique_id"));
				dto.setName(rs.getString("Name"));
				dto.setGender(rs.getString("Gender").charAt(0));
				dto.setDob(rs.getString("DOB"));
				dto.setPicture(rs.getString("Picture"));
				dto.setCustomer_type(rs.getString("Customer_Type").charAt(0));
				dto.setMobile_no(rs.getString("Mobile_No"));
				dto.setPassword(rs.getString("Password"));
				dto.setStatus(rs.getString("Status"));
				dto.setCreated_date_time(rs.getString("Creadted_Date_Time"));
				dto.setAddress(rs.getString("address"));
				dto.setCountry(rs.getString("Country"));
				dto.setState(rs.getString("State"));
				dto.setCity(rs.getString("City"));
				dto.setAddress(rs.getString("Address"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));

			}

		} catch (Exception e) {
			System.out.println("+++Exception at getUser: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public UserDTO getAddress(int user_id) {
		UserDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select * from user where User_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new UserDTO();
				dto.setCountry(rs.getString("Country"));
				dto.setState(rs.getString("State"));
				dto.setCity(rs.getString("City"));
				dto.setAddress(rs.getString("Address"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAddress: " + e);
		} finally {
			
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public HashMap<String, Object> getUserID_MobileNo(String unique_id) {
		HashMap<String, Object> map= null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select user_id,mobile_no from user where Unique_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, unique_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				map=new HashMap<>();
				map.put("user_id", rs.getInt("user_id"));
				map.put("mobile_no", rs.getString("mobile_no"));
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getMobileNo: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return map;
		}
	}

	public HashMap<Integer, String> getCompany_id_name(int user_id) {
		HashMap<Integer, String> map = new HashMap<>();
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT Company_id,name FROM neer.company where owner_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				map.put(rs.getInt("Company_id"), rs.getString("Name"));
			}
		} catch (Exception e) {
			System.out.println("+++Exception at getCompany_id_name: " + e);
		} finally {
			if (map.isEmpty()) {
				map = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return map;
		}
	}


	public HashMap<Integer, String> getAllCompany_id_name() {
		HashMap<Integer, String> map = new HashMap<>();
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT Company_id,name FROM neer.company ";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				map.put(rs.getInt("Company_id"), rs.getString("Name"));
			}
		} catch (Exception e) {
			System.out.println("+++Exception at getAllCompany_id_name: " + e);
		} finally {
			if (map.isEmpty()) {
				map = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return map;
		}
	}

	
	
	public ArrayList<UserDTO> getAllUsers() {

		ArrayList<UserDTO> list = new ArrayList<>();
		UserDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select * from user";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new UserDTO();
				dto.setUser_id(rs.getInt("User_id"));
				dto.setUnique_id(rs.getString("Unique_id"));
				dto.setName(rs.getString("Name"));
				dto.setGender(rs.getString("Gender").charAt(0));
				dto.setDob(rs.getString("DOB"));
				dto.setPicture(rs.getString("Picture"));
				dto.setCustomer_type(rs.getString("Customer_Type").charAt(0));
				dto.setMobile_no(rs.getString("mobile_no"));
				dto.setPassword(rs.getString("Password"));
				dto.setStatus(rs.getString("Status"));
				dto.setCreated_date_time(rs.getString("Creadted_Date_Time"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllUsers: " + e);
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

	public ArrayList<UserDTO> getAllUsersByType(char Customer_Type) {

		ArrayList<UserDTO> list = new ArrayList<>();
		UserDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select * from user where Customer_Type=?";

			ps = conn.prepareStatement(query);
			ps.setString(1, "" + Customer_Type);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new UserDTO();
				dto.setUser_id(rs.getInt("User_id"));
				dto.setUnique_id(rs.getString("Unique_id"));
				dto.setName(rs.getString("Name"));
				dto.setGender(rs.getString("Gender").charAt(0));
				dto.setDob(rs.getString("DOB"));
				dto.setPicture(rs.getString("Picture"));
				dto.setCustomer_type(rs.getString("Customer_Type").charAt(0));
				dto.setMobile_no(rs.getString("mobile_no"));
				dto.setPassword(rs.getString("Password"));
				dto.setStatus(rs.getString("Status"));
				dto.setCreated_date_time(rs.getString("Creadted_Date_Time"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllUsersByType: " + e);
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
	
	public ArrayList<UserDTO> getAllWorkersByCompanyId(int company_id) {

		ArrayList<UserDTO> list = new ArrayList<>();
		UserDTO dto = null;

		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT Name, mobile_no FROM neer.user,worker where worker.user_id=user.User_id and company_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, company_id);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new UserDTO();
				dto.setName(rs.getString("Name"));
				dto.setMobile_no(rs.getString("mobile_no"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllWorkersByCompanyId: " + e);
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

	public ArrayList<UserDTO> getAllUsersByCompanyId(int company_id) {

		ArrayList<UserDTO> list = new ArrayList<>();
		UserDTO dto = null;

		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "Select Distinct user.Unique_id,mobile_no from user,orders where orders.user_id = user.User_id and product_id in (SELECT product_id FROM neer.product where company_id=?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, company_id);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new UserDTO();
				dto.setUnique_id(rs.getString("user.Unique_id"));
				dto.setMobile_no(rs.getString("mobile_no"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllUsersByCompanyId: " + e);
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

	public ArrayList<UserDTO> getLocationUnderRadius(float radius, float lat, float lng) {
		ArrayList<UserDTO> al = new ArrayList<UserDTO>();

		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT * FROM neer.user where sqrt(pow((lat-" + lat + "),2)+pow((lng-" + lng + "),2))<"
					+ radius + "/109.0319912594731";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserDTO dto = new UserDTO();
				dto = new UserDTO();
				dto.setUser_id(rs.getInt("user_id"));
				dto.setName(rs.getString("name"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getLocationUnderRadius:" + e);
		} finally {
			if (al.isEmpty()) {
				al = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}

	public ArrayList<String> getUserLocation(int user_id) {
		ArrayList<String> al = new ArrayList<>();
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT lat, lng FROM neer.user where user_id= " + user_id;
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				al.add(rs.getString("lat"));
				al.add(rs.getString("lng"));
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getUserLocation:" + e);
		} finally {
			if (al.isEmpty()) {
				al = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}

}