package controllers;

public class UserInfo {
    private static int Id;
    private static String first_name;
    private static String last_name;
    private static String password;
    private static String id_number;
    private static String major;
    private static String role;
    private static String group_id;
    private static String status;

    public UserInfo() {
    }

    static int getId() {
        return Id;
    }

    static String getFirst_name() {
        return first_name;
    }

    static String getLast_name() {
        return last_name;
    }

    static String getPassword() {
        return password;
    }

    static String getId_number() {
        return id_number;
    }

    static String getMajor() {
        return major;
    }

    static String getRole() {
        return role;
    }

    static String getStatus() {
        return status;
    }

    static String getGroup_id() {
        return group_id;
    }

    static void setId(int Id){
        UserInfo.Id = Id;
    }

    static void setFirst_name(String first_name) {
        UserInfo.first_name = first_name;
    }

    static void setLast_name(String last_name) {
        UserInfo.last_name = last_name;
    }

    static void setPassword(String password) {
        UserInfo.password = password;
    }

    static void setId_number(String id_number) {
        UserInfo.id_number = id_number;
    }

    static void setMajor(String major) {
        UserInfo.major = major;
    }

    static void setRole(String role) {
        UserInfo.role = role;
    }

    static void setStatus(String status) {
        UserInfo.status = status;
    }

    static void setGroup_id(String group_id) {
        UserInfo.group_id = group_id;
    }
}
