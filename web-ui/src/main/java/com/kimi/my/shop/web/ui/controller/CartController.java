package com.kimi.my.shop.web.ui.controller;

import com.kimi.my.shop.web.ui.api.CartApi;
import com.kimi.my.shop.web.ui.constant.SystemConstants;
import com.kimi.my.shop.web.ui.dto.Cart;
import com.kimi.my.shop.web.ui.dto.TbUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

/**
 * @ClassName CartController
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 20:50
 * @Version 1.0
 **/
@Controller("uiCartController")
public class CartController {

    /**
     * 购物车展示
     * @param request
     * @return
     */
    @RequestMapping(value = "cart", method = RequestMethod.GET)
    public String toCart(HttpServletRequest request){
        TbUser user = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        System.out.println(user);
        if(user == null){
            return "login";
        }
        List<Cart> cartList = CartApi.showCart(String.valueOf(user.getId()));
        System.out.println("cartList："+cartList);

        if(cartList != null){
            BigDecimal allPrice = new BigDecimal(0);
            int selectNum = 0;
            int allNum = cartList.size();
            boolean allFlag = false;
            for(Cart cart : cartList){
                if(cart.getFlag() == 1){
                    selectNum++;
                    allPrice = allPrice.add(cart.getTotalPrice());
                }
            }
            if(selectNum == allNum){
                allFlag = true;
            }
            request.setAttribute("allFlag", allFlag);
            request.setAttribute("allNum", allNum);
            request.setAttribute("selectNum", selectNum);
            request.setAttribute("allPrice", allPrice);
        }
        request.setAttribute("cartList", cartList);
        return "cart";
    }

    /**
     * 添加购物车
     * @param productId
     * @param request
     * @return
     */
    @RequestMapping(value = "addCart", method = RequestMethod.GET)
    public String addCart(String productId, HttpServletRequest request){
        TbUser user = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        CartApi.addCart(productId, String.valueOf(user.getId()));
        CartApi.updateCartNum(request);
        return "redirect:cart";
    }

    /**
     * 删除购物车
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteCart", method = RequestMethod.GET)
    public String deleteCart(String id, HttpServletRequest request){
        CartApi.deleteCart(id);
        CartApi.updateCartNum(request);
        return "redirect:cart";
    }

    /**
     * 增加数量
     * @param id
     * @return
     */
    @RequestMapping(value = "addNum", method = RequestMethod.GET)
    public String addNum(String id){
        CartApi.addNum(id);
        return "redirect:cart";
    }

    /**
     * 减少数量
     * @param id
     * @param num
     * @return
     */
    @RequestMapping(value = "subNum", method = RequestMethod.GET)
    public String subNum(String id, String num){
        if(!num.equals("1")){
            CartApi.subNum(id);
        }
        return "redirect:cart";
    }

    /**
     * 选择-单选-全选-反选
     * @param id
     * @param request
     * @return
     */
    @RequestMapping(value = "select", method = RequestMethod.GET)
    public String select(String id, HttpServletRequest request){
        TbUser user = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        CartApi.select(id, String.valueOf(user.getId()));
        return "redirect:cart";
    }
}
