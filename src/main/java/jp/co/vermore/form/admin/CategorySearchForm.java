package jp.co.vermore.form.admin;

public class CategorySearchForm {

    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "CategorySearchForm{" +
                "title='" + title + '\'' +
                '}';
    }
}
