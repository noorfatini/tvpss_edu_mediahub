/*
 * package com.dao;
 * 
 * import javax.persistence.EntityManager; import
 * javax.persistence.PersistenceContext; import javax.persistence.TypedQuery;
 * 
 * import org.springframework.stereotype.Repository;
 * 
 * import com.entity.User;
 * 
 * @Repository public class UserDaoImpl implements UserDao {
 * 
 * @PersistenceContext private EntityManager entityManager;
 * 
 * @Override public User findByUsernameAndPasswordAndRole(String username,
 * String password, String role) { String queryStr =
 * "SELECT u FROM User u WHERE u.username = :username AND u.password = :password AND u.role = :role"
 * ; TypedQuery<User> query = entityManager.createQuery(queryStr, User.class);
 * query.setParameter("username", username); query.setParameter("password",
 * password); query.setParameter("role",
 * User.UserRole.valueOf(role.toUpperCase()));
 * 
 * try { return query.getSingleResult(); // Use getSingleResult } catch
 * (javax.persistence.NoResultException e) { return null; // Return null if no
 * user is found } } }
 */