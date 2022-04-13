package com.survey.example.service;

import java.util.ArrayList;

import com.survey.example.domain.Pagination;
import com.survey.example.domain.Search;
import com.survey.example.domain.Survey;

public interface SurveyService {
	public int getSurveyCount(Search search);
	public ArrayList<Survey> selectSurveyList(Pagination pagination);
	public void insertQuestion(Survey survey);
	public void insertItem(Survey survey);
	public void insertSurvey(Survey survey);
}
