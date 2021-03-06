package com.kimi.my.shop.web.api.web.controller.v1;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.domain.Cart;
import com.kimi.my.shop.web.api.service.CartService;
import com.kimi.my.shop.web.api.web.dto.CartDTO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName CartController
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 21:49
 * @Version 1.0
 **/
@RestController
@RequestMapping(value = "${api.path.v1}/cart")
public class CartController {

    @Autowired
    CartService cartService;
//    private final CartService cartService;
//    private final ProductService productService;
//
//    public CartController(CartService cartService, ProductService productService) {
//        this.cartService = cartService;
//        this.productService = productService;
//    }

    @RequestMapping(value = "showCart", method = RequestMethod.POST)
    public BaseResult showCart(String userId){
        List<CartDTO> cartDTOS = null;
        List<Cart> cartList = cartService.showCartList(Long.valueOf(userId));

        if(cartList != null && cartList.size()>0){
            cartDTOS = new ArrayList<>();
            for(Cart cart : cartList){
                CartDTO dto = new CartDTO();
                dto.setId(cart.getId());
                dto.setUserId(cart.getUserId());
                dto.setProductId(cart.getProductId());
                dto.setProductName(cart.getProduct().getName());
                dto.setImgUrl(cart.getProduct().getImg1());
                dto.setNumber(cart.getNumber());
                dto.setPrice(cart.getProduct().getPrice());
                BigDecimal dbNum = new BigDecimal(cart.getNumber());
                dto.setTotalPrice(cart.getProduct().getPrice().multiply(dbNum));
                dto.setFlag(cart.getFlag());
                cartDTOS.add(dto);
            }
        }
        System.out.println("cartDTOS:"+cartDTOS);
        return BaseResult.success("成功", cartDTOS);
    }

    @RequestMapping(value = "addCart", method = RequestMethod.POST)
    public BaseResult addCart(String productId, String userId){
        System.out.println(userId+productId);
        if(StringUtils.isNotBlank(productId) && StringUtils.isNotBlank(userId)){
            Cart cart = new Cart();
            cart.setUserId(Long.valueOf(userId));
            cart.setProductId(Long.valueOf(productId));
            cart.setNumber(1);
            cart.setFlag(1);
            if(cartService.addCart(cart) == 1){
                return BaseResult.success("成功");
            }
        }
        return BaseResult.fail("失败");
    }

    @RequestMapping(value = "deleteCart", method = RequestMethod.POST)
    public BaseResult deleteCart(String cartId){
        if(StringUtils.isNotBlank(cartId)){
            if(cartService.deleteCart(Long.valueOf(cartId)) == 1){
                return BaseResult.success("成功");
            }
        }
        return BaseResult.fail("失败");
    }

    @RequestMapping(value = "addNum", method = RequestMethod.POST)
    public BaseResult addNum(String cartId){
        if(StringUtils.isNotBlank(cartId)){
            if(cartService.addNum(Long.valueOf(cartId)) == 1){
                return BaseResult.success("成功");
            }
        }
        return BaseResult.fail("失败");
    }

    @RequestMapping(value = "subNum", method = RequestMethod.POST)
    public BaseResult subNum(String cartId){
        if(StringUtils.isNotBlank(cartId)){
            if(cartService.subNum(Long.valueOf(cartId)) == 1){
                return BaseResult.success("成功");
            }
        }
        return BaseResult.fail("失败");
    }

    @RequestMapping(value = "select", method = RequestMethod.POST)
    public BaseResult select(String cartId, String userId){
        if(StringUtils.isNotBlank(userId)){
            //若购物车id不为空-单选
            if(StringUtils.isNotBlank(cartId)){
                if(cartService.updateOneFlag(Long.valueOf(cartId)) == 1){
                    return BaseResult.success("成功");
                }
            }
            //若购物车id为空-全选/反选
            else{
                if(cartService.updateAllFlag(Long.valueOf(userId)) != 0){
                    return BaseResult.success("成功");
                }
            }

        }
        return BaseResult.fail("失败");
    }
}
