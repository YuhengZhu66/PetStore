package com.example.shop.dao;


import com.example.shop.tools.ChStr;
import com.example.shop.tools.ConnDB;
import com.example.shop.model.SuperType;

public class SuperTypeDaoImpl implements SupertypeDao {
  ConnDB conn=new ConnDB();
  ChStr chStr=new ChStr();
  public int insert(SuperType spt) {
  int ret=-1;
  try{
    String sql = "insert into tb_superType (typename) values('" + chStr.chStr(spt.gettypename()) +
        "')";
    ret = conn.executeUpdate(sql);
  }catch (Exception e){
    ret=0;
  }
  return ret;
}

}
