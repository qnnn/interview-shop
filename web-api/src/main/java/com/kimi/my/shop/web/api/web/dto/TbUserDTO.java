package com.kimi.my.shop.web.api.web.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class TbUserDTO implements Serializable {
    private Long id;
    private String username;
    private String password;
    private String phone;
    private String email;
}
