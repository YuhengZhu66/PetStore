package com.dao;

import com.model.Goods;
import com.tools.ChStr;
import com.tools.ConnDB;

public class GoodDaoImpl implements GoodDao {
	ConnDB conn = new ConnDB();//Load the method classes in the Tools package
	ChStr chStr = new ChStr();
	

	public int insert(Goods g) {
		int ret = -1;//Set the return value variable
		try {
			String sql = "Insert into tb_good (TypeID,GoodName,Introduce,Price,nowPrice,picture,newGood,sale) values("
					+ g.getTypeID()
					+ ",'"
					+ chStr.chStr(g.getGoodName())
					+ "','"
					+ chStr.chStr(g.getIntroduce())
					+ "',"
					+ g.getPrice()
					+ ","
					+ g.getPrice()
					+ ",'"
					+ chStr.chStr(g.getPicture())
					+ "',"
					+ g.getNewGood()
					+ "," + g.getSale() + ")";

			ret = conn.executeUpdate(sql);//Execute the statement to connect to the database
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();
		return ret;
	}

	public int update(Goods g) {
		int ret = -1;
		try {
			String sql = "update tb_good set TypeID=" + g.getTypeID()
					+ ",GoodName='" + chStr.chStr(g.getGoodName())
					+ "',introduce='" + chStr.chStr(g.getIntroduce())
					+ "',price=" + g.getPrice() + ",nowprice="
					+ g.getNowPrice() + ",picture='"
					+ chStr.chStr(g.getPicture()) + "',newGood="
					+ g.getNewGood() + ",sale=" + g.getSale() + " where ID="
					+ g.getID();
			ret = conn.executeUpdate(sql);
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();
		return ret;
	}

	public int delete(Goods g) {
		int ret = -1;
		try {
			String sql = "Delete from tb_good where ID=" + g.getID();
			ret = conn.executeUpdate(sql);
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();
		return ret;

	}

}