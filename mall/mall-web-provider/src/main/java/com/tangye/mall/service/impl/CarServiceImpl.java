package com.tangye.mall.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.MallCar;
import com.tangye.mall.mapper.MallCarMapper;
import com.tangye.mall.service.CarService;

@Service
@Component
public class CarServiceImpl implements CarService {

	@Resource
	MallCarMapper carMapper;
	
	@Override
	public List<MallCar> myCar(long userNo) {
		// TODO Auto-generated method stub
		return carMapper.myCar(userNo);
	}

	@Override
	public int deleteCar(Integer id) {
		// TODO Auto-generated method stub
		return carMapper.deleteCar(id);
	}

	@Override
	public int addCar(MallCar car) {
		// TODO Auto-generated method stub
		return carMapper.addCar(car);
	}

	@Override
	public int updateCar(MallCar car) {
		// TODO Auto-generated method stub
		return carMapper.updateCar(car);
	}

	@Override
	public int updateCarAmount(MallCar car) {
		// TODO Auto-generated method stub
		return carMapper.updateCarAmount(car);
	}

	@Override
	public PageInfo<MallCar> myCarByPage(int pageIndex, long userNo) {
		PageHelper.startPage(pageIndex,2);
		List<MallCar> list = carMapper.myCar(userNo);
		PageInfo<MallCar> pageInfo = new PageInfo<MallCar>(list);
		return pageInfo;
	}

}
