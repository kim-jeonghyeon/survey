package com.survey.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.survey.example.domain.Pagination;
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
	public ArrayList<Survey> selectSurveyList(Pagination pagination){
		return surveyMapper.selectSurveyList(pagination);
	}
	
	@Override
	public void insertQuestion(Survey survey) {
		surveyMapper.insertQuestion(survey);
	}
	
	@Override
	public void insertItem(Survey survey) {
		surveyMapper.insertItem(survey);
	}
	
	@Override
	public void insertSurvey(Survey survey) {
		surveyMapper.insertSurvey(survey);
		surveyMapper.insertQuestion(survey);
		surveyMapper.insertItem(survey);			
	}

}
