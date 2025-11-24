package project.service.impl;

import project.entity.User;
import project.repository.UserRepository;
import project.service.UserService;

public class UserServiceImpl implements UserService{
	private UserRepository userRepository;
	
	public UserServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@Override
	public User login(String userName, String password) {
		return userRepository.login(userName, password);
	}
}
