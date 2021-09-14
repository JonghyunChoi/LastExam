package com.it.spring.auth;

import com.it.spring.oauth.MyOauth2UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    public AuthenticationFailureHandler authFailHandler;

    @Autowired
    public MyOauth2UserService myOauth2UserService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        System.out.println(passwordEncoder().encode("123"));

        http.authorizeRequests()
//                .antMatchers("/").permitAll()
                .antMatchers("/join").permitAll()
                .antMatchers("/board/write").hasAnyRole("USER", "ADMIN")
                .antMatchers("/board/**").permitAll()
                .antMatchers("/css/**", "/js/**", "/img/**").permitAll()
                .antMatchers("/store/**").permitAll()
                //.anyRequest().authenticated();
                .anyRequest().permitAll();

        http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .failureHandler(authFailHandler)
                .usernameParameter("name")
                .passwordParameter("password")

                .and()
                .oauth2Login() // google login
                .loginPage("/login")
                .userInfoEndpoint()
                .userService(myOauth2UserService);
                //.permitAll();

        http.logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .permitAll();

        http.csrf().disable();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}














