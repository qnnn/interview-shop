package com.kimi.my.shop.web.api.dao;

import com.kimi.my.shop.domain.Cart;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName CartDao
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 22:00
 * @Version 1.0
 **/
@Repository
public interface CartDao {

    /**
     * 显示购物车
     * @param userId
     * @return
     */
    List<Cart> showCartList(Long userId);

    /**
     * 根据选择状态查找购物车列表 - 用于提交订单
     * @param userId
     * @param flag
     * @return
     */
    List<Cart> showCartListByStatus(@Param("userId") Long userId, @Param("flag") Integer flag);

    /**
     * 根据购物车id选择记录
     * @param id
     * @return
     */
    Cart selectCartById(Long id);

    /**
     * 增加购物车
     * @param cart
     * @return
     */
    int addCart(Cart cart);

    /**
     * 是否存在订单
     * @param cart
     * @return
     */
    Cart isExistCart(Cart cart);

    /**
     * 删除购物车
     * @param id
     * @return
     */
    int deleteCart(Long id);

    /**
     * 删除购物车已选择的商品
     * @param userId
     * @param flag
     * @return
     */
    int deleteCartBySelect(@Param("userId") Long userId, @Param("flag") Integer flag);

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
     * @param flag
     * @return
     */
    int updateOneFlag(@Param("id") Long id, @Param("flag") int flag);

    /**
     * 全选反选
     * @param userId
     * @param flag
     * @return
     */
    int updateAllFlag(@Param("userId") Long userId, @Param("flag")int flag);

}
