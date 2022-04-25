package com.survey.example.domain;

public class Item {
	private int s_idx;
	private int q_idx;
	private int i_idx;
	private String i_contents;
	private Survey survey;
	
	
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public int getI_idx() {
		return i_idx;
	}
	public void setI_idx(int i_idx) {
		this.i_idx = i_idx;
	}
	public String getI_contents() {
		return i_contents;
	}
	public void setI_contents(String i_contents) {
		this.i_contents = i_contents;
	}
	public Survey getSurvey() {
		return survey;
	}
	public void setSurvey(Survey survey) {
		this.survey = survey;
	}
	
}
