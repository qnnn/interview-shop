package com.kimi.my.shop.domain;

import com.kimi.my.shop.commons.persistence.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * @ClassName Cart
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 21:51
 * @Version 1.0
 **/
@EqualsAndHashCode(callSuper = true)
@Data
public class Cart extends BaseEntity {
    private Long userId;
    private Long productId;
    private Product product;
    private Integer number;
    private Integer flag;
}
