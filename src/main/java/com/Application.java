package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com") // Ensure that your package is being scanned
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
