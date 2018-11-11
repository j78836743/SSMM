package com.etoak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.bean.Emp;
import com.etoak.service.EmpService;
import com.etoak.util.ResultMsg;

import java.util.Map;

@Controller
@RequestMapping(value="/emp")
public class EmpController {
	@Autowired
	private EmpService empservice;

	@RequestMapping(value="/empaddAndUpdate",method=RequestMethod.GET)
	public String empAddandUpdate(){
		return "/emp/addAndUpdate";
	}
	@ResponseBody
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ResultMsg add(Emp emp){
		
		try{
			empservice.doAdd(emp);
			return new ResultMsg(200,"新增员工"+emp.getEname()+"success");
		}catch (Exception e) {
			e.printStackTrace();
			return new ResultMsg(500,"err");
		}
	}

	//收到从前台传过来的请求 收发跳转
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String list(){
		return "emp/list";
	}

	@ResponseBody
    @RequestMapping(value = "/query",method = RequestMethod.POST)
    public Map<String,Object> query(Integer page,Integer rows,Emp emp){


	    return empservice.query(page,rows,emp);
    }
    @ResponseBody
    @RequestMapping(value = "/update",method = RequestMethod.GET)
    public ResultMsg update(Emp emp){
        System.out.print("update"+emp.getEname() + emp.getJob() + emp.getSalary() + emp.getDid()+"id:"+emp.getId());

		try{
			empservice.update(emp);
			return new ResultMsg(200,"修改员工"+emp.getEname()+"success");
		}catch (Exception e) {
			e.printStackTrace();
			return new ResultMsg(500,"err");
		}

    }


}
