package com.kimi.my.shop.web.ui.api;

import com.kimi.my.shop.commons.utils.HttpClientUtils;
import com.kimi.my.shop.commons.utils.MapperUtils;
import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.domain.TbContentCategory;
import org.apache.http.message.BasicNameValuePair;

import java.util.List;

/**
 * @ClassName ProductApi
 * @Description TODO 商品接口
 * @Author Arlin
 * @Date 2021/1/7 11:07
 * @Version 1.0
 **/
public class ProductApi {

    /**
     * 获取商品分类
     * @return
     */
    public static List<TbContentCategory> getProductCategories(){
        String result = HttpClientUtils.doGet(API.API_PRODUCT_CATEGORIES);
        try {
            List<TbContentCategory> productCategories = MapperUtils.json2listByTree(result, "data", TbContentCategory.class);
            return productCategories;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据商品分类ID获取商品
     * @param productCategoryId
     * @return
     */
    public static List<Product> getTypeProducts(String productCategoryId){
        BasicNameValuePair param1 = new BasicNameValuePair("productCategoryId", productCategoryId);
        String result = HttpClientUtils.doPost(API.API_PRODUCT_TYPE, param1);
        try {
            List<Product> products = MapperUtils.json2listByTree(result, "data", Product.class);
            return products;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取商品详情
     * @param productId
     * @return
     */
    public static Product getProductInfo(String productId){
        BasicNameValuePair param1 = new BasicNameValuePair("productId", productId);
        String result = HttpClientUtils.doPost(API.API_PRODUCT_INFO, param1);
        try {
            Product product = MapperUtils.json2pojoByTree(result, "data", Product.class);
            return product;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
