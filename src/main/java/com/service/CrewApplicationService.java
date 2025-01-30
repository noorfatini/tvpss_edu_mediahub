package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.dao.CrewApplicationDao;
import com.entity.CrewApplications;

@Service
public class CrewApplicationService {

    @Autowired
    private CrewApplicationDao crewApplicationDao;

    // Submit a new crew application
    public void submitApplication(CrewApplications crewApplication) {
        crewApplicationDao.save(crewApplication);  // Save the application to the database
    }

    // Get all crew applications
    public List<CrewApplications> getAllCrewApplications() {
        return crewApplicationDao.findAll();  // Retrieve all applications
    }

    // Get crew applications by status (approved, rejected, pending)
    public List<CrewApplications> getCrewApplicationsByStatus(String applyStat) {
        // Convert the String to an ApplicationStatus enum
        CrewApplications.ApplicationStatus status = CrewApplications.ApplicationStatus.valueOf(applyStat.toUpperCase());
        return crewApplicationDao.findByApplyStat(status);  // Use the DAO to fetch applications by status
    }

    // Update crew application status by ID
    public void updateApplicationStatus(int applyId, String applyStat) {
        CrewApplications application = crewApplicationDao.findById(applyId).orElseThrow();
        application.setApplyStat(CrewApplications.ApplicationStatus.valueOf(applyStat));
        crewApplicationDao.save(application);  // Save the updated application back to the database
    }

    // Delete a crew application by ID
    public void deleteCrewApplication(int applyId) {
        crewApplicationDao.deleteById(applyId);  // Use the DAO to delete by ID
    }

    // Find applications by status
    public List<CrewApplications> getApplicationsByStatus(CrewApplications.ApplicationStatus status) {
        return crewApplicationDao.findByApplyStat(status);  // Fetch applications by status
    }
}
