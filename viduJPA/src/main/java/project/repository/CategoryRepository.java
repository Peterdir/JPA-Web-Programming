package project.repository;

import java.util.List;

import project.entity.Category;

public interface CategoryRepository {
	void save(Category category);
    void update(Category category);
    void deleteById(int id);
    Category findById(int id);
	List<Category> findAll();
	List<Category> findByUserId(int userId);
}
