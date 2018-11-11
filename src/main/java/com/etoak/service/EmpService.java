package com.etoak.service;



import com.etoak.bean.Emp;

import java.util.Map;


public interface EmpService {
	public void doAdd(Emp emp);
	 
	public Emp getEno(String eno);

    public Map<String,Object> query(Integer page, Integer rows, Emp emp);

    public void update(Emp emp);
}
