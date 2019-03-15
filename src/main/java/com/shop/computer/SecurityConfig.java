package com.shop.computer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource securityDataSource;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(securityDataSource);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/ustawienia").hasRole("USER")
                .antMatchers("/zamowienia").hasRole("USER")
                .antMatchers("/zamowienia/**").hasRole("USER")
                .antMatchers("/koszyk").hasRole("USER")
                .antMatchers("/produkty/dodaj").hasRole("USER")
                .antMatchers("/admin").hasRole("ADMIN")
                .antMatchers("/admin/**").hasRole("ADMIN")
                    .and()
                .formLogin().loginPage("/logowanie")
                .loginProcessingUrl("/zaloguj")
                .permitAll()
                    .and()
                .logout().permitAll();
    }

}
