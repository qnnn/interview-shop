var App = function () {

    //iCheck
    var _masterCheckbox;
    var _checkbox;

    //用于存放ID的数组
    var _idArray;

    //默认的Dropzone参数
    var defaultDropzoneOpts = {
        url: "",
        dictDefaultMessage: '拖动文件至此或者点击上传', // 设置默认的提示语句
        paramName: "dropFile", // 传到后台的参数名称
        maxFiles: 1,// 一次性上传的文件数量上限
        maxFilesize: 2, // 文件大小，单位：MB
        acceptedFiles: ".jpg,.gif,.png,.jpeg", // 上传的类型
        addRemoveLinks: true,
        parallelUploads: 1,// 一次上传的文件数量
        dictMaxFilesExceeded: "您最多只能上传" + this.maxFiles + "个文件！",
        dictResponseError: '文件上传失败!',
        dictInvalidFileType: "文件类型只能是*.jpg,*.gif,*.png,*.jpeg。",
        dictFallbackMessage: "浏览器不受支持",
        dictFileTooBig: "文件过大上传文件最大支持.",
        dictRemoveLinks: "删除",
        dictCancelUpload: "取消",
    };

    /**
     * 私有方法，初始化icheck
     */
    var handlerInitCheckbox = function () {
        //激活
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });

        //获取控制端 Checkbox
        _masterCheckbox = $('input[type="checkbox"].minimal.icheck_master');

        //获取全部 Checkbox 集合
        _checkbox = $('input[type="checkbox"].minimal');
    };

    /**
     * Checkbox 全选功能
     */
    var handlerCheckboxAll = function () {
        _masterCheckbox.on("ifClicked", function (e) {
            console.log(e.target.checked);
            //返回true表示未选中
            if (e.target.checked) {
                _checkbox.iCheck("uncheck");
            }

            //选中状态
            else {
                _checkbox.iCheck("check")
            }
        });
    };

    /**
     * 删除单个
     * @param url
     * @param id
     * @param msg
     */
    var handleDeleteSingle = function (url, id, msg) {
        //可选参数
        if (!msg) msg = null;

        //将ID放入数组中，以便和批量删除通用
        _idArray = new Array();
        _idArray.push(id);

        $("#modal-message").html(msg == null ? "您确定删除数据项吗？" : msg);
        $("#modal-default").modal("show");
        //绑定删除事件
        $("#btnModalOk").bind("click", function () {
            handlerDeleteData(url);
        })
    }

    /**
     * 异步删除
     */
    var handlerDeleteData = function (url) {
        $("#modal-default").modal("hide");

        if (_idArray.length > 0)
            setTimeout(function () {
                $.ajax({
                    "type": "POST",
                    "url": url,
                    "data": {"ids": _idArray.toString()},
                    "dataType": "json",
                    success: function (data) {
                        //解绑
                        $("#btnModalOk").unbind("click");

                        //请求成功
                        if (data.status === 200) {
                            $("#btnModalOk").bind("click", function () {
                                $("#modal-default").modal("hide");
                                window.location.reload();
                            });
                        }
                        //请求失败
                        else {
                            $("#btnModalOk").bind("click", function () {
                                $("#modal-default").modal("hide");
                            });

                        }

                        //显示结果
                        $("#modal-message").html(data.message);
                        $("#modal-default").modal("show");

                    }
                });
            }, 500);
    }

    /**
     * 批量删除
     */
    var handlerDeleteMulti = function (url) {
        _idArray = new Array();

        //将选中元素的ID放入数组中
        _checkbox.each(function () {
            var _id = $(this).attr("id");
            if (_id != null && _id != "undefine" && $(this).is(":checked")) {
                _idArray.push(_id);
            }
        });

        //3个0是绝对等于
        if (_idArray.length === 0) {
            $("#modal-message").html("您还没有选择任何数据项，请至少选择一项");
        } else {
            $("#modal-message").html("您确定删除数据项吗?");
        }

        //删除时显示模态框并绑定确定进行删除
        $("#modal-default").modal("show");

        $("#btnModalOk").bind("click", function () {
            handlerDeleteData(url);
        });
    };

    /**
     * 初始化DataTables
     */
    var handlerInitDataTables = function (url, columns) {
        var _dataTable = $("#dataTable").DataTable({
            "paging": true,
            "info": true,
            "lengthChange": false,
            "ordering": false,
            "processing": true,
            "searching": false,
            "serverSide": true,
            "deferRender": true,
            "ajax": {
                "url": url
            },
            "columns": columns,
            "language": {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            "drawCallback": function (settings) {
                App.init();
            }
        });

        return _dataTable;
    }

    /**
     * 初始化zTree
     * @param url
     * @param autoParam
     * @param callback
     */
    var handlerInitZTree = function (url, autoParam, callback) {

        var setting = {
            view: {
                fontCss: {fontSize: "14px"},
                selectedMulti: false
            },
            callback: {
                onClick: zTreeOnClick
            },
            async: {
                enable: true,
                url: url,
                autoParam: autoParam
            }
        };
        $.fn.zTree.init($("#myTree"), setting);

        function zTreeOnClick(event) {
            var zTree = $.fn.zTree.getZTreeObj("myTree");
            var nodes = zTree.getSelectedNodes();

            callback(nodes);
            hideTree();
        };


        if ($('.ztree').css('display') === 'none') {
            $('.ztree').css('display', 'block');
        } else {
            $('.ztree').css('display', 'none');
        }
        $("body").bind("mousedown", onBodyDownByActionType);

        //隐藏菜单
        function hideTree() {
            $('.ztree').css('display', 'none');
            $("body").unbind("mousedown", onBodyDownByActionType);
            return false;
        }

        //区域外点击事件
        function onBodyDownByActionType(event) {
            if (event.target.id.indexOf("myTree") === -1) {
                if (event.target.id !== 'selectDevType') {
                    hideTree();
                }
            }
        }
    };

    /**
     * 初始化DropZone
     * @param opts
     */
    var handleInitDropzone = function (opts) {
        //关闭Dropzone自动发现
        Dropzone.autoDiscover = false;
        $.extend(defaultDropzoneOpts, opts);

        new Dropzone(defaultDropzoneOpts.id, defaultDropzoneOpts);
    };

    /**
     * 查看详情
     * @param url
     */
    var handlerShowDetail = function (url) {
        //通过Ajax 请求 html 得方式将jsp 装载进模态框中
        $.ajax({
            url: url,
            type: "get",
            dataType: "html",
            success: function (data) {
                $("#modal-detail-body").html(data);
                $("#modal-detail").modal("show");
            }
        })
    };

    /**
     * 显示用户信息
     */
    var handlerShowUserDetail = function (url) {
        //通过Ajax 请求 html 得方式将jsp 装载进模态框中
        $.ajax({
            url: url,
            type: "get",
            dataType: "html",
            success: function (data) {
                $("#modal-detail-body").html(data);
                $("#modal-detail").modal("show");
            }
        });
    };

    return {
        //初始化
        init: function () {
            handlerInitCheckbox();
            handlerCheckboxAll();
        },

        //批量删除
        deleteMulti: function (url) {
            handlerDeleteMulti(url);
        },

        //初始化datatables
        initDataTables: function (url, columns) {
            return handlerInitDataTables(url, columns);
        },

        //初始化ZTree
        initZTree: function (url, autoParam, callback) {
            handlerInitZTree(url, autoParam, callback);
        },

        //初始化Dropzone
        initDropZone: function (opts) {
            handleInitDropzone(opts);
        },

        //显示详情
        showDetail: function (url) {
            handlerShowDetail(url);
        },

        //显示用户信息
        showPersonal:function(url){
            handlerShowUserDetail(url);
        },

        //删除单个
        deleteSingle: function (url,id,msg) {
            handleDeleteSingle(url,id,msg);
        }
    }
}();

$(document).ready(function () {
    App.init();
});