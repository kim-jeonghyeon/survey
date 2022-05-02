package com.survey.example.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.survey.example.domain.User;
import com.survey.example.domain.Survey;
import com.survey.example.domain.Pagination;
import com.survey.example.domain.Search;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.survey.example.domain.Answer;
import com.survey.example.domain.Item;
import com.survey.example.domain.Question;
import com.survey.example.domain.Response;
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
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
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
	public String listsurvey(Model model, Search search,Authentication auth) {
		int count = 0;
		User user = (User)auth.getPrincipal(); 
		
		search.setUser(user);
		
		count = surveyservice.getSurveyCount(search);
		
		Pagination pagination = new Pagination();
		pagination.setCount(count);
		pagination.setPage(search.getPage());
		pagination.init();
		pagination.setSearch(search);
		
		ArrayList<Survey> survey = surveyservice.selectSurveyList(pagination);
		
		model.addAttribute("survey",survey);
		model.addAttribute("pagination", pagination);
		model.addAttribute("count",count);

	   return "/surveylist";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/resultlist")
	public String resultlist(Model model, Search search,Authentication auth) {
		int count = 0;
		User user = (User)auth.getPrincipal(); 
		
		search.setUser(user);
		
		count = surveyservice.getSurveyCount(search);
		
		Pagination pagination = new Pagination();
		pagination.setCount(count);
		pagination.setPage(search.getPage());
		pagination.init();
		pagination.setSearch(search);
		
		ArrayList<Survey> survey = surveyservice.selectSurveyList(pagination);
		
		model.addAttribute("survey",survey);
		model.addAttribute("pagination", pagination);
		model.addAttribute("count",count);

	   return "/resultlist";
	}
	
	@RequestMapping(value="/surveyprocess")
	public String surveyprovess(Model model, @RequestBody Survey survey, Authentication auth) {
		
		User user = (User)auth.getPrincipal();
		
		survey.setS_journal(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		survey.setS_views(0);
		survey.setU_idx(user.getU_idx());
		
		surveyservice.insertSurvey(survey);
		
		model.addAttribute("survey",survey);
		
		return "/main";
	}
	
	
	
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/mysurvey")
	public String mysurvey(Model model, Search search, Authentication auth) {
		User user = (User)auth.getPrincipal();
		
		search.setUser(user);
		int count = 0;
		
		count = surveyservice.MySurveyCount(search);
		
		Pagination pagination = new Pagination();
		pagination.setCount(count);
		pagination.setPage(search.getPage());
		pagination.init();
		pagination.setSearch(search);
		
		ArrayList<Survey> survey = surveyservice.MySurveyList(pagination);
		
		model.addAttribute("survey",survey);
		model.addAttribute("pagination", pagination);
		model.addAttribute("count",count);
		
		return "/mysurvey";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/surveyDetail")
	public String surveyDetail(Model model,Survey survey) {
		
		survey = surveyservice.selectSurvey(survey);
		
		model.addAttribute("survey",survey);
		
		return "/surveyDetail";
	}
	
	@Secured({"ROLE_USER"})
	@RequestMapping(value="/responseprocess")
	public String responseprocess(Model model, @RequestBody Response response, Authentication auth) {
		User user = (User)auth.getPrincipal();
		
		response.setU_idx(user.getU_idx());
		
		surveyservice.insertResponse(response);
		
		model.addAttribute("response", response);
		return "/savesurvey";
	}
	

	@Secured({"ROLE_USER"})
	@RequestMapping(value="/surveyresult")
	public String surveyresult(Model model,Survey survey) throws JsonProcessingException {
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		survey = surveyservice.selectSurvey(survey);
		
		String surveyString = objectMapper.writeValueAsString(survey);
		
		model.addAttribute("survey", survey);
		model.addAttribute("surveyjson", surveyString);
		return "/surveyresult";	}
	
	
}