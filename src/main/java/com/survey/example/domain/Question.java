package com.survey.example.domain;

import java.util.List;

public class Question {
	private int s_idx;
	private int q_idx;
	private String q_contents;
	private String q_type;
	private List<Item> itemList;
	private Survey survey;
	
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = survey.getS_idx();
	}
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getQ_contents() {
		return q_contents;
	}
	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public List<Item> getItemList() {
		return itemList;
	}
	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}
}
