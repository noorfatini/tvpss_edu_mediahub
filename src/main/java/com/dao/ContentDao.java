package com.dao;

import com.entity.Content;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import javax.transaction.Transactional;
import com.entity.School;
import com.entity.User;


@Repository
public class ContentDao {

    @PersistenceContext
    private EntityManager entityManager;

    public List<Content> findBySchoolCodeAndUserId(String schoolCode, int userId) {
        return entityManager.createQuery(
                "SELECT c FROM Content c WHERE c.school.schoolCode = :schoolCode AND c.user.userID = :userId", 
                Content.class)
            .setParameter("schoolCode", schoolCode)
            .setParameter("userId", userId)
            .getResultList();
    }

    public int countVideosBySchoolCode(String schoolCode) {
        Long count = entityManager.createQuery(
            "SELECT COUNT(c) FROM Content c WHERE c.school.schoolCode = :schoolCode", Long.class)
            .setParameter("schoolCode", schoolCode)
            .getSingleResult();
        return count.intValue();
    }
    
    public String getSchoolNameByCode(String schoolCode) {
        return entityManager.createQuery(
            "SELECT s.schoolName FROM School s WHERE s.schoolCode = :schoolCode", String.class)
            .setParameter("schoolCode", schoolCode)
            .getSingleResult();
    }
    
    public List<Content> findBySchoolCode(String schoolCode) {
        return entityManager.createQuery(
                "SELECT c FROM Content c WHERE c.school.schoolCode = :schoolCode", Content.class)
                .setParameter("schoolCode", schoolCode)
                .getResultList();
    }
    
    public List<Content> findByUserId(int userId) {
        return entityManager.createQuery(
                        "SELECT c FROM Content c WHERE c.user.userID = :userId", Content.class)
                .setParameter("userId", userId)
                .getResultList();
    }

    @Transactional
    public void saveContent(Content content) {
        entityManager.persist(content);
    }

    @Transactional
    public void deleteById(int contentId) {
        Content content = entityManager.find(Content.class, contentId);
        if (content != null) {
            entityManager.remove(content);
        }
    }

    public User findUserById(int userId) {
        return entityManager.find(User.class, userId);
    }

    public School findSchoolByCode(String schoolCode) {
        return entityManager.find(School.class, schoolCode);
    }

    
}