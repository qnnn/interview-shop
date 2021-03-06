package com.kimi.my.shop.web.api.web.controller.v1;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.domain.TbContentCategory;
import com.kimi.my.shop.web.api.service.ProductService;
import com.kimi.my.shop.web.api.web.dto.ProductDTO;
import com.kimi.my.shop.web.api.web.dto.TbContentCategoryDTO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName ProductController
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 11:44
 * @Version 1.0
 **/
@RestController
@RequestMapping(value = "${api.path.v1}/product")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    /**
     * 获取商品分类
     * @return
     */
    @RequestMapping(value = "productCategories", method = RequestMethod.GET)
    public BaseResult getProductCategories(){
        List<TbContentCategoryDTO> tbContentCategoryDTOS = null;
        List<TbContentCategory> productCategories = productService.getProductCategories();

        if(productCategories != null && productCategories.size()>0){
            tbContentCategoryDTOS = new ArrayList<>();
            for(TbContentCategory productCategory : productCategories){
                TbContentCategoryDTO dto = new TbContentCategoryDTO();
                BeanUtils.copyProperties(productCategory, dto);
                tbContentCategoryDTOS.add(dto);
            }
        }
        return BaseResult.success("成功", tbContentCategoryDTOS);
    }

    /**
     * 获取一类商品
     * @param productCategoryId
     * @return
     */
    @RequestMapping(value = "typeProduct", method = RequestMethod.POST)
    public BaseResult getTypeProducts(String productCategoryId){
        List<ProductDTO> productDTOS = null;
        List<Product> products = productService.getTypeProducts(productCategoryId);

        if(products != null && products.size()>0){
            productDTOS = new ArrayList<>();
            for(Product product : products){
                ProductDTO dto = new ProductDTO();
                BeanUtils.copyProperties(product, dto);
                productDTOS.add(dto);
            }
        }
        return BaseResult.success("成功", productDTOS);
    }

    /**
     * 获取商品详情
     * @param productId
     * @return
     */
    @RequestMapping(value = "productInfo",method = RequestMethod.POST)
    public BaseResult getProductInfo(String productId){
        if(StringUtils.isBlank(productId)){
            System.out.println("错误，productId为空！");
            return BaseResult.fail("错误");
        }
        Product product = productService.getProductInfo(Long.valueOf(productId));
        System.out.println("product:"+product);
        ProductDTO dto = new ProductDTO();
        BeanUtils.copyProperties(product,dto);
        return BaseResult.success("成功",dto);
    }
}
