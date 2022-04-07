package com.survey.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.survey.example.domain.Item;
import com.survey.example.domain.Question;
import com.survey.example.domain.Survey;
import com.survey.example.domain.User;
import com.survey.example.mapper.SurveyMapper;

@Service("SurveyServiceImpl")
public class SurveyServiceImpl implements SurveyService{
	
	@Autowired
	   SurveyMapper surveyMapper;

	@Override
	public void insertSurvey(Survey survey) {
		surveyMapper.insertSurvey(survey);
	}
}
