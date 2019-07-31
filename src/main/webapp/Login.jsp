<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>沃斯酒店</title>
    <link rel="stylesheet" href="js/layui/css/layui.css">
</head>
<body>


tel:  <input type="text" id="vip_tel">
code:<input type="text" id="code">

<button id="btn_sendcode"  type="button" style="margin-left: 20px;" class="layui-btn layui-btn-normal">send</button>
<button id="btn_login"  type="button" style="margin-left: 20px;" class="layui-btn layui-btn-normal">login</button>
<a href="background.jsp">Hello World!</a>
<a href="updateVipMsg.jsp">updateMsg</a>
<%--<jsp:forward page="background.jsp"></jsp:forward>--%>
</body>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/layui/layui.js"></script>
<script type="text/javascript">

    var code1;//正确的验证码
    var status;//用户状态
    var vip_id;
    var vip_tel;
    // var jsonstr=JSON.stringify(vip_id);
    $("#btn_sendcode").click(function() {
        vip_tel=$("#vip_tel").val();

        alert(vip_tel);

        $.ajax({
            url : "sendCode",
            type : "get",
            data : {"vip_tel":vip_tel},
            datatype:"json",
            contentType:"application/json;charset=UTF-8",
            success : function(data) {
                var jsondata = JSON.parse(data);
                code1 =jsondata.code;
                status=jsondata.status;
                alert(code1);
            }
        });



    });
    $("#btn_login").click(function() {
        var code=$("#code").val();//输入的验证码
        if(code==code1){
            $.ajax({

                url : "login",
                type : "get",
                data : {"vip_tel":vip_tel,"status":status},
                datatype:"json",
                contentType:"application/json;charset=UTF-8",
                success : function(data) {
                    var jsondata = JSON.parse(data);
                    vip_id=jsondata.vip_id;
                    alert(vip_id);
                }

            });
            $.ajax({

                url : "dosession",
                type : "get",
                data : {"vip_tel":vip_tel},
                datatype:"json",
                contentType:"application/json;charset=UTF-8",
                success : function(data) {
                    alert("success");
                }

            });

            if(status==1) {
                alert("welcome");

                window.location.href="recharge.jsp";
            }
            else if(status==0){
                alert("注册成功，请先完善会员信息")
                window.location.href="updateVipMsg.jsp";
            }
        }
        else{
            alert("验证码错误");
        }

    });
</script>
</html>
