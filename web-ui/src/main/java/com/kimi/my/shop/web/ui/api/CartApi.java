package com.kimi.my.shop.web.ui.api;

import com.kimi.my.shop.commons.utils.HttpClientUtils;
import com.kimi.my.shop.commons.utils.MapperUtils;
import com.kimi.my.shop.web.ui.constant.SystemConstants;
import com.kimi.my.shop.web.ui.dto.Cart;
import com.kimi.my.shop.web.ui.dto.TbUser;
import org.apache.http.message.BasicNameValuePair;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ClassName CartAPI
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 21:02
 * @Version 1.0
 **/
public class CartApi {

    public static List<Cart> showCart(String userId){
        BasicNameValuePair param1 = new BasicNameValuePair("userId", userId);
        String result = HttpClientUtils.doPost(API.API_SHOW_CART, param1);
        try {
            List<Cart> cart = MapperUtils.json2listByTree(result, "data", Cart.class);
            return cart;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void addCart(String productId, String userId){
        BasicNameValuePair param1 = new BasicNameValuePair("productId", productId);
        BasicNameValuePair param2 = new BasicNameValuePair("userId", userId);
        String result = HttpClientUtils.doPost(API.API_ADD_CART, param1,param2);
        System.out.println("addCart-result"+result);
    }

    public static void deleteCart(String cartId){
        BasicNameValuePair param1 = new BasicNameValuePair("cartId", cartId);
        String result = HttpClientUtils.doPost(API.API_DELETE_CART, param1);
        System.out.println("deleteCart-result"+result);
    }

    public static void addNum(String cartId){
        BasicNameValuePair param1 = new BasicNameValuePair("cartId", cartId);
        String result = HttpClientUtils.doPost(API.API_CART_ADD_NUM, param1);
        System.out.println("addNum-result"+result);
    }

    public static void subNum(String cartId){
        BasicNameValuePair param1 = new BasicNameValuePair("cartId", cartId);
        String result = HttpClientUtils.doPost(API.API_CART_SUB_NUM, param1);
        System.out.println("subNum-result"+result);
    }

    public static void select(String cartId, String userId){
        BasicNameValuePair param1 = new BasicNameValuePair("cartId", cartId);
        BasicNameValuePair param2 = new BasicNameValuePair("userId", userId);
        String result = HttpClientUtils.doPost(API.API_CART_SELECT, param1, param2);
        System.out.println("select-result"+result);
    }

    /**
     * 更新购物车数量
     * @param request
     */
    public static void updateCartNum(HttpServletRequest request){
        TbUser user = (TbUser) request.getSession().getAttribute(SystemConstants.SESSION_USER_KEY);
        BasicNameValuePair param1 = new BasicNameValuePair("userId", String.valueOf(user.getId()));
        String result = HttpClientUtils.doPost(API.API_SHOW_CART, param1);
        try {
            List<Cart> cartList = MapperUtils.json2listByTree(result, "data", Cart.class);
            if(cartList != null){
                int chatNum = cartList.size();
                request.getSession().setAttribute("chatNum",chatNum);
            }else{
                request.getSession().setAttribute("chatNum",0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
