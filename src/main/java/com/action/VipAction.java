package com.action;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.exceptions.ClientException;
import com.pojo.Rc_case;
import com.pojo.Vip;
import com.service.VipService;
import com.util.TelMsgLogin;
import com.util.UUIDTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import sun.misc.Request;

import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class VipAction {
    @Autowired
    private VipService service;

    @RequestMapping(value = "/findbyid",produces = "text/html;charset=utf-8")
    //@responsebody用来将返回值解析成json数据 不使用则返回一个跳转路径

    public @ResponseBody String testFindBuvipid(){
        String Vipmsg=service.getVip();
        int count = service.count();
        String json ="{\"code\":0, \"msg\":\"\", \"count\":"+count+",\"data\":"+Vipmsg+"}" ;
//        String json ="{\"code\":0, \"msg\":\"\", \"count\":1000,\"data\":"+Vipmsg+"}" ;
        System.out.println(json);
        return json;
    }

    @RequestMapping("/add")
    public  String addvip(String vip_tel){
        String vip_id = UUIDTool.getUUID();
        service.addVip(vip_id,vip_tel);
        return "background.jsp";
    }

    @RequestMapping("/addopenid")
    public String addvipbyopenid(){
        int openid = 111;
        String vip_id = UUIDTool.getUUID();
        service.addVipbyopenid(openid,vip_id);
        return "background.jsp";
    }

    @RequestMapping("/updateMsg")
    @ResponseBody
    public int updateMsg(String vip_id,String vip_name,String vip_IDcard,String vip_tel){
        System.out.println(vip_id);
        System.out.println(vip_name);

        int x = service.updateMsg(vip_id,vip_name,vip_IDcard,vip_tel);
        return x;
    }

    @ResponseBody
    @RequestMapping(value="/delete")
    public  int  delete( String vip_id ){
        int num=0;
        if (vip_id!= null) {
            num = service.deleteMsg(vip_id);
        }
        System.out.println(vip_id);
        return num;

    }
    @ResponseBody
    @RequestMapping(value="/sendCode")
    public  String sendCode (String vip_tel) throws ClientException {
        int count = service.countBytel(vip_tel);
        System.out.println(count);
        String code = TelMsgLogin.Setcode(vip_tel);
        JSONObject json =new JSONObject();
        int status;
        if(count==0)
        {
            status=0;
            json.put("code",code);
            json.put("status",status);
            addvip(vip_tel);
        }
        else if(count==1)
        {
            status=1;
            json.put("code",code);
            json.put("status",status);
        }
        String json1=json.toString();
        System.out.println(json1);
        return json1;
    }

    @ResponseBody
    @RequestMapping("/rcCase")
    public int rcCase(int rc_a,int rc_b,int rc_c,int rc_a_regiv,int rc_b_regiv,int rc_c_regiv){
        int rc_caseid=1;
        int x = service.rcCase(rc_a,rc_b,rc_c,rc_a_regiv,rc_b_regiv,rc_c_regiv,rc_caseid);
        System.out.println(rc_a+","+rc_a_regiv+","+rc_b+","+rc_b_regiv+","+rc_c+","+rc_c_regiv);
        return x;
    }
    @ResponseBody
    @RequestMapping("/findMsg")
    public String findMsg(String vip_id){
       String json= service.findMsg(vip_id);
        System.out.println(json);
        return json;
    }
    @ResponseBody
    @RequestMapping("/getRc")
    public String getRc(int rc_caseid){
        Rc_case rc_case = service.getRc(rc_caseid);
        String json = JSONObject.toJSONString(rc_case);
        System.out.println(json);
        return json;
    }

    @ResponseBody
    @RequestMapping("/recharge")
    public int recharge(String vip_id , double rc_cost ){
        System.out.println(rc_cost);
        Rc_case rc_case = service.getRc(1);

        double rc_num1=0;//最终结果
        int rc_a=0,rc_b=0,rc_c=0,rc_a_regiv,rc_b_regiv,rc_c_regiv ,num,n,m;//num 存优惠方案  m存翻倍值 n中间数
        rc_a=rc_case.getRc_a();
        rc_b=rc_case.getRc_b();
        rc_c=rc_case.getRc_c();
        rc_a_regiv=rc_case.getRc_a_regiv();
        rc_b_regiv=rc_case.getRc_b_regiv();
        rc_c_regiv=rc_case.getRc_c_regiv();

        if(rc_a==0&&rc_b==0&&rc_c==0)
        {
            rc_num1=rc_cost;
        }
        else if(rc_a!=0&&rc_b==0&&rc_c==0)
        {

            if(rc_cost>=rc_a){
                 n=(int)(rc_cost-rc_cost%rc_a);
                 m=n/rc_a;
                num=rc_a_regiv;
                rc_num1= rc_cost+num*m;
            }
            else {
                num = 0;
                rc_num1=rc_cost;
            }
        }
        else if(rc_a==0&&rc_b!=0&&rc_c==0)
        {

            if(rc_cost>=rc_b){
                 n=(int)(rc_cost-rc_cost%rc_b);
                 m=n/rc_b;
                num=rc_b_regiv;
                rc_num1= rc_cost+num*m;
            }
            else {
                num = 0;
                rc_num1=rc_cost;
            }
        }
        else if(rc_a==0&&rc_b==0&&rc_c!=0)
        {

            if(rc_cost>=rc_c){
                 n=(int)(rc_cost-rc_cost%rc_c);
                 m=n/rc_c;
                num=rc_c_regiv;
                rc_num1= rc_cost+num*m;
            }
            else {
                num = 0;
                rc_num1=rc_cost;
            }
        }
        else if (rc_a!=0&&rc_b!=0&&rc_c==0)
        {
            if (rc_cost<=rc_a)
            {
                num=0;
                rc_num1=rc_cost;
            }
            else if(rc_cost>=rc_a&&rc_cost<rc_b)
            {
                num=rc_a_regiv;
                rc_num1 = rc_cost+num;
            }
            else if(rc_cost>=rc_b)
            {
                 n=(int)(rc_cost-rc_cost%rc_b);
                 m=n/rc_b;
                num=rc_b_regiv;
                rc_num1= rc_cost+num*m;
            }
        }
        else if (rc_a!=0&&rc_b==0&&rc_c!=0)
        {
            if (rc_cost<=rc_a)
            {
                num=0;
                rc_num1=rc_cost;
            }
            else if(rc_cost>=rc_a&&rc_cost<rc_c)
            {
                num=rc_a_regiv;
                rc_num1 = rc_cost+num;
            }
            else if(rc_cost>=rc_c)
            {
                n=(int)(rc_cost-rc_cost%rc_c);
                m=n/rc_c;
                num=rc_c_regiv;
                rc_num1= rc_cost+num*m;
            }
        }
        else if (rc_a==0&&rc_b!=0&&rc_c!=0)
        {
            if (rc_cost<=rc_b)
            {
                num=0;
                rc_num1=rc_cost;
            }
            else if(rc_cost>=rc_b&&rc_cost<rc_c)
            {
                num=rc_b_regiv;
                rc_num1 = rc_cost+num;
            }
            else if(rc_cost>=rc_c)
            {
                n=(int)(rc_cost-rc_cost%rc_c);
                m=n/rc_c;
                num=rc_c_regiv;
                rc_num1= rc_cost+num*m;
            }
        }
        else if(rc_a!=0&&rc_b!=0&&rc_c!=0)
        {
            if (rc_cost<rc_a)
            {
                num=0;
                rc_num1=rc_cost;
            }
            else if(rc_cost>=rc_a&&rc_cost<rc_b)
            {
                num=rc_a_regiv;
                rc_num1=rc_cost+num;
            }
            else if(rc_cost>=rc_b&&rc_cost<rc_c)
            {
                num=rc_b_regiv;
                rc_num1 = rc_cost+num;

            }
            else if(rc_cost>=rc_c)
            {
                n=(int)(rc_cost-rc_cost%rc_c);
                m=n/rc_c;
                num=rc_c_regiv;
                rc_num1= rc_cost+num*m;
            }
        }
        String rc_id = UUIDTool.getUUID();
        System.out.println(rc_num1);
        int x = service.recharge(vip_id,rc_num1,rc_id);
        return x;

    }


}
