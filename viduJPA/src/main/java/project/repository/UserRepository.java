package project.repository;

import project.entity.User;

public interface UserRepository {
	public User login(String userName, String password);
}
