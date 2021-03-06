package com.kimi.my.shop.web.admin.web.controller;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.domain.TbContent;
import com.kimi.my.shop.domain.TbContentCategory;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseTreeController;
import com.kimi.my.shop.web.admin.service.TbContentCategoryService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 功能描述：<br>
 * (分类管理)
 *
 * @Param:
 * @Return:
 * @Author:郭富城
 * @Date:2020/8/1218:19
 */
@Controller
@RequestMapping(value = "content/category")
public class ContentCategoryController extends AbstractBaseTreeController<TbContentCategory,TbContentCategoryService> {

    @Autowired
    TbContentCategoryService tbContentCategoryService;

    @ModelAttribute
    public TbContentCategory getTbContentCategory(Long id) {
        TbContentCategory tbContentCategory;

        //id不为空，则从数据库中获取
        if (id != null) {
            tbContentCategory = service.getById(id);
        } else {
            tbContentCategory = new TbContentCategory();
        }

        return tbContentCategory;
    }

    @Override
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model) {
        List<TbContentCategory> targetList = new ArrayList<>();
        List<TbContentCategory> sourceList = service.selectAll();

        //排序
        sortList(sourceList, targetList, 0L);

        model.addAttribute("tbContentCategories", targetList);
        return "content_category_list";
    }

    @Override
    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids){
        BaseResult baseResult = null;
        if(StringUtils.isNotBlank(ids)){
            Long result = Long.valueOf(ids);

            List<TbContentCategory> result1 = tbContentCategoryService.selectByPid(result);

            recursionDelete(result1);

            tbContentCategoryService.delete(result);

            baseResult = BaseResult.success("删除分类成功");
        }
        else {
            baseResult=BaseResult.fail("删除分类失败");
        }
        return baseResult;
    }

    private void recursionDelete(List<TbContentCategory> tbContentCategories){
        if (!tbContentCategories.isEmpty()){
            for (TbContentCategory tbContentCategory : tbContentCategories) {
                List<TbContentCategory> result = tbContentCategoryService.selectByPid(tbContentCategory.getId());
                recursionDelete(result);
            }
        }
        for (TbContentCategory category : tbContentCategories) {
            tbContentCategoryService.delete(category.getId());
        }
    }

    /**
     *功能描述：<br>
     *(添加下级菜单)
     *@Param:[tbContentCategory]
     *@Return:java.lang.String
     *@Author:郭富城
     *@Date:2020/8/3014:45
    */
    @Override
    @RequestMapping(value = "form" , method = RequestMethod.GET)
    public String form(TbContentCategory tbContentCategory){
        return "content_category_form";
    }

    @Override
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(TbContentCategory tbContentCategory, Model model, RedirectAttributes redirectAttributes){
        BaseResult baseResult = service.save(tbContentCategory);
        //保存成功
        if(baseResult.getStatus()==200){
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/content/category/list";
        }
        //保存失败
        else {
            model.addAttribute("baseResult",baseResult);
            return form(tbContentCategory);
        }
    }

    /**
     * 功能描述：<br>
     * (树形结构)
     *
     * @Param:[]
     * @Return:java.util.List<com.kimi.my.shop.domain.TbContentCategory>
     * @Author:郭富城
     * @Date:2020/8/1617:23
     */
    @Override
    @ResponseBody
    @RequestMapping(value = "tree/data", method = RequestMethod.POST)
    public List<TbContentCategory> treeData(Long id) {
        if (id == null) {
            id = 0L;
        }
        return service.selectByPid(id);
    }


}
