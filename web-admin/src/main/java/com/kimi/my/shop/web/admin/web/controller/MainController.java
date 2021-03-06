package com.kimi.my.shop.web.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    /**
     *功能描述：<br>
     *(跳转到首页)
     *@Param:
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/7/2823:01
    */
    @RequestMapping(value = "main",method = RequestMethod.GET)
    public String main(){
        return "main";
    }
}
