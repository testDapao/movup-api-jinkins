package jp.co.vermore.form.admin;

import java.util.Date;

public class EventList20Form extends DatatablesBaseForm {

    private String categoryType;
    private int nums;
    private String newsTitle;

    public String getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(String categoryType) {
        this.categoryType = categoryType;
    }

    public int getNums() {
        return nums;
    }

    public void setNums(int nums) {
        this.nums = nums;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    @Override
    public String toString() {
        return "EventList20Form{" +
                "categoryType='" + categoryType + '\'' +
                ", nums=" + nums +
                ", newsTitle='" + newsTitle + '\'' +
                '}';
    }
}
