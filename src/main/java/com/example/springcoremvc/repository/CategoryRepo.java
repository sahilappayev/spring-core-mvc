package com.example.springcoremvc.repository;

import com.example.springcoremvc.entity.Category;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryRepo extends AbstractCrudRepository<Category, Integer> {

    public CategoryRepo(LocalSessionFactoryBean localSessionFactoryBean) {
        super(localSessionFactoryBean, Category.class);
    }
}
