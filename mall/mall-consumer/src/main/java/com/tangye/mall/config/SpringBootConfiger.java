package com.tangye.mall.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.tangye.mall.interceptor.LogInterceptor;

//applicationconfiger.xml配置文件相同功能
@SpringBootConfiguration
public class SpringBootConfiger extends WebMvcConfigurerAdapter{

	@Autowired
	LogInterceptor logInterceptor;

	//配置拦截器
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(logInterceptor).addPathPatterns("/car/*.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/order/*.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/after/*.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/comment/*.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/user/myAddress.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/user/addMyAddress.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/user/deleteMyAddress.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/user/updateMyAddress.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/user/updateMypwd.do");
		registry.addInterceptor(logInterceptor).addPathPatterns("/user/updateUserInfo.do");
	}
	
	//开启后缀
	@Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        //开启路径后缀匹配
        configurer.setUseRegisteredSuffixPatternMatch(true);
    }

	
}
