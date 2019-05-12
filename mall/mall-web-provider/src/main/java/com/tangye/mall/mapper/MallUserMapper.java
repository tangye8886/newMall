package com.tangye.mall.mapper;

import com.tangye.mall.entity.MallUser;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MallUserMapper {
	
	public List<MallUser> allUser();
	
	public MallUser findUserByid(@Param("id")long id);
	
	public MallUser loginUser(@Param("username")String username);
	
	public int deleteUser(@Param("id")long id);
	
	public int addUser(MallUser user);
	
	public int updateUser(MallUser user);
	
	
}