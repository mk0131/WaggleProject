package com.probee.waggle.model.dto;

public class Criteria {
	
	// 특정 페이지 조회를 위한 클래스
	private int page; // 현재 페이지 번호
	private int perPageNum; // 페이지당 보여줄 게시글의 갯수
	private int sub_page;

	public int getPageStart() {
		// 특정 페이지의 범위를 정하는 구간. 현재 페이지의 게시글 시작 번호
		// 0 ~ 10, 10 ~ 20 이런식으로

		return (this.page - 1) * perPageNum;
	}

	public Criteria() {
		this.page = 1;
		this.sub_page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	// 페이지당 보여줄 게시글의 갯수 perPageNum : getter, setter
	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;

		if (perPageNum != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", sub_page=" + sub_page + "]";
	}

	public int getSub_page() {
		return sub_page;
	}

	

}
