package controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;

public class AdminController {
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
    private TableView allBooks;
    @FXML
    private TextField id;
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
    private TableColumn tableId;
    @FXML
    private TableColumn tableTitle;
    @FXML
    private TableColumn tableCategory;
    @FXML
    private TableColumn tableAuthor;
    @FXML
    private TableColumn tableYear;
    @FXML
    private TableColumn tableDescription;
    @FXML
    private TableColumn tableStatus;

    public void clear(){
        id.setText("");
        title.setText("");
        author.setText("");
        year.setText("");
        category.setText("");
        description.setText("");
    }
    // Changes visibility on editBook and addBook pages
    public void AddBook(ActionEvent actionEvent) {
        if (actionEvent.getSource() == save){
            // check the info and save the book or return error

            //return to main page
            clear();
            mainTitle.setText("All Books");
            AllBooksPage.setVisible(true);
            AddBookPage.setVisible(false);
            searchText.setVisible(true);
            searchIcon.setVisible(true);
        } else if (actionEvent.getSource() == clear){
            // clear the fields
            clear();
        } else if (actionEvent.getSource() == cancel){
            //clear the fields and return to main page
            clear();
            mainTitle.setText("All Books");
            AllBooksPage.setVisible(true);
            AddBookPage.setVisible(false);
            searchText.setVisible(true);
            searchIcon.setVisible(true);
        }
    }
    // changes visibility on MainPage
    public void MainControl(ActionEvent actionEvent) {
        if(actionEvent.getSource() == addBook){
            mainTitle.setText("Add New Book");
            AllBooksPage.setVisible(false);
            AddBookPage.setVisible(true);
            searchText.setVisible(false);
            searchIcon.setVisible(false);
        } else if(actionEvent.getSource() == editBook){
            mainTitle.setText("Edit Book Info");
            System.out.println(allBooks.getSelectionModel().getSelectedItems());
            searchText.setVisible(false);
            searchIcon.setVisible(false);
        } else if (actionEvent.getSource() == deleteBook){
            mainTitle.setText("All Books");
            System.out.println(allBooks.getSelectionModel().getSelectedItems());
        }
    }
    public void search(KeyEvent keyEvent){
        // to check the input data is coming or not
        System.out.println(searchText.getText());
        // search ...
    }

}

