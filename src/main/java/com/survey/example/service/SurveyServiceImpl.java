package com.survey.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.survey.example.domain.Pagination;
import com.survey.example.domain.Question;
import com.survey.example.domain.Search;
import com.survey.example.domain.Survey;
import com.survey.example.mapper.SurveyMapper;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService{
	
	@Autowired
	   SurveyMapper surveyMapper;
	
	@Override
	public int getSurveyCount(Search search) {
		return surveyMapper.getSurveyCount(search);
	}
	
	@Override
	public int MySurveyCount(Survey survey) {
		return surveyMapper.MySurveyCount(survey);
	}
	
	@Override
	public ArrayList<Survey> selectSurveyList(Pagination pagination){
		return surveyMapper.selectSurveyList(pagination);
	}
	
	@Override
	public void insertQuestion(Question question) {
		surveyMapper.insertQuestion(question);
	}
	
	@Override
	public void insertItem(Question question) {
		surveyMapper.insertItem(question);
	}
	
	@Override
	public void insertSurvey(Survey survey) {
		surveyMapper.insertSurvey(survey);
		for (Question question : survey.getQuestionList()) {
			//question.setS_idx(survey.getS_idx());
			surveyMapper.insertQuestion(question);
			//question.setQ_idx(question.getQ_idx());
			surveyMapper.insertItem(question);
		}
	}

}
