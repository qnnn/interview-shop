package com.kimi.my.shop.web.api.service;

import com.kimi.my.shop.domain.Cart;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CartService
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 21:59
 * @Version 1.0
 **/
public interface CartService {
    /**
     * 显示购物车
     * @param userId
     * @return
     */
    List<Cart> showCartList(Long userId);

    /**
     * 增加购物车
     * @param cart
     * @return
     */
    int addCart(Cart cart);

    /**
     * 删除购物车
     * @param id
     * @return
     */
    int deleteCart(Long id);

    /**
     * 增加数量
     * @param id
     * @return
     */
    int addNum(Long id);

    /**
     * 减少数量
     * @param id
     * @return
     */
    int subNum(Long id);

    /**
     * 反选单条记录
     * @param id
     * @return
     */
    int updateOneFlag(Long id);

    /**
     * 全选反选
     * @param userId
     * @return
     */
    int updateAllFlag(Long userId);
}
