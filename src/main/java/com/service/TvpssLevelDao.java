package com.service;

import com.entity.TvpssLevel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class TvpssLevelDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Transactional
    public void saveOrUpdate(TvpssLevel tvpssLevel) {
        getCurrentSession().saveOrUpdate(tvpssLevel);
    }
}
