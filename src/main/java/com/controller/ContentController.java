/*
 * package com.controller;
 * 
 * import com.entity.Content; import com.entity.School; import
 * com.service.ContentService; import com.service.SchoolService;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody;
 * 
 * import java.time.LocalDate; import java.time.ZoneId; import java.util.Date;
 * import java.util.List;
 * 
 * @Controller public class ContentController {
 * 
 * @Autowired private SchoolService schoolService;
 * 
 * @Autowired private ContentService contentService;
 * 
 * 
 * // Display Guest Dashboard
 * 
 * @GetMapping("/guest/dashboard") public String guestDashboard(Model model) {
 * return "guest-dashboard"; // Maps to /WEB-INF/views/guest-dashboard.jsp }
 * 
 * 
 * @GetMapping("/view-content") public String
 * viewContent(@RequestParam("schoolCode") String schoolCode, Model model) {
 * String schoolName = contentService.getSchoolNameByCode(schoolCode);
 * List<Content> contents = contentService.getContentBySchoolCode(schoolCode);
 * 
 * model.addAttribute("schoolName", schoolName); model.addAttribute("contents",
 * contents); model.addAttribute("totalVideos", contents.size());
 * 
 * return "view-content"; }
 * 
 * @GetMapping("/manage-content") public String
 * manageContent(@RequestParam(value = "userId", required = false) Integer
 * userId, Model model) { if (userId == null) { throw new
 * IllegalArgumentException("User ID is required to manage content."); }
 * 
 * // Fetch user-specific content List<Content> userContents =
 * contentService.getContentByUserId(userId); model.addAttribute("contents",
 * userContents);
 * 
 * // Add the user ID to the model model.addAttribute("user",
 * contentService.getUserById(userId)); return "manage-content"; }
 * 
 * @ResponseBody
 * 
 * @PostMapping("/add-content") public String addContent(@RequestParam("userID")
 * int userID, @RequestParam("schoolCode") String schoolCode,
 * 
 * @RequestParam("contentTitle") String
 * contentTitle, @RequestParam("contentLink") String contentLink,
 * 
 * @RequestParam("contentDesc") String contentDesc, @RequestParam("contentPic")
 * String contentPic) { try { Content newContent = new Content();
 * newContent.setUser(contentService.getUserById(userID));
 * newContent.setSchool(contentService.getSchoolByCode(schoolCode));
 * newContent.setContentTitle(contentTitle);
 * newContent.setContentLink(contentLink);
 * newContent.setContentDesc(contentDesc); newContent.setContentPic(contentPic);
 * newContent.setUploadDate(new Date());
 * newContent.setStatus(Content.ContentStatus.uploaded);
 * 
 * contentService.addContent(newContent); return
 * "Content uploaded successfully!"; } catch (Exception e) {
 * e.printStackTrace(); return "Failed to upload content."; } }
 * 
 * @PostMapping("/delete-content") public String
 * deleteContent(@RequestParam("contentId") int
 * contentId, @RequestParam("userId") int userId) {
 * contentService.deleteContentById(contentId); // Deletes content return
 * "redirect:/manage-content?userId=" + userId; // Redirects to updated page }
 * 
 * }
 */