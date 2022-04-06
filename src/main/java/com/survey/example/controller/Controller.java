package com.survey.example.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.survey.example.domain.User;
import com.survey.example.service.UserService;


@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired PasswordEncoder passwordEncoder;
	
	@RequestMapping("/")
	public String home(Model model) { 
		return "/main";
	}
   
   @RequestMapping("/beforeSignUp") 
	public String beforeSignUp() {
		return "/signup";
	}
	
   @RequestMapping("/signup")
   public String signup(User user) {
      String encodedPassword = passwordEncoder.encode(user.getPassword());
      
      user.setPassword(encodedPassword);
      user.setAccountNonExpired(true);
      user.setEnabled(true);
      user.setAccountNonLocked(true);
      user.setCredentialsNonExpired(true);
      user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER")); 
      
      userservice.createUser(user); 
      userservice.createAuthorities(user);
      
      return "/login";
   }

	@RequestMapping(value="/login")
	public String beforeLogin(Model model) {
		return "/login";
	}
	
	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/admin")
	public String admin() {
	   return "/admin";
	}
	   
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/user/info")
	public String userInfo(Model model) {
	   return "/user_info";
	}
	   
	@RequestMapping(value="/denied")
	public String denied() {
	   return "/denied";
	}
	
	@RequestMapping(value="/mypage")
	public String mypage() {
	   return "/mypage";
	}
	
	@RequestMapping(value="/makesurvey")
	public String makesurvey() {
	   return "/makesurvey";
	}
	
	@RequestMapping(value="/listsurvey")
	public String listsurvey() {
	   return "/listsurvey";
	}
	
	@RequestMapping(value="/resultsurvey")
	public String resultsurvey() {
	   return "/resultsurvey";
	}

}