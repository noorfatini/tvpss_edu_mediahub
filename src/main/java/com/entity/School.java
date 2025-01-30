package com.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "school")
public class School {

    @Id
    @Column(name = "schoolCode")
    private String schoolCode;

    @OneToMany(mappedBy = "school")
    private List<Content> contentList;

    @OneToMany(mappedBy = "school")
    private List<CrewApplications> crewApplications;

    @OneToMany(mappedBy = "school")
    private List<Events> eventsList;

    private String schoolName;
    private String districtPPD;
    private String address;
    private String email;
    private String passwordEmail;
    private String contactNum;

    @Enumerated(EnumType.STRING)
    private SchoolType schoolType;

    @Enumerated(EnumType.STRING)
    private RegistrationStatus registeredStatus;

    private Integer level;
    private Integer version;
    
 // Add relationship to User
    @ManyToOne
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    private User userID;

    public enum SchoolType {
        PRIMARY, SECONDARY
    }

    public enum RegistrationStatus {
        REGISTERED, UNREGISTERED, REQUEST
    }

    public School() {
        // Default constructor for JPA
    }

    
    // Getters and Setters
    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }

    public List<Content> getContentList() {
        return contentList;
    }

    public void setContentList(List<Content> contentList) {
        this.contentList = contentList;
    }

    public List<CrewApplications> getCrewApplications() {
        return crewApplications;
    }

    public void setCrewApplications(List<CrewApplications> crewApplications) {
        this.crewApplications = crewApplications;
    }

    public List<Events> getEventsList() {
        return eventsList;
    }

    public void setEventsList(List<Events> eventsList) {
        this.eventsList = eventsList;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getDistrictPPD() {
        return districtPPD;
    }

    public void setDistrictPPD(String districtPPD) {
        this.districtPPD = districtPPD;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordEmail() {
        return passwordEmail;
    }

    public void setPasswordEmail(String passwordEmail) {
        this.passwordEmail = passwordEmail;
    }

    public String getContactNum() {
        return contactNum;
    }

    public void setContactNum(String contactNum) {
        this.contactNum = contactNum;
    }

    public SchoolType getSchoolType() {
        return schoolType;
    }

    public void setSchoolType(SchoolType schoolType) {
        this.schoolType = schoolType;
    }

    public RegistrationStatus getRegisteredStatus() {
        return registeredStatus;
    }

    public void setRegisteredStatus(RegistrationStatus registeredStatus) {
        this.registeredStatus = registeredStatus;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
    
    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
        this.userID = userID;
    }
}
