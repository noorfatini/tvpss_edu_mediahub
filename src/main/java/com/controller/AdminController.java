package com.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.Content;
import com.entity.Criteria;
import com.entity.Resource2;
import com.entity.School;
import com.entity.User;
import com.service.ContentService;
import com.service.CriteriaDao;
import com.service.ResourceDao;
import com.service.SchoolService;
import com.service.UserService;


@Controller
public class AdminController {
	
	@Autowired
	private SchoolService schoolService;
	@Autowired
    private ContentService contentService;
	@Autowired
	private UserService userService;
	
	@Autowired
    private ResourceDao resourceDao;
    
    @Autowired
    private CriteriaDao criteriaDao;

	@GetMapping("/admin/dashboard")
    public String schoolDashboard(HttpSession session, Model model) {
		/*
		 * Object user = session.getAttribute("user"); if (user == null || !((User)
		 * user).getRole().equals("SCHOOL")) { return "redirect:/login"; // Redirect to
		 * login if not authorized } model.addAttribute("user", user);
		 */
        return "admin-dashboard"; // Maps to /WEB-INF/views/school-dashboard.jsp
    }

    @RequestMapping("/dashboard")
    public ModelAndView dashboard() {
        ModelAndView modelAndView = new ModelAndView("dashboard");
        modelAndView.addObject("currentPage", "dashboard");
        return modelAndView;
    }
    
 // View Content
    @GetMapping("/admin/list-content")
    public String showSchoolList(Model model) {
        List<School> schools = schoolService.getAllSchools();
        model.addAttribute("schools", schools);
        return "list-content"; // Add your content page here
    }
    
    @GetMapping("/admin/view-content")
    public String viewContent(@RequestParam("schoolCode") String schoolCode, Model model) {
        String schoolName = contentService.getSchoolNameByCode(schoolCode);
        List<Content> contents = contentService.getContentBySchoolCode(schoolCode);

        model.addAttribute("schoolName", schoolName);
        model.addAttribute("contents", contents);
        model.addAttribute("totalVideos", contents.size());

        return "view-content";
    }

    @RequestMapping("/admin/manage-account")
	public String manageAccount(Model model) {
		// Assuming you have a method in SchoolService to fetch all schools
		List<School> schools = schoolService.getAllSchools();
		model.addAttribute("schools", schools);
		return "manage-account"; // This maps to manage-account.jsp
	}

	@RequestMapping("/admin/delete-school")
	public String deleteSchoolAccount(@RequestParam("schoolCode") String schoolCode,
			RedirectAttributes redirectAttributes) {
		// Find the school by its code
		School school = schoolService.findSchoolByCode(schoolCode);

		if (school != null) {
			if (school.getUserID() != null) {
				// Delete the user account from the database
				userService.deleteUserById(school.getUserID().getUserID());

				// Set the userID in the school table to null
				school.setUserID(null);
				school.setRegisteredStatus(School.RegistrationStatus.UNREGISTERED);
				schoolService.updateSchool(school);

				// Success message
				redirectAttributes.addFlashAttribute("deleteSuccess",
						"Account for school " + school.getSchoolName() + " has been deleted successfully.");
			} else {
				// If no user is associated with the school
				redirectAttributes.addFlashAttribute("deleteError",
						"No account found for the school " + school.getSchoolName() + ".");
			}
		} else {
			// If the school is not found
			redirectAttributes.addFlashAttribute("deleteError", "School not found.");
		}

		// Redirect back to manage-account page
		return "redirect:/admin/manage-account";
	}

	@RequestMapping("/admin/edit-school")
	public String editSchool(@RequestParam("schoolCode") String schoolCode, Model model) {
		School school = schoolService.findSchoolByCode(schoolCode);
		if (school != null) {
			// Check if the school has an associated user
			if (school.getUserID() != null) {
				model.addAttribute("school", school);
				model.addAttribute("user", school.getUserID()); // Add user data
				model.addAttribute("hasUser", true); // Indicate that user data is available
			} else {
				model.addAttribute("school", school);
				model.addAttribute("hasUser", false); // No user data available
			}
		} else {
			model.addAttribute("errorMessage", "School or User not found.");
		}
		return "edit-school"; // This will map to edit-school.jsp page
	}

	@RequestMapping(value = "/admin/update-school", method = RequestMethod.POST)
	public String updateSchool(@RequestParam("schoolCode") String schoolCode,
			@RequestParam(value = "password", required = false) String password, @RequestParam("email") String email,
			@RequestParam("contactNum") String contactNum, RedirectAttributes redirectAttributes) {

		School school = schoolService.findSchoolByCode(schoolCode);
		if (school != null) {
			// Update email and contactNum for schools with status 'REQUEST' or
			// 'UNREGISTERED'
			school.setEmail(email);
			school.setContactNum(contactNum);

			// If the school has a user and the password is provided, update the password
			if (school.getUserID() != null && password != null && !password.isEmpty()) {
				User user = school.getUserID();
				user.setPassword(password);
				userService.updateUser(user); // Make sure to update the user as well
			}

			// Save the updated school
			schoolService.updateSchool(school);

			redirectAttributes.addFlashAttribute("updateSuccess", "School account updated successfully.");
		} else {
			redirectAttributes.addFlashAttribute("updateError", "School not found.");
		}

		return "redirect:/admin/manage-account"; // Redirect back to manage account page
	}
	
	@RequestMapping(value = "/admin/create-account", method = RequestMethod.POST)
	public String createAccount(@RequestParam("schoolCode") String schoolCode,
	                            @RequestParam("username") String username,
	                            @RequestParam("password") String password,
	                            @RequestParam("role") String role, // Accept role as a String
	                            RedirectAttributes redirectAttributes) {
	    try {
	        // Convert the role string to the UserRole enum
	        User.UserRole userRole = User.UserRole.valueOf(role.toLowerCase()); // Convert to lowercase and map to enum

	        // Find the school by schoolCode
	        School school = schoolService.findSchoolByCode(schoolCode);

	        if (school != null) {
	            // Check if the school already has a registered account
	            if (school.getUserID() != null) {
	                redirectAttributes.addFlashAttribute("createError", "Account already exists for this school.");
	                return "redirect:/admin/manage-account";
	            }

	            // Create the new User
	            User user = new User();
	            user.setUsername(username);
	            user.setPassword(password); // Ensure password encryption if needed
	            user.setRole(userRole); // Set role as UserRole enum
	            user.setEmail(school.getEmail()); // Retrieve email from School
	            user.setContactNumber(school.getContactNum()); // Retrieve contact number from School

	            try {
	                // Save the user to the database
	                userService.saveUser(user);

	                // Assign the userID to the school and update registration status
	                school.setUserID(user);
	                school.setRegisteredStatus(School.RegistrationStatus.REGISTERED);
	                schoolService.updateSchool(school);

	                // Success message
	                redirectAttributes.addFlashAttribute("createSuccess",
	                        "Account created successfully for " + school.getSchoolName());
	            } catch (Exception e) {
	                // Log and show error message
	                e.printStackTrace();
	                redirectAttributes.addFlashAttribute("createError",
	                        "Failed to create account due to an internal error.");
	            }
	        } else {
	            // If the school is not found
	            redirectAttributes.addFlashAttribute("createError", "School not found.");
	        }

	        return "redirect:/admin/manage-account"; // Redirect back to the manage account page
	    } catch (IllegalArgumentException e) {
	        // Handle the case where the role is invalid
	        redirectAttributes.addFlashAttribute("createError", "Invalid role selected.");
	        return "redirect:/admin/manage-account"; // Redirect back to manage account page
	    }
	}

	@RequestMapping(value = "/admin/create-account", method = RequestMethod.GET)
	public String createAccountPage(@RequestParam("schoolCode") String schoolCode, Model model) {
		// Find the school by its code
		School school = schoolService.findSchoolByCode(schoolCode);

		if (school != null) {
			model.addAttribute("school", school); // Add school data to the model
			return "create-account"; // This will map to the create-account.jsp page
		} else {
			model.addAttribute("errorMessage", "School not found.");
			return "redirect:/admin/manage-account"; // Redirect back to manage account if school is not found
		}
	}
	
	
	@RequestMapping("/admin/approve-resource")
    public ModelAndView approveResource() {
        ModelAndView modelAndView = new ModelAndView("approve-resource");
        try {
            
			List<Resource2> resources = resourceDao.getAllResources2();
            modelAndView.addObject("resources", resources);
            modelAndView.addObject("currentPage", "ResourceList");
        } catch (Exception e) {
            modelAndView.addObject("error", "Error fetching resources: " + e.getMessage());
        }
        return modelAndView;
    }
	
	@RequestMapping("/admin/criteria-list")
    public ModelAndView criteriaList() {
    	ModelAndView modelAndView = new ModelAndView("criteria-list");
    	try {
    		
    		List<Criteria> criteriaList = criteriaDao.getAllCriteria();
    		modelAndView.addObject("resources", criteriaList);
    		modelAndView.addObject("currentPage", "criteriaList");
    	} catch (Exception e) {
    		modelAndView.addObject("error", "Error fetching resources: " + e.getMessage());
    	}
    	return modelAndView;
    }
	
    
    @RequestMapping("/upload-resource")
    public ModelAndView uploadResource() {
        ModelAndView modelAndView = new ModelAndView("upload-resource");
        modelAndView.addObject("currentPage", "uploadResource");
        return modelAndView;
    }

    

    @RequestMapping("/validate-tvpss")
    public ModelAndView validateTVPSS() {
        ModelAndView modelAndView = new ModelAndView("validate-tvpss");
        modelAndView.addObject("currentPage", "validateTVPSS");
        return modelAndView;
    }
    
    
}
