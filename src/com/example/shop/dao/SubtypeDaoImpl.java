package com.example.shop.dao;


import com.example.shop.tools.ConnDB;
import com.example.shop.model.SubType;
import com.example.shop.tools.ChStr;

public class SubtypeDaoImpl implements SubtypeDao {
  public SubtypeDaoImpl() {
  }
ConnDB conn=new ConnDB();
ChStr chStr=new ChStr();
public int insert(SubType st) {
int ret=-1;
try{
  String sql = "insert into tb_subType (superType,typename) values("+st.getsuperid()+",'" + chStr.chStr(st.gettypename()) +
      "')";
  ret = conn.executeUpdate(sql);
}catch (Exception e){
  ret=0;
}
return ret;
}

}

