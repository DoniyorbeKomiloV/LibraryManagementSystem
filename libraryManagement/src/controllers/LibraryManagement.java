
package controllers;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.Objects;

public class LibraryManagement extends Application {
    
    private double x = 0;
    private double y = 0;
    public void setStage(String fxmlFile) throws IOException {
        Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource(fxmlFile)));

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
        stage.setResizable(false);
        stage.setTitle("Library Management System");
        stage.setScene(scene);

        stage.show();
    }

    @Override
    public void start(Stage stage) throws Exception {
        setStage("../fxml/login.fxml");
    }
    public static void main(String[] args) {
        launch(args);
    }
    
}
