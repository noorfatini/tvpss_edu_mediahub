package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.dao.EventDao;
import com.entity.Events;

@Service
public class EventService {

	@Autowired
	private final EventDao eventDao;

    public EventService(EventDao eventDao) {
        this.eventDao = eventDao;
    }

    // Save event to the database
    public void saveEvent(Events event) {
        eventDao.save(event);
    }
    
 // Method to save the uploaded file
    public String saveUploadedFile(MultipartFile file) {
        String directoryPath = "src/main/webapp/uploads/";  // Path to your uploads folder
        String fileName = file.getOriginalFilename();
        Path path = Paths.get(directoryPath + fileName);

        // Ensure the directory exists
        File uploadsDir = new File(directoryPath);
        if (!uploadsDir.exists()) {
            uploadsDir.mkdirs();  // Create the directory if it doesn't exist
        }

        try {
            // Save the file to the specified path
            file.transferTo(path.toFile());
            return fileName;  // Return the file name (you can return the complete path if you want)
        } catch (IOException e) {
            e.printStackTrace();
            return null;  // Return null if there was an error during file upload
        }
    }
}
