package com.example.sklep_moto.Security;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.DelegatingPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

       @Bean(name = "pwdEncoder")
       public PasswordEncoder getPasswordEncoder()
       {
           DelegatingPasswordEncoder delegatingPasswordEncoder = (DelegatingPasswordEncoder)
                   PasswordEncoderFactories.createDelegatingPasswordEncoder();
           BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
           delegatingPasswordEncoder.setDefaultPasswordEncoderForMatches(bCryptPasswordEncoder);
           return delegatingPasswordEncoder;
       }




    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/assets/**").permitAll()
                .antMatchers("/cart","/zamowienia_user","/user_data/**")
                .authenticated()
                .antMatchers("/produkty","/kategorie","/create-kategorie","/create-produkty",
                        "/update-produkty/**","/update-kategorie/**")
                .hasAuthority("ADMIN")
                .antMatchers("/zamowienia", "/zamowienia_klient/**","/update_status/**")
                .hasAnyAuthority("ADMIN","PRACOWNIK")
                .antMatchers("/").permitAll()
                .and()
                .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/Glowna")
                .permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/accessDenied");
                http.csrf().disable();
    }

}
