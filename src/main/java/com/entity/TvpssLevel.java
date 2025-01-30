package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "tvpss_level")
public class TvpssLevel {

    @Id
    @Column(name = "school_code")
    private String schoolCode;

    @Column(name = "level", nullable = true) // Updated column name
    private String level; // Renamed field

    // Default constructor
    public TvpssLevel() {}

    // Constructor with all fields
    public TvpssLevel(String schoolCode, String level) {
        this.schoolCode = schoolCode;
        this.level = level;
    }

    // Getters and Setters
    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
