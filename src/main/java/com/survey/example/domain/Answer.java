package com.survey.example.domain;

import java.util.List;

public class Answer {
	private int a_idx;
	private int s_idx;
	private int q_idx;
	private int i_idx;
	private int r_idx;
	private String a_answer;
	private List<AnswerItem> answerItem;
	
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
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
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getA_answer() {
		return a_answer;
	}
	public void setA_answer(String a_answer) {
		this.a_answer = a_answer;
	}
	
	public List<AnswerItem> getAnswerItem() {
		return answerItem;
	}
	public void setAnswerItem(List<AnswerItem> answerItem) {
		this.answerItem = answerItem;
	}
}
