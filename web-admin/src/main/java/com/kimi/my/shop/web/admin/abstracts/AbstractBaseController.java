package com.kimi.my.shop.web.admin.abstracts;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;
import com.kimi.my.shop.commons.persistence.BaseEntity;
import com.kimi.my.shop.commons.persistence.BaseService;
import com.kimi.my.shop.domain.TbUser;
import com.kimi.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

public abstract class AbstractBaseController<T extends BaseEntity, S extends BaseService<T>> {

    @Autowired
    protected S service;

    public abstract String list();

    //跳转表单页
    public abstract String form();

    public abstract String save(T entity, Model model, RedirectAttributes redirectAttributes);

    public abstract BaseResult delete(String ids);

    // 分页
    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<T> page(HttpServletRequest request, T entity){

        String strDraw=request.getParameter("draw");
        String strStart=request.getParameter("start");
        String strLength=request.getParameter("length");

        int draw = strDraw ==null? 0:Integer.parseInt(strDraw);
        int start = strStart ==null? 0:Integer.parseInt(strStart);
        int length = strLength ==null? 10:Integer.parseInt(strLength);

        //封装 Datatables 需要的结果
        PageInfo<T> pageInfo =service.page(start,length,draw,entity);

        return pageInfo;
    }

    //跳转详情页
    public abstract String detail();
}
