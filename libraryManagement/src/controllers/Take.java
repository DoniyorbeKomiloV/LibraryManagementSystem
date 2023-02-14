package controllers;

public class Take {
    private final int id;
    private final String issued_at;
    private final String return_at;
    private final int book_id;
    private final int user_id;

    public Take(int id, String issued_at, String return_at, int book_id, int user_id) {
        this.id = id;
        this.issued_at = issued_at;
        this.return_at = return_at;
        this.book_id = book_id;
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public String getIssued_at() {
        return issued_at;
    }

    public String getReturn_at() {
        return return_at;
    }

    public int getBook_id() {
        return book_id;
    }

    public int getUser_id() {
        return user_id;
    }
}
