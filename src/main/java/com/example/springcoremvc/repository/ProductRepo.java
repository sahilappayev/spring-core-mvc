package com.example.springcoremvc.repository;

import com.example.springcoremvc.entity.Product;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

@Repository
public class ProductRepo extends AbstractCrudRepository<Product, Integer> {

    public ProductRepo(LocalSessionFactoryBean localSessionFactoryBean) {
        super(localSessionFactoryBean, Product.class);
    }
}
