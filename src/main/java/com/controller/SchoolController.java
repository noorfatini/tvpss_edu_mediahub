package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
/*import org.springframework.web.bind.annotation.ResponseBody;*/
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
/*import java.io.File;
import java.io.IOException;*/
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.entity.Content;
import com.entity.CrewApplications;
import com.entity.Events;
import com.entity.Resource2;
import com.entity.School;
import com.entity.User;
import com.service.ContentService;
import com.service.CrewApplicationService;
import com.service.CriteriaDao;
import com.service.EventService;
import com.service.ResourceDao;
import com.service.SchoolService;
import com.service.UserService;

@Controller
public class SchoolController {

	@Autowired
	private CrewApplicationService crewApplicationService;
	@Autowired
    private EventService eventService;
	@Autowired
    private SchoolService schoolService;
	@Autowired
    private UserService userService;
	@Autowired
    private ContentService contentService;

	@Autowired
    private ResourceDao resourceDao;
    
    @Autowired
    private CriteriaDao criteriaDao;
    
	// Display School Dashboard
	@GetMapping("/school/dashboard")
	public String schoolDashboard(Model model) {
		return "school-dashboard"; // Maps to /WEB-INF/views/school-dashboard.jsp
	}

	// View Content
    @GetMapping("/school/list-content")
    public String showSchoolList(Model model) {
        List<School> schools = schoolService.getAllSchools();
        model.addAttribute("schools", schools);
        return "list-content"; // Add your content page here
    }
    
    @GetMapping("/school/view-content")
    public String viewContent(@RequestParam("schoolCode") String schoolCode, Model model) {
        String schoolName = contentService.getSchoolNameByCode(schoolCode);
        List<Content> contents = contentService.getContentBySchoolCode(schoolCode);

        model.addAttribute("schoolName", schoolName);
        model.addAttribute("contents", contents);
        model.addAttribute("totalVideos", contents.size());

        return "view-content";
    }

    @GetMapping("/school/school-manage-content")
    public String manageContent(Model model) {
        
        Integer userId = 1;

        // Fetch user-specific content
        List<Content> userContents = contentService.getContentByUserId(userId);
        model.addAttribute("contents", userContents);

        // Add the user ID to the model
        model.addAttribute("user", contentService.getUserById(userId));
        return "school-manage-content";
    }


	// View Event
	@GetMapping("/school/view-event")
	public String viewEvent(Model model) {
		return "view-event"; // Add your event page here
	}

	// Upload Information
	@GetMapping("/school/upload-information")
	public String uploadInformation(Model model) {
		return "upload-information"; // Add your information upload page here
	}

	// Upload Resources
	@GetMapping("/school/upload-resources")
	public String uploadResources(Model model) {
		return "school-upload-resources"; // Add your resources upload page here
	}

	// Validate Crew
	@GetMapping("/school/school-validate-crew")
	public String validateCrew(Model model) {
	    // Fetch all crew applications
	    List<CrewApplications> applications = crewApplicationService.getAllCrewApplications();
	    
	    // Calculate statistics
	    long totalApplicants = applications.size();
	    long totalPending = applications.stream().filter(app -> app.getApplyStat() == CrewApplications.ApplicationStatus.PENDING).count();
	    long totalApproved = applications.stream().filter(app -> app.getApplyStat() == CrewApplications.ApplicationStatus.APPROVED).count();
	    long totalRejected = applications.stream().filter(app -> app.getApplyStat() == CrewApplications.ApplicationStatus.REJECTED).count();
	    
	    // Add data to model
	    model.addAttribute("applications", applications);
	    model.addAttribute("totalApplicants", totalApplicants);
	    model.addAttribute("totalPending", totalPending);
	    model.addAttribute("totalApproved", totalApproved);
	    model.addAttribute("totalRejected", totalRejected);
	    
	    return "school-validate-crew"; // Return the view
	}
	
	@PostMapping("/school/deleteApplication")
    public String deleteApplication(@RequestParam("applyId") int applyId, Model model) {
        try {
            // Delete the crew application by ID
            crewApplicationService.deleteCrewApplication(applyId);
            model.addAttribute("message", "Crew application deleted successfully.");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error deleting crew application.");
        }
        
        // Redirect back to the validation page
        return "redirect:/school/school-validate-crew";
    }

	
	@PostMapping("/school/updateStatus")
    public String updateStatus(@RequestParam("applyId") int applyId, @RequestParam("applyStat") String applyStat) {
        // Fetch the crew application by ID and update its status
        crewApplicationService.updateApplicationStatus(applyId, applyStat);

        // Redirect back to the same page or to a success page
        return "redirect:/school/school-validate-crew";
    }

	// Manage Event
	@GetMapping("/school/manage-event")
	public String manageEvent(Model model) {
		return "manage-event"; // Add your event management page here
	}
	
	// Show Create Event Form
    @GetMapping("/school/create-event")
    public String createEventForm(Model model) {
        // Set userId to null by default
        model.addAttribute("userId", null);
        return "school-create-event";  // Return the view
    }

    // Handle Event Creation
    @PostMapping("/school/create-event")
    public String createEvent(@RequestParam("eventName") String eventName,
                              @RequestParam("eventDesc") String eventDescription,
                              @RequestParam("eventDate") String eventDate,
                              @RequestParam("eventTime") String eventTime,
                              @RequestParam("eventLoc") String eventLocation,
                              @RequestParam("eventPoster") MultipartFile eventPoster,
                              @RequestParam("eventStatus") String eventStatus,
                              @RequestParam(value = "userId", required = false) Integer userId,
                              @RequestParam("schoolCode") String schoolCode,
                              Model model) {

        System.out.println("Event Name: " + eventName);
        System.out.println("Event Description: " + eventDescription);
    	
    	try {
    	    
            // Ensure that the eventName is not empty or null
            if (eventName == null || eventName.isEmpty()) {
                model.addAttribute("error", "Event name is required.");
                return "school-create-event"; // Redirect back to the event creation page with an error
            }

            // Check if the school exists by name (schoolCode)
            School school = schoolService.findBySchoolName(schoolCode);
            if (school == null) {
                model.addAttribute("error", "School name does not exist in the database.");
                return "school-create-event";  // Return to the form with an error message
            }

            // Handle file upload for the event poster
            String filePath = null;
            if (eventPoster != null && !eventPoster.isEmpty()) {
                // Define the path where you want to store the uploaded file
                String uploadsDir = "C:/Spring/STS/Workspace/psstv/src/main/webapp/uploads/";
                filePath = uploadsDir + eventPoster.getOriginalFilename();
                File dest = new File(filePath);
                eventPoster.transferTo(dest); // Save the file to disk
            }

            // Convert eventDate string to Date object
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = sdf.parse(eventDate);
            } catch (ParseException e) {
                e.printStackTrace();
                model.addAttribute("error", "Error parsing date.");
                return "school-create-event";  // Return to the form with an error message
            }

            // Create Event object and set its properties
            Events event = new Events();
            event.setEventName(eventName);
            event.setEventDescription(eventDescription);
            event.setEventDate(date);
            event.setEventTime(eventTime);
            event.setEventLocation(eventLocation);
            event.setEventPoster(filePath);
            event.setEventStatus(Events.EventStatus.valueOf(eventStatus));

         // Fetch user and set the event’s user and school
            if (userId != null) {
                User user = userService.findById(userId);
                event.setUser(user);
            }
            event.setSchool(school);

            // Save the event to the database
            eventService.saveEvent(event);

        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "Error uploading file.");
            return "school-create-event";  // Return to the form with an error message
        }
    	
    	if (eventDescription.length() > 500) {
    	    model.addAttribute("error", "Event description cannot exceed 255 characters.");
    	    return "school-create-event";
    	}


        // Redirect to a page to view all events after successful creation
        return "redirect:/school/school-read-event";
    }
    
    @RequestMapping("/upload-tvpss")
    public ModelAndView uploadTVPSS() {
        ModelAndView modelAndView = new ModelAndView("upload-tvpss");
        modelAndView.addObject("currentPage", "uploadTVPSS");
        return modelAndView;
    }
    
    @RequestMapping("/resource-list")
    public ModelAndView ResourceList() {
        ModelAndView modelAndView = new ModelAndView("resource-list");
        try {
           
			List<Resource2> resources = resourceDao.getAllResources2();
            modelAndView.addObject("resources", resources);
            modelAndView.addObject("currentPage", "ResourceList");
        } catch (Exception e) {
            modelAndView.addObject("error", "Error fetching resources: " + e.getMessage());
        }
        return modelAndView;
    }
    
    @RequestMapping("/upload-resource2")
    public ModelAndView uploadResource2() {
        ModelAndView modelAndView = new ModelAndView("upload-resource2");
        modelAndView.addObject("currentPage", "uploadResource2");
        return modelAndView;
    }
    
	// Logout
	@GetMapping("/logout")
	public String logout() {
		return "redirect:/login"; // Redirect to login page after logout
	}
}
