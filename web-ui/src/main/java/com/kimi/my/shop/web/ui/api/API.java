package com.kimi.my.shop.web.ui.api;


public class API {
    /**
     * 主机地址
     */
    public static final String HOST="http://localhost:8083/api/v1";

    /**
     * 内容查询接口 - 幻灯片
     */
    public static final String API_CONTENTS_PPT = HOST + "/contents/ppt";

    /**
     * 登录接口
     */
    public static final String API_USERS_LOGIN = HOST + "/users/login";

    /**
     * 注册接口
     */
    public static final String API_USERS_REGISTER = HOST + "/users/register";

    /**
     * 保存用户信息接口
     */
    public static final String API_USERS_SAVE_INFO = HOST + "/users/saveUserInfo";

    /**
     * 请求接口 - 商品分类
     */
    public static final String API_PRODUCT_CATEGORIES = HOST + "/product/productCategories";

    /**
     * 请求接口 - 单分类商品
     */
    public static final String API_PRODUCT_TYPE = HOST + "/product/typeProduct";

    /**
     * 请求接口 - 商品详情
     */
    public static final String API_PRODUCT_INFO = HOST + "/product/productInfo";

    /**
     * 购物车接口 - 查看购物车详情
     */
    public static final String API_SHOW_CART = HOST + "/cart/showCart";

    /**
     * 购物车接口 - 添加商品
     */
    public static final String API_ADD_CART = HOST + "/cart/addCart";

    /**
     * 购物车接口 - 删除商品
     */
    public static final String API_DELETE_CART = HOST + "/cart/deleteCart";

    /**
     * 购物车接口 - 数量增加
     */
    public static final String API_CART_ADD_NUM = HOST + "/cart/addNum";

    /**
     * 购物车接口 - 数量减少
     */
    public static final String API_CART_SUB_NUM = HOST + "/cart/subNum";

    /**
     * 购物车接口 - 全选反选
     */
    public static final String API_CART_SELECT = HOST + "/cart/select";

    /**
     * 订单接口 - 查看订单
     */
    public static final String API_SHOW_ORDER = HOST + "/order/showOrder";

    /**
     * 订单接口 - 提交订单
     */
    public static final String API_SUBMIT_ORDER = HOST + "/order/submitOrder";

    /**
     * 订单接口 - 删除订单
     */
    public static final String API_DELETE_ORDER = HOST + "/order/deleteOrder";

    /**
     * 订单接口 - 支付订单
     */
    public static final String API_PAY_ORDER = HOST + "/order/payOrder";

    /**
     * 订单接口 - 支付成功
     */
    public static final String API_PAY_SUCCESS = HOST + "/order/paySuccess";

    /**
     * 订单接口 - 确认收货
     */
    public static final String API_CONFIRM_RECEIPT = HOST + "/order/confirmReceipt";
}
