package com.kimi.my.shop.web.api.service;

import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.domain.TbContentCategory;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName ProductService
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 11:43
 * @Version 1.0
 **/
public interface ProductService {
    /**
     * 获取商品分类
     * @return
     */
    List<TbContentCategory> getProductCategories();

    /**
     * 根据分类获取商品
     * @param categoryId
     * @return
     */
    List<Product> getTypeProducts(String categoryId);

    /**
     * 根据商品id获取商品详细信息
     * @param id
     * @return
     */
    Product getProductInfo(Long id);
}
