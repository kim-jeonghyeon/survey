package com.survey.example.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.survey.example.domain.User;
import com.survey.example.domain.Survey;
import com.survey.example.domain.Pagination;
import com.survey.example.domain.Search;
import com.survey.example.domain.Item;
import com.survey.example.domain.Question;
import com.survey.example.service.UserService;
import com.survey.example.service.SurveyService;


@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired SurveyService surveyservice;
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
	 
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/denied")
	public String denied() {
	   return "/denied";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/mypage")
	public String mypage() {
	   return "/mypage";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/makesurvey")
	public String makesurvey() {
	   return "/makesurvey";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/resultsurvey")
	public String resultsurvey() {
	   return "/resultsurvey";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/savesurvey")
	public String savesurvey() {
		return "/savesurvey";
	}
	
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/surveylist")
	public String listsurvey(Model model, Search search) {
		int count = 0;
		
		count = surveyservice.getSurveyCount(search);
		
		Pagination pagination = new Pagination();
		pagination.setCount(count);
		pagination.setPage(search.getPage());
		pagination.init();
		pagination.setSearch(search);
		
		ArrayList<Survey> survey = surveyservice.selectNoticeList(pagination);
		
		model.addAttribute("notice",notice);
		model.addAttribute("pagination", pagination);
		model.addAttribute("count",count);
		
		
		
	   return "/surveylist";
	}
	
	@RequestMapping(value="/surveyprocess")
	public String surveyprovess(Model model, Survey survey, Authentication auth) {
		
		User user = (User)auth.getPrincipal();
		
		
		
		surveyservice.insertSurvey(survey);
		model.addAttribute("survey",survey);
		
		return "/main";
	}

}