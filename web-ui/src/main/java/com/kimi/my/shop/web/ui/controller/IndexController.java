package com.kimi.my.shop.web.ui.controller;

import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.domain.TbContentCategory;
import com.kimi.my.shop.web.ui.api.ContentsApi;
import com.kimi.my.shop.web.ui.api.ProductApi;
import com.kimi.my.shop.web.ui.dto.TbContent;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName IndexController
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/9 22:24
 * @Version 1.0
 */

@Controller("uiIndexController")
public class IndexController {

    @RequestMapping(value = {"","index"})
    public String index(String productCategoryId, Model model, HttpServletRequest request){
        //获取商品分类
        List<TbContentCategory> productCategories = ProductApi.getProductCategories();
        //根据商品分类获取商品，默认获取第一类商品
        List<Product> products = ProductApi.getTypeProducts(productCategoryId);
        request.setAttribute("productCategories", productCategories);
        request.setAttribute("products", products);
        return "index";
    }

    /**
     * 请求幻灯片
     * @param model
     */
    private void requestContentsPPT(Model model){
        List<TbContent> tbContents = ContentsApi.ppt();
        model.addAttribute("ppt", tbContents);
    }


    @RequestMapping(value = "about", method = RequestMethod.GET)
    private String toAbout(){
        return "about";
    }

}
