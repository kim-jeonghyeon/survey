package com.survey.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.survey.example.domain.Pagination;
import com.survey.example.domain.Search;
import com.survey.example.domain.Survey;



@Mapper
public interface SurveyMapper {
	public int getSurveyCount(Search search);
	public ArrayList<Survey> selectSurveyList(Pagination pagination);
	public void insertQuestion(Survey survey);
	public void insertItem(Survey survey);
	public void insertSurvey(Survey survey);
}
