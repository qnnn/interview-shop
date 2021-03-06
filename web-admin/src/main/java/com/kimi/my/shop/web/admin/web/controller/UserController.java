package com.kimi.my.shop.web.admin.web.controller;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;
import com.kimi.my.shop.domain.TbUser;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseController;
import com.kimi.my.shop.web.admin.service.TbUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *功能描述：<br>
 *(用户管理)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/8/315:32
*/
@Controller
@RequestMapping(value = "user")
public class UserController extends AbstractBaseController<TbUser,TbUserService> {

    @ModelAttribute
    public TbUser getTbUser(Long id){
        TbUser tbUser;
        //id不为空，则从数据库中获取
        if(id!=null){
            tbUser =service.getById(id);
        }
        else {
            tbUser=new TbUser();
        }
        return tbUser;
    }

    /**
     *功能描述：<br>
     *(跳转到用户列表页)
     *@Param:[]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/8/315:35
    */
    @Override
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(){
//        List<TbUser> tbUsers=tbUserService.selectAll();
//        model.addAttribute("tbUsers",tbUsers);
        return "user_list";
    }

    @Override
    @RequestMapping(value = "form",method = RequestMethod.GET)
    public String form(){
        return "user_form";
    }


    @Override
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(TbUser tbUser, Model model, RedirectAttributes redirectAttributes){
        BaseResult baseResult = service.save(tbUser);

        //保存成功
        if(baseResult.getStatus()==200){
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/user/list";
        }

        //保存失败
        else {
            model.addAttribute("baseResult",baseResult);
            return "user_form";
        }

    }

    /**
     *功能描述：<br>
     *(搜索)
     *@Param:[keyword, model]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/8/617:01
    */
//    @RequestMapping(value = "search",method = RequestMethod.POST)
//    public String search(TbUser tbUser,Model model){
//        List<TbUser> tbUsers = tbUserService.search(tbUser);
//        model.addAttribute("tbUsers",tbUsers);
//        return "user_list";
//    }

    /**
     *功能描述：<br>
     *(删除用户信息)
     *@Param:[ids]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/8/814:37
    */
    @Override
    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids){
        BaseResult baseResult = null;
        if(StringUtils.isNotBlank(ids)){
            String[] idArray = ids.split(",");
            service.deleteMulti(idArray);
            baseResult = BaseResult.success("删除用户成功");
        }
        else {
            baseResult=BaseResult.fail("删除用户失败");
        }
        return baseResult;
    }

//    @Override
//    @ResponseBody
//    @RequestMapping(value = "page", method = RequestMethod.GET)
//    public PageInfo<TbUser> page(HttpServletRequest request,TbUser tbUser){
//
//        String strDraw=request.getParameter("draw");
//        String strStart=request.getParameter("start");
//        String strLength=request.getParameter("length");
//
//        int draw = strDraw ==null? 0:Integer.parseInt(strDraw);
//        int start = strStart ==null? 0:Integer.parseInt(strStart);
//        int length = strLength ==null? 10:Integer.parseInt(strLength);
//
//        //封装 Datatables 需要的结果
//        PageInfo<TbUser> pageInfo =service.page(start,length,draw,tbUser);
//
//        return pageInfo;
//    }

    /**
     *功能描述：<br>
     *(显示用户详情)
     *@Param:[tbUser]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/8/1115:50
    */
    @Override
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail(){
        return "user_detail";
    }

    @RequestMapping(value = "personal", method = RequestMethod.GET)
    public String personal(){
        return "user_personal";
    }
}
