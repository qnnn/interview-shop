package com.kimi.my.shop.web.api.service.Impl;

import com.kimi.my.shop.domain.TbContent;
import com.kimi.my.shop.domain.TbContentCategory;
import com.kimi.my.shop.web.api.dao.TbContentDao;
import com.kimi.my.shop.web.api.service.TbContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional(readOnly = true)
public class TbContentServiceImpl implements TbContentService {

    private final TbContentDao tbContentDao;

    public TbContentServiceImpl(TbContentDao tbContentDao) {
        this.tbContentDao = tbContentDao;
    }

    @Override
    public List<TbContent> selectByCategoryId(Long categoryId) {
        TbContentCategory tbContentCategory = new TbContentCategory();
        tbContentCategory.setId(categoryId);

        TbContent tbContent= new TbContent();
        tbContent.setTbContentCategory(tbContentCategory);
        return tbContentDao.selectByCategoryId(tbContent);
    }
}
