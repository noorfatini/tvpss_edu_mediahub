package com.service;

import com.dao.ContentDao;
import com.entity.Content;
import com.entity.School;
import com.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentService {

    @Autowired
    private ContentDao contentDao;

    public List<Content> getContentBySchoolAndUser(String schoolCode, int userId) {
        List<Content> contents = contentDao.findBySchoolCodeAndUserId(schoolCode, userId);
        System.out.println("Contents fetched from DB: " + contents);
        return contents;
    }

    public int getTotalVideosBySchool(String schoolCode) {
        return contentDao.countVideosBySchoolCode(schoolCode);
    }

    public String getSchoolNameByCode(String schoolCode) {
        return contentDao.getSchoolNameByCode(schoolCode);
    }
    
    public List<Content> getContentBySchoolCode(String schoolCode) {
        return contentDao.findBySchoolCode(schoolCode);
    }
    
    public List<Content> getContentByUserId(int userId) {
        return contentDao.findByUserId(userId);
    }

    public void addContent(Content content) {
        contentDao.saveContent(content);
    }

    public void deleteContentById(int contentId) {
        contentDao.deleteById(contentId);
    }

    public User getUserById(int userId) {
        return contentDao.findUserById(userId);
    }

    public School getSchoolByCode(String schoolCode) {
        return contentDao.findSchoolByCode(schoolCode);
    }
}