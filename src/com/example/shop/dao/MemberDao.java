package com.example.shop.dao;

import java.util.List;	//导入List类

import com.example.shop.model.Member;//导入会员模型类

public interface MemberDao {
	public int insert(Member m);// Save member information

	public List select(); // Querying

	public int update(Member m);

	public int delete(Member m);

	public Member select1();
}
