package com.sjl.neer.worker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import com.sjl.neer.database.NeerDB;

public class WorkerDAO {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addWorker(int user_id, int company_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "insert into worker ( user_id, company_id) values(?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			ps.setInt(2, company_id);

			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("+++Exception at addWorker: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return flag;
		}
	}

	public int getCompanyId(int user_id) {
		int company_id = 0;
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "select company_id from worker where user_id=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				company_id = rs.getInt("company_id");
			}
		} catch (Exception e) {
			System.out.println("+++Exception at getCompanyId: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return company_id;
		}
	}
	
	public HashMap<Integer, String> getCompany_id_name(int user_id) {
		HashMap<Integer, String> map = new HashMap<>();
		try {
			if (conn == null) {
				conn = NeerDB.getConnection();
			}
			String query = "SELECT worker.Company_id,Name FROM neer.company,worker where user_id=? and worker.Company_id=company.Company_id";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				map.put(rs.getInt("worker.Company_id"), rs.getString("Name"));
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

	public static void main(String[] args) {
		System.out.println(new WorkerDAO().getCompany_id_name(3));
	}
}
