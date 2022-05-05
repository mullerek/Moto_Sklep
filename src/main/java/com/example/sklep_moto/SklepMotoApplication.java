package com.example.sklep_moto;


import com.example.sklep_moto.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.event.EventListener;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.WebApplicationInitializer;


@SpringBootApplication
@EnableJpaRepositories(basePackageClasses = UserRepository.class)
public class SklepMotoApplication  extends SpringBootServletInitializer
        implements WebApplicationInitializer {



    public static void main(String[] args)
    {
        SpringApplication.run(SklepMotoApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(SklepMotoApplication.class);
    }

}
