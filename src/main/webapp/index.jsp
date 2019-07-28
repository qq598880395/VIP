<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>沃斯酒店</title>
    <link rel="stylesheet" href="js/layui/css/layui.css">
</head>
<body onload="load()">

<br>
<br>
<div class="layui-form-item">



</div>


<button id="sure" type="button"  class="layui-btn layui-btn-normal">确定</button>

<div ><span id="test"></span>,你好</div>
<a href="background.jsp" class="layui-btn">Hello World!</a>
<a href="rcCase.jsp" class="layui-btn">rccase</a>
<%--<jsp:forward page="background.jsp"></jsp:forward>--%>
</body>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/layui/layui.js"></script>
<script type="text/javascript">

    // http://how2j.cn/k/ssm/ssm-json/1575.html#nowhere
    document.getElementById("test").innerHTML=vip_name;

    var vip_id,vip_name,_vip_tel,vip_money;
    vip_id=
    // var jsonstr=JSON.stringify(vip_id);
    function load(){
        $.ajax({
            url : "sendCode",
            type : "get",
            data : {"vip_id":vip_id},
            datatype:"json",
            contentType:"application/json;charset=UTF-8",
            success : function(data) {

                if(data==1)
                {
                    alert("修改成功");
                }
                else{
                    alert("修改失败");
                }
            }
        })
    };
    $("#sure").click(function() {
        rc_a=$("#rc_a").val();


        alert(rc_a+","+rc_b+","+rc_c);

        $.ajax({
            url : "sendCode",
            type : "get",
            data : {"rc_a":rc_a,"rc_b":rc_b,"rc_c":rc_c,"rc_a_regiv":rc_a_regiv,"rc_b_regiv":rc_b_regiv,"rc_c_regiv":rc_c_regiv},
            datatype:"json",
            contentType:"application/json;charset=UTF-8",
            success : function(data) {
                if(data==1)
                {
                    alert("修改成功");
                }
                else{
                    alert("修改失败");
                }
            }
        });



    });
        // $("#btn_login").click(function() {
        //     var code=$("#code").val();//输入的验证码
        //     if(code==code1){
        //         if(status==1) {
        //             alert("welcome");
        //             window.location.href="background.jsp";
        //         }
        //         else if(status==0){
        //             alert("注册成功，请先完善会员信息")
        //             window.location.href="updateVipMsg.jsp";
        //         }
        //     }
        //     else{
        //         alert("验证码错误");
        //     }
        //
        // });
</script>
</html>
