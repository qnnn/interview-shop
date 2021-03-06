package com.kimi.my.shop.web.api.service;

import com.kimi.my.shop.domain.Order;
import com.kimi.my.shop.domain.ReceivingInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName OrderService
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/9 15:34
 * @Version 1.0
 **/
public interface OrderService {

    /**
     * 根据订单状态status查询用户订单
     * @param userId
     * @param status
     * @return
     */
    List<Order> showOrderList(Long userId, int status);

    /**
     * 根据订单状态status、订单号查询用户订单（同订单商品合并）
     * @param userId
     * @param orderNo
     * @param status
     * @return
     */
    List<Order> showOrderListByOrderNo(Long userId, String orderNo, int status);

    /**
     * 根据状态查询用户所有大订单
     * @param userId
     * @param status
     * @return
     */
    List<String> findOrderNo(Long userId, int status);

    /**
     * 提交订单-插入订单表
     * @param userId
     * @param orderNo
     * @return
     */
    void submitOrder(Long userId, String orderNo);

    /**
     * 删除订单
     * @param userId
     * @param orderNo
     * @return
     */
    int deleteOrder(Long userId, String orderNo);

    /**
     * 支付订单
     * @param receivingInfo
     * @param orderNo
     * @return
     */
    int payOrder(ReceivingInfo receivingInfo, String orderNo);

    /**
     * 确认收货
     * @param orderNo
     * @return
     */
    int confirmReceipt(String orderNo);

    /**
     * 支付成功 - 更新状态
     * @param orderNo
     * @return
     */
    int paySuccess(String orderNo);

}
