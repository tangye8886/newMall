package com.tangye.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
/*
 * 	启动类
 */

@EnableDubbo
@ComponentScan("com.tangye.mall")
@MapperScan("com.tangye.mall.mapper")
@SpringBootApplication
public interface Mall_Provider_APP {
	public static void main(String[] args) {
		SpringApplication.run(Mall_Provider_APP.class, args);
	}
	

}
