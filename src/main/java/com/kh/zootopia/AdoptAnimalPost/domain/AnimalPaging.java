package com.kh.zootopia.AdoptAnimalPost.domain;

public class AnimalPaging {
	
	  private int currentPage;     // 현재 페이지
	  private int totalCount;      // 전체 동물 입양 공고 게시글 수
	  private int animalPostLimit; // 한 페이지에 노출할 동물 입양 공고 게시글 수
	  private int naviLimit;       // 한 페이지 당 pageNavi 수
	  
	  private int startNavi;       // pageNavi 시작값
	  private int endNavi;         // pageNavi 끝값
	  private int maxPage;         // 페이지의 마지막 번호

	  public AnimalPaging() {}

	  public AnimalPaging(int currentPage, int totalCount) {
	    this.currentPage = currentPage;
	    this.totalCount = totalCount;
	    this.animalPostLimit = 16;  // 한 페이지에 노출할 동물 입양 공고 게시글 수
	    this.naviLimit = 5;         // 한 페이지 당 pageNavi 수
	    calc();
	  }

	  public int getCurrentPage() {
	    return currentPage;
	  }

	  public void setCurrentPage(int currentPage) {
	    this.currentPage = currentPage;
	  }

	  public int getAnimalPostLimit() {
	    return animalPostLimit;
	  }

	  public void setAnimalPostLimit(int animalPostLimit) {
	    this.animalPostLimit = animalPostLimit;
	  }

	  public int getNaviLimit() {
	    return naviLimit;
	  }

	  public void setNaviLimit(int naviLimit) {
	    this.naviLimit = naviLimit;
	  }

	  public int getStartNavi() {
	    return startNavi;
	  }

	  public void setStartNavi(int startNavi) {
	    this.startNavi = startNavi;
	  }

	  public int getEndNavi() {
	    return endNavi;
	  }

	  public void setEndNavi(int endNavi) {
	    this.endNavi = endNavi;
	  }

	  public int getTotalCount() {
	    return totalCount;
	  }

	  public void setTotalCount(int totalCount) {
	    this.totalCount = totalCount;
	    calc();
	  }

	  public int getMaxPage() {
	    return maxPage;
	  }

	  public void setMaxPage(int maxPage) {
	    this.maxPage = maxPage;
	  }

	  // 페이징 처리 계산 메소드
	  private void calc() {
	    maxPage = (int) Math.ceil((double) totalCount / animalPostLimit);
//	    maxPage = (int)((double)totalCount/animalPostLimit + 0.9);
	    
	    if (currentPage > maxPage) {
	      currentPage = maxPage;
	    }
	    if (currentPage < 1) {
	      currentPage = 1;
	    }
	    
	    startNavi = ((currentPage - 1) / naviLimit) * naviLimit + 1;
//	    startNavi = (((int)((double)currentPage/naviLimit + 0.9)) - 1) * naviLimit + 1;
	    
	    endNavi = startNavi + naviLimit - 1;
	    if (endNavi > maxPage) {
	      endNavi = maxPage;
	    }
	  }
	}