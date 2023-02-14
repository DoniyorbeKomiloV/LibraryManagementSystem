
package controllers;

public class BookData {

    private int id;
    private String author;
    private String category;
    private String title;
    private String published_year;
    private String description;
    private String check_status;

    public BookData(int id, String author, String category, String title, String published_year, String description, String check_status) {
        this.id = id;
        this.author = author;
        this.category = category;
        this.title = title;
        this.published_year = published_year;
        this.description = description;
        this.check_status = check_status;
    }

    public BookData() {
    }

    public int getId() {
        return id;
    }

    public String getAuthor() {
        return author;
    }

    public String getCategory() {
        return category;
    }

    public String getTitle() {
        return title;
    }

    public String getPublished_year() {
        return published_year;
    }

    public String getDescription() {
        return description;
    }

    public String getCheck_status() {
        return check_status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPublished_year(String published_year) {
        this.published_year = published_year;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCheck_status(String check_status) {
        this.check_status = check_status;
    }
}
