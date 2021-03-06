package com.kimi.my.shop.web.api.dao;

import com.kimi.my.shop.domain.TbContent;
import com.kimi.my.shop.domain.TbUser;
import org.springframework.stereotype.Repository;

/**
 *功能描述：<br>
 *(会员管理)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/9/1422:05
*/
@Repository
public interface TbUserDao {
    /**
     * 用户登录
     * @param tbUser
     * @return
     */
    TbUser login(TbUser tbUser);

    /**
     * 用户是否存在
     * @param tbUser
     * @return
     */
    TbUser isExist(TbUser tbUser);

    /**
     * 用户注册
     * @param tbUser
     * @return
     */
    int register(TbUser tbUser);

    /**
     * 更新用户信息
     * @param tbUser
     * @return
     */
    int saveUserInfo(TbUser tbUser);
}
