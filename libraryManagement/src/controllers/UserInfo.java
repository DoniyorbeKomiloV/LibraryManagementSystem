package controllers;

public class UserInfo {
    private int Id;
    private String first_name;
    private String last_name;
    private String password;
    private String id_number;
    private String major;
    private String role;
    private String group_id;
    private String status;


    public UserInfo(int Id, String first_name, String last_name, String password, String id_number, String major, String role, String status, String group_id) {
        this.Id = Id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.password = password;
        this.id_number = id_number;
        this.major = major;
        this.role = role;
        this.status = status;
        this.group_id = group_id;
    }

    public UserInfo() {
    }

    public int getId() {
        return Id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getPassword() {
        return password;
    }

    public String getId_number() {
        return id_number;
    }

    public String getMajor() {
        return major;
    }

    public String getRole() {
        return role;
    }

    public String getStatus() {
        return status;
    }

    public String getGroup_id() {
        return group_id;
    }

    public void setId(int Id){
        this.Id = Id;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setId_number(String id_number) {
        this.id_number = id_number;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setGroup_id(String group_id) {
        this.group_id = group_id;
    }
}
