package jp.co.vermore.entity;

import java.util.List;

public class Category {
    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(String categoryType) {
        this.categoryType = categoryType;
    }

    public Integer getNums() {
        return nums;
    }

    public void setNums(Integer nums) {
        this.nums = nums;
    }

    /**
     * カテゴリ
     * */
    private String categoryType;

    /**
     * 数量
     * */
    private Integer nums;

    /**
     * news
     * */
    private String newsTitle;


    @Override
    public String toString() {
        return "Category{" +
                "categoryType='" + categoryType + '\'' +
                ", nums=" + nums +
                ", newsTitle='" + newsTitle + '\'' +
                '}';
    }
}
