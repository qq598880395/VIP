<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/18
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>会员表格</title>
</head>
<link rel="stylesheet" type="text/css" href="js/layui/css/layui.css"/>
<body>

<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" id="btn_delete" >删除</a>
</script>

</body>
<script src="js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

    layui.use('table', function() {
        var table = layui.table;//表格

        //向世界问个好
        layer.msg('Welcome');

        //执行一个 table 实例
        table.render({
            elem: '#demo',
            height: 650,
            url: 'findbyid',//数据接口
            title: '用户表',
            page: true, //开启分页
            toolbar: '' ,//开启工具栏，此处显示默认图标，可以自定义模板，详见文档,
            totalRow: true ,//开启合计行\
            limit:10,//十数据一页
            limit:[10,20,50],
            response:{
              statusName:'code',
              statusCode:0,
              msgName:'msg',
              countName:'count',
              dataName:'data',
            },
            cols: [//表头
                [
                    { type: 'checkbox', fixed: 'left' },
                    { field: 'vip_id', title: 'ID', width: 110},
                    { field: 'openid', title: 'openid', width: 110 },
                    { field: 'vip_tel', title: '电话', width: 110},
                    { field: 'vip_name', title: '用户名', width: 80 },
                    { field: 'vip_IDcard', title: '身份证号', width: 177 },
                    { field: 'hotel_id', title: '酒店ID', width: 80, sort: true },
                    { field: 'hotel_name', title: '酒店名称', width: 100, sort: true },
                    { field: 'vip_money', title: '余额', width: 80, sort: true },
                    { field: 'vip_time', title: '加入时间', width: 130, sort: true },
                    { fixed: 'right', width: 250, align: 'center', toolbar: '#barDemo' }
                ]
            ]
        });

        //监听 头 工具栏事件
        // table.on('toolbar(test)', function(obj) {
        //     var checkStatus = table.checkStatus(obj.config.id),
        //         data = checkStatus.data; //获取选中的数据
        //     switch(obj.event) {
        //         case 'add':
        //             layer.msg('添加');
        //             break;
        //         case 'update':
        //             if(data.length === 0) {
        //                 layer.msg('请选择一行');
        //             } else if(data.length > 1) {
        //                 layer.msg('只能同时编辑一个');
        //             } else {
        //                 layer.alert('编辑 [id]：' + checkStatus.data[0].id);
        //             }
        //             break;
        //         case 'delete':
        //             if(data.length === 0) {
        //                 layer.msg('请选择一行');
        //             } else {
        //                 layer.msg('删除');
        //             }
        //             break;
        //     };
        // });
        //监听 行 工具事件
        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"

            var data = obj.data ,//获得当前行数据
                layEvent = obj.event; //获得 lay-event 对应的值
           // var jsondata=JSON.stringify(data);
            var jsondata = JSON.parse(JSON.stringify(data));

            if(layEvent === 'del') {
                if(jsondata.vip_money>=1)
                {
                    alert('无法删除 用户还有余额');
                }
                // for(var key in jsondata){
                //
                //     alert(key); //json对象的key
                //
                //     alert(jsondata[key]); //json对象的值
                // }
                else {
                    layer.confirm('真的删除此人么', function(index) {
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                        var vip_id = jsondata.vip_id;
                        $.ajax({
                            url : "delete",
                            type : "get",
                            data : {"vip_id":vip_id},
                            datatype:"json",
                            contentType:"application/json;charset=UTF-8",
                            success : function(data) {

                                if (data == null) {
                                    alert("错误 没有找到对象");
                                } else {
                                    if (data == 1) {
                                        alert("删除成功");
                                        // window.location.href="background.jsp";
                                    } else {
                                        alert("删除失败 错误原因未知");

                                    }
                                }
                            }
                        });
                //向服务端发送删除指令
            });
                }
        } else if(layEvent === 'edit') {
            layer.msg('没有权限，只允许用户本人修改');
        }
    });
    });
</script>


</html>