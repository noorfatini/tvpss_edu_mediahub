package com.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "crew_applications")
public class CrewApplications {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int applyId;

    @Column(name = "applyDate", columnDefinition = "DATE DEFAULT CURRENT_DATE")
    private Date applyDate;

    @ManyToOne
    @JoinColumn(name = "schoolCode", referencedColumnName = "schoolCode")
    private School school;

    @Enumerated(EnumType.STRING)
    private ApplicationStatus applyStat = ApplicationStatus.PENDING;

    private String name;
    private int age;
    private String phoneNum;
    private String reason;

    public enum ApplicationStatus {
        PENDING, APPROVED, REJECTED
    }

    // Getters and Setters
    public int getApplyId() {
        return applyId;
    }

    public void setApplyId(int applyId) {
        this.applyId = applyId;
    }

    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public ApplicationStatus getApplyStat() {
        return applyStat;
    }

    public void setApplyStat(ApplicationStatus applyStat) {
        this.applyStat = applyStat;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
    
 // Automatically set applyDate before persisting the entity
    @PrePersist
    public void setApplyDate() {
        if (applyDate == null) {
            this.applyDate = new Date();  // Set to current date if not already set
        }
    }
}
