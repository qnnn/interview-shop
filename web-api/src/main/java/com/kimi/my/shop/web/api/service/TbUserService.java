package com.kimi.my.shop.web.api.service;

import com.kimi.my.shop.domain.TbUser;
import org.springframework.stereotype.Service;

/**
 *功能描述：<br>
 *(会员管理)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/9/1422:06
*/
public interface TbUserService {

    /**
     *功能描述：<br>
     *(登录)
     *@Param:[tbUser]
     *@Return:com.kimi.my.shop.domain.TbUser
     *@Author:郭富城
     *@Date:2020/9/1422:06
    */
    TbUser login(TbUser tbUser);

    /**
     * 用户注册
     * @param tbUser
     * @return
     */
    boolean register(TbUser tbUser);

    /**
     * 更新用户信息
     * @param tbUser
     * @return
     */
    boolean saveUserInfo(TbUser tbUser);
}
