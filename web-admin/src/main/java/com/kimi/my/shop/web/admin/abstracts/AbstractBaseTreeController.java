package com.kimi.my.shop.web.admin.abstracts;

import com.kimi.my.shop.commons.dto.BaseResult;
import com.kimi.my.shop.commons.persistence.BaseEntity;
import com.kimi.my.shop.commons.persistence.BaseTreeEntity;
import com.kimi.my.shop.commons.persistence.BaseTreeService;
import com.kimi.my.shop.domain.TbContentCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

public abstract class AbstractBaseTreeController<T extends BaseTreeEntity,S extends BaseTreeService<T>> {
    @Autowired
    protected S service;

    public abstract String list(Model model);

    public abstract String form(T entity);

    public abstract String save(T entity, Model model, RedirectAttributes redirectAttributes);

    public abstract List<T> treeData(Long id);

    public abstract BaseResult delete(String id);

    protected void sortList(List<T> sourceList, List<T> targetList, Long parentId) {
        for (T sourceEntity : sourceList) {
            if (sourceEntity.getParent().getId().equals(parentId)) {
                targetList.add(sourceEntity);

                //判断有无子节点，若有子节点则继续追加
                if (sourceEntity.getIsParent()) {
                    for (T currentEntity : sourceList) {
                        if (currentEntity.getParent().getId().equals(sourceEntity.getId())) {
                            sortList(sourceList, targetList, sourceEntity.getId());
                            break;
                        }
                    }
                }
            }
        }
    }
}
