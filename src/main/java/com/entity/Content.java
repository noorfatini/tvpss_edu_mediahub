package com.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "content")
public class Content {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int contentID;

	@ManyToOne
	@JoinColumn(name = "schoolCode", referencedColumnName = "schoolCode", nullable = false)
	private School school; // References the School entity

	@ManyToOne
	@JoinColumn(name = "userID", referencedColumnName = "userID", nullable = false)
	private User user; // References the User entity

	@Column(nullable = false)
	private String contentTitle;

	@Column(nullable = false)
	private String contentPic;

	@Column(nullable = false, length = 500)
	private String contentDesc;

	@Column(nullable = false)
	private String contentLink;

	@Column(name = "uploadDate", nullable = false)
	@Temporal(TemporalType.DATE)
	private Date uploadDate;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private ContentStatus status;

	public enum ContentStatus {
		uploaded, rejected, approved
	}

	// Getters and Setters

	public int getContentID() {
		return contentID;
	}

	public void setContentID(int contentID) {
		this.contentID = contentID;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getContentTitle() {
		return contentTitle;
	}

	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}

	public String getContentPic() {
		return contentPic;
	}

	public void setContentPic(String contentPic) {
		this.contentPic = contentPic;
	}

	public String getContentDesc() {
		return contentDesc;
	}

	public void setContentDesc(String contentDesc) {
		this.contentDesc = contentDesc;
	}

	public String getContentLink() {
		return contentLink;
	}

	public void setContentLink(String contentLink) {
		this.contentLink = contentLink;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public ContentStatus getStatus() {
		return status;
	}

	public void setStatus(ContentStatus status) {
		this.status = status;
	}
}