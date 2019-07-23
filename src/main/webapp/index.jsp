<html>

<body>


name：<input type="text" id="vip_id">
<button id="btn_login">login</button>
<a href="background.jsp">Hello World!</a>
<%--<jsp:forward page="background.jsp"></jsp:forward>--%>
</body>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">


    // var jsonstr=JSON.stringify(vip_id);
    $("#btn_login").click(function() {
        var vip_id = $("#vip_id").val();
        alert(vip_id);
        $.ajax({
            url : "delete",
            type : "post",
            data : {vip_id:"123456"},
            datatype:"json",
            contentType:"application/json;charset=UTF-8",
            success : function(data) {

                // if (data == null) {
                //         alert("查无此人");
                // }
                // else {
                //     if(data==1){
                //         alert("成功！");
                //     }
                //  else {
                //     alert("失败！");
                }
            // }
        });
    });

</script>
</html>
