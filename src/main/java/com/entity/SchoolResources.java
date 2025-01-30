package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "school_resources")
public class SchoolResources {

    @EmbeddedId
    private SchoolResourcesId id;

    @ManyToOne
    @MapsId("userID") // Maps the userID in the composite key
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    private User user;

    @ManyToOne
    @MapsId("schoolCode") // Maps the schoolCode in the composite key
    @JoinColumn(name = "schoolCode", referencedColumnName = "schoolCode")
    private School school;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean phone;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean mic;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean tripod;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean cam;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean lighting;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean laptop;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean vest;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean stabilizer;

    @Column(nullable = false, columnDefinition = "TINYINT(1) DEFAULT 0")
    private boolean greenscreen;

    // Default constructor
    public SchoolResources() {}

    // Getters and Setters
    public SchoolResourcesId getId() {
        return id;
    }

    public void setId(SchoolResourcesId id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public boolean isPhone() {
        return phone;
    }

    public void setPhone(boolean phone) {
        this.phone = phone;
    }

    public boolean isMic() {
        return mic;
    }

    public void setMic(boolean mic) {
        this.mic = mic;
    }

    public boolean isTripod() {
        return tripod;
    }

    public void setTripod(boolean tripod) {
        this.tripod = tripod;
    }

    public boolean isCam() {
        return cam;
    }

    public void setCam(boolean cam) {
        this.cam = cam;
    }

    public boolean isLighting() {
        return lighting;
    }

    public void setLighting(boolean lighting) {
        this.lighting = lighting;
    }

    public boolean isLaptop() {
        return laptop;
    }

    public void setLaptop(boolean laptop) {
        this.laptop = laptop;
    }

    public boolean isVest() {
        return vest;
    }

    public void setVest(boolean vest) {
        this.vest = vest;
    }

    public boolean isStabilizer() {
        return stabilizer;
    }

    public void setStabilizer(boolean stabilizer) {
        this.stabilizer = stabilizer;
    }

    public boolean isGreenscreen() {
        return greenscreen;
    }

    public void setGreenscreen(boolean greenscreen) {
        this.greenscreen = greenscreen;
    }
}
