package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "criteria")
public class Criteria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "school_code", nullable = false, length = 50)
    private String schoolCode;

    @Column(name = "brand_name", nullable = false, length = 100)
    private String brandName;

    @Column(name = "school_logo_link", length = 255)
    private String schoolLogoLink;

    @Column(name = "studio_logo_link", length = 255)
    private String studioLogoLink;

    @Column(name = "recording_in_school_link", length = 255)
    private String recordingInSchoolLink;

    @Column(name = "youtube_link", length = 255)
    private String youtubeLink;

    @Column(name = "recording_outside_school_link", length = 255)
    private String recordingOutsideSchoolLink;

    @Column(name = "collaborate_with_external_agencies", length = 255)
    private String collaborateWithExternalAgencies;

    @Column(name = "green_screen_technology_link", length = 255)
    private String greenScreenTechnologyLink;

    // Default Constructor
    public Criteria() {}

    // Constructor with all fields
    public Criteria(String schoolCode, String brandName, String schoolLogoLink, String studioLogoLink,
                    String recordingInSchoolLink, String youtubeLink, String recordingOutsideSchoolLink,
                    String collaborateWithExternalAgencies, String greenScreenTechnologyLink) {
        this.schoolCode = schoolCode;
        this.brandName = brandName;
        this.schoolLogoLink = schoolLogoLink;
        this.studioLogoLink = studioLogoLink;
        this.recordingInSchoolLink = recordingInSchoolLink;
        this.youtubeLink = youtubeLink;
        this.recordingOutsideSchoolLink = recordingOutsideSchoolLink;
        this.collaborateWithExternalAgencies = collaborateWithExternalAgencies;
        this.greenScreenTechnologyLink = greenScreenTechnologyLink;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getSchoolLogoLink() {
        return schoolLogoLink;
    }

    public void setSchoolLogoLink(String schoolLogoLink) {
        this.schoolLogoLink = schoolLogoLink;
    }

    public String getStudioLogoLink() {
        return studioLogoLink;
    }

    public void setStudioLogoLink(String studioLogoLink) {
        this.studioLogoLink = studioLogoLink;
    }

    public String getRecordingInSchoolLink() {
        return recordingInSchoolLink;
    }

    public void setRecordingInSchoolLink(String recordingInSchoolLink) {
        this.recordingInSchoolLink = recordingInSchoolLink;
    }

    public String getYoutubeLink() {
        return youtubeLink;
    }

    public void setYoutubeLink(String youtubeLink) {
        this.youtubeLink = youtubeLink;
    }

    public String getRecordingOutsideSchoolLink() {
        return recordingOutsideSchoolLink;
    }

    public void setRecordingOutsideSchoolLink(String recordingOutsideSchoolLink) {
        this.recordingOutsideSchoolLink = recordingOutsideSchoolLink;
    }

    public String getCollaborateWithExternalAgencies() {
        return collaborateWithExternalAgencies;
    }

    public void setCollaborateWithExternalAgencies(String collaborateWithExternalAgencies) {
        this.collaborateWithExternalAgencies = collaborateWithExternalAgencies;
    }

    public String getGreenScreenTechnologyLink() {
        return greenScreenTechnologyLink;
    }

    public void setGreenScreenTechnologyLink(String greenScreenTechnologyLink) {
        this.greenScreenTechnologyLink = greenScreenTechnologyLink;
    }
}
