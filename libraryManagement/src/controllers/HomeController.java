package controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Pane;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;

public class HomeController implements Initializable {
    @FXML
    private Label title;
    @FXML
    private Label author;
    @FXML
    private Label published_year;
    @FXML
    private Label description;
    @FXML
    private Label category;

    @FXML
    private Label studentNumber_label;

    @FXML
    private Button availableBooks_btn;
    @FXML
    private Button issued_btn;
    @FXML
    private Button go_back_btn;
    @FXML
    private DatePicker rent_date;

    @FXML
    private Button logout_btn;
    @FXML
    private Button dashboard_btn;
    @FXML
    private Pane dashboard;
    @FXML
    private Label total_books;
    @FXML
    private Label issued_books;
    @FXML
    private Label available_books;

    @FXML
    private AnchorPane availableBooks_form;

    @FXML
    private TableView<BookData> availableBooks_tableView;

    @FXML
    private TableColumn<BookData, String> col_ab_bookTitle;

    @FXML
    private TableColumn<BookData, String> col_ab_author;

    @FXML
    private TableColumn<BookData, String> col_ab_publishedDate;
    @FXML
    private TableColumn<BookData, String> col_ab_category;
    @FXML
    private AnchorPane issued_books_form;
    @FXML
    private AnchorPane take_book_form;

    @FXML
    private TableView<Take> issuedBooks_tableView;

    @FXML
    private TableColumn<Take, Integer> col_ib_id;

    @FXML
    private TableColumn<Take, String> col_ib_issued_at;

    @FXML
    private TableColumn<Take, String> col_ib_return_at;
    @FXML
    private TableColumn<Take, Integer> col_ib_book_id;
    @FXML
    private TableView<BookData> totalBooks_tableView;

    @FXML
    private TableColumn<BookData, String> col_tb_bookTitle;

    @FXML
    private TableColumn<BookData, String> col_tb_bookAuthor;

    @FXML
    private TableColumn<BookData, String> col_tb_bookPublishedYear;
    @FXML
    private TableColumn<BookData, String> col_tb_bookCategory;
    @FXML
    private Button showInfo;
    @FXML
    private Button return_btn;
    private Connection connect;
    private PreparedStatement prepare;
    private ResultSet result;

    LibraryManagement libraryManagement = new LibraryManagement();

    public ObservableList<BookData> bookList(String sql) {

        ObservableList<BookData> listBooks = FXCollections.observableArrayList();
        connect = utils.Database.connectDB();

        try {

            BookData Books;

            assert connect != null;
            prepare = connect.prepareStatement(sql);
            result = prepare.executeQuery();

            while (result.next()) {

                Books = new BookData(
                        result.getInt("id"),
                        result.getString("author"),
                        result.getString("category"),
                        result.getString("title"),
                        result.getString("published_year"),
                        result.getString("description"),
                        result.getString("check_status")
                );

                listBooks.add(Books);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listBooks;
}

    public void takeBook() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String current_date = dtf.format(now);
        String issue_date = dtf.format(rent_date.getValue());
        String sql = "INSERT INTO library_take(issued_at, return_at, book_id, user_id) VALUES ('%s','%s','%s','%s')".formatted(current_date, issue_date, SavedInfo.getBook_id(), UserInfo.getId());
        String sql1 = "UPDATE library_book SET check_status = 'NR' WHERE id = %s".formatted(SavedInfo.getBook_id());
        connect = utils.Database.connectDB();

        try {

            Alert alert;
            assert connect != null;
            prepare = connect.prepareStatement(sql);
            prepare.executeUpdate();

            alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("Admin Message");
            alert.setHeaderText(null);
            alert.setContentText("Successfully take the book!");
            alert.showAndWait();
            prepare = connect.prepareStatement(sql1);
            prepare.executeUpdate();
            goBack(availableBooks_form, take_book_form);

            refresh();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    @FXML
    public void logout(ActionEvent event){
        try {
            if (event.getSource() == logout_btn) {
                libraryManagement.setStage("../fxml/login.fxml");

                logout_btn.getScene().getWindow().hide();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setVisible(Node visible_btn, Node[] others){
        for (Node node :others){
            node.setVisible(false);
        }
        visible_btn.setVisible(true);
    }

    public void navButtonDesign(ActionEvent event) {
        if (event.getSource() == availableBooks_btn) {
            setVisible(availableBooks_form, new Node[]{dashboard, issued_books_form, take_book_form});
        }
        if (event.getSource() == dashboard_btn) {
            setVisible(dashboard, new Node[]{availableBooks_form, issued_books_form, take_book_form});
        }
        if (event.getSource() == issued_btn) {
            setVisible(issued_books_form, new Node[]{availableBooks_form, dashboard, take_book_form});
        }
        if (event.getSource() == go_back_btn) {
            goBack(availableBooks_form, take_book_form);
        }
    }
    public void goBack(AnchorPane to, AnchorPane from){
        to.setVisible(true);
        from.setVisible(false);
    }
    public void setTableValues(TableColumn<BookData, String> title, TableColumn<BookData, String> author, TableColumn<BookData, String> published_year, TableColumn<BookData, String> category){
        title.setCellValueFactory(new PropertyValueFactory<>("title"));
        author.setCellValueFactory(new PropertyValueFactory<>("author"));
        published_year.setCellValueFactory(new PropertyValueFactory<>("published_year"));
        category.setCellValueFactory(new PropertyValueFactory<>("category"));
    }
    public void setTableIssued(TableColumn<Take, Integer> id, TableColumn<Take, String> issued_at, TableColumn<Take, String> return_at, TableColumn<Take, Integer> book_id){
        id.setCellValueFactory(new PropertyValueFactory<>("id"));
        issued_at.setCellValueFactory(new PropertyValueFactory<>("issued_at"));
        return_at.setCellValueFactory(new PropertyValueFactory<>("return_at"));
        book_id.setCellValueFactory(new PropertyValueFactory<>("book_id"));
    }

    public void showAvailableBooks() {
        ObservableList<BookData> listBook = bookList("SELECT * FROM library_book WHERE check_status='R' ORDER BY title ASC ");
        setTableValues(col_ab_bookTitle, col_ab_author, col_ab_publishedDate, col_ab_category);

        availableBooks_tableView.setItems(listBook);

    }
    public void showTotalBooks() {
        ObservableList<BookData> listBook = bookList("SELECT * FROM library_book ORDER BY title ASC");

        setTableValues(col_tb_bookTitle, col_tb_bookAuthor, col_tb_bookPublishedYear, col_tb_bookCategory);

        totalBooks_tableView.setItems(listBook);

    }
    public ObservableList<Take> issuedList(){
        ObservableList<Take> listIssued = FXCollections.observableArrayList();
        connect = utils.Database.connectDB();
        String sql = "SELECT * FROM library_take WHERE user_id = %s".formatted(UserInfo.getId());

        try {

            Take Books;

            assert connect != null;
            prepare = connect.prepareStatement(sql);
            result = prepare.executeQuery();

            while (result.next()) {

                Books = new Take(
                        result.getInt("id"),
                        result.getString("issued_at"),
                        result.getString("return_at"),
                        result.getInt("book_id"),
                        result.getInt("user_id")
                );

                listIssued.add(Books);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listIssued;

    }
    public void showIssuedBooks() {
        ObservableList<Take> listIssued = issuedList();

        setTableIssued(col_ib_id, col_ib_issued_at, col_ib_return_at, col_ib_book_id);

        issuedBooks_tableView.setItems(listIssued);

    }
    public void refresh(){
        String sql1 = "SELECT COUNT(id) FROM library_book";
        String sql2 = "SELECT COUNT(id) FROM library_book WHERE check_status='NR'";
        String sql3 = "SELECT COUNT(id) FROM library_book WHERE check_status='R'";

        setBooksCount(sql1, total_books);
        setBooksCount(sql2, issued_books);
        setBooksCount(sql3, available_books);
        showAvailableBooks();
        showIssuedBooks();
        showTotalBooks();
    }
    public void selectBooks(ActionEvent e) {


        BookData bookData = availableBooks_tableView.getSelectionModel().getSelectedItem();

        int num = availableBooks_tableView.getSelectionModel().getFocusedIndex();

        if ((num - 1) < -1) {
            return;
        }
        if (bookData != null && e.getSource() == showInfo){
            setVisible(take_book_form, new Node[]{availableBooks_form, dashboard,issued_books_form});
            title.setText(bookData.getTitle());
            author.setText(bookData.getAuthor());
            category.setText(bookData.getCategory());
            published_year.setText(bookData.getPublished_year());
            description.setText(bookData.getDescription());
            SavedInfo.setBook_id(bookData.getId());

        }else {
            Alert alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("Admin Message");
            alert.setHeaderText(null);
            alert.setContentText("Please select a book");
            alert.showAndWait();
        }

    }
    public void selectIssued(ActionEvent e) {


        Take take = issuedBooks_tableView.getSelectionModel().getSelectedItem();

        int num = issuedBooks_tableView.getSelectionModel().getFocusedIndex();

        if ((num - 1) < -1) {
            return;
        }
        if (take != null && e.getSource() == return_btn){
            SavedInfo.setBook_id(take.getId());
            String sql = "DELETE FROM library_take WHERE book_id = %s".formatted(SavedInfo.getBook_id());
            String sql1 = "UPDATE library_book SET check_status = 'R' WHERE id = %s".formatted(SavedInfo.getBook_id());
            connect = utils.Database.connectDB();

            try {

                Alert alert;
                assert connect != null;
                prepare = connect.prepareStatement(sql);
                prepare.executeUpdate();

                alert = new Alert(AlertType.INFORMATION);
                alert.setTitle("Admin Message");
                alert.setHeaderText(null);
                alert.setContentText("Successfully return the book!");
                alert.showAndWait();
                prepare = connect.prepareStatement(sql1);
                prepare.executeUpdate();
                refresh();
            } catch (Exception ev) {
                ev.printStackTrace();
            }

        }else {
            Alert alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("Admin Message");
            alert.setHeaderText(null);
            alert.setContentText("Please select a book");
            alert.showAndWait();
        }

    }

    public void studentName() {
        studentNumber_label.setText("%s %s".formatted(UserInfo.getFirst_name(), UserInfo.getLast_name()));
    }

    public void setBooksCount(String sql, Label label){
        connect = utils.Database.connectDB();
        try{
            assert connect != null;
            prepare = connect.prepareStatement(sql);
            result = prepare.executeQuery();
            while(result.next()){
                label.setText(String.valueOf(result.getString(1)));
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        refresh();
        studentName();

    }


}
