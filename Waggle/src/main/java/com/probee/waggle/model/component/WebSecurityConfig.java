package com.probee.waggle.model.component;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
public class WebSecurityConfig {
	
//	@Bean
//	  public UserDetailsService userDetailsService() {
//	    return new UserDetailsServiceImpl();
//	  }
	  
	  @Bean
	  public BCryptPasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	  }


	@Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		 http
		.requestMatchers(matchers -> matchers.antMatchers("/resources/**")) // 로그인 안해도 불러옴
	    .authorizeRequests()
	    .antMatchers("/login/page", "/login","/").permitAll()
	    .anyRequest().authenticated() // 나머지 페이지 권한 있어야 접속가능
	    .and()

        .csrf().disable()
        .formLogin()
        .loginPage("/login")
        .loginProcessingUrl("/authenticate")
        .usernameParameter("user_Id")
        .passwordParameter("user_Pw")
        .defaultSuccessUrl("/")
        .failureUrl("/login/page");
   
    return http.build();
    }
	
	
	
	
	
    
}