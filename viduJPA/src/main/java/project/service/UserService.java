package project.service;

import project.entity.User;

public interface UserService {
	User login(String userName, String password);
}
