package com.dao;

import com.model.Book;
import com.tools.ChStr;
import com.tools.ConnDB;

public class GoodDaoImpl implements GoodDao {
	ConnDB conn = new ConnDB();//����tools���µķ�����
	ChStr chStr = new ChStr();//����tools���µķ�����
	
	/**
	 * ��������
	 * 
	 */
	public int insert(Book g) {
		int ret = -1;//�趨����ֵ����
		try {
			//�趨ִ�����
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

			ret = conn.executeUpdate(sql);//ִ����䣬�����ݿ�������
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//�ر����ݿ�����
		return ret;
	}

	/**
	 * ���²���
	 * 
	 */
	public int update(Book g) {
		int ret = -1;//�趨����ֵ����r
		try {
			//�趨ִ�����
			String sql = "update tb_good set TypeID=" + g.getTypeID()
					+ ",GoodName='" + chStr.chStr(g.getGoodName())
					+ "',introduce='" + chStr.chStr(g.getIntroduce())
					+ "',price=" + g.getPrice() + ",nowprice="
					+ g.getNowPrice() + ",picture='"
					+ chStr.chStr(g.getPicture()) + "',newGood="
					+ g.getNewGood() + ",sale=" + g.getSale() + " where ID="
					+ g.getID();
			ret = conn.executeUpdate(sql);//ִ����䣬�����ݿ�������
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//�ر����ݿ�����
		return ret;
	}
	
	/**
	 * ɾ������
	 * 
	 */
	public int delete(Book g) {
		int ret = -1;//�趨����ֵ����
		try {
			//�趨ִ�����
			String sql = "Delete from tb_good where ID=" + g.getID();
			ret = conn.executeUpdate(sql);//ִ����䣬�����ݿ�������
		} catch (Exception e) {
			ret = 0;
		}
		conn.close();//�ر����ݿ�����
		return ret;

	}

}