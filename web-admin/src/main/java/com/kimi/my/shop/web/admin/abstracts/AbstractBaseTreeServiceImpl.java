package com.kimi.my.shop.web.admin.abstracts;

import com.kimi.my.shop.commons.persistence.BaseEntity;
import com.kimi.my.shop.commons.persistence.BaseTreeDao;
import com.kimi.my.shop.commons.persistence.BaseTreeEntity;
import com.kimi.my.shop.commons.persistence.BaseTreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public abstract class AbstractBaseTreeServiceImpl<T extends BaseTreeEntity,D extends BaseTreeDao<T>> implements BaseTreeService<T> {

    @Autowired
    protected D dao;


    @Override
    public List<T> selectAll(){
        return dao.selectAll();
    }

    @Override
    //@Transactional
    public void delete(Long id){
        dao.delete(id);
    }

    @Override
    public T getById(Long id){
        return dao.getById(id);
    }

    @Override
    @Transactional
    public void update(T entity){
        dao.update(entity);
    }

    @Override
    public List<T> selectByPid(Long pid){
        return dao.selectByPid(pid);
    }

    /*
     *功能描述：<br>
     *(插入)
     *@Param:[entity]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/3111:16
    */

}
