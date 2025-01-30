package com.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "events")
public class Events {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int eventId;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;  // Assumed User entity

    @ManyToOne
    @JoinColumn(name = "schoolCode")
    private School school;  // Assumed School entity

    @Column(name = "eventName")
    private String eventName;

    @Column(name = "eventDesc")
    private String eventDescription;

    @Column(name = "eventDate")
    private Date eventDate;

    @Column(name = "eventTime")
    private String eventTime;

    @Column(name = "eventLoc")
    private String eventLocation;

    @Column(name = "eventPoster")
    private String eventPoster;

    @Enumerated(EnumType.STRING)
    @Column(name = "eventStatus")
    private EventStatus eventStatus;

    public enum EventStatus {
        ONGOING, COMING_SOON, FINISHED
    }

    // Getters and Setters
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
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

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public String getEventLocation() {
        return eventLocation;
    }

    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }

    public String getEventPoster() {
        return eventPoster;
    }

    public void setEventPoster(String eventPoster) {
        this.eventPoster = eventPoster;
    }

    public EventStatus getEventStatus() {
        return eventStatus;
    }

    public void setEventStatus(EventStatus eventStatus) {
        this.eventStatus = eventStatus;
    }
}
