package com.kimi.my.shop.domain;

import com.kimi.my.shop.commons.persistence.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * @ClassName Order
 * @Description TODO 订单实体类
 * @Author Arlin
 * @Date 2021/1/6 17:50
 * @Version 1.0
 **/
@EqualsAndHashCode(callSuper = true)
@Data
public class Order extends BaseEntity {

    /**
     * 订单号
     */
    private String orderNo;

    /**
     * 商品详情
     */
    private Product product;

    /**
     * 总价
     */
    private BigDecimal totalPrice;
    /**
     * 数量
     */
    private Integer number;

    /**
     * 收货信息
     */
    private ReceivingInfo receivingInfo;

    /**
     * 支付方式
     */
    private String payMethod;

    /**
     * 快递单号
     */
    private String trackingNo;

    /**
     * 订单状态
     */
    private int status;

}
