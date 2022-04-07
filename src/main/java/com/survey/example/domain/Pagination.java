package com.survey.example.domain;

public class Pagination {

		int count;     
		int page;	  
		int pageNum;    
		int startPage; 
		int endPage;   
		int lastPage;  
		int prevPage;  
		int nextPage;  
		public final int pageUnit; 
		public final int perPage;  
		private Search search;
		private PaginationObject object;
		
		
		public Pagination() {
			this(5, 3);
		}
		
		public Pagination(int perPage, int pageUnit) {
			this.perPage = perPage;
			this.pageUnit = pageUnit;
		}
		
		public void init() {
			pageNum = (page-1)*perPage;
			startPage =((page-1)/pageUnit)*pageUnit+1;
			lastPage = (int)Math.ceil(count / (float)perPage); 
			endPage = startPage+pageUnit-1;
			endPage = endPage < lastPage ? endPage : lastPage;
			prevPage=1;
			nextPage=(startPage+pageUnit);
		}
		

		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public int getPage() {
			return page;
		}
		public void setPage(int page) {
			this.page = page < 1 ? 1 : page;
		}
		public int getPageNum() {
			return pageNum;
		}
		public void setPageNum(int pageNum) {
			this.pageNum = pageNum;
		}
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public int getEndPage() {
			return endPage;
		}
		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}
		public int getLastPage() {
			return lastPage;
		}
		public void setLastPage(int lastPage) {
			this.lastPage = lastPage;
		}
		public int getPageUnit() {
			return pageUnit;
		}
		public int getPerPage() {
			return perPage;
		}
		public int getPrevPage() {
			return prevPage;
		}
		public void setPrevPage(int prevPage) {
			this.prevPage = prevPage;
		}
		public int getNextPage() {
			return nextPage;
		}
		public void setNextPage(int nextPage) {
			this.nextPage = nextPage;
		}

		public Search getSearch() {
			return search;
		}

		public void setSearch(Search search) {
			this.search = search;
		}

		public PaginationObject getObject() {
			return object;
		}

		public void setObject(PaginationObject object) {
			this.object = object;
		}
		

}
