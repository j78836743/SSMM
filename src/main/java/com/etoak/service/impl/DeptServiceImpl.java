package com.etoak.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoak.bean.Dept;
import com.etoak.mapper.DeptMapper;
import com.etoak.service.DeptService;
import com.etoak.util.TreeNode;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptMapper deptMapper;
	
	@Override
	public List<TreeNode> findDeptByPid(Integer id) {
		
		List<TreeNode> trees = Collections.EMPTY_LIST;
		
		List<Dept> list = deptMapper.findDeptsBypid(id);
		
		if(list != null && list.size() >0){
			trees = new ArrayList<>();
			TreeNode tree = null;
			for(Dept dept:list){
				tree = new TreeNode();
				tree.setId(dept.getId());
				tree.setText(dept.getDname());
				
				List<Dept> count = deptMapper.findDeptsBypid(dept.getId());
				
				tree.setState((count == null || count.size() == 0)?"open":"closed");
				
				trees.add(tree);
				
				
			}			
		}				
		return trees;
	}

}
