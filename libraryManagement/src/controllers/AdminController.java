package controllers;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.input.KeyEvent;

public class AdminController {

    @FXML
    private Label mainTitle;
    @FXML
    private TableView allBooks;

    @FXML
    private TableColumn id;

    @FXML
    private TableColumn title;
    @FXML
    private TableColumn category;
    @FXML
    private TableColumn author;
    @FXML
    private TableColumn year;
    @FXML
    private TableColumn description;
    @FXML
    private TableColumn status;


    public void addBook(ActionEvent actionEvent) {
    }

    public void deleteBook(ActionEvent actionEvent) {
    }

    public void editBook(ActionEvent actionEvent) {
    }

    public void search(KeyEvent keyEvent) {
    }
}

