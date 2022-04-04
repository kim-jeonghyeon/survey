package com.survey.example.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import com.survey.example.service.UserService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)

public class SecurityConfig extends WebSecurityConfigurerAdapter {
   @Autowired
   private UserService userService;
   
   @Autowired
   private DataSource dataSource;
   
   @Bean
   public PasswordEncoder passwordEncoder() {
      return new BCryptPasswordEncoder();
   }
   
   
   @Override
   protected void configure(HttpSecurity http) throws Exception {
   // 인증과 권한
      http
	      .authorizeRequests()
	            .antMatchers("/user/**").authenticated() // 인증된 사용자만이 접근할 수 있습니다
	            .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
	            // 리소스 admin으로 시작하는 모든 URL은 인증후 ADMIN 레벨의 권한을 가진 사용자만 접근을 허용한다는 의미입니다.
	            .anyRequest().permitAll()
	            .and()
	      // 폼 로그인 설정
	      .formLogin() // 로그인 페이지와 기타 로그인 처리 및 성공 실패 처리를 사용할겠다는 의미
	            .loginPage("/login") // 사용자가 따로 만든 로그인 페이지를 사용할때 설정
	            .loginProcessingUrl("/loginPro") // 로그인 즉 인증 처리를 하는 URL을 설정합니다
	            .defaultSuccessUrl("/", true) // 정상적으로 인증성공 했을 경우 이동하는 페이지를 설정합니다.
	            .permitAll() // 어떤 사용자든지 접근할 수 있습니다.
	            .and()
	      // 로그아웃 설정
	      .logout()
	         .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	         // 로그아웃을 실행할 주소를 나타냅니다. 새롭게 로그아웃 주소를 설정할 수 있습니다
	         .logoutSuccessUrl("/")
	         // 로그아웃을 성공했을 때 이동하는 페이지를 설정합니다.
	         .invalidateHttpSession(true)
	         .deleteCookies("JSESSIONID", "remember-me") // 자동 로그인이 되어있을때 리멤버미 토큰 로그아웃 처리
	         .and()
	      // remember me 설정
	      .rememberMe() // 본인 확인 수단으로 로그인 하면 서버가 확인하여 맞으면 유효한 사용자라는 토큰을 발행
	         .key("myWeb") // 인증을 위해 발행되는 토큰을 구별하는 키 이름을 지정
	         .rememberMeParameter("remember-me") // html(input 태그의 name값 작성) 자동로그인 파라미터 이름
	         .tokenValiditySeconds(86400)//1day = 토큰이 유요한 시간은 기본 2주지만 하루로 구성
	         .and()
	      // exceptionHandling - 예외처리 기능
	      .exceptionHandling()
	         .accessDeniedPage("/denied") // 인증되지 않은 사용자에게 제공할 url을 사용
	         .and()
	      // session 관리
	      .sessionManagement()
	         .sessionCreationPolicy(SessionCreationPolicy.NEVER) // 스프링 시큐리티가 생성하지 않지만 이미 존재하면 사용
	         .invalidSessionUrl("/login")
	         .and()
	      // csrf      
	      .csrf().disable();
      	  // SRF 보안에 대한 설정입니다. 아무 설정도 하지 않으면 CSRF 보안을 하도록 설정됩니다. /  해당 기능을 해제 합니다. 여기서는 csrf()를 해제합니다.
   }
   @Bean 
   public PersistentTokenRepository persistentTokenRepository() {
      JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
      db.setDataSource(dataSource);
      return db;
   }
   //security 기본설정
   @Override
   public void configure(AuthenticationManagerBuilder auth) throws Exception {
      auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
   } 
}

