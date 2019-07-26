<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>沃斯酒店</title>
</head>
<body>


tel:  <input type="text" id="vip_tel">
code:<input type="text" id="code">

<button id="btn_update">send</button>
<button id="btn_login">login</button>
<a href="background.jsp">Hello World!</a>
<a href="updateVipMsg.jsp">Hello World!</a>
<%--<jsp:forward page="background.jsp"></jsp:forward>--%>
</body>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

    var code1;//正确的验证码
    var status;//用户状态
    // var jsonstr=JSON.stringify(vip_id);
    $("#btn_update").click(function() {
        var vip_tel=$("#vip_tel").val();

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
                alert(status);
            }
        });



    });
    $("#btn_login").click(function() {
        var code=$("#code").val();//输入的验证码
        if(code==code1){
            if(status==1) {
                alert("welcome");
                window.location.href="background.jsp";
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
