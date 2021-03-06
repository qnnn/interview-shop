package com.kimi.my.shop.web.ui.api;

import com.kimi.my.shop.commons.utils.HttpClientUtils;
import com.kimi.my.shop.commons.utils.MapperUtils;
import com.kimi.my.shop.web.ui.dto.TbUser;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.List;

/**
 *功能描述：<br>
 *(会员管理接口)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/9/1715:07
*/
public class UserApi {
    /**
     *功能描述：<br>
     *(登录)
     *@Param:
     *@Return:
     *@Author:郭富城
     *@Date:2020/9/1715:07
    */
    public static TbUser login(TbUser tbUser) throws Exception {
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("username",tbUser.getUsername()));
        params.add(new BasicNameValuePair("password",tbUser.getPassword()));

        String json = HttpClientUtils.doPost(API.API_USERS_LOGIN, params.toArray(new BasicNameValuePair[params.size()]));
        TbUser user = MapperUtils.json2pojoByTree(json,"data",TbUser.class);
        return user;
    }

    public static TbUser register(TbUser tbUser) throws Exception {
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("username",tbUser.getUsername()));
        params.add(new BasicNameValuePair("email",tbUser.getEmail()));
        params.add(new BasicNameValuePair("password",tbUser.getPassword()));

        String json = HttpClientUtils.doPost(API.API_USERS_REGISTER, params.toArray(new BasicNameValuePair[params.size()]));
        TbUser user = MapperUtils.json2pojoByTree(json,"data",TbUser.class);
        return user;
    }

    public static TbUser saveUserInfo(TbUser tbUser) throws Exception {
        List<BasicNameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("username",tbUser.getUsername()));
        params.add(new BasicNameValuePair("email",tbUser.getEmail()));
        params.add(new BasicNameValuePair("password",tbUser.getPassword()));
        params.add(new BasicNameValuePair("phone",tbUser.getPhone()));
        params.add(new BasicNameValuePair("id",String.valueOf(tbUser.getId())));

        String json = HttpClientUtils.doPost(API.API_USERS_SAVE_INFO, params.toArray(new BasicNameValuePair[params.size()]));
        TbUser user = MapperUtils.json2pojoByTree(json,"data",TbUser.class);
        return user;
    }

}
