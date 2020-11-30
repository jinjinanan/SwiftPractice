package com.example.a.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

import javax.annotation.sql.DataSourceDefinition;
import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public PasswordEncoder encoder() {return new StandardPasswordEncoder("53cr3t"); }

    @Override
    protected void configure(HttpSecurity http) throws Exception{
//        声明在前面的安全规则比后面声明的规则有更高的优先级
        http.authorizeRequests().antMatchers("/design","orders")
                .access("hasRole('ROLE_USER')").antMatchers("/","/**").access("permitAll")
                .and().formLogin().loginPage("/login").defaultSuccessUrl("/design")
                .and().logout().logoutSuccessUrl("/")
                .and().csrf().ignoringAntMatchers("/h2-console/**")
                .and().headers().frameOptions().sameOrigin();
    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception
    {
        auth.userDetailsService(userDetailsService).passwordEncoder(encoder());
    }
}
