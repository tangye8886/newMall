package com.tangye.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tangye.mall.entity.MallCar;

public interface MallCarMapper {
	
	public List<MallCar> myCar(@Param("userNo")long userNo);
	
	public int deleteCar(@Param("id")Integer id);
	
	public int addCar(MallCar car);
	
	public int updateCar(MallCar car);
	
	public int updateCarAmount(MallCar car);
}
