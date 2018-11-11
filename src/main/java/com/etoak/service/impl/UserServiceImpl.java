package com.etoak.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoak.bean.User;
import com.etoak.mapper.UserMapper;
import com.etoak.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper mapper;
	
	@Override
	public void add(User user) {
		int result = 0;
		try {
			result = mapper.add(user);
		}catch (Exception e){
			e.printStackTrace();
		}
		if(result <=0 ){
			throw new RuntimeException("新增用户"+user.getName()+"失败");
			
			
		}
		
	}
	
	
	
}
