package jp.co.vermore.form;

import jp.co.vermore.common.mvc.BaseForm;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class CategoryRegistForm extends BaseForm {


    private String sortScore;

    private String title;

    private String gustName;

    private String hallName;

    private String holdDate;

    private String excerpt;

    private String comment;

    public String getSortScore() {
        return sortScore;
    }

    public void setSortScore(String sortScore) {
        this.sortScore = sortScore;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGustName() {
        return gustName;
    }

    public void setGustName(String gustName) {
        this.gustName = gustName;
    }

    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName;
    }

    public String getHoldDate() {
        return holdDate;
    }

    public void setHoldDate(String holdDate) {
        this.holdDate = holdDate;
    }

    public String getExcerpt() {
        return excerpt;
    }

    public void setExcerpt(String excerpt) {
        this.excerpt = excerpt;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "CategoryRegistForm{" +
                "sortScore='" + sortScore + '\'' +
                ", title='" + title + '\'' +
                ", gustName='" + gustName + '\'' +
                ", hallName='" + hallName + '\'' +
                ", holdDate='" + holdDate + '\'' +
                ", excerpt='" + excerpt + '\'' +
                ", comment='" + comment + '\'' +
                '}';
    }
}