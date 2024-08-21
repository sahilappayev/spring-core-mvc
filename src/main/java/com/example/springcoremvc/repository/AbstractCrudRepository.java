package com.example.springcoremvc.repository;

import java.util.List;
import java.util.Optional;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.Transactional;

public abstract class AbstractCrudRepository<ENTITY, ID> {

    private final LocalSessionFactoryBean localSessionFactoryBean;
    private final Class<ENTITY> type;

    public AbstractCrudRepository(LocalSessionFactoryBean localSessionFactoryBean, Class<ENTITY> type) {
        this.localSessionFactoryBean = localSessionFactoryBean;
        this.type = type;
    }

    protected Session getSession() {
        return localSessionFactoryBean.getObject().getCurrentSession();
    }

    @Transactional
    public ENTITY create(ENTITY entity) {
        getSession().persist(entity);
        return entity;
    }

    @Transactional
    public List<ENTITY> findAll() {
//        return getSession().get("select e from " + type.getSimpleName() + " e", type).getResultList();
        CriteriaBuilder criteriaBuilder = getSession().getCriteriaBuilder();
        CriteriaQuery<ENTITY> query = criteriaBuilder.createQuery(type);
        query.from(type);
        return getSession().createQuery(query).list();
    }

    @Transactional
    public Optional<ENTITY> findById(ID id) {
        return Optional.ofNullable(getSession().find(type, id));
    }

    @Transactional
    public ENTITY update(ENTITY entity) {
        return (ENTITY) getSession().merge(entity);  //
    }

    @Transactional
    public ENTITY delete(ENTITY entity) {
        getSession().delete(entity); //
        return entity;
    }

}
