package com.portal.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.util.DefaultUriBuilderFactory;

@Configuration // khai báo 1 bean. Bean dùng để cấu hình MVC.
public class MVCConf implements WebMvcConfigurer {
	
	// cấu hình cho MVC biết chỗ folder để lấy view trả về cho Browser.
	@Bean public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}

	@Bean
	public RestTemplate restTemplate() {
		RestTemplate restTemplate = new RestTemplate();
		DefaultUriBuilderFactory defaultUriBuilderFactory = new DefaultUriBuilderFactory("http://localhost:8088/");
		restTemplate.setUriTemplateHandler(defaultUriBuilderFactory);
		return restTemplate;
	}
	
	/**
	 * classpath <-> src/main/resources
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/fonts/**").addResourceLocations("classpath:/META-INF/fonts/");
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/META-INF/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/META-INF/js/");
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/META-INF/images/");
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/META-INF/img/");
		registry.addResourceHandler("/adminn/**").addResourceLocations("classpath:/META-INF/adminn/");
		// dành cho thư mục upload.
		registry.addResourceHandler("/file/upload/**").addResourceLocations("file:D:/picture/");
	}
}
