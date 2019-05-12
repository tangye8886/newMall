package com.tangye.mall.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.tangye.mall.entity.MallCar;

public interface CarService {
	public List<MallCar> myCar(long userNo);
	
	public int deleteCar(Integer id);
	
	public int addCar(MallCar car);
	
	public int updateCar(MallCar car);
	
	public int updateCarAmount(MallCar car);
	
	public PageInfo<MallCar> myCarByPage(int pageIndex,long userNo);
}
