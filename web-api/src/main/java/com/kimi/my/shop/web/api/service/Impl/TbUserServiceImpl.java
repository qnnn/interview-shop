package com.kimi.my.shop.web.api.service.Impl;

import com.kimi.my.shop.domain.TbUser;
import com.kimi.my.shop.web.api.dao.TbUserDao;
import com.kimi.my.shop.web.api.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
@Service
public class TbUserServiceImpl implements TbUserService {
    @Autowired
    private TbUserDao tbUserDao;

    @Override
    public TbUser login(TbUser tbUser) {
        TbUser user = tbUserDao.login(tbUser);

        if(user!=null){
            //将明文密码加密
            String password = DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes());
            if (password.equals(user.getPassword())){
                return user;
            }
        }
        return null;
    }

    @Override
    public boolean register(TbUser tbUser){
        TbUser user = tbUserDao.isExist(tbUser);
        if(user != null){
            return false;
        }
        String password = DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes());
        tbUser.setPassword(password);
        if(tbUserDao.register(tbUser) == 1){
            return true;
        }
        return false;
    }

    @Override
    public boolean saveUserInfo(TbUser tbUser) {
        String password = DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes());
        tbUser.setPassword(password);
        if(tbUserDao.saveUserInfo(tbUser) == 1){
            return true;
        }
        return false;
    }

}
