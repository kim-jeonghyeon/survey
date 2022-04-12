package com.survey.example.domain;

public class Survey implements PaginationObject {
	private int ROWNUM;
	private int s_idx;
	private String s_title;
	private String s_journal;
	private int s_views;
	private int u_idx;
	
	private User user;
	private Item item;
	private Question question;
	private Pagination pagination;
	
	
	public int getRownum() {
		return ROWNUM;
	}
	public void setRownum(int ROWNUM) {
		this.ROWNUM = ROWNUM;
	}
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
	public String getS_journal() {
		return s_journal;
	}
	public void setS_journal(String s_journal) {
		this.s_journal = s_journal;
	}
	public int getS_views() {
		return s_views;
	}
	public void setS_views(int s_views) {
		this.s_views = s_views;
	}
	public int getU_idx() {
		return u_idx;
	}
	public void setU_idx(int u_idx) {
		this.u_idx = u_idx;
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
