package com.kimi.my.shop.web.admin.service;


import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;
import com.kimi.my.shop.commons.persistence.BaseService;
import com.kimi.my.shop.domain.TbUser;

import java.util.List;

public interface TbUserService extends BaseService<TbUser> {
    /**
     *功能描述：<br>
     *(登录)
     *@Param:[email, password]
     *@Return:com.kimi.my.shop.domain.TbUser
     *@Author:郭富城
     *@Date:2020/8/1213:25
    */
    TbUser login(String email,String password);
}
