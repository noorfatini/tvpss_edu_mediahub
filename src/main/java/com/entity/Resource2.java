package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "resource2")
public class Resource2 {
    
    @Id
    @Column(name = "school_code")
    private String schoolCode;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "brand", nullable = false)
    private String brand;

    @Column(name = "quantity", nullable = false)
    private int quantity;

    @Column(name = "status")
    private String status;

    // Default constructor
    public Resource2() {}

    // Constructor with all fields
    public Resource2(String schoolCode, String type, String brand, int quantity, String status) {
        this.schoolCode = schoolCode;
        this.type = type;
        this.brand = brand;
        this.quantity = quantity;
        this.status = status;
    }

    // Getters and Setters
    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}