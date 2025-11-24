package project.repository.impl;

import jakarta.persistence.EntityManager;
import project.config.JPAConfig;
import project.entity.User;
import project.repository.UserRepository;

public class UserRepositoryImpl implements UserRepository{
	@Override
	public User login(String userName, String password) {
		EntityManager em = JPAConfig.getEntityManager();
		
		try {
			User user = em.createQuery("SELECT u FROM User u WHERE u.userName = :userName AND u.password = :password", User.class)
					.setParameter("userName", userName)
					.setParameter("password", password)
					.getSingleResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			em.close();
		}
	}
}
