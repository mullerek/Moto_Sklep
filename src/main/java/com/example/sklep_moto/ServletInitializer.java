package com.example.sklep_moto;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SklepMotoApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(ServletInitializer.class, args);
    }

}
