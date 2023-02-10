/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarymanagement;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

public class LibraryManagement extends Application {
    
    private double x = 0;
    private double y = 0;
    
    @Override
    public void start(Stage stage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("../fxml/login.fxml"));
        
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
    }
    public static void main(String[] args) {
        launch(args);
    }
    
}
