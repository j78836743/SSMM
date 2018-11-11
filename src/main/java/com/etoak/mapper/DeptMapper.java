package com.etoak.mapper;

import com.etoak.bean.Dept;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeptMapper {
	
	public List<Dept> findDeptsBypid(@Param("pid") Integer pid);
	
}
