package com.kimi.my.shop.web.ui.dto;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Time;
import java.util.Date;

/**
 * @ClassName Order
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/8 22:16
 * @Version 1.0
 **/
@Data
public class Order implements Serializable {

    private Long id;
    private String orderNo;
    private Long productId;
    private String productName;
    private String imgUrl;
    private BigDecimal price;
    private BigDecimal totalPrice;
    private Integer number;
    private Long receivingInfoId;
    private String trackingNo;
    private Integer status;
    private Integer allNumber;
    private BigDecimal allPrice;
    private String created;
    private String updated;
}
