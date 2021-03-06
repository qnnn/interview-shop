package com.kimi.my.shop.web.admin.dao;

import com.kimi.my.shop.commons.persistence.BaseDao;
import com.kimi.my.shop.commons.persistence.BaseTreeDao;
import com.kimi.my.shop.domain.TbContentCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TbContentCategoryDao extends BaseTreeDao<TbContentCategory> {

}
