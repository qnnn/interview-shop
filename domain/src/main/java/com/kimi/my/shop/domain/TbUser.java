package com.kimi.my.shop.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.kimi.my.shop.commons.persistence.BaseEntity;
import com.kimi.my.shop.commons.utils.RegexpUtils;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Pattern;


// serializable 实现序列化接口

@EqualsAndHashCode(callSuper = true)
@Data
public class TbUser extends BaseEntity {
    @Length(min = 4,max = 12, message = "姓名长度必须介于4到12之间")
    private String username;
    @JsonIgnore
    @Length(min = 8,max = 20, message = "密码长度必须介于8到20之间")
    private String password;
    @Pattern(regexp = RegexpUtils.PHONE,message = "手机号码格式错误")
    private String phone;
    @Pattern(regexp = RegexpUtils.EMAIL,message = "邮箱格式错误")
    private String email;
}
