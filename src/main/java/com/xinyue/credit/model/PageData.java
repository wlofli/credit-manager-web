package com.xinyue.credit.model;

import java.util.List;

import com.xinyue.credit.util.Globals;

public class PageData<T> {

	public PageData(List<T> data , int total , int currentPage) {
		// TODO Auto-generated constructor stub
		
		this.pageSize = Globals.PAGE_SIZE;
		this.data = data;
		this.total = total;
		this.currentPage = currentPage;
	}
	//总记录数
	private int total;
	//当前页
	private int currentPage;
	//每页大小 
	private int pageSize;
	//每页数据
	private List<T> data;
	
	private int start;
	
	private int end;

	public int getTotalPage(){
		int page = total/pageSize;
		if (total%pageSize != 0){
			page++;
		}
		return page;
	}
	
	public int getTotal() {
		return total;
	}

	public int getCurrentPage() {
		if(currentPage > getTotalPage())
			return getTotalPage();
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public List<T> getData() {
		return data;
	}

	/**
	 * @return the start
	 */
	public int getStart() {
		if (getCurrentPage() - 2 <= 0) {
			start = 1;
		} else if (getTotalPage() > 5
				&& (getCurrentPage() - 2 >= getTotalPage() - 5)) {
			start = getTotalPage() - 5;
		} else {
			start = getCurrentPage() - 2;
		}
		return start;
	}

	/**
	 * @return the end
	 */
	public int getEnd() {
		if (getCurrentPage() + 2 >= getTotalPage()) {
			end = getTotalPage();
		} else {
			end = getCurrentPage() + 2;
			if (getCurrentPage() + 2 < 5) {
				end = 5;
			}
		}
		return end;
	}
	
}
