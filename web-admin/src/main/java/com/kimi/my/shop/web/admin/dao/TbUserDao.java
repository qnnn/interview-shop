package com.kimi.my.shop.web.admin.dao;

import com.kimi.my.shop.commons.persistence.BaseDao;
import com.kimi.my.shop.domain.TbUser;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

//数据访问层注解
@Repository
public interface TbUserDao extends BaseDao<TbUser> {


    /**
     *功能描述：<br>
     *(根据邮箱查询用户信息)
     *@Param:[email]
     *@Return:com.kimi.my.shop.domain.TbUser
     *@Author:郭富城
     *@Date:2020/8/220:09
    */
    TbUser getByEmail(String email);
}
