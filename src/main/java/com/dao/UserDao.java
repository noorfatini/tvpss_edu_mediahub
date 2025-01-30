package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.entity.User;

public interface UserDao extends JpaRepository<User, Integer> {
	@Query("SELECT u FROM User u WHERE u.username = :username AND u.password = :password AND u.role = :role")
	User findByUsernameAndPasswordAndRole(String username, String password, String role);
}
