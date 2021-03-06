package com.kimi.my.shop.web.api.web.dto;

import com.kimi.my.shop.domain.TbContentCategory;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @ClassName ProductDTO
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 11:49
 * @Version 1.0
 **/
@Data
public class ProductDTO implements Serializable {

    private Long id;
    private String name;
    private String img1;
    private String img2;
    private String img3;
    private String img4;
    private String describe;
    private TbContentCategory tbContentCategory;
    private BigDecimal price;
    private Integer soldNum;
    private Integer stockNum;
}
