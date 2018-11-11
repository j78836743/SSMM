package com.etoak.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.bean.User;
import com.etoak.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	public UserService service;
	
	@ResponseBody
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public Map<String, Object> add(User user){
		
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			service.add(user);
			result.put("flag", "success");
			result.put("msg", "新增"+user.getName()+"success");
		} catch (Exception e) {
			result.put("flag", "err");
			result.put("msg", "新增"+user.getName()+"error");
		}
		
		
		return result;
		
	}



}
