//package com.controller;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.service.UserService;
//import com.entity.User;
//
//@Controller
//@RequestMapping("/") // Maps all requests starting with /login to this controller
//public class LoginController {
//
//    @Autowired
//    private UserService userService;
//
//    // Display the Login Page
//    @GetMapping
//    public String loginPage() {
//        return "login"; // Maps to /WEB-INF/views/login.jsp
//    }
//
//    // Login Authentication
//    @PostMapping("/authenticate")
//    public String authenticate(HttpServletRequest request, HttpSession session, Model model) {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String role = request.getParameter("role");
//
//        User user = userService.validateUser(username, password, role);
//
//        if (user != null) {
//            session.setAttribute("user", user); // Store user in session
//            if ("ADMIN".equals(user.getRole())) {
//                return "redirect:/admin/dashboard";
//            } else if ("SCHOOL".equals(user.getRole())) {
//                return "redirect:/school/dashboard";
//            } else {
//                return "redirect:/guest/dashboard";
//            }
//        }
//
//        model.addAttribute("error", "Invalid username, password, or role.");
//        return "login";
//    }
//
//    // Logout
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate(); // Invalidate the session
//        return "redirect:/login"; // Redirect to the login page
//    }
//}
