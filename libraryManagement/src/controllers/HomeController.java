package controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import librarymanagement.availableBooks;
import librarymanagement.getData;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Objects;
import java.util.ResourceBundle;

public class HomeController implements Initializable {

    @FXML
    private Label studentNumber_label;

    @FXML
    private Button availableBooks_btn;

    @FXML
    private Button logout_btn;

    @FXML
    private AnchorPane availableBooks_form;

    @FXML
    private TableView<availableBooks> availableBooks_tableView;

    @FXML
    private TableColumn<availableBooks, String> col_ab_bookTitle;

    @FXML
    private TableColumn<availableBooks, String> col_ab_author;

    @FXML
    private TableColumn<availableBooks, Integer> col_ab_publishedDate;

    @FXML
    private Object take_btn;

    private Connection connect;
    private PreparedStatement prepare;
    private ResultSet result;

    public ObservableList<availableBooks> dataList() {

        ObservableList<availableBooks> listBooks = FXCollections.observableArrayList();

        String sql = "SELECT * FROM library_book";

        connect = utils.Database.connectDB();

        try {

            availableBooks aBooks;

            assert connect != null;
            prepare = connect.prepareStatement(sql);
            result = prepare.executeQuery();

            while (result.next()) {

                aBooks = new availableBooks(result.getInt("id"),
                        result.getString("title"), result.getString("published_year"),
                        result.getString("description"), result.getString("author"));

                listBooks.add(aBooks);

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
        Date date = new Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());

        String sql = "INSERT INTO library_take VALUES (?,?,?,?,?,?)";
        String sql1 = "SELECT user  WHERE id_number = " + getData.id_number;

        connect = utils.Database.connectDB();

        try {

            Alert alert;
            assert connect != null;
            prepare = connect.prepareStatement(sql1);
            result = prepare.executeQuery();
            int user_id = result.getInt(1);

            prepare = connect.prepareStatement(sql);
            prepare.setString(2, current_date);
            prepare.setString(3, current_date);
            prepare.setString(4, "NR");
            prepare.setInt(5, 1);
            prepare.setInt(6, user_id);
            prepare.executeUpdate();

            alert = new Alert(AlertType.INFORMATION);
            alert.setTitle("Admin Message");
            alert.setHeaderText(null);
            alert.setContentText("Successfully take the book!");
            alert.showAndWait();

//            clearTakeData();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    @FXML
    public void logout(ActionEvent event){
        try {
            if (event.getSource() == logout_btn) {
                // TO SWAP FROM DASHBOARD TO LOGIN FORM
                Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("../fxml/login.fxml")));

                Stage stage = new Stage();
                Scene scene = new Scene(root);

                root.setOnMousePressed((MouseEvent e) -> {
                    x = e.getSceneX();
                    y = e.getSceneY();
                });

                root.setOnMouseDragged((MouseEvent e) -> {

                    stage.setX(e.getScreenX() - x);
                    stage.setY(e.getScreenY() - y);

                });

                stage.setScene(scene);
                stage.show();

                logout_btn.getScene().getWindow().hide();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void navButtonDesign(ActionEvent event) {

        if (event.getSource() == availableBooks_btn) {

            availableBooks_form.setVisible(true);
        }
    }
    public void showAvailableBooks() {

        //    SHOWING BOOKS DATA
        ObservableList<availableBooks> listBook = dataList();

        col_ab_bookTitle.setCellValueFactory(new PropertyValueFactory<>("title"));
        col_ab_author.setCellValueFactory(new PropertyValueFactory<>("author"));
        col_ab_publishedDate.setCellValueFactory(new PropertyValueFactory<>("date"));

        availableBooks_tableView.setItems(listBook);

    }
    public void selectAvailableBooks() {

        availableBooks bookData = availableBooks_tableView.getSelectionModel().getSelectedItem();

        int num = availableBooks_tableView.getSelectionModel().getFocusedIndex();

        if ((num - 1) < -1) {
            return;
        }
        if (bookData != null){

            getData.savedTitle = bookData.getTitle();
            getData.savedAuthor = bookData.getAuthor();
            getData.savedPublishedDate = bookData.getDate();
        }

    }

    public void studentNumber() {
//        WE CAN DISPLAY THE STUDENT NUMBER THAT STUDENT USED
        studentNumber_label.setText(getData.id_number);
    }

    private double x = 0;
    private double y = 0;


    @Override
    public void initialize(URL location, ResourceBundle resources) {

        showAvailableBooks();

        studentNumber();


    }

}
