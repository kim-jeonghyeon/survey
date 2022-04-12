package com.survey.example.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.survey.example.domain.Item;
import com.survey.example.domain.Pagination;
import com.survey.example.domain.Question;
import com.survey.example.domain.Search;
import com.survey.example.domain.Survey;



@Mapper
public interface SurveyMapper {
	public int getSurveyCount(Search search);
	public ArrayList<Survey> selectSurveyList(Pagination pagination);
	public void insertSurvey(Survey survey);
	public void insertQuestion(Question question);
	public void insertItem(Item item);
}
