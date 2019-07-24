<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>沃斯酒店</title>
</head>
<body>

id:<input type="text" id="vip_id">
name：<input type="text" id="vip_name">
tel:  <input type="text" id="vip_tel">
IDcard:<input type="text" id = "vip_IDcard">
<button id="btn_update">delete</button>
<a href="background.jsp">Hello World!</a>
<%--<jsp:forward page="background.jsp"></jsp:forward>--%>
</body>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">


    // var jsonstr=JSON.stringify(vip_id);
    $("#btn_update").click(function() {
        var vip_id = $("#vip_id").val();
        var vip_name = $("#vip_name").val();
        var vip_tel=$("#vip_tel").val();
        var vip_IDcard=$("#vip_IDcard").val();
        alert(vip_id);
        alert(vip_name);
        $.ajax({
            url : "updateMsg",
            type : "get",
            data : {"vip_id":vip_id,"vip_name":vip_name,"vip_tel":vip_tel,"vip_IDcard":vip_IDcard},
            datatype:"json",
            contentType:"application/json;charset=UTF-8",
            success : function(data) {

                if (data == null) {
                    alert("nobody");
                } else {
                    if (data == 1) {
                        alert("success");
                        window.location.href="background.jsp";
                    } else {
                        alert("fauls");

                    }
                }
            }
        });
    });

</script>
</html>
