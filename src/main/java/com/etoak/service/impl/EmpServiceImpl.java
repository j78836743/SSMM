package com.etoak.service.impl;

import com.etoak.bean.Emp;
import com.etoak.mapper.EmpMapper;
import com.etoak.service.EmpService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EmpServiceImpl implements EmpService{

	
	@Autowired
	private EmpMapper empmapper;
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void doAdd(Emp emp) {
		Emp e = empmapper.getEno(emp.getEno());
		
		if(e!=null){
			throw new RuntimeException( "员工编号"+ emp.getEno() +"已存在");
		}
		emp.setHiredate(new Date());
		
		emp.setPassword(DigestUtils.md5DigestAsHex(emp.getPassword().getBytes()));
		
		int result = empmapper.add(emp);
		if (result <= 0 ) {
			throw new RuntimeException("add" + emp.getEname() + "error");
			
		}
		
		
	}

	@Override
	public Emp getEno(String eno) {
		// 
		return empmapper.getEno(eno);
	}

	@Override
	public Map<String, Object> query(Integer page, Integer rows, Emp emp) {
		PageHelper.startPage(page,rows);
		List<Emp> list = empmapper.query(emp);
		PageInfo<Emp> p = new PageInfo<>(list);

		Map<String,Object> result = new HashMap<>();
		result.put("rows",list);
		result.put("total",p.getTotal());

		return result;


	}

	@Override
	public void update(Emp emp) {
		System.out.print("did"+emp.getDid() + "|" + emp.getEname() + "|" + emp.getJob());
		int result = empmapper.update(emp);
		if(result <= 0) {
			throw new RuntimeException(
					"修改员工" + emp.getEno() + "失败！");
		}
	}

}
