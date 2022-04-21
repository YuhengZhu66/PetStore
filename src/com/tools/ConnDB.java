package com.tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnDB {
	public Connection conn = null;	//���ݿ����Ӷ���
	public Statement stmt = null;	//Statement��������ִ��SQL���
	public ResultSet rs = null;		//���������
	private static String dbClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";	//�����������
	private static String dbUrl = "jdbc:sqlserver://localhost:1433;DatabaseName=db_good";
	private static String dbUser = "sa";	//��¼SQL Server���û���
	private static String dbPwd = "guankaiwen1";	//��¼SQL Server������
	/**
	 * ���ܣ����������ݿ������
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		Connection conn = null;// �������ݿ����Ӷ���
		try {// ��׽�쳣
			Class.forName(dbClassName).newInstance();// װ�����ݿ�����
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);// ��ȡ���ݿ����Ӷ���
		} catch (Exception ee) {// �����쳣
			ee.printStackTrace();// ����쳣��Ϣ
		}
		if (conn == null) {
			System.err.println("DbConnectionManager.getConnection():" + dbClassName + "\r\n :" + dbUrl + "\r\n "
					+ dbUser + "/" + dbPwd);// ���������Ϣ���������
		}
		return conn; // �������ݿ����Ӷ���
	}

	/**
	 * ���ܣ���������
	 * 
	 * @param sql
	 * @return
	 */
	public int executeUpdate(String sql) {
		int result = 0;// �������ݵļ�¼����
		try {// ��׽�쳣
			conn = getConnection();// ��ȡ���ݿ�����
			// ��������ִ��SQL����Statement����
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);// ִ��SQL���
		} catch (SQLException ex) {// �����쳣
			result = 0;// ָ���������ݵļ�¼����Ϊ0����ʾû�и�������
			ex.printStackTrace();// ����쳣��Ϣ
		}
		try {// ��׽�쳣
			stmt.close();// �ر�����ִ��SQL����Statement����
		} catch (SQLException ex1) {// �����쳣
			ex1.printStackTrace();// ����쳣��Ϣ
		}
		return result;// ���ظ������ݵļ�¼����
	}

	/**
	 * ���ܣ�����ָ����SQL����ѯ����
	 * 
	 * @param sql
	 * @return
	 */
	public ResultSet executeQuery(String sql) {
		try {// ��׽�쳣
			conn = getConnection();// ��ȡ���ݿ�����
			// ��������ִ��SQL����Statement����
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);// ִ��SQL���

		} catch (SQLException ex) {// �����쳣
			ex.printStackTrace();// ����쳣��Ϣ
		}
		return rs;// ���ز�ѯ���
	}
	
	/**
	 * ���ܣ��ر����ݿ�����
	 */
	public void close() {
		try { // ��׽�쳣
			if (rs != null) {
				rs.close();// �رս��������
			}
			if (stmt != null) {
				stmt.close(); // �ر�Statement����
			}
			if (conn != null) {
				conn.close(); // �ر����ݿ����Ӷ���
			}
		} catch (Exception e) {// �����쳣
			e.printStackTrace(System.err);// ����쳣��Ϣ
		}
	}

	/**
	 * ���ܣ��������ݿ������Ƿ�ɹ�
	 * @param args
	 */
	public static void main(String[] args) {
		if (getConnection() != null) {//�����ȡ�����ݿ�����
			System.out.print("���ݿ����ӳɹ���");
		}
	}
	/**
	 * ���ܣ��������ݺ��ȡ���ɵ��Զ����
	 * 
	 * @param sql
	 * @return
	 */
	public int executeUpdate_id(String sql) {
		int result = 0;
		try {// ��׽�쳣
			conn = getConnection();// ��ȡ���ݿ�����
			// ��������ִ��SQL����Statement����
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);// ִ��SQL���
			String ID = "select @@IDENTITY as id";// �������ڻ�ȡ�ո����ɵ��Զ���ŵ�SQL���
			rs = stmt.executeQuery(ID);// ��ȡ�ո����ɵ��Զ����
			if (rs.next()) {// �����������
				int autoID = rs.getInt("id");// �ѻ�ȡ�����Զ���ű��浽����autoID��
				result = autoID;
			}
		} catch (SQLException ex) {// �����쳣
			result = 0;
		}
		return result;// ���ػ�ȡ���
	}
	
}
