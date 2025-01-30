package com.controller;

import com.entity.TVPSSResource;
import com.service.ResourceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
public class TVPSSController {

    @Autowired
    private ResourceDao resourceService;

    @GetMapping("/validate-tvpss")
    public String validateTVPSSPage(Model model) {
        try {
            List<TVPSSResource> resources = resourceService.getAllResources();
            model.addAttribute("resources", resources);
            return "validate-tvpss";
        } catch (Exception e) {
            model.addAttribute("error", "Error fetching resources: " + e.getMessage());
            return "error";
        }
    }
    
    @GetMapping("/update-page")
    public String updatePage(Model model) { //update
        List<TVPSSResource> resources = resourceService.getAllResources();
        model.addAttribute("resources", resources);
        return "update-page";
    }

    @PostMapping("/update-resource-status")
    public ResponseEntity<String> updateResourceStatus(@RequestParam int id, @RequestParam String status) {
        try {
            if (!status.equalsIgnoreCase("APPROVED") && !status.equalsIgnoreCase("REJECTED")) {
                return ResponseEntity.badRequest().body("Invalid status value. Allowed values are 'APPROVED' or 'REJECTED'.");
            }

            TVPSSResource resource = resourceService.getResourceById(id);
            if (resource == null) {
                return ResponseEntity.badRequest().body("Resource not found with ID: " + id);
            }

            resourceService.updateResourceStatus(id, status.toUpperCase());
            return ResponseEntity.ok("Status updated successfully to " + status.toUpperCase() + ".");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error updating status: " + e.getMessage());
        }
    }

}
