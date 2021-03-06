package com.kimi.my.shop.web.ui.controller;

import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.web.ui.api.ProductApi;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName ProductController
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 16:52
 * @Version 1.0
 **/
@Controller("uiProductController")
public class ProductController {

    @RequestMapping("detail")
    public String getProductInfo(String id, HttpServletRequest request){
        Product productInfo = ProductApi.getProductInfo(id);
        request.setAttribute("productInfo", productInfo);
        return "detail";
    }

}
