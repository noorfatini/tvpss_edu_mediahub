package com.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.entity.User;
import com.dao.UserDao;

@Service
public class UserService {

	@PersistenceContext
    private EntityManager entityManager;
	
	@Autowired
	private UserDao userDao;

	public User validateUser(String username, String password, String role) {
		User.UserRole userRole;
		try {
			userRole = User.UserRole.valueOf(role.toUpperCase());
			return userDao.findByUsernameAndPasswordAndRole(username, password, userRole.name());
		} catch (IllegalArgumentException e) {
			return null; // Return null if the role is invalid
		}
	}
	// This method finds a user by ID
    public User findById(int userId) {
        return userDao.findById(userId).orElse(null); // Returns null if the user is not found
    }
    
    @Transactional
    public void deleteUserById(int i) {
        User user = entityManager.find(User.class, i);
        if (user != null) {
            entityManager.remove(user);
        }
    }
    
    @Transactional
    public void updateUser(User user) {
        entityManager.merge(user);
    }
    @Transactional
    public void saveUser(User user) {
        entityManager.persist(user); // This saves the new user into the database
    }

}