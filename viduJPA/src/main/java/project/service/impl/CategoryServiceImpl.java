package project.service.impl;

import java.util.List;

import project.entity.Category;
import project.repository.CategoryRepository;
import project.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	
	private CategoryRepository categoryRepository;
	
	public CategoryServiceImpl(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}
	
	@Override
	public List<Category> findAll() {
		return categoryRepository.findAll();
	}
	
	@Override
	public List<Category> findByUserId(int userId) {
		return categoryRepository.findByUserId(userId);
	}
	
	@Override
    public void save(Category category) {
		categoryRepository.save(category);
    }

    @Override
    public void update(Category category) {
    	categoryRepository.update(category);
    }

    @Override
    public void deleteById(int id) {
    	categoryRepository.deleteById(id);
    }

    @Override
    public Category findById(int id) {
        return categoryRepository.findById(id);
    }
}
