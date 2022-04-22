package com.dao;

import com.model.Goods;

public interface GoodDao {
	public int insert(Goods g);// Define an insert method that returns the data type as good and g as an alias

	public int update(Goods g);

	public int delete(Goods g);
}
