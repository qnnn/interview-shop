package com.kimi.my.shop.web.api.web.dto;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @ClassName CartDTO
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 21:50
 * @Version 1.0
 **/
@Data
public class CartDTO implements Serializable {
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
