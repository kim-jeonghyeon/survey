package com.survey.example.domain;

import com.survey.example.domain.Pagination;

public class Survey implements PaginationObject {
	private int s_idx;
	private String s_title;
	private String s_desc;
	
	private User user;
	private Item item;
	private Question question;
	private Pagination pagination;
	
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_desc() {
		return s_desc;
	}
	public void setS_desc(String s_desc) {
		this.s_desc = s_desc;
	}
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	
	@Override
	public int getPk() {
		return s_idx;
	}
}
