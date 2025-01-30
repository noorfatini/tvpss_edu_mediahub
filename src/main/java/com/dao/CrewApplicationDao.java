package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.entity.CrewApplications;

import java.util.List;

@Repository
public interface CrewApplicationDao extends JpaRepository<CrewApplications, Integer> {
    
    // This method will be automatically implemented by Spring Data JPA
    List<CrewApplications> findByApplyStat(CrewApplications.ApplicationStatus applyStat);

    // You don't need to manually define methods like save(), findById(), and findAll()
    // They are already provided by JpaRepository
}
