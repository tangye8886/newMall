package com.tangye.mall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
/*
 * 	启动类
 */

@EnableDubbo
@ComponentScan("com.tangye.mall")
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class Manager_Main_APP {
	public static void main(String[] args) {
		SpringApplication.run(Manager_Main_APP.class,args);
	}
}
