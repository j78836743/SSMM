package com.etoak.controller;

import com.etoak.bean.Emp;
import com.etoak.service.EmpService;
import com.etoak.util.ResultMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/login")
public class LoginController { 
	
	@Autowired
	private EmpService empService;
	
	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ResultMsg login(String username,String password,HttpSession session){
		System.out.println("login"+username + password);
		Emp emp = empService.getEno(username);
		//判断是否为null
		if(emp == null) {
			return new ResultMsg(500,
					"该用户名：" + username + "不存在！");
		}
		
		//判断密码是否一致
		password = 
				DigestUtils.md5DigestAsHex(password.getBytes());
		
		if(!emp.getPassword().equals(password)) {
			return new ResultMsg(500, "密码错误！");
		}
		

		//登录成功
		emp.setPassword(null);
		session.setAttribute("emp", emp);
	
		return new ResultMsg(200, null);
		
	}
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public String index(){
		return "index";
	}

	@RequestMapping(value="/logout",
			method=RequestMethod.GET)
	public String logout(HttpSession session) {
		//session.removeAttribute("emp");
		session.invalidate();
		return "redirect:/";
	}


}
