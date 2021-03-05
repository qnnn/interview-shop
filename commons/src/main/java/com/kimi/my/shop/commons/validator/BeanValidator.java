package com.kimi.my.shop.commons.validator;


import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.util.*;

public class BeanValidator {


    private static ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
    /**
     * 校验对象
     * @param t 对象的泛型
     * @param groups
     * @param <T>
     * @return
     */
    public static <T>Map<String,String> validate(T t,Class... groups){
        Validator validator = validatorFactory.getValidator();
        Set validateResult = validator.validate(t, groups);
        if(validateResult.isEmpty()){
            return Collections.emptyMap();
        }else {
            LinkedHashMap errors = Maps.newLinkedHashMap();
            Iterator iterator = validateResult.iterator();
            while (iterator.hasNext()){
                ConstraintViolation violation = (ConstraintViolation) iterator.next();
                errors.put(violation.getPropertyPath().toString(),violation.getMessage());
            }
            return errors;
        }
    }

    /**
     * 校验集合
     * @param collection 集合
     * @return
     */
    public static Map<String,String> validateList(Collection<?> collection){
        Preconditions.checkNotNull(collection);
        Iterator iterator = collection.iterator();
        Map errors;
        do{
            if (!iterator.hasNext()) {
                return Collections.emptyMap();
            }
            Object object = iterator.next();
            errors = validate(object,new Class[0]);
        }while (errors.isEmpty()); // 如果errors为空则循环校验,一旦不为空   跳出循环
        return errors;
    }

    /**
     * 通用方法，至少传入一个Object参数
     * <p>校验参数之后不会处理只会将错误信息存储到map中
     * @param first
     * @param objects
     */
    public static Map<String,String> validateObject(Object first,Object... objects){
        if(objects == null || objects.length == 0){
            return validate(first,new Class[0]);
        }else {
            return validateList(Lists.asList(first,objects));
        }
    }
}
