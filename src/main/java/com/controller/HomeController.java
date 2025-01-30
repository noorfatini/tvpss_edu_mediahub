package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.service.ResourceDao;
import com.entity.Resource2;
import com.service.CriteriaDao;
import com.entity.Criteria;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private ResourceDao resourceDao;
    
    @Autowired
    private CriteriaDao criteriaDao;

    @GetMapping("/")
    public String redirectToDashboard() {
        return "redirect:/dashboard";
    }

    @RequestMapping("/dashboard")
    public ModelAndView dashboard() {
        ModelAndView modelAndView = new ModelAndView("dashboard");
        modelAndView.addObject("currentPage", "dashboard");
        return modelAndView;
    }

    

    
    
   
    
    
    
}