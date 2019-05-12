package com.tangye.mall.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;
import com.alibaba.dubbo.config.annotation.Service;
import com.tangye.mall.config.RabbitConfig;
import com.tangye.mall.entity.MallUser;
import com.tangye.mall.mapper.MallUserMapper;
import com.tangye.mall.service.UserService;

@Service
@Component
public class UserServiceImpl implements UserService {

	@Resource
	MallUserMapper mapper;
	
	@Resource
	RabbitTemplate rabbitTemplate;
	
	@Override
	public List<MallUser> allUser() {
		// TODO Auto-generated method stub
		return mapper.allUser();
	}

	@Override
	public MallUser findUserByid(long id) {
		// TODO Auto-generated method stub
		return mapper.findUserByid(id);
	}

	@Override
	public int deleteUser(long id) {
		// TODO Auto-generated method stub
		return mapper.deleteUser(id);
	}

	@Override
	public int addUser(MallUser user) {
		// TODO Auto-generated method stub
		return mapper.addUser(user);
	}

	@Override
	public int updateUser(MallUser user) {
		// TODO Auto-generated method stub
		return mapper.updateUser(user);
	}

	@Override
	public MallUser loginUser(String username) {
		// TODO Auto-generated method stub
		return mapper.loginUser(username);
	}


	@Override
	public void rabbitSendMsg(String msg) {
		rabbitTemplate.convertAndSend(RabbitConfig.EXCHANGE_NAME, RabbitConfig.ROUNTER_KEY, msg);
	}

}
