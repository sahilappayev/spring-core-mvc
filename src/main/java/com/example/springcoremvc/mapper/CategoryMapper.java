package com.example.springcoremvc.mapper;

import com.example.springcoremvc.dto.CategoryResponseDto;
import com.example.springcoremvc.entity.Category;
import org.springframework.stereotype.Component;

@Component
public class CategoryMapper {

    public Category toEntity(String name) {
        Category category = new Category();
        category.setName(name);
        return category;
    }

    public CategoryResponseDto toResponseDto(Category category) {
        CategoryResponseDto categoryResponseDto = new CategoryResponseDto();
        categoryResponseDto.setId(category.getId());
        categoryResponseDto.setName(category.getName());
        return categoryResponseDto;
    }


}
