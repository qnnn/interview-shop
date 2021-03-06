package com.kimi.my.shop.web.admin.web.interceptor;


import com.kimi.my.shop.commons.constant.ConstantUtils;
import com.kimi.my.shop.domain.TbUser;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *功能描述：<br>
 *(登录拦截器)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/7/2916:12
*/
public class LoginInterceptor implements HandlerInterceptor {

    //throws Exception：抛出异常
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //getAttribute表示从request范围取得设置的属性，必须要先setAttribute设置属性，设置与取得的为object对象类型
        TbUser user = (TbUser) httpServletRequest.getSession().getAttribute(ConstantUtils.SESSION_USER);

        //未登录
        if(user==null){
            httpServletResponse.sendRedirect("/login");
        }

        //放行
        return true;
    }

    // Override重写
    // preHandle：调用时间，Controller方法处理之前
    // PostHandle：调用前提：preHandle返回true；调用时间：Controller方法处理完之后，DispatcherServlet进行视图的渲染之前，在这个方法中可以对ModelAndView进行操作
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    //afterCompletion：调用前提：preHandle返回true；调用时间：DispatcherServlet进行视图的渲染之后。多用于清理资源
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
















