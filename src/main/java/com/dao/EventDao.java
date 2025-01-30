package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.entity.Events;

@Repository
public interface EventDao extends JpaRepository<Events, Integer> {
    // Add custom queries if needed
}
