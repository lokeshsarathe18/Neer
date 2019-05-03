package com.sjl.neer.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sjl.neer.database.NeerDB;

public class CompanyDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addCompany(CompanyDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "insert into company( Owner_id, Name, Covering_Area, Mobile_No, Status, Country, State, City, Address, lat, lng) values(?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getOwner_id());
			ps.setString(2, dto.getName());
			ps.setFloat(3, dto.getCovering_area());
			ps.setString(4, dto.getMobile_no());
			ps.setString(5, dto.getStatus());
			ps.setString(6, dto.getCountry());
			ps.setString(7, dto.getState());
			ps.setString(8, dto.getCity());
			ps.setString(9, dto.getAddress());
			ps.setString(10, dto.getLat());
			ps.setString(11, dto.getLng());

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addCompany: " + e);
		} finally {
				
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateCompany(CompanyDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "update company set Owner_id=?, Name=?, Covering_Area=?, Mobile_No=?, Status=?, Country=?, State=?, City=?, Address=?, lat=?, lng=? where Company_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, dto.getOwner_id());
			ps.setString(2, dto.getName());
			ps.setFloat(3, dto.getCovering_area());
			ps.setString(4, dto.getMobile_no());
			ps.setString(5, dto.getStatus());
			ps.setString(6, dto.getCountry());
			ps.setString(7, dto.getState());
			ps.setString(8, dto.getCity());
			ps.setString(9, dto.getAddress());
			ps.setString(10, dto.getLat());
			ps.setString(11, dto.getLng());
			ps.setInt(12, dto.getCompany_id());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("+++Exception in updateCompany: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}

	}

	public boolean deleteCompany(int company_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "delete from company where Company_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, company_id);

			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception at deleteCompany: " + e);
		} finally {
			ps = null;
			conn = null;
			return flag;

		}
	}

	public CompanyDTO getCompany(int company_id) {
		CompanyDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select * from company where Company_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, company_id);
			rs = ps.executeQuery();

			if (rs.next()) {
				dto = new CompanyDTO();
				dto.setCompany_id(rs.getInt("Company_id"));
				dto.setOwner_id(rs.getString("Owner_id"));
				dto.setName(rs.getString("Name"));
				dto.setRating(rs.getFloat("Rating"));
				dto.setCovering_area(rs.getFloat("Covering_Area"));
				dto.setMobile_no(rs.getString("Mobile_No"));
				dto.setStatus(rs.getString("Status"));
				dto.setCreated_date_time(rs.getString("Created_Date_Time"));
				dto.setCountry(rs.getString("Country"));
				dto.setState(rs.getString("State"));
				dto.setCity(rs.getString("City"));
				dto.setAddress(rs.getString("Address"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getCompany: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return dto;
		}
	}

	public ArrayList<CompanyDTO> getAllCompanies() {

		ArrayList<CompanyDTO> list = new ArrayList<>();
		CompanyDTO dto = null;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select * from company";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			while (rs.next()) {
				dto = new CompanyDTO();
				dto.setCompany_id(rs.getInt("Company_id"));
				dto.setOwner_id(rs.getString("Owner_id"));
				dto.setName(rs.getString("Name"));
				dto.setRating(rs.getFloat("Rating"));
				dto.setCovering_area(rs.getFloat("Covering_Area"));
				dto.setMobile_no(rs.getString("Mobile_No"));
				dto.setStatus(rs.getString("Status"));
				dto.setCreated_date_time(rs.getString("Created_Date_Time"));
				dto.setCountry(rs.getString("Country"));
				dto.setState(rs.getString("State"));
				dto.setCity(rs.getString("City"));
				dto.setAddress(rs.getString("Address"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));

				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("+++Exception at getAllCompanies: " + e);
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