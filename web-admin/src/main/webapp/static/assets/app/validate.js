/**
 * 函数对象
 */

var Validate=function () {

    /**
     * 初始化 jquery validation
     */
    var handlerInitValidate = function () {
       $("#inputForm").validate({
           errorElement:'span',
           errorClass:'help-block',

           errorPlacement:function (error,element) {
               element.parent().parent().attr("class","form-group has-error");
                error.insertAfter(element);
           }
       });


    };


    /**
     * 增加自定义验证规则
     */
    var handlerInitCustomValidate = function () {
        $.validator.addMethod("mobile", function(value,element){
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "手机号码格式错误");

        $.validator.addMethod("nameRange",function(value, element) {
            return this.optional(element) || /^[a-zA-Z0-9][a-zA-Z0-9_]{3,11}$/.test(value);
        },"名字长度必须介于4到12之间")

        $.validator.addMethod("passwordRange",function(value, element) {
            return this.optional(element) || /^[a-zA-Z0-9][a-zA-Z0-9_]{7,19}$/.test(value);
        },"密码长度必须介于8到20之间，不允许包含特殊字符！")

        // 中文的验证
        $.validator.addMethod("chinese", function(value, element) {
            var chinese = /^[\u4e00-\u9fa5]+$/;
            return this.optional(element) || (chinese.test(value));
        }, "只能输入中文");

        // 字符验证
        $.validator.addMethod("stringLegal", function(value, element){
            return this.optional(element) ||/^[u0391-uFFE5w]+$/.test(value);
        }, "不允许包含特殊符号!");

        // 字符最小长度验证（一个中文字符长度为2）
        $.validator.addMethod("stringMinLength", function(value,element, param) {
            var length = value.length;
            for ( var i = 0; i < value.length; i++) {
                if (value.charCodeAt(i) > 127) {
                    length++;
                }}
            return this.optional(element) || (length >=param);
        }, $.validator.format("长度不能小于{}!"));
    }

    return{
        init:function () {
            handlerInitCustomValidate();
            handlerInitValidate();
        }
    }

}();

$(document).ready(function () {
    Validate.init();
});