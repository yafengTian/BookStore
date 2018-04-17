package com.tyf.main;


import org.apache.ibatis.session.SqlSession;

import com.tyf.mapper.RoleMapper;
import com.tyf.pojo.MyRole;
import com.tyf.util.SqlSessionFactoryUtil;

public class Test {
	public static void main(String[] args) {
		
		SqlSession session=null;
		try{
		session=SqlSessionFactoryUtil.openSqlSession();
		RoleMapper roleMapper=session.getMapper(RoleMapper.class);
		MyRole role=roleMapper.getRole(1L);
		System.out.println(role.getRoleName());
		session.commit();
			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			session.rollback();
		}
	}

}
