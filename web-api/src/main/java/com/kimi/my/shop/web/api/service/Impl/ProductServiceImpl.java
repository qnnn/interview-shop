package com.kimi.my.shop.web.api.service.Impl;

import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.domain.TbContentCategory;
import com.kimi.my.shop.web.api.dao.ProductDao;
import com.kimi.my.shop.web.api.service.ProductService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName ProductServiceImpl
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 11:43
 * @Version 1.0
 **/
@Service
public class ProductServiceImpl implements ProductService {

    private final ProductDao productDao;

    public ProductServiceImpl(ProductDao productDao) {
        this.productDao = productDao;
    }

    @Override
    public List<TbContentCategory> getProductCategories() {
        return productDao.getProductCategories();
    }

    @Override
    public List<Product> getTypeProducts(String categoryIdString) {
        Long categoryId;
        //若无传入分类id，则获取分类表中的第一个值
        if(StringUtils.isBlank(categoryIdString)){
            categoryId = productDao.getProductCategories().get(0).getId();
        }else{
            categoryId = Long.valueOf(categoryIdString);
        }
        return productDao.getTypeProducts(categoryId);
    }

    @Override
    public Product getProductInfo(Long id) {
        return productDao.getProductInfo(id);
    }
}
