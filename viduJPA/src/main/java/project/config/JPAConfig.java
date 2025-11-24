package project.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
	private static final EntityManagerFactory FACTORY;
	
	static {
		FACTORY = Persistence.createEntityManagerFactory("myPersistenceUnit");
	}
	
	public static EntityManager getEntityManager() {
		return FACTORY.createEntityManager();
	}
}
