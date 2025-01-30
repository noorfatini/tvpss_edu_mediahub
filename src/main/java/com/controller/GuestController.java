package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
/*import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;*/
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Content;
import com.entity.CrewApplications;
import com.entity.School;
import com.service.ContentService;
import com.service.CrewApplicationService;
import com.service.SchoolService;


@Controller
public class GuestController {
	

	@Autowired
    private ContentService contentService;

	// Display Guest Dashboard
	@GetMapping("/guest/dashboard")
	public String guestDashboard(Model model) {
		return "guest-dashboard"; // Maps to /WEB-INF/views/guest-dashboard.jsp
	}

	// View Event
	@GetMapping("/guest/view-event")
	public String viewEvent(Model model) {
		return "view-event"; // Add your event page here
	}

	// Apply Crew
	@GetMapping("/guest/guest-apply-crew")
	public String applyCrew(Model model) {
		return "guest-apply-crew"; // Add your apply crew page here
	}

	@Autowired
	private CrewApplicationService crewApplicationService;

	@Autowired
	private SchoolService schoolService;

	// Handle the submission of the crew application form
	@PostMapping("/guest/submitCrewApplication")
	public String submitCrewApplication(@RequestParam String name, @RequestParam int age, @RequestParam String phoneNum,
			@RequestParam String schoolName, // Accept schoolName
			@RequestParam String reason, Model model) {
		// Lookup the school using the provided schoolName
		School school = schoolService.findBySchoolName(schoolName);

		if (school == null) {
			model.addAttribute("message", "School not found. Please enter a valid school name.");
			return "guest-apply-crew"; // Return to the application form with an error message
		}

		// Create a new crew application object
		CrewApplications crewApplication = new CrewApplications();
		crewApplication.setName(name);
		crewApplication.setAge(age);
		crewApplication.setPhoneNum(phoneNum);
		crewApplication.setSchool(school); // Set the entire School object
		crewApplication.setReason(reason);

		// Submit the application to the service to save in the database
		crewApplicationService.submitApplication(crewApplication);

		// Return a success message (will appear as a popup on the same page)
		model.addAttribute("message", "Your application has been submitted successfully.");
		return "guest-apply-crew"; // Return to the same page with a success message
	}

	// Request Account
	@GetMapping("/guest/request-account")
	public String requestAccount(Model model) {
		return "request-account"; // Add your request account page here
	}

	// Handle the account request form submission
	@PostMapping("/guest/request-account")
	public String submitRequestAccount(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model) {
		// Log the email and password to debug
		System.out.println("Email entered: " + email);
		System.out.println("Password entered: " + password);

		// Check if email and password match with the database
		School school = schoolService.authenticateSchool(email, password);

		if (school != null) {
			// If successful, display school information
			model.addAttribute("schoolDetails", school);
			// return "request-account"; // Return to request-account.jsp with school
			// details
		} else {
			// If email and password don't match, show error message
			model.addAttribute("errorMessage", "Invalid email or password.");
			// return "request-account"; // Show the same form with error message
		}

		return "request-account";
	}

	// In GuestController.java
	@PostMapping("/guest/create-account")
	@ResponseBody
	public String handleCreateAccount(@RequestParam("schoolCode") String schoolCode) {
		System.out.println("Received schoolCode: " + schoolCode);

		// Check if schoolCode is missing
		if (schoolCode == null || schoolCode.isEmpty()) {
			return "Error: Missing school code.";
		}

		// Process the request to update the school status
		return schoolService.handleCreateAccount(schoolCode);
	}
	
	// View Content
    @GetMapping("/guest/list-content")
    public String showSchoolList(Model model) {
        List<School> schools = schoolService.getAllSchools();
        model.addAttribute("schools", schools);
        return "list-content"; // Add your content page here
    }
    
    @GetMapping("/guest/view-content")
    public String viewContent(@RequestParam("schoolCode") String schoolCode, Model model) {
        String schoolName = contentService.getSchoolNameByCode(schoolCode);
        List<Content> contents = contentService.getContentBySchoolCode(schoolCode);

        model.addAttribute("schoolName", schoolName);
        model.addAttribute("contents", contents);
        model.addAttribute("totalVideos", contents.size());

        return "view-content";
    }

	// Back to login
	@GetMapping("/login")
	public String backToLogin() {
		return "login"; // Redirect to login page
	}
}
