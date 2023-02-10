package controllers;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import utils.Database;
import librarymanagement.getData;

public class LoginController implements Initializable {
    
    @FXML
    private TextField id_number;

    @FXML
    private PasswordField password;

    @FXML
    private Button login_Btn;

    private Connection connect;
    private PreparedStatement prepare;
    private ResultSet result;
    private String MAIN = "../fxml/dashboard.fxml";
    
    private double x = 0;
    private double y = 0;
    public void login(){
        
        String sql = "SELECT * FROM library_user WHERE id_number = ? and password = ?";
        
        connect = Database.connectDB();
        
        try{
            
            prepare = connect.prepareStatement(sql);
            prepare.setString(1, id_number.getText());
            prepare.setString(2, password.getText());
            result = prepare.executeQuery();
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
                        System.out.println("Hello");
                    }
                    getData.id_number = id_number.getText();
                    
                    alert = new Alert(AlertType.INFORMATION);
                    alert.setTitle("Admin Message");
                    alert.setHeaderText(null);
                    alert.setContentText("Successfully Login!");
                    alert.showAndWait();


                    login_Btn.getScene().getWindow().hide();

                    Parent root = FXMLLoader.load(getClass().getResource(MAIN));
                    
                    Stage stage = new Stage();
                    
                    Scene scene = new Scene(root);
                    
                    root.setOnMousePressed((MouseEvent event) ->{
                        
                        x = event.getSceneX();
                        y = event.getSceneY();
                        
                    });
                    
                    root.setOnMouseDragged((MouseEvent event) ->{
                       
                        stage.setX(event.getScreenX() - x);
                        stage.setY(event.getScreenY() - y);
                        
                    });
                    
                    stage.setScene(scene);
                    stage.show();
                    
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
        // TODO
    }    
    
}
