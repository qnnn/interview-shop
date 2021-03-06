package com.kimi.my.shop.web.api.web.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @ClassName OrderDTO
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/8 22:31
 * @Version 1.0
 **/
@Data
public class OrderDTO {

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
    private String created;
    private String updated;
}
