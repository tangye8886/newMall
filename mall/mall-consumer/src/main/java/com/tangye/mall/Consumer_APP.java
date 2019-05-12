package com.tangye.mall;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.DispatcherServlet;

import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
/*
 * 	启动类
 */

@EnableDubbo
@ComponentScan("com.tangye.mall")
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class Consumer_APP {
	public static void main(String[] args) {
		SpringApplication.run(Consumer_APP.class, args);
	}
	
	/**
     * 设置匹配*.do后缀请求
     * @param dispatcherServlet
     * @return
     */
	
    @Bean
    public ServletRegistrationBean servletRegistrationBean(DispatcherServlet dispatcherServlet) {
        ServletRegistrationBean<DispatcherServlet> servletServletRegistrationBean = new ServletRegistrationBean<>(dispatcherServlet);
        servletServletRegistrationBean.addUrlMappings("*.do");
        return servletServletRegistrationBean;
    }
}
