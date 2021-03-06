package com.kimi.my.shop.web.admin.web.controller;


import com.kimi.my.shop.commons.constant.ConstantUtils;
import com.kimi.my.shop.commons.utils.CookieUtils;
import com.kimi.my.shop.domain.TbUser;
import com.kimi.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//
@Controller
public class LoginController {

    @Autowired
    private TbUserService tbUserService;
    /**
     *功能描述：<br>
     *(跳转登录页面)
     *@Param:[]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/7/2822:56
    */
    //RequestMapping是一个用来处理请求地址映射的注解，可用于类或方法上。用于类上，表示类中的所有响应请求的方法都是以该地址作为父路径。
    @RequestMapping(value = {"", "login"},method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    /**
     *功能描述：<br>
     *(登录逻辑)
     *@Param:[email, password]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/7/2822:56
    */
    @RequestMapping(value="login",method=RequestMethod.POST)
    public String login(@RequestParam(required = true) String email, @RequestParam(required = true) String password, HttpServletRequest httpServletRequest, Model model) {
        TbUser tbUser = tbUserService.login(email, password);

        //登录失败
        if(tbUser==null){
            //addAttribute往前台传数据
            model.addAttribute("message","用户名或密码错误，请重新输入");
            return login();
        }

        //登录成功
        else {
            //保存数据
            httpServletRequest.getSession().setAttribute(ConstantUtils.SESSION_USER,tbUser);
            return "redirect:/main";
        }
    }

    /**
     *功能描述：<br>
     *(注销)
     *@Param:[httpServletRequest]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/7/3017:19
    */
    @RequestMapping(value = "logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest httpServletRequest){
        //invalidate:使无效
        httpServletRequest.getSession().invalidate();
        return login();
    }
}











