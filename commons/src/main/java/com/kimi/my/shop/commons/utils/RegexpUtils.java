package com.kimi.my.shop.commons.utils;

//regexp ： 正则表达式
public class RegexpUtils {
    //验证手机号
    public static final String PHONE="^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";

    //验证邮箱
    public static final String EMAIL="^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";

    public static boolean checkPhone(String phone){
        return phone.matches(PHONE);
    }

    public static boolean checkEmail(String email){
        return email.matches(EMAIL);
    }
}
