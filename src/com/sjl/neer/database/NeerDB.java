package com.sjl.neer.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class NeerDB implements DBData {

	private static Connection conn = null;

	private NeerDB() {

	}

	static {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);

		} catch (Exception e) {
			System.out.println("+++Exception in getConnection: " + e);
		}
	}

	public static Connection getConnection() {

		return conn;
	}

	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
