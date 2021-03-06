package com.kimi.my.shop.web.ui.controller;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.utils.EmailSendUtils;
import com.kimi.my.shop.commons.utils.VerifyRegularUtil;
import com.kimi.my.shop.web.ui.api.CartApi;
import com.kimi.my.shop.web.ui.api.UserApi;
import com.kimi.my.shop.web.ui.constant.SystemConstants;
import com.kimi.my.shop.web.ui.dto.Cart;
import com.kimi.my.shop.web.ui.dto.TbUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName UserController
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/9 22:24
 * @Version 1.0
 */

@Controller("uiUserController")
public class UserController {

    @Autowired
     EmailSendUtils emailSendUtils;

    /**
     *功能描述：<br>
     *(跳转登录页)
     *@Param:
     *@Return:
     *@Author:郭富城
     *@Date:2020/9/1715:15
    */
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    /**
     *功能描述：<br>
     *(登录)
     *@Param:
     *@Return:
     *@Author:郭富城
     *@Date:2020/9/1715:15
    */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(TbUser tbUser, Model model, HttpServletRequest request) throws Exception {
        System.out.println("用户登录："+tbUser);
        if(!VerifyRegularUtil.Notempty(tbUser.getUsername())){
            model.addAttribute("loginBaseResult",BaseResult.fail("电子邮箱为空！"));
            return "login";
        }
        if(!VerifyRegularUtil.Notempty(tbUser.getPassword()) || !VerifyRegularUtil.Number_length(tbUser.getPassword())){
            model.addAttribute("loginBaseResult",BaseResult.fail("密码为空或格式有误！"));
            return "login";
        }
        TbUser user = UserApi.login(tbUser);
        //登录失败
        if(user==null){
            model.addAttribute("loginBaseResult",BaseResult.fail("用户名或密码错误,请重新输入"));
            return "login";
        }
        //登录成功
        else {
//            emailSendUtils.send("用户登录",String.format("用户 【%s】 登录MyShop",user.getUsername()),user.getEmail());
            request.getSession().setAttribute(SystemConstants.SESSION_USER_KEY,user);
            CartApi.updateCartNum(request);
            return "redirect:/index";
        }
    }

    /**
     * 注册
     * @param user
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(TbUser user, Model model, HttpServletRequest request) throws Exception {
        System.out.println("注册:"+user);
        if(StringUtils.isBlank(user.getUsername())){
            model.addAttribute("registerBaseResult",BaseResult.fail("用户名不能为空！"));
            return "login";
        }
        if(!VerifyRegularUtil.Notempty(user.getEmail()) || !VerifyRegularUtil.Email(user.getEmail())){
            model.addAttribute("registerBaseResult",BaseResult.fail("邮箱为空或格式有误！"));
            return "login";
        }
        if(!VerifyRegularUtil.Notempty(user.getPassword())){
            model.addAttribute("registerBaseResult",BaseResult.fail("密码不能为空！"));
            return "login";
        }
        TbUser tbUser = UserApi.register(user);
        if(tbUser == null){
            model.addAttribute("registerBaseResult",BaseResult.fail("注册失败，请重试！"));
            return "login";
        }
        else {
            request.getSession().setAttribute(SystemConstants.SESSION_USER_KEY,user);
            return "redirect:/index";
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/index";
    }

    /**
     * 修改保存用户个人信息
     * @param user
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "saveUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public String saveUserInfo(TbUser user, HttpServletRequest request) throws Exception {
        TbUser tbuser = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        user.setId(tbuser.getId());
        System.out.println("更新用户个人信息"+user);
        if(!VerifyRegularUtil.Notempty(user.getUsername()) || !VerifyRegularUtil.UserName(user.getUsername())){
            return "501";
        }
        if(!VerifyRegularUtil.Notempty(user.getPassword()) || !VerifyRegularUtil.Number_length(user.getPassword())){
            return "502";
        }
        if(!VerifyRegularUtil.Notempty(user.getEmail()) || !VerifyRegularUtil.Email(user.getEmail())){
            return "503";
        }
        if(!VerifyRegularUtil.Notempty(user.getPhone()) || !VerifyRegularUtil.Tel(user.getPhone())){
            return "504";
        }
        user = UserApi.saveUserInfo(user);
        request.getSession().setAttribute(SystemConstants.SESSION_USER_KEY,user);
        return "success";
    }

}
