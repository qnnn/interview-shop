package com.kimi.my.shop.web.api.web.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName TbContentCategoryDTO
 * @Description TODO
 * @Author Arlin
 * @Date 2021/1/7 13:15
 * @Version 1.0
 **/
@Data
public class TbContentCategoryDTO implements Serializable {

    private Long id;
    private String name;
    private Integer status;
    private Boolean isParent;
}
