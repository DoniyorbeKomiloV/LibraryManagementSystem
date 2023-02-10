
package librarymanagement;

import java.sql.Date;

public class availableBooks {

    private int id;
    private final String title;
    private final String author;
    private final String description;
    private final String date;
    
    public availableBooks(int id, String title,  String date, String description, String author){
        this.id = id;
        this.title = title;
        this.author = author;
        this.date = date;
        this.description = description;
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
