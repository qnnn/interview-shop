package com.kimi.my.shop.web.admin.web.controller;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.domain.Product;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseController;
import com.kimi.my.shop.web.admin.service.ProductService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "product")
public class ProductController extends AbstractBaseController<Product, ProductService> {

    private static final String baseSqlImg = "http://localhost:8081/uploadImg/";

    @Autowired
    ProductService productService;

    @ModelAttribute
    public Product getProduct(Long id){
        Product product;
        // id不为空，则从数据库中获取
        if (id !=null){
            product=productService.getById(id);
        }
        else {
            product = new Product();
        }
        return product;
    }

    @Override
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list() {
        return "product_list";
    }

    @Override
    @RequestMapping(value = "form",method = RequestMethod.GET)
    public String form() {
        return "product_form";
    }

    @Override
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(Product entity, Model model, RedirectAttributes redirectAttributes) {

        if(StringUtils.isNotBlank(entity.getImg1())){
            entity.setImg1(baseSqlImg+entity.getImg1());
        }
        if(StringUtils.isNotBlank(entity.getImg2())){
            entity.setImg2(baseSqlImg+entity.getImg2());
        }
        if(StringUtils.isNotBlank(entity.getImg3())){
            entity.setImg3(baseSqlImg+entity.getImg3());
        }
        if(StringUtils.isNotBlank(entity.getImg4())){
            entity.setImg4(baseSqlImg+entity.getImg4());
        }
        BaseResult baseResult = productService.save(entity);
        // 保存成功
        if (baseResult.getStatus()==200){
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/product/list";
        }
        // 保存失败
        else {
            model.addAttribute("baseResult",baseResult);
            return "product_form";
        }
    }

    @ResponseBody
    @RequestMapping(value = "deleteOne",method = RequestMethod.POST)
    public BaseResult deleteSingle(String ids){
        BaseResult baseResult = null;
        if(StringUtils.isNotBlank(ids)){
            Long result = Long.valueOf(ids);
            productService.delete(result);
            baseResult = BaseResult.success("删除商品成功");
        }
        else {
            baseResult = BaseResult.fail("删除商品失败");
        }
        return baseResult;
    }

    @Override
    @ResponseBody
    @RequestMapping(value = "delete",method = RequestMethod.POST)
    public BaseResult delete(String ids) {
        BaseResult baseResult = null;
        if(StringUtils.isNotBlank(ids)){
            String[] idArray = ids.split(",");
            productService.deleteMulti(idArray);
            baseResult = BaseResult.success("删除商品成功");
        }
        else {
            baseResult = BaseResult.fail("删除商品失败！");
        }
        return baseResult;
    }

    @Override
    @RequestMapping(value = "detail",method = RequestMethod.GET)
    public String detail() {
        return "product_detail";
    }
}
