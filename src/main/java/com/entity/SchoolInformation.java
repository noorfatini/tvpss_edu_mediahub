package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "school_information")
public class SchoolInformation {

    @EmbeddedId
    private SchoolInformationId id;

    @Column(name = "brandName")
    private boolean brandName;

    @Column(name = "logo")
    private boolean logo;

    @Column(name = "miniStudio")
    private boolean miniStudio;

    @Column(name = "inRecord")
    private boolean inRecord;

    @Column(name = "outRecord")
    private boolean outRecord;

    @Column(name = "uploadVid")
    private boolean uploadVid;

    @Column(name = "collab")
    private boolean collab;

    @Column(name = "greenscreen")
    private boolean greenscreen;

    public SchoolInformation() {
    }

    // Getters and Setters
    public SchoolInformationId getId() {
        return id;
    }

    public void setId(SchoolInformationId id) {
        this.id = id;
    }

    public boolean isBrandName() {
        return brandName;
    }

    public void setBrandName(boolean brandName) {
        this.brandName = brandName;
    }

    public boolean isLogo() {
        return logo;
    }

    public void setLogo(boolean logo) {
        this.logo = logo;
    }

    public boolean isMiniStudio() {
        return miniStudio;
    }

    public void setMiniStudio(boolean miniStudio) {
        this.miniStudio = miniStudio;
    }

    public boolean isInRecord() {
        return inRecord;
    }

    public void setInRecord(boolean inRecord) {
        this.inRecord = inRecord;
    }

    public boolean isOutRecord() {
        return outRecord;
    }

    public void setOutRecord(boolean outRecord) {
        this.outRecord = outRecord;
    }

    public boolean isUploadVid() {
        return uploadVid;
    }

    public void setUploadVid(boolean uploadVid) {
        this.uploadVid = uploadVid;
    }

    public boolean isCollab() {
        return collab;
    }

    public void setCollab(boolean collab) {
        this.collab = collab;
    }

    public boolean isGreenscreen() {
        return greenscreen;
    }

    public void setGreenscreen(boolean greenscreen) {
        this.greenscreen = greenscreen;
    }
}
