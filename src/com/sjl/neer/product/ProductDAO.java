package com.sjl.neer.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sjl.neer.database.NeerDB;
import com.sjl.neer.order.OrderDTO;

public class ProductDAO {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addProduct(ProductDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			
			
			String query = "insert into product (Company_id, Cost, Name, Quantity) values(?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getCompany_id());
			ps.setFloat(2, dto.getCost());
			ps.setString(3, dto.getName());
			ps.setFloat(4, dto.getQuantity());

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addProduct: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public boolean updateProduct(ProductDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "update product set Company_id=?, Cost=?, Name=?, Quantity=? where product_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getCompany_id());
			ps.setFloat(2, dto.getCost());
			ps.setString(3, dto.getName());
			ps.setFloat(4, dto.getQuantity());
			ps.setInt(5, dto.getProduct_id());

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateProduct: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}

	}

	public boolean deleteProduct(int product_id) {
		boolean flag = false;
		try {
			if (conn == null) {
					conn=NeerDB.getConnection();
			}
			String query="delete from product where product_id=?";
			ps=conn.prepareStatement(query);
		    ps.setInt(1, product_id);	
		    
		    if(ps.executeUpdate()>0) {
		    	flag=true;
		    }
		} catch (Exception e) {
			System.out.println("+++Exception at deleteProduct: "+e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	
	public int getCompanyID() {
		int company_id=0;
		
		
		return company_id;
	}
	
	
	public ProductDTO getProduct(int product_id) {
		ProductDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select * from product where product_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, product_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new ProductDTO();
				dto.setProduct_id(rs.getInt("Product_Id"));
				dto.setCompany_id(rs.getInt("Company_id"));
				dto.setName(rs.getString("Name"));
				dto.setCost(rs.getFloat("Cost"));
				dto.setQuantity(rs.getFloat("Quantity"));
				dto.setRating(rs.getFloat("Rating"));
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getProduct: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public ArrayList<ProductDTO> getAllProductsByCompanyId(int company_id) {

		ArrayList<ProductDTO> list = new ArrayList<>();
		ProductDTO dto = null;

		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT Name, Cost,product_id FROM product where company_id=? order by product.name";
			ps = conn.prepareStatement(query);
			ps.setInt(1, company_id);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new ProductDTO();
				dto.setName(rs.getString("Name"));
				dto.setCost(rs.getFloat("Cost"));
				dto.setProduct_id(rs.getInt("product_id"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllProductsByCompanyId: " + e);
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


	
	public ArrayList<ProductDTO> getAllProducts() {

		ArrayList<ProductDTO> list = new ArrayList<>();
		ProductDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select * from product";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new ProductDTO();
				dto.setProduct_id(rs.getInt("Product_Id"));
				dto.setCompany_id(rs.getInt("Company_id"));
				dto.setName(rs.getString("Name"));
				dto.setCost(rs.getFloat("Cost"));
				dto.setQuantity(rs.getFloat("Quantity"));
				dto.setRating(rs.getFloat("Rating"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllProducts: " + e);
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

}