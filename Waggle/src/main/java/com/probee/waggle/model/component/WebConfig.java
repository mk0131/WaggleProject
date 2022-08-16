package com.probee.waggle.model.component;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private String connectPath = "/images/**";
    private String resourcePath = "file:///var/lib/tomcat9/webapps/upload/images/";
    private String connectPath2 = "/csv/**";
    private String resourcePath2 = "file:///var/lib/tomcat9/webapps/upload/csv/";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(connectPath)
                .addResourceLocations(resourcePath);
        registry.addResourceHandler(connectPath2)
                .addResourceLocations(resourcePath2);
    }
}