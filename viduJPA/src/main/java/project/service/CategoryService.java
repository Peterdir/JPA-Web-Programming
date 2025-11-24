package project.service;

import java.util.List;

import project.entity.Category;

public interface CategoryService {
	void save(Category category);
    void update(Category category);
    void deleteById(int id);
    Category findById(int id);
	public List<Category> findAll();
	public List<Category> findByUserId(int userId);
}
