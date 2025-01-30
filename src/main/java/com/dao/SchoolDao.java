package com.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.entity.School;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

@Repository
public interface SchoolDao extends JpaRepository<School, String> {

    // Find a school by its school name
    School findBySchoolName(String schoolName);

    // Custom query example using @Query
    @Query("SELECT s FROM School s WHERE s.schoolName = :name")
    List<School> findSchoolsByName(@Param("name") String schoolName);
}
