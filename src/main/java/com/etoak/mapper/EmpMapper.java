package com.etoak.mapper;

import org.springframework.stereotype.Repository;

import com.etoak.bean.Emp;

import java.util.List;

@Repository
public interface EmpMapper {
	public int add(Emp emp);
	
	public Emp getEno(String eno);

    public List<Emp> query(Emp emp);

    public int update(Emp emp);
}
