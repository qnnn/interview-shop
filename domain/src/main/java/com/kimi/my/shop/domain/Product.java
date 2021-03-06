package com.kimi.my.shop.domain;

import com.kimi.my.shop.commons.persistence.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

/**
 * 商品
 * @author 郭富城
 * @date 2021/1/6 16:29
 * @param
 * @return
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class Product extends BaseEntity {

    /**
     * 商品名
     */
    private String name;
    /**
     * 图片url
     */
    private String img1;

    private String img2;

    private String img3;

    private String img4;
    /**
     * 商品描述
     */
    private String describe;
    /**
     * 分类ID
     */
    private TbContentCategory tbContentCategory;
    /**
     * 价格
     */
    private BigDecimal price;
    /**
     * 已售
     */
    private Integer soldNum;
    /**
     * 库存
     */
    private Integer stockNum;


}
