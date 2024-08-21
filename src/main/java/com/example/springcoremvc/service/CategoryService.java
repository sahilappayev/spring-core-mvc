package com.example.springcoremvc.service;

import com.example.springcoremvc.dto.CategoryResponseDto;
import com.example.springcoremvc.entity.Category;
import com.example.springcoremvc.exception.CustomNotFoundException;
import com.example.springcoremvc.mapper.CategoryMapper;
import com.example.springcoremvc.repository.CategoryRepo;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CategoryService {

    private final CategoryRepo categoryRepo;
    private final CategoryMapper categoryMapper;


    public CategoryResponseDto create(String name) {
        Category category = categoryMapper.toEntity(name);
        Category created = categoryRepo.create(category);
        return categoryMapper.toResponseDto(created);
    }


    public CategoryResponseDto update(Integer id, String name) {
        Category category = categoryRepo.findById(id)
                .orElseThrow(() -> new CustomNotFoundException(Category.class, id));
        category.setName(name);

        Category updated = categoryRepo.update(category);

        return categoryMapper.toResponseDto(updated);
    }

    public CategoryResponseDto getById(Integer id) {
        Category category = categoryRepo.findById(id)
                .orElseThrow(() -> new CustomNotFoundException(Category.class, id));
        return categoryMapper.toResponseDto(category);
    }

    public List<CategoryResponseDto> getAll() {
        List<Category> all = categoryRepo.findAll();
        return all.stream().map(categoryMapper::toResponseDto).toList();
    }

    public CategoryResponseDto delete(Integer id) {
        Category category = categoryRepo.findById(id)
                .orElseThrow(() -> new CustomNotFoundException(Category.class, id));
        Category deleted = categoryRepo.delete(category);
        return categoryMapper.toResponseDto(deleted);
    }

}
