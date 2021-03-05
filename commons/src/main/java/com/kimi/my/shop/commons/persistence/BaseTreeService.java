package com.kimi.my.shop.commons.persistence;

import com.kimi.my.shop.commons.dto.BaseResult;

import java.util.List;

public interface BaseTreeService <T extends BaseEntity>{
    /**
     *功能描述：<br>
     *(查询用户表全部信息)
     *@Param:[]
     *@Return:java.util.List<com.kimi.my.shop.domain.TbUser>
     *@Author:郭富城
     *@Date:2020/8/113:54
     */
    List<T> selectAll();

    /**
     *功能描述：<br>
     *(新增)
     *@Param:
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/213:32
     */
    BaseResult save(T entity);

    /**
     *功能描述：<br>
     *(删除)
     *@Param:[long]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/214:46
     */
    void delete(Long id);

    /**
     *功能描述：<br>
     *(根据id查询用户信息)
     *@Param:[id]
     *@Return:com.kimi.my.shop.domain.TbUser
     *@Author:郭富城
     *@Date:2020/8/214:57
     */
    T getById(Long id);

    /**
     *功能描述：<br>
     *(更新)
     *@Param:[tbUser]
     *@Return:void
     *@Author:郭富城
     *@Date:2020/8/1213:22
     */
    void update(T tbUser);

    /**
     *功能描述：<br>
     *(根据父级节点ID查询所有子节点)
     *@Param:[pid]
     *@Return:java.util.List<com.kimi.my.shop.domain.TbContentCategory>
     *@Author:郭富城
     *@Date:2020/8/1617:33
     */
    List<T> selectByPid(Long pid);
}
