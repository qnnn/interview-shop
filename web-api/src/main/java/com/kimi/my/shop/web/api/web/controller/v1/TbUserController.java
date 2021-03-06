package com.kimi.my.shop.web.api.web.controller.v1;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.domain.TbUser;
import com.kimi.my.shop.web.api.service.TbUserService;
import com.kimi.my.shop.web.api.web.dto.TbUserDTO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *功能描述：<br>
 *(会员管理)
 *@Param:
 *@Return:
 *@Author:郭富城
 *@Date:2020/9/1422:12
*/
@RestController
@RequestMapping(value = "${api.path.v1}/users")
public class TbUserController {

    @Autowired
    private TbUserService tbUserService;

    @RequestMapping(value = "login",method = RequestMethod.POST)
    public BaseResult login(TbUser tbUser){
        TbUser user = tbUserService.login(tbUser);
        if(user == null){
            return BaseResult.fail("账号或密码错误");
        }
        else{
            TbUserDTO dto = new TbUserDTO();
            BeanUtils.copyProperties(user,dto);
            return BaseResult.success("成功",dto);
        }
    }

    @RequestMapping(value = "register",method = RequestMethod.POST)
    public BaseResult register(TbUser tbUser){
        System.out.println("注册:"+tbUser);
        if(tbUserService.register(tbUser)){
            TbUserDTO dto = new TbUserDTO();
            BeanUtils.copyProperties(tbUser,dto);
            return BaseResult.success("注册成功",dto);
        }else{
            return BaseResult.fail("注册失败");
        }
    }

    @RequestMapping(value = "saveUserInfo",method = RequestMethod.POST)
    public BaseResult saveUserInfo(TbUser tbUser){
        System.out.println("tbUser"+tbUser);
        if(tbUserService.saveUserInfo(tbUser)){
            TbUserDTO dto = new TbUserDTO();
            BeanUtils.copyProperties(tbUser,dto);
            return BaseResult.success("保存成功",dto);
        }else{
            return BaseResult.fail("保存失败");
        }
    }
}
