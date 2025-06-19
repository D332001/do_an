package com.portal.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.portal.entities.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	@PersistenceContext
	protected EntityManager entityManager;

	public User loadUserByUsername(String userName) {
		try {
			String jpql = "From User u Where u.username='" + userName +"'";
			Query query = entityManager.createQuery(jpql, User.class);
			return (User) query.getResultList().get(0);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
