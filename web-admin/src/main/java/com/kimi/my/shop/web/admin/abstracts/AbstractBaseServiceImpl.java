package com.kimi.my.shop.web.admin.abstracts;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;
import com.kimi.my.shop.commons.persistence.BaseDao;
import com.kimi.my.shop.commons.persistence.BaseEntity;
import com.kimi.my.shop.commons.persistence.BaseService;
import com.kimi.my.shop.domain.TbContent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class AbstractBaseServiceImpl<T extends BaseEntity,D extends BaseDao<T>> implements BaseService<T> {

    @Autowired
    protected D dao;

    @Override
    public List<T> selectAll(){
        return dao.selectAll();
    }

    @Override
    public void delete(Long id){
        dao.delete(id);
    }

    @Override
    public T getById(Long id){
        return dao.getById(id);
    }

    @Override
    public void update(T entity){
        dao.update(entity);
    }

    @Override
    public void deleteMulti(String[] ids){
        dao.deleteMulti(ids);
    }

    @Override
    public int count(T entity){
        return dao.count(entity);
    }

    @Override
    public PageInfo<T> page(int start, int length, int draw, T entity) {
        int count = count(entity);

        Map<String,Object> params =new HashMap<>();
        params.put("start",start);
        params.put("length",length);
        params.put("pageParams",entity);

        PageInfo<T> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(dao.page(params));

        return pageInfo;
    }
}
