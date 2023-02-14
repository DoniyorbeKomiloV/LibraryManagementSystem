package controllers;

public class SavedInfo {

    private static int book_id;

    public SavedInfo(int bookId) {
        book_id = bookId;
    }

    public static int getBook_id() {
        return book_id;
    }

    public static void setBook_id(int book_id) {
        SavedInfo.book_id = book_id;
    }
}
