package com.entity;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class SchoolInformationId implements Serializable {

    private static final long serialVersionUID = 1L;

    private int userID;
    private String schoolCode;

    public SchoolInformationId() {
    }

    public SchoolInformationId(int userID, String schoolCode) {
        this.userID = userID;
        this.schoolCode = schoolCode;
    }

    // Getters and Setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }

    // Override equals() and hashCode()
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SchoolInformationId that = (SchoolInformationId) o;
        return userID == that.userID && Objects.equals(schoolCode, that.schoolCode);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userID, schoolCode);
    }
}
