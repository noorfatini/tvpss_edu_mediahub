package com.service;

import com.entity.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

@Repository
public class CriteriaDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public List<Criteria> getAllCriteria() {
        return getCurrentSession().createQuery("from Criteria", Criteria.class).getResultList();
    }

    @Transactional
    public Criteria getCriteriaBySchoolCode(String schoolCode) {
        return getCurrentSession().get(Criteria.class, schoolCode);
    }

    @Transactional
    public void saveCriteria(Criteria criteria) {
        Session session = getCurrentSession();
        
        // Check if a record with the same school code exists
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Criteria> query = builder.createQuery(Criteria.class);
        Root<Criteria> root = query.from(Criteria.class);
        query.select(root).where(builder.equal(root.get("schoolCode"), criteria.getSchoolCode()));
        
        Criteria existingCriteria = null;
        try {
            existingCriteria = session.createQuery(query).getSingleResult();
        } catch (Exception e) {
            // No existing record found
        }

        if (existingCriteria != null) {
            // Update existing record
            criteria.setId(existingCriteria.getId());
            session.merge(criteria);
        } else {
            // Save new record
            session.save(criteria);
        }
        
        session.flush();
    }

    @Transactional
    public void updateCriteria(Criteria criteria) {
        getCurrentSession().update(criteria);
        getCurrentSession().flush();
    }

    @Transactional
    public void deleteCriteria(String schoolCode) {
        Criteria criteria = getCriteriaBySchoolCode(schoolCode);
        if (criteria != null) {
            getCurrentSession().delete(criteria);
        }
    }
}