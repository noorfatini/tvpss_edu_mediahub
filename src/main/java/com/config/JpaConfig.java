package com.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.context.annotation.ComponentScan;

@Configuration
@EnableJpaRepositories(basePackages = "com.dao")  // Your DAO package
@ComponentScan(basePackages = "com")  // Make sure to scan the correct packages
public class JpaConfig {
    // Any other configurations (e.g., DataSource, Hibernate, etc.) can go here
}
