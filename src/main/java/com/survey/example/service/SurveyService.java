package com.survey.example.service;

import java.util.ArrayList;

import com.survey.example.domain.Answer;
import com.survey.example.domain.Pagination;
import com.survey.example.domain.Question;
import com.survey.example.domain.Response;
import com.survey.example.domain.Search;
import com.survey.example.domain.Survey;

public interface SurveyService {
	public int getSurveyCount(Search search);
	public int MySurveyCount(Search search);
	public ArrayList<Survey> selectSurveyList(Pagination pagination);
	public void insertQuestion(Question question);
	public void insertItem(Question question);
	public void insertSurvey(Survey survey);
	public ArrayList<Survey> MySurveyList(Pagination pagination);
	public Survey selectSurvey(Survey survey);
	public void insertAnswer(Answer answer);
	public void insertResponse(Response response);
	public Response selectresult(Response response);
}
