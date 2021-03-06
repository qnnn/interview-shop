package com.kimi.my.shop.web.admin.web.controller;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;
import com.kimi.my.shop.domain.TbContent;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseController;
import com.kimi.my.shop.web.admin.service.TbContentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *功能描述：<br>
 *(内容管理)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/8/1512:57
*/
@Controller
@RequestMapping(value = "content")
public class ContentController extends AbstractBaseController<TbContent,TbContentService> {

    @Autowired
    private TbContentService tbContentService;

    @ModelAttribute
    public TbContent getTbContent(Long id){
        TbContent tbContent;

        //id不为空，则从数据库中获取
        if(id!=null){
            tbContent =tbContentService.getById(id);
        }
        else {
            tbContent=new TbContent();
        }
        return tbContent;
    }

    @Override
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(){
        return "content_list";
    }


    @Override
    @RequestMapping(value = "form",method = RequestMethod.GET)
    public String form(){
        return "content_form";
    }


    /**
     *功能描述：<br>
     *(保存信息)
     *@Param:[tbContent, model, redirectAttributes]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/8/1513:04
    */
    @Override
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(TbContent tbContent, Model model, RedirectAttributes redirectAttributes){
        BaseResult baseResult = tbContentService.save(tbContent);

        //保存成功
        if(baseResult.getStatus()==200){
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/content/list";
        }

        //保存失败
        else {
            model.addAttribute("baseResult",baseResult);
            return "content_form";
        }
    }


    /**
     *功能描述：<br>
     *(删除信息)
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
            tbContentService.deleteMulti(idArray);
            baseResult = BaseResult.success("删除广告成功");
        }
        else {
            baseResult=BaseResult.fail("删除广告失败");
        }
        return baseResult;
    }

    /**
     *功能描述：<br>
     *(显示详情)
     *@Param:[tbContent]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/8/1115:50
     */
    @Override
    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail(){
        return "content_detail";
    }

}
