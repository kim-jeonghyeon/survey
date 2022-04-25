package com.survey.example.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.survey.example.domain.Item;
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
	public int MySurveyCount(Search search) {
		return surveyMapper.MySurveyCount(search);
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
	public ArrayList<Survey> MySurveyList(Pagination pagination){
		return surveyMapper.MySurveyList(pagination);
	}	
	
	@Override
	public void insertSurvey(Survey survey) {
		surveyMapper.insertSurvey(survey);
		for (Question question : survey.getQuestionList()) {
			question.setS_idx(survey.getS_idx());
			if(question.getQ_type().equals("choice") || question.getQ_type().equals("check") ) {
				surveyMapper.insertQuestion(question);
				surveyMapper.insertItem(question);
			}else {
				surveyMapper.insertQuestion(question);
			}
		}
	}
	
	@Override
	public void selectSurvey(Survey survey) {
		surveyMapper.selectSurvey(survey);
	}
	@Override
	public void selectItem(Item item) {
		surveyMapper.selectItem(item);
	}
	@Override
	public void selectQuestion(Question question) {
		surveyMapper.selectQuestion(question);
	}
	
	
}
