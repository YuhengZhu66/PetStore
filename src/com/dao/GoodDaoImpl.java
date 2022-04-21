package com.dao;

import com.model.Book;
import com.tools.ChStr;
import com.tools.ConnDB;

public class GoodDaoImpl implements GoodDao {
	ConnDB conn = new ConnDB();//加载tools包下的方法类
	ChStr chStr = new ChStr();//加载tools包下的方法类
	
	/**
	 * 新增操作
	 * 
	 */
	public int insert(Book g) {
		int ret = -1;//设定返回值变量
		try {
			//设定执行语句
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

			ret = conn.executeUpdate(sql);//执行语句，与数据库相连接
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//关闭数据库连接
		return ret;
	}

	/**
	 * 更新操作
	 * 
	 */
	public int update(Book g) {
		int ret = -1;//设定返回值变量r
		try {
			//设定执行语句
			String sql = "update tb_good set TypeID=" + g.getTypeID()
					+ ",GoodName='" + chStr.chStr(g.getGoodName())
					+ "',introduce='" + chStr.chStr(g.getIntroduce())
					+ "',price=" + g.getPrice() + ",nowprice="
					+ g.getNowPrice() + ",picture='"
					+ chStr.chStr(g.getPicture()) + "',newGood="
					+ g.getNewGood() + ",sale=" + g.getSale() + " where ID="
					+ g.getID();
			ret = conn.executeUpdate(sql);//执行语句，与数据库相连接
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//关闭数据库连接
		return ret;
	}
	
	/**
	 * 删除操作
	 * 
	 */
	public int delete(Book g) {
		int ret = -1;//设定返回值变量
		try {
			//设定执行语句
			String sql = "Delete from tb_good where ID=" + g.getID();
			ret = conn.executeUpdate(sql);//执行语句，与数据库相连接
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//关闭数据库连接
		return ret;

	}

}