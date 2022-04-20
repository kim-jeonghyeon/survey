package com.survey.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.survey.example.domain.Pagination;
import com.survey.example.domain.Question;
import com.survey.example.domain.Search;
import com.survey.example.domain.Survey;



@Mapper
public interface SurveyMapper {
	public int getSurveyCount(Search search);
	public int MySurveyCount(Survey survey);
	public ArrayList<Survey> selectSurveyList(Pagination pagination);
	public void insertQuestion(Question question);
	public void insertItem(Question question);
	public void insertSurvey(Survey survey);
}
