package com.kimi.my.shop.web.admin.web.controller;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.domain.Order;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseController;
import com.kimi.my.shop.web.admin.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author 郭富城
 */
@Controller
@RequestMapping(value = "order")
public class OrderController extends AbstractBaseController<Order, OrderService> {
    @Autowired
    OrderService orderService;

    @ModelAttribute
    public Order getOrder(Long id){
        Order order;
        // id不为空则从数据库中获取
        if (id!=null){
            order = orderService.getById(id);
        }
        else {
            order = new Order();
        }
        return order;
    }

    @Override
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list() {
        return "order_list";
    }

    @Override
    @RequestMapping(value = "form",method = RequestMethod.GET)
    public String form() {
        return "order_form";
    }

    @Override
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(Order entity, Model model, RedirectAttributes redirectAttributes) {
        BaseResult baseResult = orderService.save(entity);

        // 保存成功
        if (baseResult.getStatus()==200){
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/order/list";
        }

        //保存失败
        else {
            model.addAttribute("baseResult",baseResult);
            return "product_form";
        }
    }

    @Override
    public BaseResult delete(String ids) {
        return null;
    }

    @Override
    public String detail() {
        return null;
    }
}
