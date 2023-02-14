package controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class AdminController implements Initializable {

    @FXML
    private TextField editTitle;
    @FXML
    private TextField editAuthor;
    @FXML
    private TextField editYear;
    @FXML
    private TextField editCategory;
    @FXML
    private TextArea editDescription;
    @FXML
    private Button cancelEdit;
    @FXML
    private Button clearEdit;
    @FXML
    private Button saveEdit;
    @FXML
    private AnchorPane EditBookPage;
    @FXML
    private Label last_name;
    @FXML
    private Label first_name;
    @FXML
    private TextField searchText;
    @FXML
    private ImageView searchIcon;
    @FXML
    private AnchorPane AddBookPage;
    @FXML
    private AnchorPane AllBooksPage;
    @FXML
    private Label mainTitle;
    private Connection connect;
    private PreparedStatement prepare;
    private ResultSet result;

    @FXML
    private Button addBook;
    @FXML
    private Button editBook;
    @FXML
    private Button deleteBook;
    @FXML
    private Button cancel;
    @FXML
    private Button clear;
    @FXML
    private Button save;

    @FXML
    private TableView<AllBooks> allBooks;
    @FXML
    private TextField title;
    @FXML
    private TextField category;
    @FXML
    private TextField author;
    @FXML
    private TextField year;
    @FXML
    private TextArea description;
    @FXML
    private TableColumn<AllBooks, String> tableId;
    @FXML
    private TableColumn<AllBooks, String> tableTitle;
    @FXML
    private TableColumn<AllBooks, String> tableCategory;
    @FXML
    private TableColumn<AllBooks, String> tableAuthor;
    @FXML
    private TableColumn<AllBooks, String> tableYear;
    @FXML
    private TableColumn<AllBooks, String> tableDescription;
    @FXML
    private TableColumn<AllBooks, String> tableStatus;
    @FXML
    private Button logOut;

    public void clear(){
        title.setText("");
        author.setText("");
        year.setText("");
        category.setText("");
        description.setText("");
    }
    public String reformatString(String oldString){
        String newString = "";
        for(int i=0; i<oldString.length(); i++){
            if (oldString.charAt(i) == '\'') newString += "\\'";
            else if (oldString.charAt(i) == '\"') newString += "\\\"";
            else newString += oldString.charAt(i);
        }
        System.out.println(newString);

        return newString;
    }
    public void AddBook(ActionEvent actionEvent) {
        if (actionEvent.getSource() == save){
            String sql = "INSERT INTO library_book(title, author, category, published_year, description, check_status) VALUES('%s','%s','%s','%s','%s','%s')".formatted(
                    reformatString(title.getText()),
                    reformatString(author.getText()),
                    reformatString(category.getText()),
                    reformatString(year.getText()),
                    reformatString(description.getText()),
                    "R");
            connect = utils.Database.connectDB();
            try {
                assert connect != null;
                prepare = connect.prepareStatement(sql);
                prepare.executeUpdate();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Admin");
                alert.setHeaderText(null);
                alert.setContentText("Book Added!");
                alert.showAndWait();
                mainTitle.setText("All Books");
                AllBooksPage.setVisible(true);
                AddBookPage.setVisible(false);
                EditBookPage.setVisible(false);
                searchText.setVisible(true);
                searchIcon.setVisible(true);
                clear();
                showAllBooks();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        } else if (actionEvent.getSource() == clear){
            clear();
        } else if (actionEvent.getSource() == cancel){
            clear();
            mainTitle.setText("All Books");
            AllBooksPage.setVisible(true);
            AddBookPage.setVisible(false);
            EditBookPage.setVisible(false);
            searchText.setVisible(true);
            searchIcon.setVisible(true);
        }
    }

    public void EditBookButtonControl(ActionEvent actionEvent){
        AllBooks bookData = allBooks.getSelectionModel().getSelectedItem();
        if (actionEvent.getSource() == saveEdit){
            System.out.println(bookData.getId());
            String sql = "UPDATE library_book SET author='%s', category='%s', title='%s', published_year='%s', description='%s' WHERE id=%d".formatted(
                    reformatString(editAuthor.getText()),
                    reformatString(editCategory.getText()),
                    reformatString(editTitle.getText()),
                    reformatString(editYear.getText()),
                    reformatString(editDescription.getText()),
                    bookData.getId());
            connect = utils.Database.connectDB();

            try{
                assert connect != null;
                prepare = connect.prepareStatement(sql);
                prepare.executeUpdate();
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Admin");
                alert.setHeaderText(null);
                alert.setContentText("Book Updated!");
                alert.showAndWait();
                mainTitle.setText("All Books");
                AllBooksPage.setVisible(true);
                AddBookPage.setVisible(false);
                EditBookPage.setVisible(false);
                searchText.setVisible(true);
                searchIcon.setVisible(true);
                editTitle.setText("");
                editAuthor.setText("");
                editCategory.setText("");
                editYear.setText("");
                editDescription.setText("");
                showAllBooks();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (actionEvent.getSource() == clearEdit){
            editTitle.setText("");
            editAuthor.setText("");
            editCategory.setText("");
            editYear.setText("");
            editDescription.setText("");
        } else if (actionEvent.getSource() == cancelEdit) {
            mainTitle.setText("All Books");
            AllBooksPage.setVisible(true);
            AddBookPage.setVisible(false);
            EditBookPage.setVisible(false);
            searchText.setVisible(true);
            searchIcon.setVisible(true);
            editTitle.setText("");
            editAuthor.setText("");
            editCategory.setText("");
            editYear.setText("");
            editDescription.setText("");
        }
    }
    // changes visibility on MainPage
    public void MainControl(ActionEvent actionEvent) {
        if(actionEvent.getSource() == addBook){
            mainTitle.setText("Add New Book");
            AllBooksPage.setVisible(false);
            AddBookPage.setVisible(true);
            EditBookPage.setVisible(false);
            searchText.setVisible(false);
            searchIcon.setVisible(false);


        } else if(actionEvent.getSource() == editBook){
            AllBooks bookData = allBooks.getSelectionModel().getSelectedItem();
            if (bookData == null){
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("System error found!");
                alert.setHeaderText(null);
                alert.setContentText("Please, Select a book to edit!");
                alert.showAndWait();
            }else {
                mainTitle.setText("Edit Book Info");
                editTitle.setText(bookData.getTitle());
                editYear.setText(bookData.getYear());
                editCategory.setText(bookData.getCategory());
                editAuthor.setText(bookData.getAuthor());
                editDescription.setText(bookData.getDescription());
                searchText.setVisible(false);
                searchIcon.setVisible(false);
                AllBooksPage.setVisible(false);
                AddBookPage.setVisible(false);
                EditBookPage.setVisible(true);

            }
        } else if (actionEvent.getSource() == deleteBook){
            AllBooks bookData = allBooks.getSelectionModel().getSelectedItem();
            if (bookData == null){
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("System error found!");
                alert.setHeaderText(null);
                alert.setContentText("Please, Select a book to edit!");
                alert.showAndWait();
            }else {
                String sql = "DELETE FROM library_book WHERE id=%s".formatted(bookData.getId());
                connect = utils.Database.connectDB();
                try {
                    assert connect != null;
                    prepare = connect.prepareStatement(sql);
                    prepare.executeUpdate();
                    Alert alert = new Alert(Alert.AlertType.INFORMATION);
                    alert.setTitle("Admin");
                    alert.setHeaderText(null);
                    alert.setContentText("Book Deleted!");
                    alert.showAndWait();
                    mainTitle.setText("All Books");
                    AllBooksPage.setVisible(true);
                    AddBookPage.setVisible(false);
                    EditBookPage.setVisible(false);
                    searchText.setVisible(true);
                    searchIcon.setVisible(true);
                    clear();
                    showAllBooks();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

            }
        }
    }
    LibraryManagement libraryManagement = new LibraryManagement();
    @FXML
    public void logOut(ActionEvent event){
        try {
            if (event.getSource() == logOut) {
                libraryManagement.setStage("../fxml/login.fxml");

                logOut.getScene().getWindow().hide();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void search(KeyEvent keyEvent){
        // to check the input data is coming or not
        System.out.println(searchText.getText());
        // search ...
    }

    public void setName(){
        first_name.setText(UserInfo.getFirst_name());
        last_name.setText(UserInfo.getFirst_name());
    }

    public ObservableList<AllBooks> bookList(String sql) {
        ObservableList<AllBooks> listBooks = FXCollections.observableArrayList();
        Connection connect = utils.Database.connectDB();
        try {
            AllBooks Books;
            assert connect != null;
            PreparedStatement prepare = connect.prepareStatement(sql);
            ResultSet result = prepare.executeQuery();
            while (result.next()) {
                Books = new AllBooks(
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
    public void setTableValues(
            TableColumn<AllBooks, String> tableId,
            TableColumn<AllBooks, String> tableAuthor,
            TableColumn<AllBooks, String> tableCategory,
            TableColumn<AllBooks, String> tableTitle,
            TableColumn<AllBooks, String> tableYear,
            TableColumn<AllBooks, String> tableDescription,
            TableColumn<AllBooks, String> tableStatus
    ){
        tableId.setCellValueFactory(new PropertyValueFactory<>("id"));
        tableAuthor.setCellValueFactory(new PropertyValueFactory<>("author"));
        tableCategory.setCellValueFactory(new PropertyValueFactory<>("category"));
        tableTitle.setCellValueFactory(new PropertyValueFactory<>("title"));
        tableYear.setCellValueFactory(new PropertyValueFactory<>("year"));
        tableDescription.setCellValueFactory(new PropertyValueFactory<>("description"));
        tableStatus.setCellValueFactory(new PropertyValueFactory<>("status"));
    }
    public void showAllBooks(){
        ObservableList<AllBooks> listBook = bookList("SELECT * FROM library_book ORDER BY id ASC");

        setTableValues(tableId, tableAuthor, tableCategory, tableTitle, tableYear, tableDescription, tableStatus);

        allBooks.setItems(listBook);
    }
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        setName();
        showAllBooks();
        allBooks.setPlaceholder(new Label("There is no book available"));
    }
}

