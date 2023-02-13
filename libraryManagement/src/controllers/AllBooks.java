package controllers;

public class AllBooks {
    private final int id;
    private final String author;
    private final String category;
    private final String title;
    private final String year;
    private final String description;
    private final String status;

    public AllBooks(int id, String author, String category, String title, String year, String description, String status) {
        this.id = id;
        this.author = author;
        this.category = category;
        this.title = title;
        this.year = year;
        this.description = description;
        this.status = status;
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

    public String getYear() {
        return year;
    }

    public String getDescription() {
        return description;
    }

    public String getStatus() {
        return status;
    }
}
