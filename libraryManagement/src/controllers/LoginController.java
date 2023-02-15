package controllers;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyEvent;
import utils.Database;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;

public class LoginController implements Initializable {
    
    @FXML
    private TextField id_number;

    @FXML
    private PasswordField password;

    @FXML
    private Button login_Btn;


    
    LibraryManagement libraryManagement = new LibraryManagement();

    public void setUser(int Id, String first_name, String last_name, String password, String id_number, String major, String role, String group_id, String status){

        UserInfo.setId(Id);
        UserInfo.setFirst_name(first_name);
        UserInfo.setLast_name(last_name);
        UserInfo.setPassword(password);
        UserInfo.setId_number(id_number);
        UserInfo.setMajor(major);
        UserInfo.setRole(role);
        UserInfo.setGroup_id(group_id);
        UserInfo.setStatus(status);
    }

    public void login(){
        String sql = "SELECT * FROM library_user WHERE id_number = ? and password = ?";

        Connection connect = Database.connectDB();
        
        try{

            assert connect != null;
            PreparedStatement prepare = connect.prepareStatement(sql);
            prepare.setString(1, id_number.getText());
            prepare.setString(2, password.getText());
            ResultSet result = prepare.executeQuery();
            Alert alert;
            
            if(id_number.getText().isEmpty() || password.getText().isEmpty()){
                
                alert = new Alert(AlertType.ERROR);
                alert.setTitle("System Message");
                alert.setHeaderText(null);
                alert.setContentText("Please, fill all blank fields.");
                alert.showAndWait();
            }else{
                if(result.next()){
                    setUser(
                            result.getInt(1),
                            result.getString(2),
                            result.getString(3),
                            result.getString(4),
                            result.getString(5),
                            result.getString(6),
                            result.getString(7),
                            result.getString(8),
                            result.getString(9)
                    );
                    if(result.getString("status").equals("B")){
                        alert = new Alert(AlertType.INFORMATION);
                        alert.setTitle("System Message");
                        alert.setHeaderText(null);
                        alert.setContentText("You hava been blocked by Admin and cannot access the application");
                        alert.showAndWait();
                        write("", "");
                    } else if (result.getString("role").equals("A")) {
                        alert = new Alert(AlertType.INFORMATION);
                        alert.setTitle("System Message");
                        alert.setHeaderText(null);
                        alert.setContentText("You have logged in as Admin");
                        alert.showAndWait();


                        libraryManagement.setStage("../fxml/admin.fxml");
                        login_Btn.getScene().getWindow().hide();
                    } else{
                        alert = new Alert(AlertType.INFORMATION);
                        alert.setTitle("System Message");
                        alert.setHeaderText(null);
                        alert.setContentText("Successfully Login!");
                        alert.showAndWait();
                        libraryManagement.setStage("../fxml/user.fxml");
                        login_Btn.getScene().getWindow().hide();
                    }
                }else{
                    alert = new Alert(AlertType.ERROR);
                    alert.setTitle("System Message");
                    alert.setHeaderText(null);
                    alert.setContentText("Wrong Username or Password.");
                    alert.showAndWait();
                }
            }
            
        }catch(Exception e){e.printStackTrace();}
        
    }

    public void numbersOnly(KeyEvent event){
        
        if(event.getCharacter().matches("[^\\e\t\r\\d+$]")){
            event.consume();
            
            id_number.setStyle("-fx-border-color:#e04040");
        }
        else if(event.getCharacter().matches("")){
            id_number.setStyle("-fx-border-color: -fill");
        }
        else{
            id_number.setStyle("-fx-border-color: -fill");
        }
        
    }

    private void write(String username, String pass) {
        id_number.setText(username);
        password.setText(pass);
    }


    @Override
    public void initialize(URL url, ResourceBundle rb) {
        write("2110120", "123");
        login_Btn.setDefaultButton(true);
    }

}
