<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/18
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>会员统计</title>
</head>
<link rel="stylesheet" type="text/css" href="js/layui/css/layui.css"/>
<body>
<div class="layui-row">
    <div id="main" class="layui-col-xs6" style="width: 600px;height:450px;"></div>
    <div id="main2" class="layui-col-xs6" style="width: 600px;height:450px;"></div>
</div>
</body>
<script src="js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    var myChart = echarts.init(document.getElementById('main'));
    var myChart2 = echarts.init(document.getElementById('main2'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    };
    option2 = {
        title: {
            text: 'ECharts 入门示例2'
        },
        xAxis: {
            type: 'category',
            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [820, 932, 901, 934, 1290, 1330, 1320],
            type: 'line'
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    myChart2.setOption(option2);
</script>
</html>

