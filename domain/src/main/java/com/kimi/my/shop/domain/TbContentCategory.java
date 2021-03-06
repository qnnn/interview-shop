package com.kimi.my.shop.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.kimi.my.shop.commons.persistence.BaseEntity;
import com.kimi.my.shop.commons.persistence.BaseTreeEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;

/**
 *功能描述：<br>
 *(分类管理)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/8/1218:07
*/
@EqualsAndHashCode(callSuper = true)
@Data
public class TbContentCategory extends BaseTreeEntity {

    private String name;
    private Integer status;
    private Integer sortOrder;
    @JsonProperty(value = "isParent")
    private Boolean isParent;
    private TbContentCategory parent;

}
