package controllers;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyCode;
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


    private String MAIN = "../fxml/dashboard.fxml";
    LibraryManagement libraryManagement = new LibraryManagement();

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
                alert.setTitle("Admin Message");
                alert.setHeaderText(null);
                alert.setContentText("Please fill all blank fields.");
                alert.showAndWait();
            }else{
                if(result.next()){
                    if(result.getString("role").equals("A")){
                        MAIN = "../fxml/admin_dashboard.fxml";
                    }
                    getData.first_name = result.getString(2);
                    getData.last_name = result.getString(3);
                    getData.id_number = id_number.getText();
                    
                    alert = new Alert(AlertType.INFORMATION);
                    alert.setTitle("Admin Message");
                    alert.setHeaderText(null);
                    alert.setContentText("Successfully Login!");
                    alert.showAndWait();


                    login_Btn.getScene().getWindow().hide();
                    libraryManagement.setStage(MAIN);

                    
                }else{
                    alert = new Alert(AlertType.ERROR);
                    alert.setTitle("Admin Message");
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
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        login_Btn.setDefaultButton(true);
    }    
    
}
