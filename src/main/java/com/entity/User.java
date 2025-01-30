package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userID; // Matches `userID` with AUTO_INCREMENT in the database

    @Column(nullable = false, length = 255)
    private String username; // Matches `username` varchar(255) NOT NULL

    @Column(nullable = false, length = 255)
    private String password; // Matches `password` varchar(255) NOT NULL

    @Enumerated(EnumType.STRING)
    @Column(name = "role", nullable = false)
    private UserRole role; // Matches `role` enum('school','admin') NOT NULL

    @Column(nullable = false, length = 255)
    private String email; // Matches `email` varchar(255) NOT NULL

    @Column(nullable = false, length = 20)
    private String contactNumber; // Matches `contactNumber` varchar(20) NOT NULL

    // Enum for `role` column
    public enum UserRole {
        school,admin
    }

    // Getters and Setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    @Override
    public String toString() {
        return "User{" +
                "userID=" + userID +
                ", username='" + username + '\'' +
                ", role=" + role +
                ", email='" + email + '\'' +
                ", contactNumber='" + contactNumber + '\'' +
                '}';
    }
}
