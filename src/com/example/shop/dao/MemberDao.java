package com.example.shop.dao;

import java.util.List;	//����List��

import com.example.shop.model.Member;//�����Աģ����

public interface MemberDao {
	public int insert(Member m);// Save member information

	public List select(); // Querying

	public int update(Member m);

	public int delete(Member m);

	public Member select1();
}
