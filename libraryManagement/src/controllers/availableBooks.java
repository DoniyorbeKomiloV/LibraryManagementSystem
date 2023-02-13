
package controllers;

public class availableBooks {

    private final int id;
    private final String title;
    private final String author;
    private final String description;
    private final String date;
    private final String category;


    public availableBooks(int id, String title,  String date, String description, String author, String category){
        this.id = id;
        this.title = title;
        this.author = author;
        this.date = date;
        this.description = description;
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public String getTitle(){
        return title;
    }
    public String getAuthor(){
        return author;
    }
    public String getDate(){
        return date;
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }
}
