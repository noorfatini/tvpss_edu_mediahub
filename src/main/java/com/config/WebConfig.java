package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // This maps "/css/**" URL pattern to "classpath:/webapp/css/"
        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/webapp/css/");

        // Map "/images/**" URL pattern to "classpath:/webapp/images/"
        registry.addResourceHandler("/images/**")
                .addResourceLocations("classpath:/webapp/images/");
    }
    
    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(2097152); // 2MB file size limit (adjust as needed)
        return multipartResolver;
    }
}
