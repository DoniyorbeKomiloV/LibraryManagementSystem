package controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;
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
        StringBuilder newString = new StringBuilder();
        for(int i=0; i<oldString.length(); i++){
            if (oldString.charAt(i) == '\'') newString.append("\\'");
            else if (oldString.charAt(i) == '\"') newString.append("\\\"");
            else newString.append(oldString.charAt(i));
        }
        return newString.toString();
    }
    public void showAlert(Alert.AlertType alertType, String text){
        Alert alert = new Alert(alertType);
        alert.setTitle("System Message");
        alert.setHeaderText(null);
        alert.setContentText(text);
        alert.getButtonTypes().clear();
        alert.getButtonTypes().add(ButtonType.OK);
        alert.showAndWait();
    }
    public void AddBook(ActionEvent actionEvent) {
        if (actionEvent.getSource() == save){
            if (title.getText().strip().equals("")){
                showAlert(Alert.AlertType.INFORMATION, "Book title field is empty");
            }else if (author.getText().strip().equals("")){
                showAlert(Alert.AlertType.INFORMATION, "Book author field is empty");
            }else if (year.getText().strip().equals("")){
                showAlert(Alert.AlertType.INFORMATION, "Book published year field is empty");
            }else if (category.getText().strip().equals("")){
                showAlert(Alert.AlertType.INFORMATION, "Book category field is empty");
            }else if (description.getText().strip().equals("")){
                showAlert(Alert.AlertType.INFORMATION, "Book description field is empty");
            }else {
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
                    showAlert(Alert.AlertType.CONFIRMATION, "Book Added!");
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
                showAlert(Alert.AlertType.CONFIRMATION, "Book Updated!");
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
                showAlert(Alert.AlertType.ERROR, "Please, Select a book to edit!");
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
                showAlert(Alert.AlertType.ERROR, "Please, Select a book to delete!");
            }else {
                String sql = "DELETE FROM library_book WHERE id=%s".formatted(bookData.getId());
                String sql2 = "SELECT check_status FROM library_book WHERE id=%d".formatted(bookData.getId());
                connect = utils.Database.connectDB();
                try {
                    assert connect != null;
                    Alert alert3 = new Alert(Alert.AlertType.INFORMATION);
                    alert3.setTitle("System Message");
                    alert3.setHeaderText(null);
                    alert3.setContentText("Do you want to remove this book?\nIf yes, press 'OK'\nOtherwise, press 'CANCEL'");
                    alert3.getDialogPane().getButtonTypes().add(ButtonType.CANCEL);
                    Optional<ButtonType> result = alert3.showAndWait();
                    alert3.getButtonTypes().clear();
                    alert3.getButtonTypes().add(ButtonType.OK);

                    if(result.isEmpty()){
                        // alert is exited, no button has been pressed.
                    } else if(result.get() == ButtonType.CANCEL) {
                        showAlert(Alert.AlertType.INFORMATION, "Book is not deleted!");
                    } else if(result.get() == ButtonType.OK){
                        prepare = connect.prepareStatement(sql2);
                        ResultSet status = prepare.executeQuery();
                        status.next();
                        if (status.getObject("check_status").toString().equals("R")){
                            prepare = connect.prepareStatement(sql);
                            prepare.executeUpdate();
                            showAlert(Alert.AlertType.CONFIRMATION, "Book is successfully deleted!");
                        } else {
                            showAlert(Alert.AlertType.ERROR, "Book is not returned!\nYou can not delete it now!");
                        }
                    }
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
    public void search(){
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

