package com.tangye.mall.service;

import java.util.List;
import com.tangye.mall.entity.MallUser;
/*
 * 用户服务
 */
public interface UserService {
	public List<MallUser> allUser();
	
	public MallUser findUserByid(long id);
	
	public int deleteUser(long id);
	
	public int addUser(MallUser user);
	
	public int updateUser(MallUser user);
	
	public MallUser loginUser(String username);
	
	
	public void rabbitSendMsg(String msg);
	
}
