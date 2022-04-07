package com.survey.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.survey.example.domain.Question;
import com.survey.example.domain.Item;
import com.survey.example.domain.Survey;
import com.survey.example.domain.User;


@Mapper
public interface SurveyMapper {
	public void insertSurvey(Survey survey); 
}
