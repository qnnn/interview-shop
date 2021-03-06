package com.kimi.my.shop.web.api.dao;

import com.kimi.my.shop.domain.Order;
import com.kimi.my.shop.domain.ReceivingInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName OrderDao
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/8 22:44
 * @Version 1.0
 **/
@Repository
public interface OrderDao {

    /**
     * 根据订单状态status查询用户订单
     * @param userId
     * @param status
     * @return
     */
    List<Order> showOrderList(@Param("userId") Long userId, @Param("status") int status);

    /**
     * 根据订单状态status、订单号查询用户订单（同订单商品合并）
     * @param userId
     * @param orderNo
     * @param status
     * @return
     */
    List<Order> showOrderListByOrderNoAndUserId(@Param("userId") Long userId, @Param("orderNo") String orderNo, @Param("status") int status);

    /**
     * 根据状态查询用户所有大订单
     * @param userId
     * @param status
     * @return
     */
    List<String> findOrderNo(@Param("userId") Long userId, @Param("status") int status);

    /**
     * 提交订单-插入订单表
     * @param order
     * @return
     */
    int submitOrder(Order order);

    /**
     * 收货信息表是否已经存在用户
     * @param userId
     * @return
     */
    ReceivingInfo findUserInReceivingInfo(Long userId);

    /**
     * 支付-插入用户收货信息
     * @param userId
     * @return
     */
    int addReceivingInfo(Long userId);

    /**
     * 支付-更新用户收货信息
     * @param receivingInfo
     *; @return
     */
    int updateReceivingInfo(ReceivingInfo receivingInfo);

    /**
     * 删除订单
     * @param orderNo
     * @param receivingInfoId
     * @return
     */
    int deleteOrder(@Param("orderNo") String orderNo, @Param("receivingInfoId") Long receivingInfoId);

    /**
     * 支付-更新大订单状态
     * @param order
     * @return
     */
    int updateStatusByOrderNo(Order order);

    /**
     * 支付-更新子订单状态
     * @param order
     * @return
     */
    int updateStatusById(Order order);

    /**
     * 根据订单号查询订单
     * @param orderNo
     * @return
     */
    List<Order> showOrderListByOrderNo(String orderNo);

    /**
     * 更新商品已售数量
     * @param productId
     * @param number
     * @return
     */
    int updateSoldNum(@Param("productId") Long productId, @Param("number") int number);

    /**
     * 更新商品库存数量
     * @param productId
     * @param number
     * @return
     */
    int updateStockNum(@Param("productId") Long productId, @Param("number") int number);
}
