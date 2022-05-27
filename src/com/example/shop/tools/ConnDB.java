package com.example.shop.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnDB {
	public Connection conn = null;
	public Statement stmt = null;
	public ResultSet rs = null;
	private static String dbClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String dbUrl = "jdbc:sqlserver://localhost:1433;DatabaseName=db_good";
	private static String dbUser = "sa";	//SQL Server
	private static String dbPwd = "guankaiwen1";	//SQL Server


	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(dbClassName).newInstance();
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		if (conn == null) {
			System.err.println("DbConnectionManager.getConnection():" + dbClassName + "\r\n :" + dbUrl + "\r\n "
					+ dbUser + "/" + dbPwd);
		}
		return conn;
	}


	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			result = 0;
			ex.printStackTrace();
		}
		try {
			stmt.close();
		} catch (SQLException ex1) {
			ex1.printStackTrace();
		}
		return result;
	}

	public ResultSet executeQuery(String sql) {
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return rs;
	}
	

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}


	public static void main(String[] args) {
		if (getConnection() != null) {
			System.out.print("Database connection succeeded");
		}
	}

	public int executeUpdate_id(String sql) {
		int result = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
			String ID = "select @@IDENTITY as id";
			rs = stmt.executeQuery(ID);
			if (rs.next()) {
				int autoID = rs.getInt("id");
				result = autoID;
			}
		} catch (SQLException ex) {
			result = 0;
		}
		return result;
	}
	
}
