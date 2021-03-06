package com.kimi.my.shop.web.admin.service.impl;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.dto.PageInfo;
import com.kimi.my.shop.commons.utils.RegexpUtils;
import com.kimi.my.shop.commons.validator.BeanValidator;
import com.kimi.my.shop.domain.TbUser;
import com.kimi.my.shop.web.admin.abstracts.AbstractBaseServiceImpl;
import com.kimi.my.shop.web.admin.dao.TbUserDao;
import com.kimi.my.shop.web.admin.service.TbUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.ListUtils;
import org.apache.commons.collections4.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class TbUserServiceImpl extends AbstractBaseServiceImpl<TbUser,TbUserDao> implements TbUserService {


    @Override
    public BaseResult save(TbUser tbUser) {
        Map<String, String> map = BeanValidator.validate(tbUser);
        if (MapUtils.isNotEmpty(map)) {
            StringBuilder Msg = new StringBuilder();
            Msg.append("格式错误！请勿绕过前端验证！<br/>");
            for (Map.Entry<String, String> entry : map.entrySet()) {
                log.error("error==={}-->{}", entry.getKey(), entry.getValue());
                Msg.append(String.format("%s", entry.getValue())).append(map.size() > 1 ? "<br/>" : "");
            }
            return BaseResult.fail(map.toString());
        } else {
            tbUser.setUpdated(new Date());

            //新增用户
            if (tbUser.getId() == null) {
                //密码需要加密处理
                tbUser.setPassword(DigestUtils.md5DigestAsHex((tbUser.getPassword().getBytes())));
                tbUser.setCreated(new Date());
                dao.insert(tbUser);
            }

            //编辑用户
            else {
                update(tbUser);
            }

            return BaseResult.success("保存用户信息成功");
        }

    }

    @Override
    public TbUser login(String email, String password) {
        TbUser tbUser = dao.getByEmail(email);
        if (tbUser != null) {
            //明文密码加密
            String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());

            //判断加密后的密码和数据库中存放的密码是否匹配
            if (md5Password.equals(tbUser.getPassword())) {
                return tbUser;
            }
        }
        return null;
    }
}




    /**
     *功能描述：<br>
     *(用户信息的有效性验证)
     *@Param:[tbUser]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/319:55
    */
//    private BaseResult checkTbUser(TbUser tbUser){
//        BaseResult baseResult = BaseResult.success();
//
//        //非空验证
//        if(StringUtils.isBlank(tbUser.getEmail())){
//            baseResult = BaseResult.fail("邮箱不能为空，请重新输入");
//        }
//
//        else if(!RegexpUtils.checkEmail(tbUser.getEmail())){
//            baseResult = BaseResult.fail("邮箱格式不正确，请重新输入");
//        }
//
//        else if(StringUtils.isBlank(tbUser.getPassword())){
//            baseResult = BaseResult.fail("密码不能为空，请重新输入");
//        }
//
//        else if(StringUtils.isBlank(tbUser.getUsername())){
//            baseResult = BaseResult.fail("姓名不能为空，请重新输入");
//        }
//
//        else if(StringUtils.isBlank(tbUser.getPhone())){
//            baseResult = BaseResult.fail("手机不能为空，请重新输入");
//        }
//
//        else if(!RegexpUtils.checkPhone(tbUser.getPhone())){
//            baseResult = BaseResult.fail("手机格式不正确，请重新输入");
//        }
//
//        return  baseResult;
//    }
//}

