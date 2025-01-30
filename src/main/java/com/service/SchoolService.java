package com.service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dao.SchoolDao;
import com.entity.School;

@Service
public class SchoolService {

	@PersistenceContext
	private EntityManager entityManager;
	
    @Autowired
    private SchoolDao schoolDao;

    // Method to find a school by its name
    public School findBySchoolName(String schoolName) {
        return schoolDao.findBySchoolName(schoolName);  // Fetch school from the database using the name
    }

    // Method to get all schools from the database
	/*
	 * public List<School> getAllSchools() { return schoolDao.findAll(); // Use the
	 * built-in findAll() method from JpaRepository }
	 */
    
 // Authenticate the school by email and password
 	public School authenticateSchool(String email, String password) {
 		System.out.println("Authenticating with Email: " + email + " and Password: " + password);

 		String queryStr = "SELECT s FROM School s WHERE s.email = :email AND s.passwordEmail = :password";
 		TypedQuery<School> query = entityManager.createQuery(queryStr, School.class);
 		query.setParameter("email", email);
 		query.setParameter("password", password);

 		try {
 			return query.getSingleResult();
 		} catch (javax.persistence.NoResultException e) {
 			System.out.println("No school found with the provided email and password.");
 			return null;
 		}
 	}

 	// Find a school by its schoolCode
 	public School findSchoolByCode(String schoolCode) {
 		return entityManager.find(School.class, schoolCode);
 	}

 	@Transactional
 	public void updateSchool(School school) {
 		entityManager.merge(school);
 	}

 	// In SchoolService.java
 	@Transactional
 	public String handleCreateAccount(String schoolCode) {
 	    System.out.println("Looking for school with code: " + schoolCode);
 	    School school = findSchoolByCode(schoolCode);

 	    if (school != null) {
 	        School.RegistrationStatus status = school.getRegisteredStatus();
 	        System.out.println("Current Status: " + status);

 	        switch (status) {
 	            case REGISTERED:
 	                return "Account already created.";

 	            case UNREGISTERED:
 	                // Update the status to REQUEST
 	                school.setRegisteredStatus(School.RegistrationStatus.REQUEST);
 	                entityManager.merge(school); // Save the updated school status
 	                return "Request has been sent to admin. Please follow up for updates.";

 	            case REQUEST:
 	                return "Your request has already been made. Please contact admin.";

 	            default:
 	                return "Unknown status.";
 	        }
 	    }

 	    return "Error: School not found.";
 	}

 	public List<School> getAllSchools() {
 		String queryStr = "SELECT s FROM School s ORDER BY s.schoolCode ASC";
 		TypedQuery<School> query = entityManager.createQuery(queryStr, School.class);
 		return query.getResultList();
 	}
}
