package com.etoak.mapper;

import org.springframework.stereotype.Repository;

import com.etoak.bean.User;

@Repository
public interface UserMapper {
	
	public int add(User user);
	
}
