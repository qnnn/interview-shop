package com.kimi.my.shop.web.ui.dto;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @ClassName Cart
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/8 1:55
 * @Version 1.0
 **/
@Data
public class Cart implements Serializable {
    private Long id;
    private Long userId;
    private Long productId;
    private String productName;
    private String imgUrl;
    private Integer number;
    private BigDecimal price;
    private BigDecimal totalPrice;
    private Integer flag;
}
