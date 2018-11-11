package com.etoak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.service.DeptService;
import com.etoak.util.TreeNode;

@Controller
@RequestMapping(value="/dept")
public class DeptController {
	
	@Autowired
	private DeptService deptService;
	
	@ResponseBody
	@RequestMapping(value="/getDept",method=RequestMethod.POST)
	public List<TreeNode> getDept(@RequestParam(value="id",defaultValue="0")Integer id){
		
		return deptService.findDeptByPid(id);
		
	}
	
	
}
