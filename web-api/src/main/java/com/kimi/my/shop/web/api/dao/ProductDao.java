package com.kimi.my.shop.web.api.dao;

import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.domain.TbContentCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName TbContentCategoryDao
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 11:55
 * @Version 1.0
 **/
@Repository
public interface ProductDao {
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
    List<Product> getTypeProducts(Long categoryId);

    /**
     * 根据商品id获取商品详细信息
     * @param id
     * @return
     */
    Product getProductInfo(Long id);
}
