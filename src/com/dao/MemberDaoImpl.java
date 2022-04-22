package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Member;
import com.tools.ChStr;
import com.tools.ConnDB;

public class MemberDaoImpl implements MemberDao {
	ConnDB conn = new ConnDB();
	ChStr chStr = new ChStr();
	@Override
	public int insert(Member m) {
		int ret = -1;// Used to record the number of update records
		try {// Catching Exception
			String sql = "Insert into tb_Member (UserName,TrueName,PassWord,City,address,postcode,"
					+ "CardNO,CardType,Tel,Email) values('"
					+ chStr.chStr(m.getUsername()) + "','" + chStr.chStr(m.getTruename()) + "','"
					+ chStr.chStr(m.getPwd()) + "','" + chStr.chStr(m.getCity()) + "','" + chStr.chStr(m.getAddress())
					+ "','" + chStr.chStr(m.getPostcode()) + "','" + chStr.chStr(m.getCardno()) + "','"
					+ chStr.chStr(m.getCardtype()) + "','" + chStr.chStr(m.getTel()) + "','"+ chStr.chStr(m.getEmail())
					+ "')";// Save member information
			ret = conn.executeUpdate(sql);// Save membership information to database
		} catch (Exception e) {
			e.printStackTrace();
			ret = 0;// Setting the value of variable to 0 means that saving member information fails
		}
		conn.close();
		return ret;// Returns the number of updated records
	}

	@Override
	public List select() {
		Member form = null;// Declaration of Membership
		List list = new ArrayList();
		String sql = "select * from tb_member";
		ResultSet rs = conn.executeQuery(sql);
		try {
			while (rs.next()) {
				form = new Member();
				form.setID(Integer.valueOf(rs.getString(1)));
				list.add(form);
			}
		} catch (SQLException ex) {
		}
		conn.close();
		return list;
	}

	public int delete(Member m) {
		String sql = "delect from tb_member where ID=" + m.getID();
		int ret = conn.executeUpdate(sql);
		conn.close();
		return 0;
	}



	public int update(Member m) {
		int ret = -1;
		try {
			String sql = "update tb_member set TrueName='" + chStr.chStr(m.getTruename()) + "',UserName='"
					+ chStr.chStr(m.getUsername()) + "',PassWord='" + chStr.chStr(m.getPwd()) + "',City='"
					+ chStr.chStr(m.getCity()) + "',address='" + chStr.chStr(m.getAddress()) + "',postcode='"
					+ chStr.chStr(m.getPostcode()) + "',CardNO='" + chStr.chStr(m.getCardno()) + "',CardType='"
					+ chStr.chStr(m.getCardtype()) + "',Tel='" + chStr.chStr(m.getTel()) + "',Email='"
					+ chStr.chStr(m.getEmail()) + "' where ID=" + m.getID();
			ret = conn.executeUpdate(sql);
			System.out.println(sql);
		} catch (Exception e) {
			e.printStackTrace();
			ret = 0;
		}
		conn.close();
		return ret;
	}
	public Member select1() {
		return null;
	}
}
